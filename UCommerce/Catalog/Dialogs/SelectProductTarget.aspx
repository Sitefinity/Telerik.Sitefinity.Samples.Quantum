<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="../../masterpages/Dialog.master" CodeBehind="SelectProductTarget.aspx.cs" Inherits="UCommerce.Web.UI.Catalog.Dialogs.SelectProductTarget" %>

<asp:content id="Content1" contentplaceholderid="head" runat="server">
</asp:content>
<asp:content id="Content2" contentplaceholderid="HeaderLabel" runat="server">
    <asp:Localize ID="Localize5" runat="server" meta:resourceKey="Header" />
</asp:content>
<asp:content id="Content3" contentplaceholderid="ContentArea" runat="server">
	<div class="propertyPane dialog-header">
		<h3>
			<span>
				<%= GetLocalResourceObject("Header.Text") %>
			</span>
		</h3>
		<div>
			<p class="guiDialogTiny">
				<%= GetLocalResourceObject("SubHeader.Text") %>
			</p>
		</div>
        <a class="modal-close" onclick="UCommerceClientMgr.closeModalWindow();" data-dismiss="modal" aria-hidden="true"></a>
    </div>
	<div class="propertyPane contentPane dialog-content">
            <asp:PlaceHolder id="ProductsSelector" runat="server"></asp:PlaceHolder>
		<div class="propertyPaneFooter"></div>
	</div>
    <div class="dialog-actions">
	    <div class="footerOkCancel"> 
			<asp:Button id="SaveButton" CssClass="dialog-saveButton" runat="server" onclick="SaveButton_Clicked" />
			<em><%= GetLocalResourceObject("Or.Text") %> </em>
			<a href="#" Class="dialog-cancelButton" onclick="UCommerceClientMgr.closeModalWindow()">
				<%= GetLocalResourceObject("CancelButton.Text") %>
			</a>
		</div>
    </div>
</asp:content>