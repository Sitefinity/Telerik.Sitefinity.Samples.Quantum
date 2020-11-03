<%@ Page Title="" Language="C#" MasterPageFile="../../MasterPages/Dialog.Master" AutoEventWireup="true" CodeBehind="SortProductDefinitionRelations.aspx.cs" Inherits="Ucommerce.Web.UI.Ucommerce.Settings.Definitions.SortProductDefinitionRelations" %>
<%@ Register TagPrefix="commerce" TagName="Sorter" Src="../../Controls/Sorter.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeaderLabel" runat="server">
	<asp:Localize id="Localize1" meta:resourcekey="Header" runat="server">Sort Definition relations</asp:Localize>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentArea" runat="server">
	<commerce:Sorter id="Sorter" runat="server" DataSource="<%# ProductDefinitionRelations %>"/>
</asp:Content>

