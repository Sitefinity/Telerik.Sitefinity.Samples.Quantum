<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EditProductVariants.ascx.cs" Inherits="UCommerce.Web.UI.Catalog.EditProductVariants" %>
<%@ Import Namespace="UCommerce.EntitiesV2" %>
<%@ Register tagPrefix="commerce" tagName="ValidationSummary" src="../Controls/ValidationSummaryDisplay.ascx" %>
<%@ Register TagPrefix="presentation" Assembly="UCommerce.Presentation" namespace="UCommerce.Presentation.Web.Controls" %>
<commerce:ValidationSummary runat="server" />
<script type="text/javascript">
    function confirm_delete_variant()
    {
    	return (confirm('<%= GetLocalResourceObject("ConfirmVariantDelete").ToString() %>') == true);
    }
</script>

<div class="propertyPane variantsPropertyPane">
    <h2 class="propertyPaneTitel"><asp:Localize runat="server" meta:resourcekey="variants"></asp:Localize></h2>
    <table class="variantTable">
        <tr>
            <td>
                <commerce:BulkEditGridView EnableViewState="True" BulkEdit="true" DataSource="<%# Variants %>" runat="server" ID="VariantsGridView" ShowHeader="true" DataKeyNames="ProductId" AutoGenerateColumns="false" GridLines="None" CssClass="variantContainer" UseAccessibleHeader="True" AllowPaging="True" PageSize="100" OnPageIndexChanging="VariantsGrid_OnPageIndexChanging">
                    <columns>
                        <asp:TemplateField>
                        <EditItemTemplate>
                            <asp:PlaceHolder runat="server" Visible="<%# ((Product)Container.DataItem).ProductId > 0 %>">
								<div class="variantOptions" style="width:75px; display:inline-block;">
									<a class="variantOption variantPrices" href="#" onclick="UCommerceClientMgr.openModal('<%# GetVariantPriceEditorUrl((Product)Container.DataItem) %>', 'Edit Prices', 500,320); return false;"><img src="../images/ui/price.png" alt="Edit prices" /></a>
									<a class="variantOption variantDescriptions" href="#" onclick="UCommerceClientMgr.openModal('<%# GetVariantDescriptionEditorUrl((Product)Container.DataItem)%>', 'Edit Description', 650, 540); return false;"><img src="../images/ui/note_edit.png" alt="Edit description" /></a>
									<presentation:LabeledImageButton runat="server" ID="DeleteImageButton" ImageUrl="../images/ui/cross.png" CommandArgument="<%# ((Product)Container.DataItem).ProductId %>" CommandName="Delete" AlternateText="Delete" OnClientClick="return confirm_delete_variant();" Visible="<%# CanDeleteProduct()%>" />
								</div>
                            </asp:PlaceHolder>
                        </EditItemTemplate>
                        </asp:TemplateField>                              
                        <asp:TemplateField meta:resourceKey="SkuHeader" HeaderText="Variant SKU" ControlStyle-Width="100px">
                            <EditItemTemplate>
                                <asp:HiddenField runat="server" ID="ProductIdHiddenField" Value="<%# ((Product)Container.DataItem).ProductId %>" />
                                <asp:TextBox runat="server" ID="VariantSkuTextBox" Text="<%# ((Product)Container.DataItem).VariantSku %>" MaxLength="30" cssclass="uc-variant-sku" />
                                <asp:CustomValidator runat="server" CssClass="validator" Display="Dynamic" id="UniqueVariantSkuValidator" OnServerValidate="UniqueVariantSkuValidator_Validate" ControlToValidate="VariantSkuTextBox" ErrorMessage="*" ForeColor="Red"></asp:CustomValidator>
                                <asp:RequiredFieldValidator runat="server" Display="Dynamic" CssClass="validator" id="RequiredSkuValidator" ControlToValidate="VariantSkuTextBox" Text="*" ErrorMessage="<%# GetRequiredSkuMessage()%>" ForeColor="Red" Enabled="<%# ((Product)Container.DataItem).ProductId > 0 %>"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField meta:resourceKey="NameHeader" HeaderText="Name" ControlStyle-Width="100px">
                            <EditItemTemplate>
                                <div>
                                    <asp:TextBox runat="server" ID="NameTextBox" Text="<%# ((Product)Container.DataItem).Name%>" cssclass="uc-variant-name"  />
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="NameTextBox" Display="Dynamic" Text="*" CssClass="validator" Enabled="false" />
                                </div>                                          
                            </EditItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </commerce:BulkEditGridView>
            </td>
        </tr>             
    </table>
</div>