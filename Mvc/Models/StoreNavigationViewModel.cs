using System.Collections.Generic;

namespace SitefinityWebApp.Mvc.Models
{
	public class StoreNavigationViewModel
	{
		public ICollection<UCommerce.EntitiesV2.Category> Categories { get; set; }
	}
}