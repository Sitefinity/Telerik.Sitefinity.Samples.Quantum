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


public class Index_Raven_2fDocumentsByEntityName : Raven.Database.Linq.AbstractViewGenerator
{
	public Index_Raven_2fDocumentsByEntityName()
	{
		this.ViewText = @"from doc in docs 
let Tag = doc[""@metadata""][""Raven-Entity-Name""]
select new { Tag, LastModified = (DateTime)doc[""@metadata""][""Last-Modified""] };";
		this.AddMapDefinition(docs => 
			from doc in docs
			let Tag = doc["@metadata"]["Raven-Entity-Name"]
			select new {
				Tag,
				LastModified = (DateTime)doc["@metadata"]["Last-Modified"],
				__document_id = doc.__document_id
			});
		this.AddField("LastModified");
		this.AddField("__document_id");
		this.AddField("Tag");
		this.AddQueryParameterForMap("__document_id");
		this.AddQueryParameterForReduce("__document_id");
	}
}
