jQuery(document).ready(function () {
    $('.custom-slider').slick({
        dots: true,
        autoplay: true,
        autoplaySpeed: 8000,
        arrows: true,
        centerMode: true,
        infinite: true,
        fade: true,
        cssEase: 'linear',
        slidesToShow: 1,
    });
});