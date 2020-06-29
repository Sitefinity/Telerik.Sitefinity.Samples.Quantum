<%@ page language="C#" autoeventwireup="true" masterpagefile="../../masterpages/Dialog.master" codebehind="GenerateVoucher.aspx.cs" inherits="UCommerce.Web.UI.Marketing.Dialogs.GenerateVoucher" %>
<%@ Import Namespace="UCommerce.Web.UI.Marketing.Dialogs" %>
<%@ Register TagPrefix="presentation" Assembly="UCommerce.Presentation" namespace="UCommerce.Presentation.Web.Controls" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            var prefix;
            var suffix;
            var lengthOfCode;

            $(".codeBit").keyup(function () {
                prefix = $(".prefixTextBox").val();
                suffix = $(".suffixTextBox").val();
                lengthOfCode = $(".codeLengthTextBox").val();
                join();
            })
            function generateCode() {
                var code = "";
                for (var i = 0; i < lengthOfCode; i++) {
                    code += "X";
                }
                return code;
            }
            function seperatorPrefix() {
                var sepPre = "";
                if (prefix != "") {
                    sepPre = "-";
                }
                return sepPre;
            }
            function seperatorSuffix() {
                var sepSuf = "";
                if (suffix != "") {
                    sepSuf = "-";
                }
                return sepSuf;
            }

            function join() {
                $(".lblExample").text(prefix + seperatorPrefix() + generateCode() + seperatorSuffix() + suffix);
            }

        });
</script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeaderLabel" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentArea" runat="server">
    <div class="propertyPane dialog-header">
		<h3>
			<span>
				<%= GetLocalResourceObject("Header.Text") %>
			</span>
		</h3>
		<div>
			<p class="guiDialogTiny">
				<%= GetLocalResourceObject("SubHeader.Text") %>
			</p>
            <a class="modal-close" onclick="UCommerceClientMgr.closeModalWindow();" data-dismiss="modal" aria-hidden="true"></a>
		</div>
    </div>
    <div class="propertyPane contentPane dialog-content">
		<div class="propertyItem voucher ui-widget no-border max-height">
		    <table width="100%">
		<tr>
			<td class="voucherTopLeftCell" colspan="1">
				<FieldSet class="voucherFieldset">
				<Legend><%= GetLocalResourceObject("Manual.Text") %></Legend>
				<table colspan="3">
					<tr>				
					<td style="vertical-align:top; height:20px;" colspan="1"><%= GetLocalResourceObject("Code.Text") %></td>
						<td style="vertical-align:top; height:20px;" colspan="2">
							<asp:TextBox width="70px" runat="server" id="CodeTextBox" 
								MaxLength="20" />
							<asp:RequiredFieldValidator id="ManualCodeValidator" runat="server" 
								ValidationGroup="ManualVoucherGroup"
                                Display="Dynamic"
								ControlToValidate="CodeTextBox" Text="Required value" CssClass="validator" />
							<asp:CustomValidator id="ManualUniqueVoucherCodeValidator" runat="server" 
							OnServerValidate="UniqueVoucherCode_OnServerValidate"  
							ControlToValidate="CodeTextBox" 
                            CssClass="validator"
                            Display="Dynamic"
							ValidationGroup="ManualVoucherGroup"
							Text="Required value"/>
						</td>
					</tr>
					<tr>
						<td style="vertical-align:top; height:20px;" colspan="1"><%= GetLocalResourceObject("MaxUses.Text") %></td>
						<td style="vertical-align:top; height:20px;" colspan="2">
							<asp:TextBox width="70px" runat="server" 
								ID="MaxUseTextBox" Text="1" />
							<asp:RequiredFieldValidator id="ManualMaxUseValidator" runat="server" 
							 ValidationGroup="ManualVoucherGroup" 
                                Display="Dynamic"
							 ControlToValidate="MaxUseTextBox" Text="Required value" CssClass="validator" />
						    <asp:RangeValidator 
                                runat="server" 
                                Display="Dynamic" 
                                ControlToValidate="MaxUseTextBox" 
                                MinimumValue="1" 
                                MaximumValue="2147483646" 
                                Type="Integer"
                                ValidationGroup="ManualVoucherGroup" 
                                ErrorMessage="Value must be between 1 and 2147483646" 
                                Text="Required value" />
						</td>
					</tr>
                    <tr>					
					    <td style="vertical-align:top" colspan="1">
						    <asp:Button CssClass="mediumButton" id="AddManualButton" runat="server" 
							    OnClick="AddManualVoucherButton" validationgroup="ManualVoucherGroup" />
					    </td>
					</tr>
					<tr>
					<td colspan="3">
						<asp:ValidationSummary ID="ValidationSummary1"
						ValidationGroup="ManualVoucherGroup"
						DisplayMode="BulletList"
						EnableClientScript="true"
						runat="server" />
					</td>
					</tr>
				</table>
				</FieldSet>
			</td>
			<td style="vertical-align:top;">
				<FieldSet style="min-height: 241px;">
				<Legend><%= GetLocalResourceObject("Generate.Text") %></Legend>
				<table colspan="4" class="generateVoucherTable">
					<tr>
						<td style="vertical-align:top; height:20px; width:100px;" colspan="1"><%= GetLocalResourceObject("Prefix.Text") %></td>
						<td style="vertical-align:top; height:20px;" colspan="1">
							<asp:TextBox runat="server" width="70px" ID="PrefixTextBox" 
								class="prefixTextBox codeBit" />
						</td>
					</tr>
					<tr>
						<td style="vertical-align:top; height:20px; width:100px;" colspan="1"><%= GetLocalResourceObject("Suffix.Text") %></td>
						<td style="vertical-align:top; height:20px;" colspan="1">
							<asp:TextBox runat="server" width="70px" ID="SuffixTextBox" 
								class="suffixTextBox codeBit" />
						</td>
					</tr>
					<tr>				
						<td style="vertical-align:top; height:20px; width:100px;" colspan="1"><%= GetLocalResourceObject("LengthOfCode.Text") %></td>
						<td style="vertical-align:top; height:20px;" colspan="3">
							<asp:TextBox runat="server" width="70px" id="CodeLengthTextBox" Text="6" CssClass="codeBit codeLengthTextBox" />
							<asp:RangeValidator id="CodeLengthRangeValidator" runat="server"
								  ControlToValidate="CodeLengthTextBox"
								  ValidationGroup="GenerateVoucherGroup"
								  Type="Integer"
								  MinimumValue="6"
                                  Display="Dynamic"
								  MaximumValue="20" Text="Required value" />
							<asp:RequiredFieldValidator id="GenerateCodeLengthValidator" runat="server" 
								 ValidationGroup="GenerateVoucherGroup"
                                    Display="Dynamic"
								 ControlToValidate="CodeLengthTextBox" Text="Required value" CssClass="validator" />
							<asp:RegularExpressionValidator id="GenerateRegexLengthValidator" runat="server"     
								 ValidationGroup="GenerateVoucherGroup" 
                                    Display="Dynamic"
								 ControlToValidate="CodeLengthTextBox"  
								 ValidationExpression="^\d+$" InitialValue="" Text="Required value" />					
						</td>
					</tr>
					<tr>
						<td style="vertical-align:top; height:20px; width:100px;" colspan="1"><%= GetLocalResourceObject("MaxUses.Text") %></td>
						<td style="vertical-align:top; height:20px;" colspan="3">
							<asp:TextBox runat="server" width="70px" id="GenerateMaxUseTextBox" Text="1" />
							<asp:RequiredFieldValidator id="GenerateMaxUseValidator" runat="server" 
                                Display="Dynamic"
								 ValidationGroup="GenerateVoucherGroup"
								 ControlToValidate="GenerateMaxUseTextBox" Text="Required value" CssClass="validator"/>
							<asp:RegularExpressionValidator id="GenerateRegexMaxUseValidator" runat="server"     
								 ValidationGroup="GenerateVoucherGroup"
                                Display="Dynamic"
								 ControlToValidate="GenerateMaxUseTextBox"   
								 Text="Required value"  
								 InitialValue=""
								 ValidationExpression="^\d+$" />
						    <asp:RangeValidator runat="server" Display="Dynamic" type="Integer" ControlToValidate="GenerateMaxUseTextBox" MinimumValue="1" MaximumValue="2147483646" ValidationGroup="GenerateVoucherGroup" ErrorMessage="Value must be between 1 and 2147483646" Text="*" />
						</td>
					</tr>
					<tr>				
						<td style="vertical-align:top; height:20px; width:100px;" colspan="1"><%= GetLocalResourceObject("NumberToGen.Text") %></td>
						<td style="vertical-align:top; height:20px;" colspan="3">
							<asp:TextBox runat="server" width="70px" id="NumberToGenerateTextBox" 
								Text="1000" />
							<asp:RequiredFieldValidator id="GenerateNumberToGenValidator" runat="server" 
								ValidationGroup="GenerateVoucherGroup"
                                Display="Dynamic"
								ControlToValidate="NumberToGenerateTextBox" Text="Required value" CssClass="validator" />
							<asp:RegularExpressionValidator id="GenerateRegexNumberValidator" runat="server"     
								 ValidationGroup="GenerateVoucherGroup" 
								 ControlToValidate="NumberToGenerateTextBox" 
                                Display="Dynamic" 
								 Text="Required value"   
								 ValidationExpression="^\d+$" />
						    <asp:RangeValidator runat="server" Display="Dynamic" ControlToValidate="NumberToGenerateTextBox" MinimumValue="1" MaximumValue="2147483646" ValidationGroup="GenerateVoucherGroup" ErrorMessage="Value must be between 1 and 2147483646" Text="*" Type="Integer" />
						</td>
					</tr>
					<tr>
						<td colspan="1">
						<%= GetLocalResourceObject("Example.Text") %>
						</td>
						<td colspan="3">
						    <asp:Label width="80px" id="lblExample" CssClass="lblExample" Text="XXXXXX" runat="server" ></asp:Label>
						</td>
					</tr>
					<tr>
					<td colspan="4">
						<asp:ValidationSummary ID="ValidationSummary2"
						ValidationGroup="GenerateVoucherGroup"
						DisplayMode="BulletList"
						EnableClientScript="true"
						runat="server" />
					</td>
					</tr>
					<tr>
						<td style="vertical-align:bottom;" colspan="2">
							<asp:Button CssClass="mediumButton" runat="server" ID="AddGenerateButton" 
								OnClick="AddGenerateVoucherButton" ValidationGroup="GenerateVoucherGroup" 
								Text="Add" />
						</td>
					</tr>
				</table>
				</FieldSet>
			</td>
		</tr>
		<tr>
			<td class="voucherBottomRow" colspan="2">
				<fieldset>
				<legend>
				<%= GetLocalResourceObject("Showing.Text") %>
					<%= VoucherCodesTotal() %> 
					<%= GetLocalResourceObject("Of.Text") %> 
					<%= VoucherCodesTotal() %>
				</legend>
					<div style="height:230px; overflow:auto; ">
					<asp:Repeater ID="VoucherCodeRepeater" runat="server">
						<headertemplate>
							<table class="dataList" width="100%">
								<thead>
								    <tr>
									    <th>
										    <span></span>
									    </th>
									    <th style="width:99%">
										    <span>
												<asp:Localize ID="Localize2" runat="server" meta:resourcekey="Code"></asp:Localize>
											</span>
									    </th>
									    <th style="white-space:nowrap;">
										    <span>
												<asp:Localize ID="Localize3" runat="server" meta:resourcekey="NumberUsed"></asp:Localize>
											</span>
									    </th>
									    <th style="white-space:nowrap;">
										    <span>
												<asp:Localize ID="Localize4" runat="server" meta:resourcekey="MaxUses"></asp:Localize>
											</span>
									    </th>
									</tr>
								</thead>
                                <tbody>
						</HeaderTemplate>
						<itemtemplate>
							<tr>
								<td style="text-align:right; width:20px;">
									<presentation:LabeledImageButton CssClass="delete-image-button" id="DeleteTargetButton" runat="server" 
										commandargument="<%# ((VoucherPlaceHolder)Container.DataItem).Code %>" 
										imageurl="../../Images/ui/cross.png" 
										oncommand="DeleteVoucherCode_Command" />
								</td>								
								<td style="width:300px;">
									<%# SanitizeOutput((string)Eval("Code")) %>
								</td>
								<td style="width:90px;">
									<%# Eval("NumberUsed") %>
								</td>
								<td style="width:70px;">
									<%# Eval("MaxUses") %>
								</td>
							</tr>
						</ItemTemplate>
						<footertemplate>
                            </tbody>
							</table>
						 </table>
						</FooterTemplate>
					</asp:Repeater>
					</div>
				</fieldset>
			</td>
		</tr>
		</table>			
		</div>
	
	<div class="propertyPane dialog-actions">
		<div class="footerOkCancel">
			<asp:Button cssClass="mediumButton" id="SaveButton" runat="server" onclick="SaveButton_Click" text="Save" />
			<em> <%= GetLocalResourceObject("Or.Text") %> </em>
			<a href="#" onclick="UCommerceClientMgr.closeModalWindow();" class="dialog-cancelButton">
				<%= GetLocalResourceObject("Cancel.Text") %>
			</a>
		</div>
	</div>
	</div>

</asp:Content>