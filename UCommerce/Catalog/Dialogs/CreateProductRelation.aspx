<%@ page language="C#" autoeventwireup="true" codebehind="CreateProductRelation.aspx.cs"
	inherits="Ucommerce.Web.UI.Catalog.Dialogs.CreateProductRelation" masterpagefile="../../MasterPages/Dialog.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:content id="Content2" contentplaceholderid="HeaderLabel" runat="server"><asp:Localize ID="Localize5" runat="server" meta:resourceKey="Header" /></asp:content>
<asp:content id="Content3" contentplaceholderid="ContentArea" runat="server">
   	<div class="dialog-header">
      <h3>
		    <span><asp:Localize id="Localize2" runat="server" meta:resourcekey="Header" /></span>
	    </h3>
	    <div>
		    <p class="guiDialogTiny"><asp:Localize id="Localize3" runat="server" meta:resourcekey="SubHeader" /></p>
	    </div>
      <a class="modal-close" onclick="UcommerceClientMgr.closeModalWindow();" data-dismiss="modal" aria-hidden="true"></a>
   	</div>
	<div class="create-product-relation dialog-content">
		
			<div class="dialog-content__property">
				<div class="propertyItemHeader" ><asp:Localize id="Localize4" runat="server" meta:resourcekey="RelationType" /></div>
				<div class="propertyItemContent" >
					<asp:DropDownList CssClass="editorDropDownBox" runat="server" id="RelationTypeSelector" datasource="<%# RelationTypes %>"
						datatextfield="Name" datavaluefield="ProductRelationTypeId" AutoPostBack="True" />
				</div>
			</div>
			<div class="dialog-content__property">
				<div class="propertyItemHeader" ><asp:Localize id="Localize6" runat="server" meta:resourcekey="TwoWayRelation" /></div>
				<div class="propertyItemContent" >
					<asp:CheckBox id="TwoWayRelationshipCheckBox" class="Ucommerce-toggle-check-box" runat="server" />
				</div>
			</div> 
		
			<asp:PlaceHolder runat="server" ID="ProductRelationsPlaceHolder"></asp:PlaceHolder>
	</div>
    <div class="dialog-actions">
	    <div class="footerOkCancel">
			<asp:Button id="SaveButton" CssClass="dialog-saveButton" runat="server" meta:resourcekey="SaveButton" onclick="SaveButton_Clicked" />
			<em>or&nbsp;</em>
			<a href="#" Class="dialog-cancelButton" onclick="UcommerceClientMgr.closeModalWindow()"><asp:Localize id="Localize1" runat="server" meta:resourcekey="CancelButton" /></a>
		</div>
	</div>
</asp:content>
