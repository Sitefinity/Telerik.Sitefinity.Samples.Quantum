<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="../MasterPages/Dialog.Master" CodeBehind="ChangeOrderStatus.aspx.cs" Inherits="UCommerce.Web.UI.Orders.ChangeOrderStatus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeaderLabel" runat="server"><asp:Localize ID="Localize1" runat="server" meta:resourceKey="Header" /></asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentArea" runat="server">
    <asp:PlaceHolder runat="server" ID="ChangeStatusPlaceHolder">
        <div class="dialog-header">
            <h3><asp:Localize id="Localize8" runat="server" meta:resourcekey="Header" /></h3>
            <p class="guiDialogTiny"><asp:Localize ID="Localize2" runat="server" meta:resourceKey="SubHeader" /></p>
            <a class="modal-close" onclick="UCommerceClientMgr.closeModalWindow();" data-dismiss="modal" aria-hidden="true"></a>
        </div>

        <div class="dialog-content">
	        <div class="dialog-content__property propertyContainer propertyItems ">
				<div class="propertyItem">
					<div class="propertyItemHeader propertyItemContentSmall"><asp:Localize ID="Localize3" runat="server" meta:resourceKey="CurrentStatus"/></div>
					<div class="propertyItemContent propertyItemContentSmall leftAligned" >
					    <asp:Label runat="server" Text="<%# TextSanitizeOutput(PurchaseOrders.First().OrderStatus.Name) %>" />
					</div>
				</div>
				<div class="propertyItem">
					<div class="propertyItemHeader propertyItemContentSmall"><asp:Localize ID="Localize4" runat="server" meta:resourceKey="NewStatus" /></div>
					<div class="propertyItemContent propertyItemContentSmall leftAligned">
						<asp:DropDownList runat="server" ID="NewStatusDropDownList" DataValueField="OrderStatusId" DataTextField="Name" CssClass="mediumWidth"></asp:DropDownList>
					</div>
				</div>
	        </div>
            <div class="propertyPaneFooter">-</div>
        </div>

        <div class="dialog-actions">
	        <div class="footerOkCancel">
				<asp:Button ID="SaveButton"  CssClass="dialog-saveButton" runat="server" meta:resourceKey="SaveButton" OnClick="SaveButton_Clicked" />
				<em>or&nbsp;</em>
				<a href="#" onclick="UCommerceClientMgr.closeModalWindow();" Class="dialog-cancelButton">Cancel</a>
		 </div>
		</div>
    </asp:PlaceHolder>

    <asp:PlaceHolder runat="server" ID="NoAvailableStatusPlaceHolder">
        <div class="dialog-header">
            <h3>
                <asp:Localize ID="Localize5" runat="server" meta:resourceKey="Header" />
            </h3>
            <div>
                <p class="guiDialogTiny">
                    <asp:Localize ID="Localize6" runat="server" meta:resourceKey="SubHeader" />
                </p>
            </div>
        </div>
        <div class="dialog-content">
	        <div class="propertyContainer propertyItems ">
	            <asp:Localize ID="Localize7" runat="server" meta:resourceKey="NoStatus" />
            </div>
        </div>
        <div class="dialog-actions">
            <a href="#" onclick="UCommerceClientMgr.closeModalWindow();" style="color: blue; cursor: hand">Cancel</a>
        </div>
    </asp:PlaceHolder>

</asp:Content>
