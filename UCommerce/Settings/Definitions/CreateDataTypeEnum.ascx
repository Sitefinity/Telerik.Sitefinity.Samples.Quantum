<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CreateDataTypeEnum.ascx.cs" Inherits="Ucommerce.Web.UI.Settings.Definitions.CreateDataTypeEnum" %>
<asp:TextBox runat="server" ID="NameTextBox" CssClass="bigInput fontSize" Width="350px"/><br />
<asp:RequiredFieldValidator runat="server" ControlToValidate="NameTextBox" CssClass="validationMessage validator" Display="Dynamic" ErrorMessage="Please enter a name(*)" meta:ResourceKey="RequiredNameValidator" Width="100%" />
<asp:CustomValidator ErrorMessage="The value is already in use(*)" CssClass="validationMessage validator" OnServerValidate="NameValidator_ServerValidate" meta:ResourceKey="UniqueNameValidator" Display="Dynamic" runat="server"  />
    
<div style="padding-top: 25px">
    <asp:Button runat="server" ID="CreateButton" Width="90px" Text="Create" OnClick="CreateButton_Clicked" />
    <em>or</em>
    <a href="#" onclick="UcommerceClientMgr.closeModalWindow();" style="color: blue; cursor: hand">Cancel</a>    
</div>