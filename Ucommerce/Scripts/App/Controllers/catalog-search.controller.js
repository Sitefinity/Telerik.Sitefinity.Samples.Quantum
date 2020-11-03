function uc_catalogSearchController ($scope, $http, $rootScope, $timeout) {
  $scope.baseCommerceImagesUrl =
    UcommerceClientMgr.BaseUCommerceUrl + 'images/ui/'
  $scope.searchTerm = ''
  $scope.nrOfResults = 0
  $scope.message = ''
  $scope.result = []
  $scope.showSpinner = false
  var serviceUrl =
    UcommerceClientMgr.BaseServiceUrl + 'ProductCatalogSearch/ByName'
  var _debounce
  $scope.initiateProductSearch = function () {
    if (!$scope.searchTerm.length) {
      $scope.nrOfResults = -1
      $scope.showSpinner = false
      return
    }
    $rootScope.$broadcast('startSearch')
    $scope.showSpinner = true
    if (_debounce) {
      // if there is already a timeout in process cancel it
      $timeout.cancel(_debounce)
    }

    _debounce = $timeout(function () {
      var result = $http.post(
        serviceUrl,
        {
          SearchTerm: $scope.searchTerm,
          SelectableTypes: $scope.hasCheckboxFor
        },
        {
          dataType: 'application/json'
        }
      )

      result.then(function (response) {
        if (!$scope.searchTerm.length) {
          $scope.nrOfResults = -1
          return
        }
        $scope.result = response.data.result
        var i = $scope.result.length
        while (i--) {
          if (!$scope.showCheckBoxForNode($scope.result[i])) {
            $scope.result.splice(i, 1)
          }
        }

        $scope.showSpinner = false
        $scope.nrOfResults = response.data.result.length

        if ($scope.nrOfResults == 0) {
          $scope.message = 'No results found'
        }

        if (response.data.error) {
          $scope.message = response.data.description
        }
      })
    }, 500)
  }

  $scope.clearTextBox = function () {
    $scope.searchTerm = ''
  }

  $scope.$watch('searchTerm', function (newValue, oldValue) {
    if (!newValue.length) {
      $rootScope.$broadcast('stopSearch')
      $scope.nrOfResults = -1
    }
  })

  $scope.checkIfEscapeKeyWasPressed = function ($event) {
    var keyCode = $event.which || $event.keyCode
    if (keyCode === 27) {
      $scope.searchTerm = ''
      $scope.nrOfResults = -1
    }

    if (keyCode === 13) {
      $event.preventDefault()
    }
  }

  $scope.showSearch = function () {
    if ($scope.pickertype == 'ProductCatalogGroup') {
      return false
    }
    if ($scope.pickertype == 'ProductCatalog') {
      return false
    }

    return true
  }

  $scope.showCheckBoxForNode = function (node) {
    if (node) {
      if (
        $scope.hasCheckboxFor &&
        node.nodeType != null &&
        node.nodeType != ''
      ) {
        var checkBoxTypes = $scope.hasCheckboxFor.split(',')
        var nodeTypes = node.nodeType.split(',')
        for (i in nodeTypes) {
          for (n in checkBoxTypes) {
            if (checkBoxTypes[n].toLowerCase() == nodeTypes[i].toLowerCase()) {
              return true
            }
          }
        }
      }
    }
    return false
  }

  $scope.searchResultClick = function (node) {
    if ($scope.showCheckBoxForNode(node)) {
      $rootScope.$broadcast('toggleSelectedNode', node)
    }
  }

  $scope.isSelectedCheckbox = function (node) {
    if (node) {
      if ($scope.preSelectedValues) {
        var val = ',' + $scope.preSelectedValues + ','
        return val.indexOf(',' + node.id + ',') > -1
      }
    }
    return false
  }
}
