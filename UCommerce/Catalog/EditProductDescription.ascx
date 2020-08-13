<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EditProductDescription.ascx.cs" Inherits="Ucommerce.Web.UI.Catalog.EditProductDescription" %>
<%@ Register TagPrefix="commerce" TagName="ValidationSummary" Src="../Controls/ValidationSummaryDisplay.ascx" %>

<commerce:validationsummary runat="server" />
<div class="propertyPane contentPane">
    <h2 class="propertyPaneTitel"><asp:Localize runat="server" meta:resourcekey="LangaugeSpecificProperties"></asp:Localize></h2>
	<div class="propertyItems">
		<div class="propertyItem">
			<div class="propertyItemHeader"><asp:Localize ID="Localize1" runat="server" meta:resourceKey="DisplayName" /></div>
			<div class="propertyItemContent">
				<asp:TextBox runat="server" CssClass="multiLingualDisplayName maxWidth" ID="DisplayNameTextBox" Text="<%# ProductDescription.DisplayName %>" />
			</div>
		</div>
		<div class="propertyItem">
			<div class="propertyItemHeader"><asp:Localize ID="Localize2" runat="server" meta:resourceKey="ShortDescription" /></div>
			<div class="propertyItemContent">
				<asp:TextBox runat="server" ID="ShortDescriptionTextBox" CssClass="maxWidth" TextMode="MultiLine" Text="<%# ProductDescription.ShortDescription %>" />
			</div>
		</div>
		<div class="propertyItem">
			<div class="propertyItemHeader"><asp:Localize ID="Localize3" runat="server" meta:resourceKey="LongDescription" /></div>
			<div class="propertyItemContent">
				<asp:PlaceHolder ID="LongDescriptionPlaceHolder" runat="server" />
			</div>
		</div>
	</div>
	<div class="propertyPaneFooter"></div>
</div>
<div class="contentPane">
	<asp:Panel ID="PropertyPanel" runat="server" CssClass="propertyPane propertyItems" />
</div>