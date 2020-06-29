using System;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SitefinityWebApp.Mvc.Models;
using UCommerce.Api;

namespace SitefinityWebApp.Mvc.Controllers
{
	public class StoreController : Controller
	{
		// GET: Store
		public ActionResult StoreNavigation()
		{
			var rootCategories = CatalogLibrary.GetRootCategories().Where(x => x.DisplayOnSite).ToList();
			var vm = new StoreNavigationViewModel() { Categories = rootCategories };
			return View(vm);
		}

	}
}