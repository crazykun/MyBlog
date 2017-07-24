var typ = ["marginTop", "marginLeft"],
    rangeN = 10,
    timeout = 0;

function shake(o, end) {
    var range = Math.floor(Math.random() * rangeN);
    var typN = Math.floor(Math.random() * typ.length);
    o["style"][typ[typN]] = "" + range + "px";
    var shakeTimer = setTimeout(function() { shake(o, end) }, timeout);
    o[end] = function() { clearTimeout(shakeTimer) };
}
$(window).scroll(function() {
    if ($(this).scrollTop() > 100) {
        $('#back-to-top').fadeIn();
    } else {
        $('#back-to-top').fadeOut();
    }
});
$('#back-to-top').on('click', function(e) {
    e.preventDefault();
    $('html, body').animate({
        scrollTop: 0
    }, 1000);
    return false;
});