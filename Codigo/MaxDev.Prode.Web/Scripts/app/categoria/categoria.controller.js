var app = app || {};

(function (ng, app) {
    app.constants.categoria = app.constants.categoria || {};
    app.constants.categoria.controller = "admin.categoria.controller";

    function categoriaController($rootScope, $scope, $modal, repository, tableParams) {
        var self = this;

        // Guardar para poder acceder en los metodos
        self.$rootScope = $rootScope;
        self.$scope = $scope;
        self.$modal = $modal;
        self.repository = repository;

        self.$scope.categorias = [];
        
        // NG TABLE CONFIGURACION
        self.$scope.categoriaTable = new tableParams({
            page: 1,
            count: 10,
            sorting: {
                descripcion: 'desc'
            }
        },
        {
            total: self.$scope.categorias.length,
            getData: function ($defer, params) {
                var paramsMap = app.util.ngTable.paramsMap(params);
                self.repository.listado(paramsMap).then(function (result) {
                    params.total(result.total);
                    self.$scope.categorias = result.data;
                    $defer.resolve(result.data);
                });
            }
        });
        

        /*
         * Registrar funciones en el scope para que se 
         * utilizen en la vista
         */
        self.$scope.init = ng.bind(self, self.init);
        self.$scope.crear = ng.bind(self, self.crear);
        self.$scope.editar = ng.bind(self, self.editar);
        self.$scope.eliminar = ng.bind(self, self.eliminar);

        // Retornar controlador
        return (self);
    }

    categoriaController.prototype = {
        init : function (categorias) {
            this.$scope.categorias = categorias;
        },
        crear: function () {
            var url = '/admin/categoria/crear';
            var options = {
                templateUrl: url,
                controller: app.constants.categoria.modal,
                scope: this.$scope
            };
            this.$modal.open(options).result.then(function () {
                
            }, function() {
                
            });
        },
        editar: function (categoriaId) {
            var url = '/admin/categoria/editar/' + categoriaId;
            var options = {
                templateUrl: url,
                controller: app.constants.categoria.modal,
                scope: this.$scope
            };
            this.$modal.open(options).result.then(function () {
                
            }, function() {
                
            });
        },
        eliminar: function(categoriaId) {
            var url = '/admin/categoria/eliminar/' + categoriaId;
            var options = {
                templateUrl: url,
                controller: app.constants.categoria.modal,
                scope: this.$scope
            };
            this.$modal.open(options).result.then(function() {

            }, function() {

            });
        }
    };

    
    // Definir controlador
    app.categoria.module.controller(app.constants.categoria.controller,
    [
        app.constants.inject.$rootScope,
        app.constants.inject.$scope,
        app.constants.inject.$modal,
        app.constants.categoria.services,
        app.constants.inject.ngTableParams,
        categoriaController
    ]);

})(angular, app);