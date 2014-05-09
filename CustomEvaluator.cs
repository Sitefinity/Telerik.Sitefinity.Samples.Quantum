using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Telerik.Sitefinity.Personalization.Impl.Evaluators;

namespace SitefinityWebApp
{
    public class CustomEvaluator : SearchKeywordsEvaluator
    {
        protected override string[] GetSearchKeywords()
        {
            if (base.CurrentContext.Request != null && base.CurrentContext.Request.UrlReferrer != null && base.CurrentContext.Request.Url != null)
            {
                var referrerHost = base.CurrentContext.Request.UrlReferrer.Host;
                var currentHost = base.CurrentContext.Request.Url.Host;
                if (currentHost != null && currentHost.Equals(referrerHost))
                {
                    var querySegment = this.CurrentContext.Request.UrlReferrer.Query;
                    if (querySegment.StartsWith("?"))
                    {
                        querySegment = querySegment.Substring(1);
                    }

                    var searchKeywords = new List<string>();

                    var queryStrings = querySegment.Split('&');
                    var queryKey = "searchQuery";
                    foreach (var queryString in queryStrings)
                    {
                        var pair = queryString.Split('=');
                        if (queryKey.Equals(pair[0], StringComparison.InvariantCultureIgnoreCase))
                        {
                            var kwrd = HttpUtility.UrlDecode(pair[1]);
                            if (kwrd.StartsWith("\"") && kwrd.EndsWith("\""))
                            {
                                searchKeywords.Add(kwrd.Trim('"'));
                            }
                            else
                            {
                                searchKeywords.AddRange(kwrd.Split(null));
                            }
                        }
                    }
                    return searchKeywords.ToArray();
                }

            }
            return base.GetSearchKeywords();
        }
    }
}