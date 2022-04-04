var app = app || {};

(function (ng, app) {
    app.constants.categoria = app.constants.categoria || {};
    app.constants.categoria.module = 'admin.categoria';

    app.categoria = app.categoria || {};
    app.categoria.module = ng.module(app.constants.categoria.module, [
        // Angular modules
        app.constants.angular.ngTable,
        app.constants.angular.uiBootstrap,

        app.constants.common.module
    ]);
})(angular, app);