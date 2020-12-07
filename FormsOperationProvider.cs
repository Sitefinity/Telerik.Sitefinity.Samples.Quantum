using System;
using System.Linq;
using System.Collections.Generic;
using System.Web;
using Telerik.Sitefinity.Modules.Forms;
using Telerik.Sitefinity.Web.Services.Contracts.Operations;
using System.Runtime.Serialization;
using Telerik.Sitefinity.Forms.Model;

namespace SitefinityWebApp
{
    public class FormsOperationProvider : IOperationProvider
    {
        public IEnumerable<OperationData> GetOperations(Type clrType)
        {
            if (clrType == typeof(FormDraft))
            {
                var operationData = OperationData.Create<FormData, SubmitResult>(this.SubmitForm);
                operationData.IsRead = false;
                operationData.OperationType = OperationType.Collection;
                operationData.IsAllowedUnauthorized = true;
                return new[] { operationData };
            }

            return Array.Empty<OperationData>();
        }

        private SubmitResult SubmitForm(OperationContext context, FormData formData)
        {
            var manager = FormsManager.GetManager();

            var form = manager.GetForms().FirstOrDefault(x => x.Name == "sf_register");

            var fieldMapping = new Dictionary<string, string>()
            {
                { "Name", "TextFieldController" },
                { "Company", "TextFieldController_0" },
                { "Email", "TextFieldController_1" },
                { "Comment", "ParagraphTextFieldController" },
                { "IsPrivacyPolicyAccepted", "CheckboxesFieldController" },
            };

            var formEntry = new FormEntryDTO(form);
            var formSubmition = new FormsSubmitionHelper();

            if (!formSubmition.ValidateRestrictions(formEntry, out string error))
                throw new InvalidOperationException(error);

            var resultDictionary = new Dictionary<string, object>();
            foreach (var field in formData.Fields)
            {
                if (fieldMapping.TryGetValue(field.Name, out string value))
                {
                    resultDictionary.Add(value, field.Value);
                }
            }

            formEntry.PostedData.FormsData = resultDictionary;
            formSubmition.Save(formEntry);

            return new SubmitResult();
        }
    }

    [DataContract]
    public class SubmitResult
    {
    }

    [DataContract]
    public class FormData
    {
        [DataMember]
        public FormField[] Fields { get; set; }
    }

    [DataContract]
    public class FormField
    {
        [DataMember]
        public string Name { get; set; }

        [DataMember]
        public string Value { get; set; }
    }
}