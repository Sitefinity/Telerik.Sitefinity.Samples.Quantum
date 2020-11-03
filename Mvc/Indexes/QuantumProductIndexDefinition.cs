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
			this.PricesField(p => p.UnitPrices);
			this.Facet("Colour");
			this.Facet("CollarSize");
			this.Facet("ShoeSize");
			this.Facet("Downloadable");
			this.Facet("License");
			this.Facet("Coupons");
		}
	}
}