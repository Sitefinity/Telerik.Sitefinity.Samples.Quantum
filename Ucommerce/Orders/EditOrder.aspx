<%@ Page Language="C#" MasterPageFile="../MasterPages/UcommerceAdmin.Master" AutoEventWireup="true" CodeBehind="EditOrder.aspx.cs" Inherits="Ucommerce.Web.UI.Orders.EditOrder" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<style type="text/css">
		.ui-state-highlight 
		{
			 height: 1.5em; 
			 line-height: 1.2em;
		}
	</style>
    
    <script>
        function documentReady() {
            $('#form1').submit(function () {
                if (Page_IsValid) {
                    resetHintTextFields();
                }
            });

            $('.hintTextCancelLink').each(function (i) {
                $(this).click(function () {
                    resetHintTextFields();
                });
            });

            $('.hintText').each(function (i) {
                $(this).blur(function () {
                    if (this.value === '') {
                        this.value = $(this).data('placeholder');
                        this.style.color = '#c8c8c8';
                    }
                });

                $(this).focus(function () {
                    if (this.value === $(this).data('placeholder')) {
                        this.value = '';
                        this.value = '';
                        this.style.color = '';
                    }
                });

                var placeholderText = $(this).data('placeholder');

                if (this.value === '')
                    this.value = placeholderText;

                if (this.value === placeholderText)
                    this.style.color = '#c8c8c8';
            });

            function resetHintTextFields() {
                $('.hintText').each(function (i) {
                    if (this.value === $(this).data('placeholder')) {
                        this.value = '';
                    }
                });
            }

            $('.connectedSortable').sortable({
                items: '.canSort',
                cursor: 'move',
                placeholder: {
                    element: function (currentItem) {
                        return $("<tr class=\"ui-state-highlight\"><td colspan=\"99\"></td></tr>")[0];
                    },
                    update: function (container, p) {
                        return;
                    }
                },
                start: function (event, ui) {
                    $('[id^=ShipmentTable_]').each(function () {
                        $(this).css('border', '2px dashed #c1c1c1');
                    });
                },
                stop: function (event, ui) {
                    $('[id^=ShipmentTable_]').each(function () {
                        $(this).css('border', '');
                    });
                },
                update: function (event, ui) {
                    $('[id^=ShipmentTable_]').each(function () {
                        $(this).css('border', '');
                    });
                },
                connectWith: ".connectedSortable"
            }).disableSelection();

            $('.connectedSortable').on('sortreceive', function (event, ui) {
                var startOrderLinesField = $('#Shipment_' + ui.sender[0].id.split('_')[1] + '_OrderLines');
                var receiveOrderLinesField = $('#Shipment_' + event.target.id.split('_')[1] + '_OrderLines');

                var currentOrderLineId = $(ui.item).data('orderlineId');

                var startOrderLineIdsArray = startOrderLinesField.val().split(',');

                var receiveOrderLineIdsString = receiveOrderLinesField.val();
                var startOrderLinesNewIdsString = '';

                $.each(startOrderLineIdsArray, function (i, item) {
                    if (parseInt(item) == parseInt(currentOrderLineId))
                        if (receiveOrderLineIdsString.length == 0)
                            receiveOrderLineIdsString += item;
                        else
                            receiveOrderLineIdsString += ',' + item;
                    else
                        startOrderLinesNewIdsString += item + ',';
                });

                startOrderLinesField.val(startOrderLinesNewIdsString.substring(0, startOrderLinesNewIdsString.length - 1));
                receiveOrderLinesField.val(receiveOrderLineIdsString);
            });
        };
    </script>

	<script type="text/javascript">
	    if (typeof $ === 'undefined') {
	        window.onload = function() {
	            documentReady();
	        };
	    } else {
	        $(function() {
	            documentReady();
	        });
	    }
	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentArea" runat="server">

</asp:Content>
