var app = app || {};

(function (ng, app) {
    app.constants.categoria = app.constants.categoria || {};
    app.constants.categoria.modal = "admin.categoria.modal.controller";

    function modalController($scope, $modalInstance, repository, interceptorService) {
        var self = this;

        // Guardar para poder acceder en los metodos
        self.$scope = $scope;
        self.$modalInstance = $modalInstance;
        self.repository = repository;
        self.iService = interceptorService;

        self.$scope.categoria = {};
        /*
         * Registrar funciones en el scope para que se 
         * utilizen en la vista
         */
        self.$scope.init = ng.bind(self, self.init);
        self.$scope.guardar = ng.bind(self, self.guardar);
        self.$scope.cerrar = ng.bind(self, self.cerrar);

        // Retornar controlador
        return (self);
    }

    modalController.prototype = {
        init : function (categoria) {
            this.$scope.categoria = categoria;
        },
        guardar: function (isValid) {
            // TODO: Agregar mensaje de error
            if (!isValid) return;

            this.iService.setAntiForgeryToken(this.$scope.antiForgeryToken);
            this.repository.guardar(this.$scope.categoria)
                .then(function() {
                    console.log(this);
                }, function() {
                    console.log(this);
                });

            this.$modalInstance.close(this.$scope.categoria);
        },
        cerrar: function() {
            this.$modalInstance.dismiss('cancel');
        }
    };

    
    // Definir controlador
    app.categoria.module.controller(app.constants.categoria.modal,
    [
        app.constants.inject.$scope,
        app.constants.inject.$modalInstance,
        app.constants.categoria.services,
        app.constants.common.interceptors.services,
        modalController
    ]);

})(angular, app);