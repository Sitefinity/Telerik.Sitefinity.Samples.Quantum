<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="../../MasterPages/Dialog.Master" CodeBehind="SelectProductCatalogGroupTarget.aspx.cs" Inherits="Ucommerce.Web.UI.Catalog.Dialogs.SelectProductCatalogGroupTarget" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeaderLabel" runat="server">
    <asp:Localize ID="Localize1" runat="server" meta:resourceKey="Header" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentArea" runat="server">
    		<div class="propertyPane dialog-header">
			    <h3>
				    <%= GetLocalResourceObject("Header.Text") %>
			    </h3>
				<p class="guiDialogTiny">
					<%= GetLocalResourceObject("SubHeader.Text") %>
				</p>
                <a class="modal-close" onclick="UcommerceClientMgr.closeModalWindow();" data-dismiss="modal" aria-hidden="true"></a>
			</div>
			<div class="propertyPane dialog-content contentCatalogItems">
				<asp:PlaceHolder id="CatalogsSelector" runat="server"></asp:PlaceHolder>
			</div>
            <div class="propertyPane dialog-actions"> 
				<div class="footerOkCancel">  
					<asp:Button id="SaveButton" CssClass="dialog-saveButton" runat="server" onclick="SaveButton_Clicked" />
					<em><%= GetLocalResourceObject("Or.Text") %> </em><a href="#" Class="dialog-cancelButton" onclick="UcommerceClientMgr.closeModalWindow()">
						<%= GetLocalResourceObject("CancelButton.Text") %>
					</a>
				</div>
            </div>

</asp:Content>