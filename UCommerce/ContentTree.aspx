<%@ Page Title="" Language="C#" MasterPageFile="MasterPages/Dialog.Master" AutoEventWireup="true" CodeBehind="ContentTree.aspx.cs" Inherits="Ucommerce.Web.UI.Ucommerce.ContentTree" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>

<asp:content ID="Content2" runat="server" contentplaceholderid="HeaderLabel">
	
</asp:content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentArea" runat="server">
    <asp:PlaceHolder runat="server" ID="TreePlaceholder"></asp:PlaceHolder>
</asp:Content>