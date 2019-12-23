<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EditCategoryMedia.ascx.cs" Inherits="UCommerce.Web.UI.Catalog.EditCategoryMedia" %>
<%@ Register tagPrefix="commerce" tagName="ValidationSummary" src="../Controls/ValidationSummaryDisplay.ascx" %>

<commerce:ValidationSummary runat="server" />

<div class="propertyPane leftAligned">
    <h2 class="propertyPaneTitel"><asp:Localize runat="server" meta:resourcekey="CategoryMedia"></asp:Localize></h2>
	<div class="propertyItem">
		<div class="propertyItemHeader"><asp:Localize ID="Localize1" runat="server" meta:resourceKey="Image" /></div>
		<div class="propertyItemContent">
			<asp:PlaceHolder ID="ThumbnailPicker" runat="server"></asp:PlaceHolder>
		</div>
	</div>
    <div class="propertyPaneFooter"></div>
</div>

<asp:Panel runat="server" cssclass="propertyPane" id="PropertyPanel"/>