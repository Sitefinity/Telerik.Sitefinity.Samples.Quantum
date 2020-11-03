<%@ page language="C#" autoeventwireup="true" codebehind="AddProduct.aspx.cs"
	inherits="Ucommerce.Web.UI.Orders.AddProduct" MasterPageFile="../MasterPages/Dialog.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeaderLabel" runat="server"><asp:Localize ID="Localize5" runat="server" meta:resourceKey="Header" /></asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentArea" runat="server">
   	<div class="propertyPane dialog-header">
        <h3>
		    <span><asp:Localize id="Localize2" runat="server" meta:resourcekey="Header" /></span>
	    </h3>
	    <div>
		    <p class="guiDialogTiny"><asp:Localize id="Localize3" runat="server" meta:resourcekey="SubHeader" /></p>
	    </div>
        <a class="modal-close" onclick="UcommerceClientMgr.closeModalWindow();" data-dismiss="modal" aria-hidden="true"></a>
   	</div>
	<div class="contentPane propertyPane add-product-on-order dialog-content">
		<div class="propertyContainer propertyItems">
			<div class="propertyItem">
				<div class="propertyItemHeader"><asp:Localize ID="Localize4" runat="server" meta:resourceKey="PriceGroup" /></div>
				<div class="propertyItemContent propertyItemContentSmall">
					<asp:DropDownList runat="server" ID="PriceGroupDropDown" CssClass="mediumWidth" Style="margin-top: 0px" />
				</div>
			</div>
			

			<div class="multiProductPicker">
				<asp:PlaceHolder runat="server" ID="MultiProductSelectionPlaceHolder"></asp:PlaceHolder>
				<div class="propertyPaneFooter"></div>
			</div>
		</div>
	</div>
	
    <div class="propertyPane dialog-actions">
		<div class="footerOkCancel">
			<asp:Button id="SaveButton" CssClass="dialog-saveButton" runat="server" meta:resourcekey="SaveButton" onclick="SaveButton_Clicked" />
			<em>or </em><a href="#" class="dialog-cancelButton" onclick="UcommerceClientMgr.closeModalWindow()">
				<asp:Localize id="Localize1" runat="server" meta:resourcekey="CancelButton" />
			</a>
		</div>
	</div>
 
</asp:Content>