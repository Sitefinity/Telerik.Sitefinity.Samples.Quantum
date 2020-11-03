function ModalController ($scope, $rootScope, $compile, $timeout) {
  var dialogs = []

  function removeAllDialogs (args) {
    for (var i = 0; i < dialogs.length; i++) {
      var dialog = dialogs[i]
      dialog.close(args)
      dialogs.splice(i, 1)
    }
  }

  $scope.$on('openModalDialog', function (event, args) {
    var defaults = {
      container: $('#ucommerceModal'),
      animation: 'fade',
      modalClass: 'ucommerce-modal',
      width: '650px',
      height: '650px',
      show: true,
      template: 'about:blank',
      callback: undefined,
      closeCallback: undefined,
      element: undefined
    }

    var dialog = angular.extend(defaults, args)
    var scope = args.scope || $rootScope.$new()

    var style = ''
    if (args.scope) {
      if (args.scope.stylesheet) {
        style = args.scope.stylesheet
      } else {
        if (args.scope.$parent) {
          if (args.scope.$parent.stylesheet) {
            style = args.scope.$parent.stylesheet
          }
        }
      }
    }

    // Modal dom obj and unique id
    dialog.element = $(
      '<div role="dialog" ng-style="modalStyle()" style="height:100%; width:100%;"></div>'
    )
    var id =
      dialog.template
        .replace('.html', '')
        .replace('.aspx', '')
        .replace(/[\/|\.|:\&\?\=]/g, '-') +
      '-' +
      scope.$id

    dialog.element.addClass('hide')
    dialog.element.addClass('modal')

    // set the id and add classes
    dialog.element
      .attr('id', id)
      .addClass(dialog.animation)
      .addClass(dialog.modalClass)

    // push the modal into the global modal collection
    // we halt the .push because a link click will trigger a closeAll right away
    $timeout(function () {
      dialogs.push(dialog)
    }, 500)

    dialog.closing = false

    dialog.close = function (data) {
      if (dialog.closing) {
        return
      }
      dialog.closing = true

      if (dialog.closeCallback) {
        dialog.closeCallback(data)
      }

      // Close the modal dialog by simulating a click on the back drop.
      // This is done this way, because a call to ('hide') would briefly display the Sitecore desktop.
      $('.modal-backdrop').last().click()
    }

    dialog.cleanUpAfterClosing = function () {
      if (dialog.element) {
        dialog.element.modal('hide')
        dialog.element.find('iframe').attr('src', 'about:blank')

        if (dialog.element) {
          $timeout(function () {
            dialog.element.remove()
          }, 1000)
        }
      }
    }

    var html = $(
      "<iframe src='" +
        dialog.template +
        "' ucommerce-stylesheet='" +
        style +
        "' class='auto-expand ucommerce-modal-iframe'></iframe>"
    )
    dialog.element.html(html)

    // append to body or whatever element is passed in as options.containerElement
    dialog.container.append(dialog.element)

    // Compile modal content
    $timeout(function () {
      $compile(dialog.element)(dialog.scope)
    })

    dialog.element.css('height', dialog.height)
    dialog.element.css('width', dialog.width)

    // Nested modal dialogs causes a stack overflow when boostrap tries to enforce Focus.
    // Therefor we save the focus function,
    var enforceModalFocusFn = $.fn.modal.Constructor.prototype.enforceFocus
    // no-op's it, and restores it when we hide the dialog.
    $.fn.modal.Constructor.prototype.enforceFocus = function () {}

    dialog.element.on('hidden', function (e) {
      dialog.cleanUpAfterClosing()

      // Remove the dialog from the global list, if it is still present.
      var index = dialogs.indexOf(dialog)
      if (index != -1) {
        dialogs.splice(index, 1)
      }

      // Restore the enforceModalFocusFunction
      $.fn.modal.Constructor.prototype.enforceFocus = enforceModalFocusFn
    })

    // Autoshow
    if (dialog.show) {
      dialog.element.modal('show')
    }

    dialog.scope = scope
    return dialog
  })

  $scope.$on('closeModalDialog', function () {
    var dialog = dialogs.pop()
    if (dialog) dialog.close()
  })

  $scope.modalStyle = function () {
    return {
      width: $scope.width + 'px',
      height: $scope.height + 'px',
      padding: 0
    }
  }

  $scope.modalStyleOffset = function (offset) {
    return {
      width: $scope.width + 'px',
      height: $scope.height - offset + 'px',
      padding: 0,
      'overflow-y': 'none',
      'max-height': $scope.height + 'px'
    }
  }

  $scope.closeAllDialogs = function (data) {
    removeAllDialogs(data)
  }
}

window.closeModal = function () {
  angular.element('#ModalControllerContainer').scope().$apply(function (scope) {
    scope.$broadcast('closeModalDialog')
  })
}

window.openModal = function (url, name, width, height) {
  angular.element('#ModalControllerContainer').scope().$apply(function (scope) {
    scope.$broadcast('openModalDialog', {
      template: url,
      width: width,
      height: height,
      scope: scope
    })
  })
}

angular.module('ucommerce').controller('ModalController', ModalController)
