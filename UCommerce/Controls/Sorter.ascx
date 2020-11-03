<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Sorter.ascx.cs" Inherits="Ucommerce.Web.UI.Ucommerce.Controls.Sorter" %>
<div class="sorterContainer">
    <div id="sectionGroup">
        <div class="sectionGroupHeader">
        </div>
        <div class="section ui-tabs-panel">
            <div class="propertyPane">
                <h2 class="umbraco eight only">Sort</h2>
                <p class="umbraco eight only">Drag the different items up or down below to set how they should be arranged.</p>
                <asp:Repeater runat="server" ID="SortingRepeater" DataSource="<%# DataSource %>">
                    <HeaderTemplate>
                        <table id="sortable" cellspacing="0" class="dataList">
                            <thead>
                                <tr>
                                    <th style="min-width: 200px;">
                                        <span><asp:Localize ID="Localize1" runat="server" meta:resourcekey="NameColumn" Text="Name(*)" /></span>
                                    </th>
                                    <th style="text-align: right;">
                                        <span><asp:Localize ID="Localize2" runat="server" meta:resourcekey="SortOrderColumn" Text="Sort Order(*)" /></span>
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td id="Td1" class="idCell" runat="server" value="<%# AsSortable(Container.DataItem).Id %>">
                                <%# AsSortable(Container.DataItem).Name %>
                            </td>
                            <td id="Td2" runat="server">
                                <%# AsSortable(Container.DataItem).SortOrder %>
                            </td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        </tbody>
			</table>
                    </FooterTemplate>
                </asp:Repeater>
                <div class="propertyPaneFooter"></div>
                <asp:TextBox runat="server" CssClass="newSortOrder" ID="NewSortOrder" />
                <div class="sorter save button wrapper">
                    <asp:Button runat="server" CssClass="mediumButton save-button-label" ID="SaveButton" OnClientClick="setSortOrder();" OnClick="SaveButton_Click" meta:resourcekey="SaveButton" />
                </div>
            </div>
        </div>
    </div>
</div>

<script language="javascript">
    $(function () {
        $("#sortable tbody").sortable().disableSelection();
    });

    function setSortOrder() {
        var sortOrder = "";

        $(".idCell").each(function (index) {
            sortOrder += $(this).attr("value") + ",";
        });

        $(".newSortOrder").val(sortOrder);
    }
</script>
