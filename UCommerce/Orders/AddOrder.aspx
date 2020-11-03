<%@ page language="C#" autoeventwireup="true" codebehind="AddOrder.aspx.cs"
	inherits="Ucommerce.Web.UI.Orders.AddOrder" MasterPageFile="../MasterPages/Dialog.Master" %>
<%@ import namespace="Ucommerce.Web.UI.Catalog.Dialogs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<script type="text/javascript">
		$(function () {
			$('.hintText').each(function (i) {
				$(this).blur(function () {
					if (this.value === '') {
						this.value = $(this).data('placeholder');
						this.style.color = '#c8c8c8';
					}
				});

				$(this).focus(function () {
					if (this.value === $(this).data('placeholder')) {
						this.value = '';
						this.style.color = '';
					}
				});

				var placeholderText = $(this).data('placeholder');

				if (this.value === '')
					this.value = placeholderText;

				if (this.value === placeholderText)
					this.style.color = '#c8c8c8';
			});
		});
	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeaderLabel" runat="server"><asp:Localize ID="Localize5" runat="server" meta:resourceKey="Header" /></asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentArea" runat="server">
   	<div class="dialog-header"><h3><asp:Localize id="Localize2" runat="server" meta:resourcekey="Header" /></h3>
        <a class="modal-close" onclick="UcommerceClientMgr.closeModalWindow();" data-dismiss="modal" aria-hidden="true"></a>
   	</div>

	<div class="addOrderContent dialog-content">
	        <div class="propertyContainer propertyItems dialog-content__property">
				<div class="propertyItem">
					<div class="propertyItemHeader propertyItemContentSmall"><asp:Localize runat="server" meta:resourcekey="OrderNumber" /></div>
					<div class="propertyItemContent propertyItemContentSmall">
						<asp:TextBox runat="server" ID="OrderNumberTextBox" CssClass="mediumWidth" data-placeholder="(auto)" Text="(auto)" />
						<br />
						<asp:RegularExpressionValidator 
							ID="OrderNumberTextBoxValidator" 
							runat="server"
							Display="Dynamic"
							ControlToValidate="OrderNumberTextBox" 
							ValidationExpression="^([\S\s]{0,50})$"
							CssClass="validationMessage validator"
							ErrorMessage='<%$ Resources:MaxOrderNumberLength.Text %>' />
						<asp:CustomValidator 
							id="UniqueOrderNumberValidator" 
							runat="server" 
							OnServerValidate="OrderNumber_ServerValidate" 
							ControlToValidate="OrderNumberTextBox" 
							Display="Dynamic"
							CssClass="validationMessage validator"
							ErrorMessage='<%$ Resources:OrderNumberNotUnique.Text %>' />					
					</div>
			</div>

			<div class="propertyItem dialog-content__property">
				<div class="propertyItemHeader propertyItemContentSmall"><asp:Localize runat="server" meta:resourcekey="OrderStatus" /></div>
				<div class="propertyItemContent propertyItemContentSmall">
					<asp:DropDownList runat="server" ID="OrderStatusDropDown" CssClass="mediumWidth"/>
				</div>
			</div>

			<div class="propertyItem dialog-content__property">
				<div class="propertyItemHeader propertyItemContentSmall"><asp:Localize runat="server" meta:resourcekey="Group" /></div>
				<div class="propertyItemContent propertyItemContentSmall">
					<asp:DropDownList runat="server" ID="OrderGroupDropDown" CssClass="mediumWidth" />
					<br />
                    <asp:CustomValidator 
                        id="HasEditOrderRightsValidator" 
                        runat="server" 
                        OnServerValidate="EditOrderRights_ServerValidate" 
                        ControlToValidate="OrderGroupDropDown" 
                        Display="Dynamic"
                        CssClass="validationMessage"/>
				</div>
			
        
			</div>

			<div class="propertyItem dialog-content__property">
				<div class="propertyItemHeader propertyItemContentSmall"><asp:Localize runat="server" meta:resourcekey="Currency" /></div>
				<div class="propertyItemContent propertyItemContentSmall">
					<asp:DropDownList runat="server" ID="CurrencyDropDown" CssClass="mediumWidth" />
				</div>
			</div>
		</div>
		<div class="propertyPaneFooter">-</div>
	</div>
    <div class="dialog-actions">
	    <div class="footerOkCancel">
			<asp:Button id="SaveButton" CssClass="dialog-saveButton" runat="server" meta:resourcekey="SaveButton" onclick="SaveButton_Clicked" />
			<em>or </em>
			<a href="#" Class="dialog-cancelButton" onclick="UcommerceClientMgr.closeModalWindow()"><asp:Localize id="Localize1" runat="server" meta:resourcekey="CancelButton" /></a>
		</div>
	</div>
 
</asp:Content>