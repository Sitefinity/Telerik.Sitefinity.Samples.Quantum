<%@ Page Title="" Language="C#" MasterPageFile="../MasterPages/Dialog.Master" AutoEventWireup="true" CodeBehind="SortProductCatalogs.aspx.cs" Inherits="UCommerce.Web.UI.Catalog.SortProductCatalogs" %>
<%@ Register TagPrefix="commerce" TagName="Sorter" Src="../Controls/Sorter.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeaderLabel" runat="server">
	<asp:Localize meta:resourcekey="Header" runat="server">Sort Catalogs</asp:Localize>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentArea" runat="server">
	<commerce:Sorter id="Sorter" runat="server" datasource="<%# ProductCatalogs %>"/>
</asp:Content>