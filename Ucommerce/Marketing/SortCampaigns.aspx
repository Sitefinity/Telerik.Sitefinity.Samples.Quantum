<%@ Page Title="" Language="C#" MasterPageFile="../MasterPages/Dialog.Master" AutoEventWireup="true" CodeBehind="SortCampaigns.aspx.cs" Inherits="Ucommerce.Web.UI.Marketing.SortCampaigns" %>
<%@ Register TagPrefix="commerce" TagName="Sorter" Src="../Controls/Sorter.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeaderLabel" runat="server">
	<asp:Localize id="Localize1" meta:resourcekey="Header" runat="server">Prioritize Campaigns</asp:Localize>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentArea" runat="server">
	<commerce:Sorter id="Sorter" runat="server" datasource="<%#Campaigns.OrderBy(x => x.Priority) %>"/>
</asp:Content>
