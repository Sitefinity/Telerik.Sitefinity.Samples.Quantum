<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="../../masterpages/Dialog.master" CodeBehind="SelectCategoryTarget.aspx.cs" Inherits="UCommerce.Web.UI.Catalog.Dialogs.SelectCategoryTarget" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeaderLabel" runat="server">
    <asp:Localize ID="Localize1" runat="server" meta:resourceKey="Header" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentArea" runat="server">
    <div class="propertyPane dialog-header">
		<h3>
			<span>
				<%= GetLocalResourceObject("Header.Text") %>
			</span>
		</h3>
		<p class="guiDialogTiny">
			<%= GetLocalResourceObject("SubHeader.Text") %>
		</p>
        <a class="modal-close" onclick="UCommerceClientMgr.closeModalWindow();" data-dismiss="modal" aria-hidden="true"></a>
	</div>
	<div class="propertyPane dialog-content contentCatalogItems">
		<div class="propertyItems">
			<asp:PlaceHolder id="CategorySelector" runat="server"></asp:PlaceHolder>
		</div>
    </div>
    <div class="propertyPane dialog-actions">
	    <div class="footerOkCancel">       
			<asp:Button id="SaveButton" CssClass="dialog-saveButton" runat="server" meta:resourcekey="SaveButton" onclick="SaveButton_Clicked" />
			<em><%= GetLocalResourceObject("Or.Text") %> </em><a href="#" Class="dialog-cancelButton" onclick="UCommerceClientMgr.closeModalWindow()">
				<%= GetLocalResourceObject("CancelButton.Text") %>
			</a>	
		</div>
	</div>
</asp:Content>