<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="../MasterPages/Dialog.Master" CodeBehind="CreateCampaignItem.aspx.cs" Inherits="Ucommerce.Web.UI.Ucommerce.Marketing.CreateCampaignItem" %>
<%@ Register TagPrefix="commerce" TagName="CreateCampaignItem" Src="Dialogs/CreateCampaignItem.ascx" %>

<asp:content runat="server" contentplaceholderid="HeaderLabel">
	<asp:Localize id="Localize1" meta:resourcekey="Header" runat="server">Create Campaign Item(*)</asp:Localize>
</asp:content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentArea" runat="server">
	<commerce:CreateCampaignItem runat="server"/>
</asp:Content>