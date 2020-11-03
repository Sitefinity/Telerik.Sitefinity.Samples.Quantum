<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EditEmailProfileContent.ascx.cs" Inherits="Ucommerce.Web.UI.Settings.Email.EditEmailProfileContent" %>
<%@ Register tagPrefix="commerce" tagName="ValidationSummary" src="../../Controls/ValidationSummaryDisplay.ascx" %>

<commerce:validationsummary runat="server" />
<div class="propertyPane">
    <h2 class="propertyPaneTitel"><asp:Localize runat="server" meta:resourceKey="EmailContentProperties" /></h2>
    <div class="propertyItem email-subject">
        <div class="propertyItemHeader"><asp:Localize runat="server" meta:resourceKey="Subject" /></div>
        <div class="propertyItemContent">
            <asp:TextBox runat="server" ID="SubjectTextBox" Text="<%# SanitizeOutput(EmailContent.Subject) %>" CssClass="largeWidth" />
            <asp:RequiredFieldValidator id="SubjectRequiredFieldValidator" runat="server" ControlToValidate="SubjectTextBox" Text="*" ErrorMessage='<%# GetLocalResourceObject("Subject.Text") %>' CssClass="validator" />
        </div>
    </div>
    <div class="propertyItem">
        <div class="propertyItemHeader"><asp:Localize ID="Localize1" runat="server" meta:resourceKey="ContentSelector" /><br />
            <small class="small"><asp:Localize ID="Localize2" runat="server" meta:resourceKey="ContentSelectorDescription" /><%# SanitizeOutput(EmailContent.EmailType.Description) %></small>
        </div>
        <div class="propertyItemContent">
            <asp:PlaceHolder ID="ContentPicker" runat="server"></asp:PlaceHolder>
        </div>
    </div>
    <div class="propertyPaneFooter">-</div>
</div>
