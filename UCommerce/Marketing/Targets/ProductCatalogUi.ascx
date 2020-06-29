<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProductCatalogUi.ascx.cs" Inherits="UCommerce.Web.UI.UCommerce.Marketing.Targets.ProductCatalogUi" %>
<%@ Register TagPrefix="presentation" Assembly="UCommerce.Presentation" namespace="UCommerce.Presentation.Web.Controls" %>

<table cellpadding="0" cellspacing="0" style="width:100%;">
	<tr>
		<td>
			<asp:PlaceHolder runat="server" id="NoProductCatalogSelectedPlaceHolder">
				<asp:Localize id="NoProductCatalogSelectedLabel" runat="server" meta:resourcekey="NoProductCatalogSelected" />
			</asp:PlaceHolder>

			<asp:PlaceHolder runat="server" id="ProductCatalogInfoPlaceHolder" visible="false">
				<asp:Localize id="NameLabel" runat="server" meta:resourcekey="Name" />: <asp:Label runat="server" id="ProductCatalogNameLabel" /><br />
			</asp:PlaceHolder>
		</td>
		<td style="width:50px; text-align:right; vertical-align:top;">
			<presentation:LabeledImageButton CssClass="edit-image-button" id="SelectProductCatalogButton" runat="server" ImageUrl="../../Images/ui/pencil.png" meta:resourcekey="Edit" />
			<presentation:LabeledImageButton CssClass="delete-image-button" id="DeleteTargetButton" runat="server" ImageUrl="../../Images/ui/cross.png" meta:resourcekey="Delete" onclick="DeleteTargetButton_Click" /><br />
		</td>
	</tr>
</table>