<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EditShippingMethodPrices.ascx.cs" Inherits="Ucommerce.Web.UI.Settings.Orders.EditShippingMethodPrices" %>
<%@ Register tagPrefix="commerce" tagName="ValidationSummary" src="../../Controls/ValidationSummaryDisplay.ascx" %>
<%@ Import Namespace="Ucommerce.EntitiesV2"%>
<commerce:ValidationSummary runat="server" />
<div class="propertyPane leftAligned tablePropertyPane">
    <h2 class="propertyPaneTitel"><asp:Localize runat="server" meta:resourceKey="ShippingMethodPricing" /></h2>
    <div id="pricingDescription"><asp:Localize runat="server" meta:resourceKey="Description" /></div>
            
    <commerce:BulkEditGridView CssClass="dataList customDataList shippingMethodPrices" BulkEdit="true" runat="server" ID="ShippingMethodPricesGridView" DataSource="<%# ShippingMethodPrices %>" ShowHeader="true" DataKeyNames="ShippingMethodPriceId" AutoGenerateColumns="false" GridLines="None">
        <columns>
            <asp:TemplateField meta:resourceKey="EnabledHeader" >
                <EditItemTemplate>
                    <asp:CheckBox runat="server" 
                        ID="EnabledCheckBox" 
						CssClass="EnabledContent"
                        Checked="<%# ((ShippingMethodPrice)Container.DataItem).Id > 0 %>" />                                
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField meta:resourceKey="PriceGroupHeader">         
                <EditItemTemplate>  
                    <asp:HiddenField runat="server" ID="ShippingMethodPriceId" Value="<%# ((ShippingMethodPrice)Container.DataItem).ShippingMethodPriceId %>" />
                    <asp:HiddenField runat="server" ID="PriceGroupId" Value="<%# ((ShippingMethodPrice)Container.DataItem).PriceGroup.PriceGroupId %>" />
                    <div class="CurrencyContent"><%# SanitizeOutput(((ShippingMethodPrice)Container.DataItem).PriceGroup.Name) %></div>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField meta:resourceKey="PriceHeader">
                <EditItemTemplate>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="PriceTextBox" ErrorMessage="*" CssClass="validator" Display="Dynamic" />
                    <asp:RangeValidator runat="server" ControlToValidate="PriceTextBox" Type="Double" MinimumValue="0" MaximumValue="<%# decimal.MaxValue %>" ErrorMessage="*" CssClass="validator" Display="Dynamic"/>
					<asp:TextBox runat="server" ID="PriceTextBox" Text="<%# ((ShippingMethodPrice)Container.DataItem).Price %>" CssClass="amountInput"></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
        </Columns>
    </commerce:BulkEditGridView>
</div>