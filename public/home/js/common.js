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