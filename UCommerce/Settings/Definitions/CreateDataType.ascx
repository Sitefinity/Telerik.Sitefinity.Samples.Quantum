<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CreateDataType.ascx.cs" Inherits="UCommerce.Web.UI.Settings.Definitions.CreateDataType" %>
<div>
    <asp:Localize meta:resourcekey="DataTypeNameLabel" runat="server">Name:</asp:Localize>
</div>
<div>
    <asp:TextBox runat="server" ID="NameTextBox" CssClass="bigInput fontSize"/>
</div>
<div>
    <asp:Localize meta:resourcekey="DefinitionLabel" runat="server">Definition:</asp:Localize>
</div>
<div>
    <asp:DropDownList runat="server" ID="DefinitionDropDown" DataTextField="Name" DataValueField="Id" CssClass="bigInput fontSize" />
</div>

<asp:RequiredFieldValidator meta:ResourceKey="RequiredNameValidator" runat="server" ControlToValidate="NameTextBox" CssClass="validationMessage validator" Display="Dynamic" ErrorMessage="Please enter a name(*)" Width="100%" />
<asp:CustomValidator runat="server"
    CssClass="validationMessage validator" 
    Display="Dynamic"
    meta:ResourceKey="UniqueNameValidator" 
    ErrorMessage="The name is already in use(*)" 
    ControlToValidate="NameTextBox" 
    OnServerValidate="NameValidator_ServerValidate" />

<asp:Panel CssClass="propertyPane" ID="PropertyPanel" runat="server">
</asp:Panel>

<div style="padding-top: 25px">
    <asp:Button runat="server" ID="CreateButton" Width="90px" Text="Create" OnClick="CreateButton_Clicked" />
    <em>or</em>
    <a href="#" onclick="UCommerceClientMgr.closeModalWindow();" style="color: blue; cursor: hand">Cancel</a>
</div>