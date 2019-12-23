using Raven.Abstractions;
using Raven.Database.Linq;
using System.Linq;
using System.Collections.Generic;
using System.Collections;
using System;
using Raven.Database.Linq.PrivateExtensions;
using Lucene.Net.Documents;
using System.Globalization;
using System.Text.RegularExpressions;
using Raven.Database.Indexing;


public class Index_ProductsFullTextByNameSearch : Raven.Database.Linq.AbstractViewGenerator
{
	public Index_ProductsFullTextByNameSearch()
	{
		this.ViewText = @"docs.Products.Select(product => new {
    Name = product.Name
})";
		this.ForEntityNames.Add("Products");
		this.AddMapDefinition(docs => docs.Where(__document => string.Equals(__document["@metadata"]["Raven-Entity-Name"], "Products", System.StringComparison.InvariantCultureIgnoreCase)).Select((Func<dynamic, dynamic>)(product => new {
			Name = product.Name,
			__document_id = product.__document_id
		})));
		this.AddField("Name");
		this.AddField("__document_id");
	}
}
