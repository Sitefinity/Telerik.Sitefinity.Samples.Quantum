using System.Collections.Generic;
using System.Linq;
using Telerik.Web.Data.Extensions;
using Ucommerce.Search.Extensions;
namespace SitefinityWebApp.Mvc.Indexes
{
	public class QuantumProductIndexDefinition : Ucommerce.Search.Definitions.DefaultProductsIndexDefinition
	{
		public QuantumProductIndexDefinition() : base()
		{
			this.Field(p => p["ShowOnHomepage"], typeof(bool));
			this.Field(p => p["CollarSize"], typeof(string));
			this.Field(p => p["ShoeSize"], typeof(string));
			this.Field(p => p["Colour"], typeof(string));
			this.Field(p => p["Downloadable"], typeof(bool));
			this.Field(p => p["License"], typeof(string));
			this.Field(p => p["Coupons"], typeof(string));
			this.Field(p => p.UnitPrices);
			this.Field(p => p.PricesInclTax);
			this.Field(p => p.Taxes);

			var priceGroupRepository = Ucommerce.Infrastructure.ObjectFactory.Instance.Resolve<Ucommerce.EntitiesV2.IRepository<Ucommerce.EntitiesV2.PriceGroup>>();
			var allPriceGroups = priceGroupRepository.Select(p => p.Deleted == false);
			foreach (var priceGroup in allPriceGroups)
			{
				this.Field(p => p.UnitPrices[priceGroup.Name]).Facet().AutoRanges();
			}

			this.Facet("Colour");
			this.Facet("CollarSize");
			this.Facet("ShoeSize");
			this.Facet("Downloadable");
			this.Facet("License");
			this.Facet("Coupons");
		}
	}
}