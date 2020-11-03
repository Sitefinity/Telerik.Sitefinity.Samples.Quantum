<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EditShippingMethodDescription.ascx.cs" Inherits="Ucommerce.Web.UI.Settings.Orders.EditShippingMethodDescription" %>
<%@ Register tagPrefix="commerce" tagName="ValidationSummary" src="../../Controls/ValidationSummaryDisplay.ascx" %>

<commerce:ValidationSummary runat="server" />
<div style="text-align: left;">
    <div class="propertyPane leftAligned">
         <h2 class="propertyPaneTitel"><asp:Localize runat="server" meta:resourceKey="ShippingMethodDescriptions" /></h2>
        <div class="propertyItem">
            <div class="propertyItemHeader"><asp:Localize runat="server" meta:resourceKey="DisplayName" /></div>
            <div class="propertyItemContent">
                <asp:TextBox runat="server" ID="DisplayNameTextBox" Text="<%# SanitizeOutput(Description.DisplayName) %>" CssClass="mediumWidth multiLingualDisplayName" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="DisplayNameTextBox" Text="*" ErrorMessage='<%# GetLocalResourceObject("DisplayName.Text") + string.Format(" ({0})", CultureCode)%>' CssClass="validator" />
            </div>
            <div class="propertyPaneFooter"></div>
        </div>
        <div class="propertyItem">
            <div class="propertyItemHeader"><asp:Localize runat="server" meta:resourceKey="Description" /></div>
            <div class="propertyItemContent">
                <asp:TextBox runat="server" ID="DescriptionTextBox" Text="<%# SanitizeOutput(Description.Description) %>" TextMode="MultiLine" CssClass="mediumWidth smallHeight" />
            </div>
            <div class="propertyPaneFooter"></div>
        </div>
        <div class="propertyItem">
            <div class="propertyItemHeader"><asp:Localize runat="server" meta:resourceKey="DeliveryText" /></div>
            <div class="propertyItemContent">
                <asp:TextBox runat="server" ID="DeliveryTextTextBox" Text="<%# SanitizeOutput(Description.DeliveryText) %>" CssClass="mediumWidth" />
            </div>
            <div class="propertyPaneFooter"></div>
        </div>
    </div>
</div>