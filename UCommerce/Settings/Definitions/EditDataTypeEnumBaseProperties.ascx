<%@ Import Namespace="UCommerce.Presentation.Web"%>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EditDataTypeEnumBaseProperties.ascx.cs" Inherits="UCommerce.Web.UI.Settings.Definitions.EditDataTypeEnumBaseProperties" %>
<%@ Register tagPrefix="commerce" tagName="ValidationSummary" src="../../Controls/ValidationSummaryDisplay.ascx" %>

<commerce:ValidationSummary ID="ValidationSummary1" runat="server" />
<div class="propertyPane leftAligned">
    <h2 class="propertyPaneTitel"><asp:Localize runat="server" meta:resourceKey="EnumProperties" /></h2>
    <div>
        <div class="propertyItem">
            <div class="propertyItemHeader"><asp:Localize runat="server" meta:resourceKey="Value" /></div>
            <div class="propertyItemContent">
                <asp:TextBox runat="server" ID="ValueTextBox" Text="<%# SanitizeOutput(QueryString.Common.IsNew ? QueryString.Common.Name : View.DataTypeEnum.Value) %>" cssclass="mediumWidth entityName"/>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="ValueTextBox" Display="Dynamic" Text="*" ErrorMessage='<%# GetLocalResourceObject("Value.Text") %>' CssClass="validator" />
                <asp:RegularExpressionValidator runat="server" ControlToValidate="ValueTextBox" Display="Dynamic" Enabled="<%# !string.IsNullOrEmpty(View.DataType.ValidationExpression) %>" ValidationExpression="<%# SanitizeOutput(View.DataType.ValidationExpression) %>" Text="*" ErrorMessage='<%# GetLocalResourceObject("Value.Text") %>' CssClass="validator" />
                <asp:CustomValidator runat="server" Text="*" ErrorMessage='<%# GetLocalResourceObject("Value.Text") %>' CssClass="validator" OnServerValidate="NameValidator_ServerValidate" />
            </div>
        </div>
    </div>
    <div class="propertyPaneFooter">-</div>
</div>