<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProductCatalogGroupUi.ascx.cs" Inherits="Ucommerce.Web.UI.Ucommerce.Marketing.Targets.ProductCatalogGroupUi" %>
<%@ Register TagPrefix="presentation" Assembly="Ucommerce.Presentation" namespace="Ucommerce.Presentation.Web.Controls" %>

<table cellpadding="0" cellspacing="0" style="width:100%;">
	<tr>
		<td>
			<asp:PlaceHolder runat="server" id="NoProductCatalogGroupSelectedPlaceHolder">
				<asp:Localize id="NoProductCatalogGroupSelectedLabel" runat="server" meta:resourcekey="NoProductCatalogGroupSelected" />
			</asp:PlaceHolder>

			<asp:PlaceHolder runat="server" id="ProductCatalogGroupInfoPlaceHolder" visible="false">
				<asp:Localize id="NameLabel" runat="server" meta:resourcekey="Name" />: <asp:Label runat="server" id="ProductCatalogGroupNameLabel" /><br />
			</asp:PlaceHolder>
		</td>
		<td style="width:50px; text-align:right; vertical-align:top;">
			<presentation:LabeledImageButton CssClass="edit-image-button" id="SelectProductCatalogGroupButton" runat="server" ImageUrl="../../Images/ui/pencil.png" meta:resourcekey="Edit" />
			<presentation:LabeledImageButton CssClass="delete-image-button" id="DeleteTargetButton" runat="server" ImageUrl="../../Images/ui/cross.png" meta:resourcekey="Delete" onclick="DeleteTargetButton_Click" /><br />
		</td>
	</tr>
</table>