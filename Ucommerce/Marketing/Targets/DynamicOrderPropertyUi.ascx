<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DynamicOrderPropertyUi.ascx.cs" Inherits="Ucommerce.Web.UI.Ucommerce.Marketing.Targets.DynamicOrderPropertyUi" %>
<%@ Register TagPrefix="presentation" Assembly="Ucommerce.Presentation" namespace="Ucommerce.Presentation.Web.Controls" %>

<% var containerId = Guid.NewGuid().ToString(); %>
<table cellpadding="0" cellspacing="0" style="width: 100%;" id="<% =containerId %>">
    <tr>
        <td>
	            <asp:PlaceHolder runat="server" id="NonEditModePlaceHolder">
            <div class="ReadOnlyPanel">
                <asp:Literal runat="server" id="ReadOnlyMessage"></asp:Literal>
            </div>
			</asp:PlaceHolder>
			<asp:PlaceHolder runat="server" id="EditModePlaceHolder"  visible="false">
            
                <asp:textBox runat="server" id="KeyTextBox" CssClass="key" autocompletetype="None" />&nbsp;
			    <asp:localize runat="server" meta:resourcekey="OnLabel" />&nbsp;
                <asp:DropDownList runat="server" id="TargetOrderLineOrOrderDropDownList" cssclass="targetOrderOrLine" />&nbsp;
                <asp:DropDownlist runat="server" id="CompareModeDropDownList" DataTextField="Key" DataValueField="Value" DataSource="<%# GetCompareModes() %>" />&nbsp;
                <asp:TextBox runat="server" id="TargetValueTextBox" />
            
			</asp:PlaceHolder>
        </td>
        <td style="width: 50px; text-align: right; vertical-align: top;">
			<presentation:LabeledImageButton CssClass="edit-image-button" id="EditButton" runat="server" imageurl="../../Images/ui/pencil.png" meta:resourcekey="Edit" onclick="EditButton_Click" />
            <%--<img src="../Images/ui/pencil.png" class="editButton" style="cursor: pointer;" id="button" alt="<%#GetLocalResourceObject("Edit.Text") %>" />--%>
            <presentation:JavascriptEnabledImageButton CssClass="save-image-button saveButton" id="SaveButton" runat="server" imageurl="../../Images/save.gif" meta:resourcekey="Save" visible="false" onclick="SaveButton_Click" ValidationGroup="DynamicOrderPropertyGroup" />
            <presentation:JavascriptEnabledImageButton CssClass="delete-image-button" id="DeleteButton" runat="server" imageurl="../../Images/ui/cross.png" meta:resourcekey="Delete" onclick="DeleteButton_Click" /><br />
        </td>
    </tr>
</table>

<script>
    function bindUi() {

        var container = $("#<%=containerId%>");

        var availableOrderProperties = [
            <%# GetDistinctDynamicOrderPropertyKeys() %>];

        var availableOrderLineProperties = [
            <%# GetDistinctDynamicOrderLinePropertyKeys() %>];

        container.find(".targetOrderOrLine").change(function() {
            var keyInput = container.find(".key");
            if (this.value == "0")
                keyInput.autocomplete("option", "source", availableOrderProperties);
            else
                keyInput.autocomplete("option", "source", availableOrderLineProperties);
        });

        container.find(".key").autocomplete({
            minLength: 0,
            source: availableOrderProperties
        });

        container.find(".key").focus(function() {
            if (this.value == "")
                $(this).autocomplete("search", "");
        });
    }

	$(bindUi());


</script>