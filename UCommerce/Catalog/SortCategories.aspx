<%@ Page Title="" Language="C#" MasterPageFile="../MasterPages/Dialog.Master" AutoEventWireup="true" CodeBehind="SortCategories.aspx.cs" Inherits="UCommerce.Web.UI.Catalog.SortCategories" %>
<%@ Register TagPrefix="commerce" TagName="Sorter" Src="../Controls/Sorter.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeaderLabel" runat="server">
	<asp:Localize meta:resourcekey="Header" runat="server">Sort Categories</asp:Localize>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentArea" runat="server">
	<commerce:Sorter id="Sorter" runat="server" datasource="<%# Categories.OrderBy(x => x.SortOrder) %>"/>
</asp:Content>