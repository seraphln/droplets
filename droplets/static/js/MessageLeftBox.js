// JavaScript Document
// JavaScript Document

function showDiv(innerCall) {
    document.getElementById('PcPoPmarket').style.height = 275 + 'px';
    document.getElementById('showvod').style.display = 'none';
    document.getElementById('hidevod').style.display = 'block';
}
function hideDiv(innerCall) {
    if (document.getElementById('PcPoPmarket') == null) return;
    document.getElementById('PcPoPmarket').style.height = 29 + 'px';
    document.getElementById('hidevod').style.display = 'none';
    document.getElementById('showvod').style.display = 'block';
}

var s = "";
var url = "/static"; //Á´½Ó
try {
    document.compatMode && document.compatMode != 'BackCompat'
    //s += ('<span id=tmpAreaLmtDiv><DIV style="z-index:9;right:0;bottom:0; height:275px;width:250px;hidden;POSITION:fixed;' + (/MSIE 7/.test(navigator.appVersion) ? '' : '_position:absolute; _margin-top:expression(document.documentElement.clientHeight-this.style.pixelHeight+document.documentElement.scrollTop);') + '" id="PcPoPmarket" >');
    s += ('<span id=tmpAreaLmtDiv><DIV style="z-index:9;right:0;bottom:0; width:250px;hidden;POSITION:fixed;' + (/MSIE 7/.test(navigator.appVersion) ? '' : '_position:absolute; _margin-top:expression(document.documentElement.clientHeight-this.style.pixelHeight+document.documentElement.scrollTop);') + '" id="PcPoPmarket" >');
    s += ('<div style="z-index:9; POSITION: absolute; width:250px; overflow:hidden;"><span title="\u5C55\u5F00" style="CURSOR: pointer;float:right; width:15px; height:13px; overflow:hidden;clear:none;display:none; margin:9px 15px 0 0; " onclick=showDiv() id="showvod"></span><span title="\u6700\u5C0F\u5316" style="CURSOR: pointer;float:right;overflow:hidden; width:15px; height:13px; clear:none; display:bolck; margin:9px 15px 0 0;" onclick=hideDiv() id="hidevod"></span></div> ');
    s += ("<iframe scrolling=no frameborder=0 width=250 height=275 src=/MessageLeftMain.htm></iframe>");
    s += ('</DIV></span>');
    document.write(s);
    //setTimeout('hideDiv(true);', 1000);
} catch (err) { document.write(err); }
showDiv(true);
