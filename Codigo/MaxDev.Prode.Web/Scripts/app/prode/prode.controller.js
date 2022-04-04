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