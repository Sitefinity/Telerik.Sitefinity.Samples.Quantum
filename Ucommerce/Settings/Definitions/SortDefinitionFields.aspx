<%@ Page Title="" Language="C#" MasterPageFile="../../MasterPages/Dialog.Master" AutoEventWireup="true" CodeBehind="SortDefinitionFields.aspx.cs" Inherits="Ucommerce.Web.UI.Settings.Definitions.SortDefinitionFields" %>
<%@ Register TagPrefix="commerce" TagName="Sorter" Src="../../Controls/Sorter.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeaderLabel" runat="server">
	<asp:Localize id="Localize1" meta:resourcekey="Header" runat="server">Sort Fields</asp:Localize>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentArea" runat="server">
	<commerce:Sorter id="Sorter" runat="server" DataSource="<%# Fields.OrderBy(x => x.SortOrder) %>"/>
</asp:Content>