((ng) ->
  "use strict"
  app = ng.module("demo", ["loadingCircleWithMessage"])
  app.controller "demoCtrl", ($scope) ->
    
    $scope.progress = 
      message: "Progressing STEP 1..."

    return

) angular
