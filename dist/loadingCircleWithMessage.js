(function() {
  angular.module("loadingCircleWithMessage", []).directive("loadingCircleWithMessage", [
    "$document", function($document) {
      return {
        restrict: "E",
        scope: {
          progressMessage: "="
        },
        template: "<div class=\"loading-circle-with-message\"><i class=\"fa fa-spinner fa-2x fa-spin spinner\"></i>\n  <p>{{progressMessage}}</p>\n</div>"
      };
    }
  ]);

}).call(this);
