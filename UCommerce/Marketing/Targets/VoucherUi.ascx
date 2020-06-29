<%@ control language="C#" autoeventwireup="true" codebehind="VoucherUi.ascx.cs" inherits="UCommerce.Web.UI.UCommerce.Marketing.Targets.VoucherUi" %>
<%@ Register TagPrefix="presentation" Assembly="UCommerce.Presentation" namespace="UCommerce.Presentation.Web.Controls" %>
<div>
	<table  cellpadding="0" cellspacing="0" style="width:100%;">
		<tr>
			<td><asp:PlaceHolder runat="server" id="NoVouchersAddedPlaceHolder">
				<asp:Localize id="NoVouchersAddedLabel" runat="server" meta:resourcekey="NoVoucherCodesAdded" />
			</asp:PlaceHolder>

				<asp:PlaceHolder runat="server" id="VouchersPlaceHolder" visible="false">
					<asp:Localize  runat="server" meta:resourceKey="Name" />:
					<asp:Label runat="server" id="lblVoucherName" /><br />
					<asp:Localize  runat="server" meta:resourceKey="Vouchercodes" />:
					<asp:Label runat="server" id="lblVoucherCodes" /><br />
					<asp:Localize  runat="server" meta:resourceKey="MaxUsesLeft" />:
					<asp:Label runat="server" id="lblMaxUsesLeft" /><br />
				</asp:PlaceHolder>
			</td>
			<td style="width:60px; text-align:right; vertical-align:top;" class="voucher-actions">
				<presentation:LabeledImageButton CssClass="export-image-button" id="exportVoucherButton" runat="server" ImageUrl="../../Images/ui/table_save.png" meta:resourcekey="Export" />
				<presentation:LabeledImageButton CssClass="edit-image-button" id="editVoucherButton" runat="server" ImageUrl="../../Images/ui/pencil.png" meta:resourcekey="Edit" />
				<presentation:LabeledImageButton CssClass="delete-image-button" id="deleteVoucherButton" runat="server" ImageUrl="../../Images/ui/cross.png" meta:resourcekey="Delete" onclick="DeleteVoucherButton_Click" /><br />	
			</td>

		</tr>
	</table>
</div>
