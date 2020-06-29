<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SortCampaignItems.aspx.cs" Inherits="UCommerce.Web.UI.UCommerce.Marketing.SortCampaignItems" MasterPageFile="../MasterPages/Dialog.master" %>
<%@ Import Namespace="UCommerce.EntitiesV2" %>
<%@ Register Src="../Controls/Sorter.ascx" TagName="Sorter" TagPrefix="commerce" %>

<asp:content runat="server" contentplaceholderid="HeaderLabel">
	<asp:Localize meta:resourcekey="HeaderLabel" runat="server">Prioritize Campaign Items(*)</asp:Localize>
</asp:content>
<asp:content runat="server" contentplaceholderid="ContentArea">
	<commerce:Sorter id="Sorter" runat="server" datasource="<%#CampaignItems.OrderBy(x => x.Priority).ToList() %>"/>
</asp:content>