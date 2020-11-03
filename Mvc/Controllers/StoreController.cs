using System.Linq;
using System.Web.Mvc;
using SitefinityWebApp.Mvc.Models;
using Ucommerce.Api;
using Ucommerce.Infrastructure;

namespace SitefinityWebApp.Mvc.Controllers
{
	public class StoreController : Controller
	{
		public ICatalogLibrary CatalogLibrary => ObjectFactory.Instance.Resolve<ICatalogLibrary>();

		// GET: Store
		public ActionResult StoreNavigation()
		{
			var rootCategories = CatalogLibrary.GetRootCategories().ToList();
			var vm = new StoreNavigationViewModel() { Categories = rootCategories };
			return View(vm);
		}
	}
}