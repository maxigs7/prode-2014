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
