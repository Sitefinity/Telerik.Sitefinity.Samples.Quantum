// JavaScript source code
jQuery(document).ready(function () {
    $(".dropdown").click(
    function () {
        $('.dropdown-menu', this).toggleClass("q-hidden");
    });
}); 