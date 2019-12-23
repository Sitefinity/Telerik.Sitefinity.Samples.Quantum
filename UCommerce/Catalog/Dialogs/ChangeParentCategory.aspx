<%@ Page Title="" Language="C#" MasterPageFile="../../MasterPages/Dialog.Master" AutoEventWireup="true" CodeBehind="ChangeParentCategory.aspx.cs" Inherits="UCommerce.Web.UI.UCommerce.Catalog.Dialogs.ChangeParentCategory" %>
<%@ Register TagPrefix="uc" Namespace="UCommerce.Web.UI.Catalog.Dialogs" Assembly="UCommerce.Admin" %>
<%@ Import Namespace="UCommerce.Web.UI.Catalog.Dialogs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeaderLabel" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentArea" runat="server">
	<div class="propertyPane dialog-header">
        <h3>
		    <span>
			    <asp:Localize id="Localize2" meta:resourcekey="Header" runat="server" />
		    </span>
	    </h3>
	    <div>
		    <p class="guiDialogTiny">
			    <asp:Localize id="Localize3" runat="server" meta:resourcekey="SubHeader" />
		    </p>
	    </div>
        <a class="modal-close" onclick="UCommerceClientMgr.closeModalWindow();" data-dismiss="modal" aria-hidden="true"></a>
   	</div>
	<div class="propertyPane contentPaneTwo">
	    <div id="newCategorySelector" class="TreeViewWrapper large row-hover overFlowScroll">
	        <asp:TreeView ID="CategorySelector" runat="server" ExpandImageUrl="../../images/expand.png" CollapseImageUrl="../../images/collapse.png"/>		        
	    </div>
	</div>
	<div class="propertyPane dialog-actions"> 
		<div class="footerOkCancel">
			<asp:Button id="SaveButton" CssClass="dialog-saveButton" runat="server" meta:resourcekey="SaveButton" onclick="SaveButton_Clicked" />
			
            <a href="#" Class="dialog-cancelButton" onclick="UCommerceClientMgr.closeModalWindow()">
				<asp:Localize id="Localize1" runat="server" meta:resourcekey="CancelButton" />
			</a>
		</div>
	</div>
</asp:Content>
