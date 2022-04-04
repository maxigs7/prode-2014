var app = app || {};

(function (app) {
    
    function categoriaServices($http, $q) {
        var self = this;

        // Guardar para poder acceder en los metodos
        self.http = $http;
        self.q = $q;

        // Url Base Web Api
        self.url = '/api/categoria/';
        return (this);
    }

    
    categoriaServices.prototype = {
        listado: function (params) {
            var config = {
                url: this.url + 'buscar',
                method: 'GET',
                params: params
            };
            var deferred = this.q.defer();
            
            this.http(config)
                .success(deferred.resolve)
                .error(deferred.error);

            return deferred.promise;
        },
        guardar: function (categoria) {
            var method = categoria.categoriaId == 0 ? 'POST' : 'PUT';
            var config = {
                url: this.url,
                method: method,
                data: categoria
            };
            var deferred = this.q.defer();

            this.http(config)
                .success(deferred.resolve)
                .error(deferred.error);

            return deferred.promise;
        }
    };

    app.constants.categoria = app.constants.categoria || {};
    app.constants.categoria.services = "app.categoria.services";

    app.categoria.module.service(app.constants.categoria.services,
    [
        app.constants.inject.$http,
        app.constants.inject.$q,
        categoriaServices
    ]);
})(app);