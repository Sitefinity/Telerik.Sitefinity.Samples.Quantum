<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EditProductPricing.ascx.cs" Inherits="UCommerce.Web.UI.Catalog.EditProductPricing" %>
<%@ Register tagPrefix="commerce" tagName="ValidationSummary" src="../Controls/ValidationSummaryDisplay.ascx" %>
<%@ Import Namespace="UCommerce.EntitiesV2"%>

<commerce:ValidationSummary runat="server" />

<div class="propertyPane pricing">
    <h2 class="propertyPaneTitel"><asp:Localize runat="server" meta:resourcekey="Prices"></asp:Localize></h2>    
    <commerce:BulkEditGridView CssClass="product-price-list" runat="server" ID="PriceGroupGridView" BulkEdit="true" DataSource="<%# PriceGroups %>" ShowHeader="false" DataKeyNames="PriceGroupId" AutoGenerateColumns="false" GridLines="None">
        <Columns>
            <asp:TemplateField HeaderText="Name">
                <EditItemTemplate>
                    <%# GetSanitizedOutput(((PriceGroup)Container.DataItem).Name) %>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Price">
                <EditItemTemplate>
                    <asp:TextBox class="uc-short-text propertyText mediumWidth amountInput" autocomplete="off" runat="server" ID="ProductPriceTextBox" Text="<%# GetSinglePriceForPriceGroup(((PriceGroup)Container.DataItem).PriceGroupId) %>"></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <EditItemTemplate>
                    <%# GetSanitizedOutput(((PriceGroup)Container.DataItem).Currency.ISOCode) %>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Enabled">
                <EditItemTemplate>
                    <asp:HiddenField runat="server" ID="PriceGroupIdHiddenField" Value="<%# ((PriceGroup)Container.DataItem).PriceGroupId %>" />
                </EditItemTemplate>
            </asp:TemplateField>
        </Columns>
    </commerce:BulkEditGridView>
</div>