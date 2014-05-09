using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using Telerik.Sitefinity.Abstractions;
using Telerik.Sitefinity.Personalization;
using Telerik.Microsoft.Practices.Unity;
using Telerik.Sitefinity.Personalization.Impl.Evaluators;
using Telerik.Sitefinity.Personalization.Impl;

namespace SitefinityWebApp
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {
            Telerik.Sitefinity.Abstractions.Bootstrapper.Initialized += Bootstrapper_Initialized;
        }

        protected void Bootstrapper_Initialized(object sender, Telerik.Sitefinity.Data.ExecutedEventArgs args)
        {
            if (args.CommandName == "Bootstrapped") {
                ObjectFactory.Container.RegisterType(
                    typeof(ICriterionEvaluator),
                    typeof(CustomEvaluator),
                    PersonalizationConstants.CriteriaName.SearchKeywords,
                    new ContainerControlledLifetimeManager(),
                    new InjectionConstructor()); 
            }
            

        }
        
    }
}