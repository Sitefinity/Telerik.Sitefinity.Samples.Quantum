<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="../masterpages/Dialog.master" CodeBehind="AddAuditMessage.aspx.cs" Inherits="Ucommerce.Web.UI.Orders.AddAuditMessage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeaderLabel" runat="server"><asp:Localize ID="Localize4" runat="server" meta:resourceKey="Header" /></asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentArea" runat="server">
	<asp:PlaceHolder runat="server" ID="ChangeStatusPlaceHolder">
		<div class="propertyPane dialog-header">
            <h3><asp:Localize ID="Localize1" runat="server" meta:resourceKey="Header" /></h3>
		    <p class="guiDialogTiny"><asp:Localize ID="Localize2" runat="server" meta:resourceKey="SubHeader" /></p>
            <a class="modal-close" onclick="UcommerceClientMgr.closeModalWindow();" data-dismiss="modal" aria-hidden="true"></a>
		</div>        
		<div class="propertyPane contentPane">            
			<div class="propertyContainer propertyItems">
				<div class="propertyItem" >
					<div class="propertyItemHeader propertyItemContentSmall"><asp:Localize ID="Localize3" runat="server" meta:resourceKey="Message" /></div>
					<div class="propertyItemContent propertyItemContentSmall">
						<asp:TextBox ID="txtMessage" Width="100%" Height="95px" TextMode="MultiLine" runat="server"/>
					</div>
				</div>
			</div>
			<div class="propertyPaneFooter">-</div>            
		</div>
		<div class="propertyPane dialog-actions">
			<div class="footerOkCancel">
				<asp:Button ID="SaveButton" runat="server" CssClass="dialog-saveButton" meta:resourceKey="AddButton" OnClick="SaveButton_Clicked" />
				<em>or</em>
				<a href="#" onclick=" UcommerceClientMgr.closeModalWindow();" class="dialog-cancelButton">Cancel</a>              
			</div>
		</div>
	</asp:PlaceHolder>
</asp:Content>