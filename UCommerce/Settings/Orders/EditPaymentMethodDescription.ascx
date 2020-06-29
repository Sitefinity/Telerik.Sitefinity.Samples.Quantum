<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EditPaymentMethodDescription.ascx.cs" Inherits="UCommerce.Web.UI.Settings.Orders.EditPaymentMethodDescription" %>
<%@ Register tagPrefix="commerce" tagName="ValidationSummary" src="../../Controls/ValidationSummaryDisplay.ascx" %>

<commerce:ValidationSummary runat="server" />
<div class="propertyPane leftAligned" >
    <h2 class="propertyPaneTitel"><asp:Localize runat="server" meta:resourceKey="PaymentMethodDescription" /></h2>
    <div>
        <div class="propertyItem">
            <div class="propertyItemHeader"><asp:Localize runat="server" meta:resourceKey="DisplayName" /></div>
            <div class="propertyItemContent">
                <asp:TextBox runat="server" ID="DisplayNameTextBox" Text="<%# SanitizeOutput(Description.DisplayName) %>" CssClass="mediumWidth multiLingualDisplayName" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="DisplayNameTextBox" Text="*" ErrorMessage='<%# GetLocalResourceObject("DisplayName.Text") + string.Format(" ({0})", CultureCode)%>' CssClass="validator" />
            </div>
        </div>
        <div class="propertyItem">
	        <div class="propertyItemHeader"><asp:Localize runat="server" meta:resourceKey="Description" /></div>
            <div class="propertyItemContent">
                <asp:TextBox runat="server" ID="DescriptionTextBox" TextMode="MultiLine" Text="<%# SanitizeOutput(Description.Description) %>" CssClass="mediumWidth smallHeight" />
            </div>
        </div>        
    </div>
    <div class="propertyPaneFooter">-</div>
</div>
<asp:Panel runat="server" id="PropertyPanel" cssclass="propertyPane"></asp:Panel>