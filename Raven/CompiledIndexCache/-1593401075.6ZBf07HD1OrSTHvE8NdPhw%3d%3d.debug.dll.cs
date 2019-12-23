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


public class Index_SearchRecordsFullTextSearchByName : Raven.Database.Linq.AbstractViewGenerator
{
	public Index_SearchRecordsFullTextSearchByName()
	{
		this.ViewText = @"docs.SearchRecords.Select(searchrecord => new {
    Name = searchrecord.Name
})";
		this.ForEntityNames.Add("SearchRecords");
		this.AddMapDefinition(docs => docs.Where(__document => string.Equals(__document["@metadata"]["Raven-Entity-Name"], "SearchRecords", System.StringComparison.InvariantCultureIgnoreCase)).Select((Func<dynamic, dynamic>)(searchrecord => new {
			Name = searchrecord.Name,
			__document_id = searchrecord.__document_id
		})));
		this.AddField("Name");
		this.AddField("__document_id");
	}
}
