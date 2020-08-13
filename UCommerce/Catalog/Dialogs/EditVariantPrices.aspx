<%@ page language="C#" autoeventwireup="true" masterpagefile="../../masterpages/Dialog.master" codebehind="EditVariantPrices.aspx.cs" inherits="Ucommerce.Web.UI.Catalog.Dialogs.EditVariantPrices" %>

<%@ register src="../EditProductPricing.ascx" tagprefix="commerce" tagname="EditPrices" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:content id="Content2" contentplaceholderid="HeaderLabel" runat="server">
</asp:content>
<asp:content id="Content3" contentplaceholderid="ContentArea" runat="server">
	<div class="propertyPane dialog-header">
        <h3><asp:Localize id="Localize8" runat="server" meta:resourcekey="Header"></asp:Localize></h3>
        <p class="guiDialogTiny"><asp:Localize ID="subText" runat="server" meta:resourceKey="subText"></asp:Localize></p>
        <a class="modal-close" onclick="UcommerceClientMgr.closeModalWindow();" data-dismiss="modal" aria-hidden="true"></a>
    </div>
	<div class="propertyPane contentPane">
		<div class="propertyContainer propertyItems">
			<commerce:PropertyPanel ID="PropertyPanel1" runat="server">
				<commerce:EditPrices runat="server" ID="EditProductPrices" />
			</commerce:PropertyPanel>
		</div>
	</div>
	<div class="propertyPane dialog-actions">
		<div class="footerOkCancel">
			<asp:Button runat="server" ID="SaveButton" CssClass="dialog-saveButton" Text="Save" OnClick="SaveButton_Clicked" />
			<em>or</em>
			<a href="#" onclick="UcommerceClientMgr.closeModalWindow();" Class="dialog-cancelButton">Cancel</a>    
		</div>
	</div>
</asp:content>
