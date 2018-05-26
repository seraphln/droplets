





function decode(content) { var $ = ""; for (var u = 0; u < content.length; u++) { var r = content.charCodeAt(u); $ += String.fromCharCode(r - 2); } return $; };