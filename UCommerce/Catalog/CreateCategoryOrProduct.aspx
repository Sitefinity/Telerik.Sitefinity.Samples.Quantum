<%@ Page Title="" Language="C#" MasterPageFile="../MasterPages/Dialog.Master" AutoEventWireup="true" CodeBehind="CreateCategoryOrProduct.aspx.cs" Inherits="UCommerce.Web.UI.Catalog.CreateCategoryOrProductPage" %>
<%@ Register Src="CreateCategoryOrProduct.ascx" TagName="CreateCategoryOrProduct" TagPrefix="commerce" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:content runat="server" contentplaceholderid="HeaderLabel">
	<asp:Localize id="Localize1" meta:resourcekey="Header" runat="server">Create Catalog Item</asp:Localize>
</asp:content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentArea" runat="server">
    <commerce:createcategoryorproduct runat="server"/>
</asp:Content>