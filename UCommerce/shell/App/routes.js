app.config(function ($routeProvider) {
    $routeProvider
        //
        // Dashboard
        //
        .when('/Vue/dashboard.html', {
            redirectTo: function () {
                return buildUrl('/Vue/dashboard.html');
            }
        })
		//
		// Catalog
		//
        .when('/Vue/catalogs.html#/catalogs', {
            redirectTo: function () {
                return buildUrl(`/Vue/catalogs.html?unique=${getRandom()}#catalogs`);
            }
        })
        .when('/Vue/catalogs.html#/products', {
            redirectTo: function () {
                return buildUrl(`/Vue/catalogs.html?unique=${getRandom()}#products`);
            }
        })
		.when('/ucommerce/options/catalog/createproduct/:categoryId', {
			redirectTo: function(routeParams) {
			    return buildUrl('catalog/editproduct.aspx?parentcategoryid=' + routeParams.categoryId);
			}
		})
		.when('/ucommerce/options/catalog/createproductcataloggroup', {
			redirectTo: function() {
			    return buildUrl('catalog/editproductcataloggroup.aspx');
			}
		})
		.when('/ucommerce/options/catalog/createproductcatalog/:productCatalogGroupId', {
			redirectTo: function(routeParams) {
			    return buildUrl('catalog/editproductcatalog.aspx?productCatalogGroupId=' + routeParams.productCatalogGroupId);
			}
		})
		.when('/ucommerce/options/catalog/createcategory/:productCatalogId', {
			redirectTo: function (routeParams) {
			    return buildUrl('catalog/editcategory.aspx?productcatalogid=' + routeParams.productCatalogId);
			}
		})
		.when('/ucommerce/options/catalog/createchildcategory/:parentCategoryId', {
			redirectTo: function (routeParams) {
			    return buildUrl('catalog/editcategory.aspx?parentcategoryid=' + routeParams.parentCategoryId);
			}
		})
		.when('/ucommerce/options/catalog/sortrootcategories/:id', {
			redirectTo: function(routeParameters) {
			    return buildUrl('catalog/SortCategories.aspx?id=ProductCatalog_' + routeParameters.id);
			}
		})
		.when('/ucommerce/options/catalog/sortcatalogs/:id', {
			redirectTo: function (routeParameters) {
			    return buildUrl('catalog/SortProductCatalogs.aspx?id=ProductCatalogGroup_' + routeParameters.id);
			}
		})
		.when('/ucommerce/options/catalog/sortchildcategories/:id', {
			redirectTo: function(routeParameters) {
			    return buildUrl('catalog/SortCategories.aspx?id=Category_' + routeParameters.id);
			}
		})
		.when('/ucommerce/options/catalog/sortproducts/:id', {
			redirectTo: function(routeParameters) {
			    return buildUrl('catalog/SortProducts.aspx?id=Category_' + routeParameters.id);
			}
		})
		.when('/ucommerce/options/settings/definitions/definitions/sortdefinitionrelations/:id', {
			redirectTo: function (routeParameters) {
				return buildUrl('settings/definitions/SortDefinitionRelations.aspx?id=definition_' + routeParameters.id);
			}
		})
		.when('/ucommerce/options/settings/definitions/productdefinitions/sortproductdefinitionrelations/:id', {
			redirectTo: function (routeParameters) {
				return buildUrl('settings/definitions/SortProductDefinitionRelations.aspx?id=definition_' + routeParameters.id);
			}
		})
		.when('/ucommerce/catalog/editproductcataloggroup.aspx/:id', {
			redirectTo: function(routeParameters) {
			    return buildUrl('catalog/editproductcataloggroup.aspx?id=' + routeParameters.id);
			}
		})
		.when('/ucommerce/catalog/editproductcatalog.aspx/:id', {
			redirectTo: function(routeParameters) {
			    return buildUrl('catalog/editproductcatalog.aspx?id=' + routeParameters.id);
			}
		})
		.when('/ucommerce/catalog/editcategory.aspx/:id', {
			redirectTo: function(routeParameters) {
			    return buildUrl('catalog/editcategory.aspx?id=' + routeParameters.id);
			}
		})
		.when('/ucommerce/catalog/searchproduct.aspx/:id', {
			redirectTo: function(routeParameters) {
			    return buildUrl('catalog/searchproduct.aspx?id=' + routeParameters.id);
			}
		})
		.when('/ucommerce/catalog/editproduct.aspx/:id' , {
			redirectTo: function(routeParameters) {
			    return buildUrl('catalog/editproduct.aspx?id=' + routeParameters.id);
			}
		})
		//
		// Orders
		//
		.when('/ucommerce/orders/viewordergroup.aspx/:id', {
			redirectTo: function(routeParameters) {
			    return buildUrl('orders/viewordergroup.aspx?id=' + routeParameters.id);
			}
		})
		.when('/ucommerce/orders/editorder.aspx/:id', {
			redirectTo: function(routeParameters) {
			    return buildUrl('orders/editorder.aspx?id=' + routeParameters.id);
			}
		})
		.when('/ucommerce/orders/search.aspx/:id', {
			redirectTo: function(routeParameters) {
			    return buildUrl('orders/search.aspx?id=' + routeParameters.id);
			}
		})
		//
		// Marketing
		//
		.when('/ucommerce/options/marketing/createcampaign', {
			redirectTo: function () {
			    return buildUrl('marketing/editcampaign.aspx');
			}
		})
		.when('/ucommerce/options/marketing/createcampaignitem/:parentId', {
			redirectTo: function (routeParameters) {
			    return buildUrl('marketing/editcampaignitem.aspx?parent=' + routeParameters.parentId + '&detectIEDuplicateRequest=' + new Date().getTime());
			}
		})
        .when('/ucommerce/marketing/editcampaign.aspx/:id', {
        	redirectTo: function (routeParameters) {
        	    return buildUrl('marketing/editcampaign.aspx?id=' + routeParameters.id);
        	}
        })
        .when('/ucommerce/marketing/editcampaignitem.aspx/:id/:campaignId', {
        	redirectTo: function (routeParameters) {
        	    return buildUrl('marketing/editcampaignitem.aspx?id=' + routeParameters.id + '&parent=' + routeParameters.campaignId);
        	}
        })
        .when('/ucommerce/options/marketing/prioritizecampaigns', {
        	redirectTo: function () {
        	    return buildUrl('marketing/SortCampaigns.aspx?id=Root_-1');
        	}
        })
        .when('/ucommerce/options/marketing/prioritizecampaignitems/:id', {
        	redirectTo: function (routeParameters) {
        	    return buildUrl('marketing/SortCampaignItems.aspx?id=Campaign_' + routeParameters.id);
        	}
        })
		//
		// Analytics
		//
        .when('/ucommerce/analytics/ProductAnalytics.aspx', {
        	redirectTo: function () {
        	    return buildUrl('analytics/ProductAnalytics.aspx');
        	}
        })
        .when('/ucommerce/analytics/OrderAnalytics.aspx', {
        	redirectTo: function () {
        	    return buildUrl('analytics/OrderAnalytics.aspx');
        	}
        })
		//
		// Settings Catalog
		//
		.when('/ucommerce/options/settings/catalog/createpricegroup', {
			redirectTo: function() {
			    return buildUrl('settings/catalog/editpricegroup.aspx');
			}
		})
        .when('/ucommerce/settings/catalog/editpricegroup.aspx/:id', {
        	redirectTo: function (routeParameters) {
        	    return buildUrl('settings/catalog/editpricegroup.aspx?id=' + routeParameters.id);
        	}
        })
		.when('/ucommerce/options/settings/catalog/createproductrelationtype', {
			redirectTo: function () {
			    return buildUrl('settings/catalog/editproductrelationtype.aspx');
			}
		})
        .when('/ucommerce/settings/catalog/editproductrelationtype.aspx/:id', {
        	redirectTo: function (routeParameters) {
        	    return buildUrl('settings/catalog/editproductrelationtype.aspx?id=' + routeParameters.id);
        	}
        })
        // Settings Orders
		.when('/ucommerce/options/settings/orders/createshippingmethod', {
			redirectTo: function() {
			    return buildUrl('settings/orders/editshippingmethod.aspx');
			}
		})
        .when('/ucommerce/settings/orders/editshippingmethod.aspx/:id', {
        	redirectTo: function (routeParameters) {
        	    return buildUrl('settings/orders/editshippingmethod.aspx?id=' + routeParameters.id);
        	}
        })
		.when('/ucommerce/options/settings/orders/createpaymentmethod', {
			redirectTo: function () {
			    return buildUrl('settings/orders/editpaymentmethod.aspx');
			}
		})
        .when('/ucommerce/settings/orders/editpaymentmethod.aspx/:id', {
        	redirectTo: function (routeParameters) {
        	    return buildUrl('settings/orders/editpaymentmethod.aspx?id=' + routeParameters.id);
        	}
        })
		.when('/ucommerce/options/settings/orders/createcountry', {
			redirectTo: function () {
			    return buildUrl('settings/orders/editcountry.aspx');
			}
		})
        .when('/ucommerce/settings/orders/editCountry.aspx/:id', {
        	redirectTo: function (routeParameters) {
        	    return buildUrl('settings/orders/editCountry.aspx?id=' + routeParameters.id);
        	}
        })
		.when('/ucommerce/options/settings/orders/createcurrency', {
			redirectTo: function () {
			    return buildUrl('settings/orders/editcurrency.aspx');
			}
		})
        .when('/ucommerce/settings/orders/editCurrency.aspx/:id', {
        	redirectTo: function (routeParameters) {
        	    return buildUrl('settings/orders/editCurrency.aspx?id=' + routeParameters.id);
        	}
        })
		.when('/ucommerce/options/settings/orders/createordernumbers', {
			redirectTo: function () {
			    return buildUrl('settings/orders/editOrderNumberSerie.aspx');
			}
		})
        .when('/ucommerce/settings/orders/editOrderNumberSerie.aspx/:id', {
        	redirectTo: function (routeParameters) {
        	    return buildUrl('settings/orders/editOrderNumberSerie.aspx?id=' + routeParameters.id);
        	}
        })
        // Settings Email
		.when('/ucommerce/options/settings/email/createemailprofile', {
			redirectTo: function() {
			    return buildUrl('settings/email/editemailProfile.aspx');
			}
		})
        .when('/ucommerce/settings/email/editemailProfile.aspx/:id', {
        	redirectTo: function (routeParameters) {
        	    return buildUrl('settings/email/editemailProfile.aspx?id=' + routeParameters.id);
        	}
        })
        .when('/ucommerce/settings/email/editEmailProfileType.aspx/:id/:parentId', {
        	redirectTo: function (routeParameter) {
        	    return buildUrl('settings/email/editEmailProfileType.aspx?id=' + routeParameter.id + '&parent=' + routeParameter.parentId);
        	}
        })
		.when('/ucommerce/options/settings/email/createemailtype', {
			redirectTo: function () {
			    return buildUrl('settings/email/editemailtype.aspx');
			}
		})
        .when('/ucommerce/settings/email/editemailtype.aspx/:id', {
        	redirectTo: function (routeParameters) {
        	    return buildUrl('settings/email/editemailtype.aspx?id=' + routeParameters.id);
        	}
        })
        // Settings Definitions
		.when('/ucommerce/options/settings/definitions/createproductdefinition', {
			redirectTo: function() {
			    return buildUrl('settings/definitions/editproductdefinition.aspx');
			}
		})
		.when('/ucommerce/settings/definitions/editDefinitionsOverview.aspx', {
		    redirectTo: function (routeParameters) {
		    	return buildUrl('settings/definitions/editDefinitionsOverview.aspx');
		    }
		})
        .when('/ucommerce/settings/definitions/editproductdefinition.aspx/:id', {
        	redirectTo: function (routeParameters) {
        	    return buildUrl('settings/definitions/editproductdefinition.aspx?id=' + routeParameters.id);
        	}
        })
		.when('/ucommerce/options/settings/definitions/createdynamicproductdefinition/:parentId', {
			redirectTo: function (routeParameters) {
			    return buildUrl('settings/definitions/editdefinition.aspx?parent=' + routeParameters.parentId);
			}
		})
        .when('/ucommerce/settings/definitions/editdefinition.aspx/:id', {
        	redirectTo: function (routeParameters) {
        	    return buildUrl('settings/definitions/editdefinition.aspx?id=' + routeParameters.id);
        	}
        })
		.when('/ucommerce/options/settings/definitions/createproductdefinitionfield/:parentId', {
			redirectTo: function(routeParameters) {
			    return buildUrl('settings/definitions/editproductdefinitionfield.aspx?parent=' + routeParameters.parentId);
			}
		})
        .when('/ucommerce/settings/definitions/editproductdefinitionfield.aspx/:id/:parentId', {
        	redirectTo: function (routeParameters) {
        	    return buildUrl('settings/definitions/editproductdefinitionfield.aspx?id=' + routeParameters.id + '&parent=' + routeParameters.parentId);
        	}
        })
		.when('/ucommerce/options/settings/definitions/createdynamicproductdefinitionfield/:parentId', {
			redirectTo: function(routeParameters) {
			    return buildUrl('settings/definitions/editdefinitionfield.aspx?parent=' + routeParameters.parentId);
			}
		})
        .when('/ucommerce/settings/definitions/editdefinitionfield.aspx/:id/:definitionId', {
        	redirectTo: function (routeParameters) {
        	    return buildUrl('settings/definitions/editdefinitionfield.aspx?id=' + routeParameters.id + '&parent=' + routeParameters.definitionId);
        	}
        })
		.when('/ucommerce/options/settings/definitions/createdatatype', {
			redirectTo: function() {
			    return buildUrl('settings/definitions/editdatatype.aspx');
			}
		})
        .when('/ucommerce/settings/definitions/editdatatype.aspx/:id', {
        	redirectTo: function (routeParameters) {
        	    return buildUrl('settings/definitions/editdatatype.aspx?id=' + routeParameters.id);
        	}
        })
		.when('/ucommerce/options/settings/definitions/createdatatypeenum/:parentId', {
			redirectTo: function(routeParameters) {
			    return buildUrl('settings/definitions/editdatatypeenum.aspx?parent=' + routeParameters.parentId);
			}
		})
        .when('/ucommerce/settings/definitions/editDataTypeEnum.aspx/:id', {
        	redirectTo: function (routeParameters) {
        	    return buildUrl('settings/definitions/editDataTypeEnum.aspx?id=' + routeParameters.id);
        	}
        })
        .when('/ucommerce/options/settings/definitions/productdefinitions/sortproductdefinitionfields/:id', {
        	redirectTo: function (routeParameters) {
        	    return buildUrl('settings/definitions/SortDefinitionFields.aspx?id=ProductDefinition_' + routeParameters.id + '&mode=0');
        	}
        })
        .when('/ucommerce/options/settings/definitions/definitions/sortdefinitionfields/:id', {
            redirectTo: function (routeParameters) {
                return buildUrl('settings/definitions/SortDefinitionFields.aspx?id=Definition_' + routeParameters.id + '&mode=1');
            }
        })
        .when('/ucommerce/options/settings/definitions/dynamicproductdefinitions/sortproductdefinitionfields/:id', {
        	redirectTo: function (routeParameters) {
        	    return buildUrl('settings/definitions/SortDefinitionFields.aspx?id=Definition_' + routeParameters.id + '&mode=1');
        	}
        })
        // Settings Security
        .when('/ucommerce/settings/security/EditUserAccess.aspx/:id', {
        	redirectTo: function (routeParameters) {
        	    return buildUrl('settings/security/EditUserAccess.aspx?id=' + routeParameters.id);
        	}
        })
        .when('/ucommerce/settings/security/EditUserGroupAccess.aspx/:id', {
        	redirectTo: function (routeParameters) {
        		return buildUrl('settings/security/EditUserGroupAccess.aspx?id=' + routeParameters.id);
        	}
        })
		.when('/ucommerce/information/Error.html/:id', {
			redirectTo: function (routeParameters) {
				return constants.webPageBaseUrl + 'information/Error.aspx?#' + routeParameters.id;
			}
		})
		//Settings search
		.when('/ucommerce/settings/search/SearchSettings.aspx', {
			redirectTo: function() {
			    return buildUrl('/settings/search/SearchSettings.aspx');
			}
		})
		//Settings apps
		.when('/Settings/Apps/InstallAppPage.aspx', {
			redirectTo: function() {
				return buildUrl('/settings/apps/installAppPage.aspx');
			}
		})
		.when('/Settings/Apps/InstalledAppsPage.aspx', {
			redirectTo: function() {
				return buildUrl('/settings/apps/installedAppsPage.aspx');
			}
		})
		//Root nodes
		.when('/ucommerce/LandingPages/StartPage.aspx/', {
			redirectTo: function() {
				return buildUrl('/LandingPages/StartPage.aspx/');
			}
		})
		.when('/ucommerce/Catalog/StoresStartPage.aspx/', {
			redirectTo: function() {
				return buildUrl('/Catalog/StoresStartPage.aspx/');
			}
		}).when('/ucommerce/Orders/OrdersStartPage.aspx/', {
			redirectTo: function() {
				return buildUrl('/Orders/OrdersStartPage.aspx/');
			}
		}).when('/ucommerce/Marketing/MarketingStartPage.aspx/', {
		redirectTo: function() {
			return buildUrl('/Marketing/MarketingStartPage.aspx/');
			}
		}).when('/ucommerce/Analytics/AnalyticsStartPage.aspx/', {
			redirectTo: function () {
				return buildUrl('/analytics/analyticsStartPage.aspx/');
			}
		}).when('/ucommerce/settings/settingsStartPage.aspx/', {
			redirectTo: function() {
				return buildUrl('/settings/settingsStartPage.aspx/');
			}
		})
		// Apps
		.when("/ucommerce/apps:action", {
			redirectTo: function (routeParameters) {
				return buildAppUrl(routeParameters);
			}
		})
		.when("/root:action", {
			redirectTo: function (routeParameters) {
				return buildUrlFromParams(routeParameters);
			}
		})
		//Default
		.when('/about:blank', {
			redirectTo: function () {
				return 'about:blank';
			}
		});

	function buildUrl(url) {
		url = addSearchToUrl(url);

        url = constants.webPageBaseUrl + url;

	    return url;
	}
	
	function getRandom() {
		return Math.floor(Math.random() * 100);
	}

	function buildAppUrl(params) {
		var path = "";
		if (params.action && params.action !== "") {
			path = params.action.split("=")[1];
			path = constants.webPageBaseUrl + "/apps/" + path.replace("%2f", '/');
		    path = path.replace("%3F", '?');
		    path = path.replace("%26", '&');
		    path = path.replace("%3d", '=');
		}
		return addSearchToUrl(path);
	}

	function buildUrlFromParams(params) {
		var path = "";
		if (params.action && params.action !== "") {
			path = params.action.split("=")[1];
		}
		return addSearchToUrl(path);
	}

	function addSearchToUrl(url) {
		var search = top.location.search;

		var urlContainsSearch = (url.indexOf('?') != -1);
		var topLocationContainsSearch = (search.indexOf('?') != -1);

		if (urlContainsSearch) {
			if (topLocationContainsSearch) {
				url += '&' + search.substring(1);
			}
		} else {
			if (topLocationContainsSearch) {
				url += search;
			}
		}

		return url;
	}
})
