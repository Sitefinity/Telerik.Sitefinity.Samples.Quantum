<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EditOrderPayments.ascx.cs" Inherits="Ucommerce.Web.UI.Orders.EditOrderPayments" %>

<asp:Repeater runat="server" ID="PaymentRepeater" DataSource="<%# Payments %>">
	<ItemTemplate>
		<div class="orderPayment-<%# Container.ItemIndex % 2 == 0 ? "even" : "odd"%>">
			<div class="propertyPane leftAligned shippingPane" style="overflow: hidden;">

                <h2 class="propertyPaneTitel">Payment  #<%#Container.ItemIndex+1%></h2>
			    <commerce:PropertyPanel runat="server" meta:resourceKey="PaymentMethod">
				    <%# SanitizeOutput(AsPayment(Container.DataItem).PaymentMethodName) %>
			    </commerce:PropertyPanel> 
			    <commerce:PropertyPanel runat="server" meta:resourceKey="Amount">
				    <%# AsPayment(Container.DataItem).Amount.ToString("N") %>
			    </commerce:PropertyPanel>
			    <commerce:PropertyPanel runat="server" meta:resourceKey="PaymentStatus">
				    <%# SanitizeOutput(AsPaymentStatus(Container.DataItem).Name) %>
			    </commerce:PropertyPanel>
			    <commerce:PropertyPanel runat="server" meta:resourceKey="TransactionID">
				    <%# SanitizeOutput(AsPayment(Container.DataItem).TransactionId) %>
			    </commerce:PropertyPanel>
			    <commerce:PropertyPanel runat="server" meta:resourceKey="ReferenceID">
				    <%# SanitizeOutput(AsPayment(Container.DataItem).ReferenceId) %>
			    </commerce:PropertyPanel>
            </div>
		</div>
	</ItemTemplate>
</asp:Repeater>