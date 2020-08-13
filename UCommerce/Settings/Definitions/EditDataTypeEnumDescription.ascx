<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EditDataTypeEnumDescription.ascx.cs" Inherits="Ucommerce.Web.UI.Settings.Definitions.EditDataTypeEnumDescription" %>
<%@ Register tagPrefix="commerce" tagName="ValidationSummary" src="../../Controls/ValidationSummaryDisplay.ascx" %>

<commerce:ValidationSummary runat="server" />
<div class="propertyPane leftAligned">
     <h2 class="propertyPaneTitel"><asp:Localize runat="server" meta:resourceKey="EnumDescription" /></h2>
    <div>
        <div class="propertyItem">
            <div class="propertyItemHeader"><asp:Localize runat="server" meta:resourceKey="DisplayName" /></div>
            <div class="propertyItemContent">
                <asp:TextBox runat="server" ID="DisplayNameTextBox" Text="<%# SanitizeOutput(Description.DisplayName) %>" CssClass="mediumWidth multiLingualDisplayName" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="DisplayNameTextBox" Display="Dynamic" Text="*" ErrorMessage='<%# string.Format("{0} ({1})", GetLocalResourceObject("DisplayName.Text"), CultureCode) %>' CssClass="validator" />
            </div>
        </div>
        <div class="propertyItem">
            <div class="propertyItemHeader"><asp:Localize runat="server" meta:resourceKey="Description" /></div>
            <div class="propertyItemContent">
                <asp:TextBox runat="server" ID="DescriptionTextBox" Text="<%# SanitizeOutput(Description.Description) %>" CssClass="mediumWidth smallHeight" TextMode="MultiLine" />
            </div>
        </div>        
    </div>
    <div class="propertyPaneFooter">-</div>
</div>