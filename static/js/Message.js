var nochar = "#999999";

function sendMsg() {
    document.getElementById("hide").style.zIndex = 1000;
    var s_reg = /^([0-9]|[\-])+$/g;
    var tel = document.getElementById("msgLeft_telephone").value;

    if (document.getElementById("msgLeft_Txtbox").value == "在此留言，我们会及时联系您")
    {
        alert("提醒：请输入留言内容！");
        document.getElementById("hide").style.zIndex = 1;
        document.getElementById("msgLeft_Txtbox").focus();
        return false;
    }
    if (document.getElementById("msgLeft_senderName").value == "请输入您的名称")
    {
        alert("提醒：请输入您的姓名！");
        document.getElementById("hide").style.zIndex = 1;
        document.getElementById("msgLeft_senderName").focus();
        return false;
    }
    if (tel.match(s_reg) == null || tel.length < 7 || tel.length > 18 || document.getElementById("msgLeft_telephone").value == "请输入您的联系方式") {
        alert("提醒：请输入正确的手机号码或电话号码\n\n例如:13916752109或023-86526333");
        document.getElementById("hide").style.zIndex = 1;
        document.getElementById("msgLeft_telephone").focus();
        return false;
    }
    if (document.getElementById("msgLeft_senderName").value.length >= 50) {
        alert("提醒：留言人姓名过长");
        document.getElementById("hide").style.zIndex = 1;
        document.getElementById("msgLeft_senderName").focus();
        return false;
    }

    if (checkEmail(document.getElementById("msgLeft_email").value)) {
        alert("提醒：邮箱格式不正确");
        document.getElementById("hide").style.zIndex = 1;
        document.getElementById("msgLeft_email").focus();
        return false;
    }
    /*
    if(tel==""||document.getElementById("msgLeft_senderName").value==""||
    document.getElementById("msgLeft_senderName").style.color==nochar||
    document.getElementById("msgLeft_Txtbox").value==""||
    document.getElementById("msgLeft_Txtbox").style.color==nochar||
    document.getElementById("msgLeft_email").value==""||
    document.getElementById("msgLeft_email").style.color==nochar)
    {
    alert("提醒：某个必填项为空");
    document.getElementById("hide").style.zIndex = 1;
    return false;
    }
    */
    //有参数调用

    $.ajax({
        type: "POST",
        url: "/admin/usr_msg/",
        data: "{'username':'" + document.getElementById("msgLeft_senderName").value + "','telephone':'" + document.getElementById("msgLeft_telephone").value + "','email':'" + document.getElementById("msgLeft_email").value + "','content':'" + document.getElementById("msgLeft_Txtbox").value + "'}",
        contentType: "application/json; charset=utf-8",
        dataType: 'json',
        success: function (result) {
            xmlResponse();
        },
        error: function (msg) {
            alert(msg.status);
            alert("无法正常连接服务器，错误：\n"); //+req.statusText + ":" + req.status
            document.getElementById("hide").style.zIndex = 1;
            document.getElementById("msgLeft_Txtbox").value = "";
            document.getElementById("msgLeft_senderName").value = "";
            document.getElementById("msgLeft_telephone").value = "";
            document.getElementById("msgLeft_email").value = "";
            checkFocus();
        }
    });
}

function checkEmail(registeremail)
{
    //检验邮箱地址是否正确
    var reg = /^[a-za-z0-9_-]+@[a-za-z0-9_-]+(\.[a-za-z0-9_-]+)+$/;//验证mail的正则表达式,^[a-za-z0-9_-]:开头必须为字母,下划线,数字,
    if (!registeremail.match(reg) && registeremail!="")
    {
        return true;
    }
    return false;

}


//电话号码验证
String.prototype.Trim = function() {
  var m = this.match(/^\s*(\S+(\s+\S+)*)\s*$/);
  return (m == null) ? "" : m[1];
}
String.prototype.isMobile = function() {
  return (/^(?:13\d|15[89])-?\d{5}(\d{3}|\*{3})$/.test(this.Trim()));
}
String.prototype.isTel = function()
{
    //"兼容格式: 国家代码(2到3位)-区号(2到3位)-电话号码(7到8位)-分机号(3位)"
    //return (/^(([0\+]\d{2,3}-)?(0\d{2,3})-)?(\d{7,8})(-(\d{3,}))?$/.test(this.Trim()));
    return (/^(([0\+]\d{2,3}-)?(0\d{2,3})-)(\d{7,8})(-(\d{3,}))?$/.test(this.Trim()));
}

//最后修改页面
function xmlResponse()
{
    document.getElementById("hide").style.zIndex = 1;
    document.getElementById("msgLeft_Txtbox").value="";
    document.getElementById("msgLeft_senderName").value="";
    document.getElementById("msgLeft_telephone").value = "";
    document.getElementById("msgLeft_email").value = "";
    checkFocus();
    alert("留言成功");
}

function checkFocus() {
    if (document.getElementById("msgLeft_Txtbox").value == "" && document.activeElement.id != "msgLeft_Txtbox") {
        document.getElementById("msgLeft_Txtbox").value = "在此留言，我们会及时联系您";
        document.getElementById("msgLeft_Txtbox").style.color = nochar;
    }
    if (document.getElementById("msgLeft_senderName").value == "" && document.activeElement.id != "msgLeft_senderName") {
        document.getElementById("msgLeft_senderName").value = "请输入您的名称";
        document.getElementById("msgLeft_senderName").style.color = nochar;
    }
    if (document.getElementById("msgLeft_telephone").value == "" && document.activeElement.id != "msgLeft_telephone") {
        document.getElementById("msgLeft_telephone").value = "请输入您的联系方式";
        document.getElementById("msgLeft_telephone").style.color = nochar;
    }
    if (document.getElementById("msgLeft_email").value == "" && document.activeElement.id != "msgLeft_email") {
        document.getElementById("msgLeft_email").value = "请输入您的邮箱";
        document.getElementById("msgLeft_email").style.color = nochar;
    }
}
function BeFocus(itemName) {
    if(document.getElementById(itemName).style.color ==nochar)
    {
        document.getElementById(itemName).value = "";
    }
    document.getElementById(itemName).style.color = "black";
}
window.onload = function () {

    document.getElementById("msgLeft_Txtbox").value = "";
    document.getElementById("msgLeft_senderName").value = "";
    document.getElementById("msgLeft_telephone").value = "";
    document.getElementById("msgLeft_email").value = "";
    checkFocus();
}