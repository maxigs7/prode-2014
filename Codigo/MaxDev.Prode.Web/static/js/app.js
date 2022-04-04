var app = app || {};

(function (app) {
    'use strict';

    // Registrar modulo
    app.module = angular.module('prodeApp', [
        // Modulos Angular
        'ngResource',
        'ngAnimate',

        // Mis modulos
        'prodeApp.torneo',
        'prodeApp.prode'
        //'common'           // common functions, logger, spinner

        // 3rd Party Modules
    ]);

    //app.module.config([
    //    app.constants.inject.$routeProvider,
    //    app.constants.inject.$locationProvider,
    //    function ($routeProvider, $locationProvider) {
    //    }
    //]);

    app.module.run([
        '$rootScope',
        function($rootScope) {

        }
    ]);
})(app);


(function (ng, app) {
    app.torneo = ng.module('prodeApp.torneo', [
        // Angular modules
    ]);
})(angular, app || {});
(function (ng, app) {
    app.prode = ng.module('prodeApp.prode', [
        // Angular modules
        'prodeApp.torneo'
    ]);
})(angular, app || {});
(function (ng, app) {
    var paramsDefault = {
        pageIndex: 1,
        pageSize: 10
    };

    function torneoServices($http, $q) {
        var self = this;

        // Guardar para poder acceder en los metodos
        self.$http = $http;
        self.$q = $q;

        // Url Base Web Api
        self.url = '/api/torneo/';
        return (this);
    }

    
    torneoServices.prototype = {
        listado: function (params) {
            var config = {
                url: this.url + 'buscar',
                method: 'GET',
                params: ng.extend(paramsDefault, params)
            };

            var deferred = this.$q.defer();

            this.$http(config)
                .success(deferred.resolve)
                .error(deferred.error);

            return deferred.promise;
        }
    };


    app.torneo.service('prodeApp.torneo.services',
    [
        '$http',
        '$q',
        torneoServices
    ]);
})(angular, app || {});
(function (ng, app) {

    function prodeController($scope, torneoRepository) {
        var self = this;

        // Guardar para poder acceder en los metodos
        self.$scope = $scope;
        self.torneoRepository = torneoRepository;
        self.$scope.torneos = [];
        
        self.torneoRepository
            .listado({})
            .then(function(result) {
                self.$scope.torneos = result.data;
            });
        
        //self.$scope.eliminar = ng.bind(self, self.eliminar);

        // Retornar controlador
        return (self);
    }

    prodeController.prototype = {
        
    };

    
    // Definir controlador
    app.prode.controller('prodeApp.prode.controller',
    [
        '$scope',
        'prodeApp.torneo.services',
        prodeController
    ]);

})(angular, app || {});
