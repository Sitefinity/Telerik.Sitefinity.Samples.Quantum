<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="Masterpages/MasterPageShell.Master" CodeBehind="CatalogManager.aspx.cs" Inherits="UCommerce.Web.Shell.Sitefinity.CatalogManager" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlacerHolder" runat="server">
	<ucommerce-shell content-picker-type="CatalogApp" tree-indetion-size="31" fixed-left-size="300px" disable-resize="false" start-page="../Catalog/StoresStartPage.aspx"></ucommerce-shell>        
</asp:Content>