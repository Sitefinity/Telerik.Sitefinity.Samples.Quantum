var uc_tree_node_icon_service = function () {
  return {
    getNodeIconClasses: function (nodeIconRequest) {
      if (nodeIconRequest.shell === 'Umbraco7') {
        if (nodeIconRequest.icon === '.sprTreeFolder') {
          nodeIconRequest.icon = 'icon-folder'
        }

        return 'treeNodeIcon icon umb-tree-icon ' + nodeIconRequest.icon
      } else {
        return 'treeNodeIcon'
      }
    },

    getNodeIconStyle: function (nodeIconRequest) {
      if (!nodeIconRequest.iconFolder) {
        nodeIconRequest.iconFolder = ''
      }

      if (nodeIconRequest.iconFolderOverwrite) {
        return nodeIconRequest.iconFolderOverwrite + nodeIconRequest.icon
      }
      if (nodeIconRequest.icon) {
        if (nodeIconRequest.icon.startsWith('~')) {
          var newUrl = nodeIconRequest.icon.replace('~', '')
          return {
            'background-image': 'url("' + newUrl + '")'
          }
        }

        if (
          nodeIconRequest.shell == 'Sitecore' ||
          nodeIconRequest.shell == 'Kentico'
        ) {
          if (nodeIconRequest.iconFolder == 'uCommerce') {
            var object = {
              'background-image': 'url("' +
                UcommerceClientMgr.BaseUCommerceUrl +
                'shell/content/images/ui/' +
                nodeIconRequest.icon +
                '")'
            }
            return object
          } else {
            return {
              'background-image': 'url("' + nodeIconRequest.icon + '")'
            }
          }
        }
        if (nodeIconRequest.shell == 'Umbraco7' ||
            nodeIconRequest.shell == 'Umbraco8') {
          var lowerCaseIcon = nodeIconRequest.icon.toLowerCase()
          if (nodeIconRequest.iconFolder == 'uCommerce') {
            return {
              'background-image': 'url("/umbraco/ucommerce/images/ui/' +
                nodeIconRequest.icon +
                '")',
              'background-repeat': 'no-repeat'
            }
          }
          if (
            lowerCaseIcon.indexOf('.png') != -1 ||
            lowerCaseIcon.indexOf('.gif') != -1 ||
            lowerCaseIcon.indexOf('.jpg') != -1
          ) {
            return {
              'background-image': 'url("/umbraco/images/umbraco/' +
                nodeIconRequest.icon +
                '")',
              'background-repeat': 'no-repeat',
              'padding-left': '16px'
            }
          }
        }
        if (nodeIconRequest.shell == 'Umbraco') {
          if (nodeIconRequest.iconFolder == 'uCommerce') {
            return {
              'background-image': 'url("/umbraco/uCommerce/images/ui/' +
                nodeIconRequest.icon +
                '")',
              'background-repeat': 'no-repeat',
              'padding-left': '16px'
            }
          }
        }
      }
      return {
        'background-image': 'url("' + nodeIconRequest.icon + '")'
      }
    }
  }
}
