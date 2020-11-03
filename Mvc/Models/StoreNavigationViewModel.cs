using System.Collections.Generic;
using Ucommerce.Search.Models;

namespace SitefinityWebApp.Mvc.Models
{
	public class StoreNavigationViewModel
	{
		public ICollection<Category> Categories { get; set; }
	}
}