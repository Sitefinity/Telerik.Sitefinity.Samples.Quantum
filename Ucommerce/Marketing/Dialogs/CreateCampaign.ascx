<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CreateCampaign.ascx.cs" Inherits="Ucommerce.Web.UI.Ucommerce.Marketing.Dialogs.CreateCampaign" %>
Name:
<asp:TextBox runat="server" ID="NameTextBox" CssClass="bigInput fontSize" Width="350px"/>
<asp:RequiredFieldValidator runat="server" ControlToValidate="NameTextBox" CssClass="validationMessage validator" Display="Dynamic" ErrorMessage="Please enter a name(*)" Width="100%" />
<asp:CustomValidator runat="server" OnServerValidate="ValidateCampaignName" ErrorMessage="The name is already in use." CssClass="validationMessage validator" Display="Dynamic" Width="100%" />

<div style="padding-top: 25px">
    <asp:Button runat="server" ID="CreateButton" Width="90px" Text="Create" OnClick="CreateButton_Clicked" />
    <em>or</em>
    <a href="#" onclick="UcommerceClientMgr.closeModalWindow()" style="color: blue; cursor: hand">Cancel</a>
</div>