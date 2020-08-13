<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EditDefinitionFieldDescription.ascx.cs" Inherits="Ucommerce.Web.UI.Settings.Definitions.EditDefinitionFieldDescription" %>
<%@ Register tagPrefix="commerce" tagName="ValidationSummary" src="../../Controls/ValidationSummaryDisplay.ascx" %>
<commerce:ValidationSummary runat="server" />

<div class="propertyPane">
    <h2 class="propertyPaneTitel"><asp:Localize runat="server" meta:resourceKey="DefinitionFieldDescription" /></h2>
    <div class="propertyItem">
        <div class="propertyItemHeader"><asp:Localize ID="Localize1" runat="server" meta:resourceKey="DisplayName" /></div>
        <div class="propertyItemContent">
            <asp:TextBox runat="server" ID="DisplayNameTextBox" Text="<%# SanitizeOutput(View.DefinitionField.GetDisplayName(CultureCode)) %>" cssclass="mediumWidth multiLingualDisplayName" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="DisplayNameTextBox" Text="*" ErrorMessage='<%# string.Format("{0} ({1})", GetLocalResourceObject("DisplayName.Text"), CultureCode) %>' CssClass="validator" Display="Static" />
        </div>
    </div>
    <div class="propertyItem">
        <div class="propertyItemHeader"><asp:Localize ID="Localize2" runat="server" meta:resourceKey="Description" /></div>
        <div class="propertyItemContent">
            <asp:TextBox runat="server" ID="DescriptionTextBox" Text="<%# SanitizeOutput(View.DefinitionField.GetDescription(CultureCode)) %>" textmode="MultiLine" cssclass="mediumWidth" />
        </div>
    </div>
    <div class="propertyPaneFooter"></div>
</div>
