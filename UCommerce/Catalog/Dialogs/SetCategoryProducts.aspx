<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="../../masterpages/Dialog.master" CodeBehind="SetCategoryProducts.aspx.cs" Inherits="Ucommerce.Web.UI.Ucommerce.Catalog.Dialogs.SetCategoryProducts" %>
<%@ Register tagPrefix="commerce" tagName="ValidationSummary" src="../../Controls/ValidationSummaryDisplay.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeaderLabel" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentArea" runat="server">
    <div class="dialog-header">
        <h3>
		    <span>
			    <asp:Localize id="Localize2" meta:resourcekey="Header" runat="server" /> <asp:Label id="categoryName" runat="server"></asp:Label>
		    </span>
	    </h3>
	    <div>
		    <p class="guiDialogTiny">
			    <asp:Localize id="Localize3" runat="server" meta:resourcekey="SubHeader" />
		    </p>
            <a class="modal-close" onclick="UcommerceClientMgr.closeModalWindow();" data-dismiss="modal" aria-hidden="true"></a>
	    </div>
        <a class="modal-close" onclick="UcommerceClientMgr.closeModalWindow();" data-dismiss="modal" aria-hidden="true"></a>
   	</div>
    <commerce:ValidationSummary runat="server" />
    <div class="contentPane propertyPane set-category-products dialog-content">
        <asp:PlaceHolder ID="ProductsPlaceHolder" runat="server"></asp:PlaceHolder>
    </div>

    <asp:CustomValidator runat="server" CssClass="validator" ID="ProductCategoriesValidator" ErrorMessage='<%# GetLocalResourceObject("ProductCategories") %>' Display="None" OnServerValidate="OnServerValidate"></asp:CustomValidator>
    
    <div class="dialog-actions">
	    <div class="footerOkCancel">
			<asp:Button id="SaveButton" CssClass="dialog-saveButton" runat="server" meta:resourcekey="SaveButton" onclick="SaveButton_Clicked"></asp:Button>
			<em>
			    <asp:Localize id="Localize5" runat="server" meta:resourcekey="Or" />
			</em>
            <a href="#" Class="dialog-cancelButton" onclick="UcommerceClientMgr.closeModalWindow()">
				<asp:Localize id="Localize1" runat="server" meta:resourcekey="CancelButton" />
			</a>
		</div>
	</div>
</asp:Content>
