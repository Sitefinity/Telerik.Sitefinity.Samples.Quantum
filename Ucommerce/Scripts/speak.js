window.addAlert = function (type, header, body) {
	$("#notification-text").text(body);
	$("div.speak-notification").show(100).delay(10000).hide(100);
};

$(document).ready(function () {
	$("button.close").click(function() {
		$("div.speak-notification").clearQueue();
		$("div.speak-notification").hide();
	});
});