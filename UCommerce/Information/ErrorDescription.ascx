<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ErrorDescription.ascx.cs" Inherits="Ucommerce.Web.UI.Ucommerce.Information.ErrorDescription" %>
	
<div class="propertyPane">
	<h1>Exception while loading data</h1>
	<p id="errorText"></p>			
</div>
<script>$('#errorText').text(parent.getErrorDescription())</script>