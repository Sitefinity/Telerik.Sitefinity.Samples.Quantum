<%@ Import Namespace="Ucommerce.Presentation.Web"%>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EditDataTypeBaseProperties.ascx.cs" Inherits="Ucommerce.Web.UI.Settings.Definitions.EditDataTypeBaseProperties" %>
<%@ Register tagPrefix="commerce" tagName="ValidationSummary" src="../../Controls/ValidationSummaryDisplay.ascx" %>

<commerce:ValidationSummary runat="server" />

<div class="propertyPane">
	<h2 class="propertyPaneTitel"><asp:Localize runat="server" meta:resourceKey="DataTypeDefinition" /></h2>
    <div class="propertyItem">
		<div class="propertyItemHeader">Definition</div>
		<div class="propertyItemContent">
            <asp:DropDownList runat="server" ID="DefinitionDropDown" CssClass="mediumWidth propertyItemDropDown" Enabled="<%# !View.DataType.BuiltIn %>" DataSource="<%# View.Definitions %>" DataValueField="DefinitionId" DataTextField="Name"/>
        </div>
	</div>
</div>

<asp:Panel CssClass="propertyPane" ID="DynamicPropertyPanel" runat="server">
</asp:Panel>

<asp:Panel CssClass="propertyPane" ID="PropertyPanel" runat="server">
</asp:Panel>