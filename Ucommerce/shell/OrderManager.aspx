<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrderManager.aspx.cs" Inherits="Ucommerce.Web.Shell.Sitefinity.OrderManager" MasterPageFile="Masterpages/MasterPageShell.Master"%>

<asp:Content runat="server" ContentPlaceHolderID="ContentPlacerHolder">
	<Ucommerce-shell content-picker-type="OrdersApp" tree-indetion-size="31" fixed-left-size="300px" disable-resize="false" start-page="../Orders/OrdersStartPage.aspx"></Ucommerce-shell>    
</asp:Content>