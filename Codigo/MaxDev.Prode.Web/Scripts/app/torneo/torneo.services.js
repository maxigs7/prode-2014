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