angular.module("loadingCircleWithMessage", []).directive "loadingCircleWithMessage", ["$document", ($document) ->

    return {
      restrict: "E"
      scope:
        progressMessage: "="
      # templateUrl: 'loadingCircleWithMessage.html'
      template: """{html}"""
    }
]
