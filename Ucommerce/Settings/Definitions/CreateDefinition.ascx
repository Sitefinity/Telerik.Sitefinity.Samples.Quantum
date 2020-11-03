<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CreateDefinition.ascx.cs" Inherits="Ucommerce.Web.UI.Settings.Definitions.CreateDefinition" %>
<div>
    <asp:Localize runat="server" meta:resourcekey="Name"></asp:Localize>
</div>
<div>
    <asp:TextBox runat="server" ID="NameTextBox" CssClass="bigInput fontSize" Width="350px"/><br />
</div>
<%--<div>
    <asp:Localize runat="server" meta:resourcekey="Definition"></asp:Localize>
</div>
<div>
    <asp:DropDownList runat="server" ID="DefinitionDropDown" DataTextField="Name" DataValueField="Id" CssClass="bigInput fontSize"/>
</div>--%>
<div>
    <asp:RequiredFieldValidator runat="server" ControlToValidate="NameTextBox" CssClass="validationMessage validator" ErrorMessage="Please enter a name.(*)" Width="100%" meta:ResourceKey="RequiredNameValidator" Display="Dynamic" />
    <asp:CustomValidator ID="UniqueNameCustomValidator" ControlToValidate="NameTextBox" ErrorMessage="The product definition already exists. Please select another name.(*)" CssClass="validationMessage validator" meta:ResourceKey="UniqueNameValidator" OnServerValidate="UniqeNameCustomVallidator_ServerValidate" Display="Dynamic" runat="server"/>
    <asp:CustomValidator ID="LicenseCustomValidator" ControlToValidate="NameTextBox" ErrorMessage="Adding another would exceed your license.(*)" CssClass="validationMessage validator" meta:ResourceKey="LicenseCustomValidator" runat="server" OnServerValidate="LicenseCustomValidator_ServerValidate" Display="Dynamic"/>
</div>

<div style="padding-top: 25px">
    <asp:Button runat="server" ID="CreateButton" Width="90px" Text="Create" OnClick="CreateButton_Clicked" meta:resourcekey="CreateButton" />
    <em>or</em>
    <a href="#" onclick="UcommerceClientMgr.closeModalWindow();" style="color: blue; cursor: hand"><asp:Localize meta:resourcekey="CloseLink" runat="server">Cancel</asp:Localize></a>    
</div>