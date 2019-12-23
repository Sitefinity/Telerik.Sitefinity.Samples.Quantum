<%@ Import Namespace="UCommerce.Presentation.Web"%>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EditEmailTypeBaseProperties.ascx.cs" Inherits="UCommerce.Web.UI.Settings.Email.EditEmailTypeBaseProperties" %>
<%@ Register tagPrefix="commerce" tagName="ValidationSummary" src="../../Controls/ValidationSummaryDisplay.ascx" %>

<commerce:ValidationSummary ID="ValidationSummary1" runat="server" />
<div class="propertyPane leftAligned" >
     <h2 class="propertyPaneTitel"><asp:Localize runat="server" meta:resourceKey="EmailTypeProperties" /></h2>
    <div>

        <div class="propertyItem">
	        <div class="propertyItemHeader"><asp:Localize runat="server" meta:resourceKey="Description" /></div>
            <div class="propertyItemContent">
                <asp:TextBox runat="server" ID="DescriptionTextBox" Text="<%# SanitizeOutput(View.EmailType.Description) %>" TextMode="MultiLine" CssClass="mediumWidth smallHeight" />
            </div>
        </div>        
        <div class="propertyItem">
	        <div class="propertyItemHeader"><asp:Localize runat="server" meta:resourceKey="ModifiedOn" /></div>
            <div class="propertyItemContent">
                <asp:Label runat="server" Text="<%# View.IsNew ? String.Empty : View.EmailType.ModifiedOn.ToString() %>" />
            </div>
        </div>
        <div class="propertyItem">
	        <div class="propertyItemHeader"><asp:Localize runat="server" meta:resourceKey="ModifiedBy" /></div>
            <div class="propertyItemContent">
                <asp:Label runat="server" Text="<%# SanitizeOutput(View.EmailType.ModifiedBy) %>" />
            </div>
        </div>        
    </div>
    <div class="propertyPaneFooter">-</div>
</div>