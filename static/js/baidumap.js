
var slng = "";
var slat = "";

//鍒涘缓鍜屽垵濮嬪寲鍦板浘鍑芥暟锛�
function initMap() {
    createMap(); //鍒涘缓鍦板浘
    setMapEvent(); //璁剧疆鍦板浘浜嬩欢
    addMapControl(); //鍚戝湴鍥炬坊鍔犳帶浠�
}

//鍒涘缓鍦板浘鍑芥暟锛�
function createMap() {
    var map = new BMap.Map("dituContent"); //鍦ㄧ櫨搴﹀湴鍥惧鍣ㄤ腑鍒涘缓涓€涓湴鍥�
    var point = new BMap.Point(104.114129, 37.550339); //瀹氫箟涓€涓腑蹇冪偣鍧愭爣
    map.centerAndZoom(point, 5); //璁惧畾鍦板浘鐨勪腑蹇冪偣鍜屽潗鏍囧苟灏嗗湴鍥炬樉绀哄湪鍦板浘瀹瑰櫒涓�
    window.map = map; //灏唌ap鍙橀噺瀛樺偍鍦ㄥ叏灞€
    var marker = new BMap.Marker(point);  // 鍒涘缓鏍囨敞
    marker.enableDragging();    //鍙嫋鎷�
    map.addOverlay(marker);              // 灏嗘爣娉ㄦ坊鍔犲埌鍦板浘涓�  
    map.addEventListener("click", showInfo);
    slng = point.lng;
    slat = point.lat;
}

//鍒涘缓鍦板浘鍑芥暟(渚涘墠鍙板睍绀鸿皟鐢ㄣ€佷笉鍏佽榧犳爣鐐瑰嚮瀹氫綅)锛�
function createMap1() {
    var map = new BMap.Map("dituContent"); //鍦ㄧ櫨搴﹀湴鍥惧鍣ㄤ腑鍒涘缓涓€涓湴鍥�
    var point = new BMap.Point(104.114129, 37.550339); //瀹氫箟涓€涓腑蹇冪偣鍧愭爣
    map.centerAndZoom(point, 5); //璁惧畾鍦板浘鐨勪腑蹇冪偣鍜屽潗鏍囧苟灏嗗湴鍥炬樉绀哄湪鍦板浘瀹瑰櫒涓�
    window.map = map; //灏唌ap鍙橀噺瀛樺偍鍦ㄥ叏灞€
	var cr = new BMap.CopyrightControl({anchor: BMAP_ANCHOR_BOTTOM_RIGHT});   //璁剧疆鐗堟潈鎺т欢浣嶇疆
	map.addControl(cr); //娣诲姞鐗堟潈鎺т欢

	var bs = map.getBounds();   //杩斿洖鍦板浘鍙鍖哄煙
	cr.addCopyright({id: 1, content: "<a href='http://www.wjdhcms.com' target='_blank' style='font-size:12px;color:red'>涓囧鐏伀绯荤粺</a>", bounds: bs});
}


//鏍规嵁缁忕含搴﹀畾浣嶏紙鍓嶅彴椤甸潰璋冪敤灞曠ず浼佷笟鍦板潃锛�
function addAddress(lng, lat,com,info) {
    createMap1(); //鍒涘缓鍦板浘
    setMapEvent(); //璁剧疆鍦板浘浜嬩欢
    addMapControl(); //鍚戝湴鍥炬坊鍔犳帶浠�
    map.clearOverlays();
    var point = new BMap.Point(lng, lat);
    var marker = new BMap.Marker(point);  // 鍒涘缓鏍囨敞
    map.centerAndZoom(point, 16);
    map.addOverlay(marker);              // 灏嗘爣娉ㄦ坊鍔犲埌鍦板浘涓�     
    marker.addEventListener("click", function () {
        this.openInfoWindow(new BMap.InfoWindow(info, {
            width: 120,     // 淇℃伅绐楀彛瀹藉害
            height: 120,     // 淇℃伅绐楀彛楂樺害
           // title: "<font color=red><b>"+com+"</b></font>"  // 淇℃伅绐楀彛鏍囬
		   title:""
        }));
    });
    marker.setAnimation(BMAP_ANIMATION_BOUNCE); //璺冲姩鐨勫姩鐢�
    marker.openInfoWindow(new BMap.InfoWindow(info, {
        width: 120,     // 淇℃伅绐楀彛瀹藉害
        height: 120,     // 淇℃伅绐楀彛楂樺害
       // title: "<font color=red><b>"+com+"</b></font>"  // 淇℃伅绐楀彛鏍囬
	   title:""
    }));
    slng = lng;
    slat = lat;
}

//鏍规嵁杈撳叆鐨勫湴鍧€瀹氫綅
function findAddress(address, city) {
//    createMap(); //鍒涘缓鍦板浘
//    setMapEvent(); //璁剧疆鍦板浘浜嬩欢
//    addMapControl(); //鍚戝湴鍥炬坊鍔犳帶浠�
    // 鍒涘缓鍦板潃瑙ｆ瀽鍣ㄥ疄渚�
    var myGeo = new BMap.Geocoder();
    // 灏嗗湴鍧€瑙ｆ瀽缁撴灉鏄剧ず鍦ㄥ湴鍥句笂,骞惰皟鏁村湴鍥捐閲�
    myGeo.getPoint(address, function (point) {
        if (point) {
            map.clearOverlays();
            map.centerAndZoom(point, 16);
            var marker = new BMap.Marker(point);  // 鍒涘缓鏍囨敞
            marker.enableDragging();    //鍙嫋鎷�
            map.addOverlay(marker);              // 灏嗘爣娉ㄦ坊鍔犲埌鍦板浘涓� 
            slng = point.lng;
            slat = point.lat;
        }
    }, city);
}

//榧犳爣鐐瑰嚮瀹氫綅
function showInfo(e) {
    map.clearOverlays();
    var point = new BMap.Point(e.point.lng, e.point.lat);
    var marker = new BMap.Marker(point);  // 鍒涘缓鏍囨敞
    marker.enableDragging();    //鍙嫋鎷�
    map.addOverlay(marker);              // 灏嗘爣娉ㄦ坊鍔犲埌鍦板浘涓�  
    slng = point.lng;
    slat = point.lat;
}

//鍦板浘浜嬩欢璁剧疆鍑芥暟锛�
function setMapEvent() {
    map.enableDragging(); //鍚敤鍦板浘鎷栨嫿浜嬩欢锛岄粯璁ゅ惎鐢�(鍙笉鍐�)
    map.enableScrollWheelZoom(); //鍚敤鍦板浘婊氳疆鏀惧ぇ缂╁皬
    map.enableDoubleClickZoom(); //鍚敤榧犳爣鍙屽嚮鏀惧ぇ锛岄粯璁ゅ惎鐢�(鍙笉鍐�)
    map.enableKeyboard(); //鍚敤閿洏涓婁笅宸﹀彸閿Щ鍔ㄥ湴鍥�
}

//鍦板浘鎺т欢娣诲姞鍑芥暟锛�
function addMapControl() {
    //鍚戝湴鍥句腑娣诲姞缂╂斁鎺т欢
    var ctrl_nav = new BMap.NavigationControl({ anchor: BMAP_ANCHOR_TOP_LEFT, type: BMAP_NAVIGATION_CONTROL_LARGE });
    map.addControl(ctrl_nav);
    //鍚戝湴鍥句腑娣诲姞缂╃暐鍥炬帶浠�
//    var ctrl_ove = new BMap.OverviewMapControl({ anchor: BMAP_ANCHOR_BOTTOM_RIGHT, isOpen: 1 });
//    map.addControl(ctrl_ove);
    //鍚戝湴鍥句腑娣诲姞姣斾緥灏烘帶浠�
    var ctrl_sca = new BMap.ScaleControl({ anchor: BMAP_ANCHOR_BOTTOM_LEFT });
    map.addControl(ctrl_sca);
}



 //鍒涘缓marker
    function addMarker() {
        for (var i = 0; i < markerArr.length; i++) {
            var json = markerArr[i];
            //var arr = json.point.split("|");
            var p0 = markerArr[0].point.lng;
            var p1 = markerArr[0].point.lat;
            var point = new BMap.Point(p0, p1);
            var iconImg = createIcon(json.icon);
            var marker = new BMap.Marker(point, { icon: iconImg });
            var iw = createInfoWindow(i);
            var label = new BMap.Label(json.title, { "offset": new BMap.Size(json.icon.lb - json.icon.x + 10, -20) });
            marker.setLabel(label);
            map.addOverlay(marker);
            label.setStyle({
                borderColor: "#808080",
                color: "#333",
                cursor: "pointer"
            });

            (function () {
                var index = i;
                var _iw = createInfoWindow(i);

                var _marker = marker;
                _marker.openInfoWindow(_iw);
                _marker.addEventListener("click", function () {
                    this.openInfoWindow(_iw);
                });
                _iw.addEventListener("open", function () {
                    _marker.getLabel().hide();
                })
                _iw.addEventListener("close", function () {
                    _marker.getLabel().show();
                })
                label.addEventListener("click", function () {
                    _marker.openInfoWindow(_iw);
                })
                if (!!json.isOpen) {
                    label.hide();
                    _marker.openInfoWindow(_iw);
                }
            })()
        }
    }
    //鍒涘缓InfoWindow
    function createInfoWindow(i) {
        var json = markerArr[i];
        var iw = new BMap.InfoWindow("<b class='iw_poi_title' title='" + json.title + "'>" + json.title + "</b><div class='iw_poi_phone'><a href='tel:" + json.phone + "'>" + json.phone + "</a></div><div class='iw_poi_content'>" + json.content + "</div>" +
           '<div class="m-find">' +
           '<ul class="select-box">' +
           '<li class="z-chose" id="aId0" onclick="tab(\'divId\',\'aId\',0,2,\'z-chose\',0)"><span></span>鍒拌繖閲屽幓</li>' +
           '<li id="aId1" onclick="tab(\'divId\',\'aId\',1,2,\'z-chose\',1)"><span></span>浠庤繖閲屽嚭鍙�</li>' +
           '</ul>' +
           '<div class="change-box" id="divId0">' +
           '<span class="u-des">璧风偣</span>' +
           '<span id="divId0_0"><input type="text" id="BMap_S" onclick="Autocomplete(this,\'divId0_0\')" class="u-input">' +
           '<input type="button" onclick="transitRouteAction(1)" value="鍏氦" class="u-tran">' +
           '<input type="button" onclick="drivingRouteAction(1)" value="椹捐溅" class="u-tran">' +
           '</span></div>' +
           '<div class="change-box" id="divId1">' +
           '<span class="u-des">缁堢偣</span>' +
           '<span id="divId1_0"><input type="text" id="BMap_E" onclick="Autocomplete(this,\'divId1_0\')" class="u-input">' +
           '<input type="button" onclick="transitRouteAction(2)" value="鍏氦" class="u-tran">' +
           '<input type="button" onclick="drivingRouteAction(2)" value="椹捐溅" class="u-tran">' +
           '</span></div>' +
           '</div>');

        return iw;
    }
    //鍒涘缓涓€涓狪con
    function createIcon(json) {
        var icon = new BMap.Icon("http://app.baidu.com/map/images/us_mk_icon.png", new BMap.Size(json.w, json.h), { imageOffset: new BMap.Size(-json.l, -json.t), infoWindowOffset: new BMap.Size(json.lb + 5, 1), offset: new BMap.Size(json.x, json.h) })
        return icon;
    }
    function tab(id, aId, num1, num2, nameClass) {
        var dlBlock = document.getElementById(id + num1);
        var aArray = document.getElementById(aId + num1);
        for (var i = 0; i < num2; i++) {
            document.getElementById(id + i).style.display = 'none';
            document.getElementById(aId + i).className = ''; 
        }
        dlBlock.style.display = 'block';
        aArray.className = nameClass;
    }
    function transitRouteAction(v) {   //鍏氦瀵艰埅
        var f = map;
        var transitRoute = new BMap.TransitRoute(f, {
            renderOptions: {
                map: f,
                panel: "kwf"
            },
            onSearchComplete: function () {
                var g = transitRoute.getStatus();
                var b = showTipBox(g);
                if (b) {
                  
                }
            }
        });
        if (v == 1) {
            var s = $("#BMap_S").val();
            var e = markerArr[0].content;
            transitRoute.search(s, e);
        } else if (v == 2) {
            var s = markerArr[0].content;
            var e = $("#BMap_E").val();
            transitRoute.search(s, e);
        }
    }
    function drivingRouteAction(v) {    //椹捐溅瀵艰埅
        var f = map;
        var drivingRoute = new BMap.DrivingRoute(f, {
            renderOptions: {
                map: f,
                panel: "kwf",
                autoViewport: true
            },
            onSearchComplete: function () {
                var g = drivingRoute.getStatus();
                var b = showTipBox(g);
                if (b) {

                }
            }
        });
        if (v == 1) {
            var s = $("#BMap_S").val();
            var e = markerArr[0].content;
            drivingRoute.search(s, e);
        } else if (v == 2) {
            var s = markerArr[0].content;
            var e = $("#BMap_E").val();
            drivingRoute.search(s, e);
        }
    }

    function showTipBox(e) {
        var g = "鏈悳绱㈠埌鍑嗙‘鐨勭粨鏋�";
        var b = true;
        switch (e) {
            case BMAP_STATUS_UNKNOWN_LOCATION:
                g = "浣嶇疆缁撴灉鏈煡";
                $(".right").show();
                $(".right").find("p:first-child").text(g);
                $(".contapic_bg").show();
                b = false;
                break;
            case BMAP_STATUS_UNKNOWN_ROUTE:
                g = "瀵艰埅缁撴灉鏈煡";
                $(".right").show();
                $(".right").find("p:first-child").text(g);
                $(".contapic_bg").show();
                b = false;
                break
        }
        return b;
    }

    function Autocomplete(obj1, id) {
        var searchAC = new BMap.Autocomplete({
            input:obj1,
            location: map,
            baseDom: document.getElementById(id)
        });
        $(obj1).bind("blur", function () { searchAC.hide(); })
    }
	 //鍒涘缓鍜屽垵濮嬪寲鍦板浘鍑芥暟锛�
    function initMapkwf() {
        var map = new BMap.Map("map_container", {     //鍦ㄧ櫨搴﹀湴鍥惧鍣ㄤ腑鍒涘缓涓€涓湴鍥� 
            enableHighResolution: true			      //鏄惁寮€鍚珮娓�
        });

        if(_lng!="" && _lat!="")
        {
            markerArr[0].point = {"lng":_lng,"lat":_lat};
            var point = new BMap.Point(_lng, _lat);    // 鍒涘缓鐐瑰潗鏍�
            map.centerAndZoom(point, 17);//璁惧畾鍦板浘鐨勪腑蹇冪偣鍜屽潗鏍囧苟灏嗗湴鍥炬樉绀哄湪鍦板浘瀹瑰櫒涓�
            window.map = map;//灏唌ap鍙橀噺瀛樺偍鍦ㄥ叏灞€
            setMapEvent();        //璁剧疆鍦板浘浜嬩欢
            addMapControl();      //鍚戝湴鍥炬坊鍔犳帶浠�
            addMarker();          //鍚戝湴鍥句腑娣诲姞marker
        }else 
        {
            var myGeo = new BMap.Geocoder();           //鍦扮悊缂栫爜
            myGeo.getPoint(markerArr[0].content, function (point) {           //鏍规嵁鍦扮悊鎻忚堪鑾峰緱鍧愭爣
            if (point) {
                //markerArr[0].point = point.lng + "|" + point.lat;
                markerArr[0].point = point;
                map.centerAndZoom(point, 17);//璁惧畾鍦板浘鐨勪腑蹇冪偣鍜屽潗鏍囧苟灏嗗湴鍥炬樉绀哄湪鍦板浘瀹瑰櫒涓�
                window.map = map;//灏唌ap鍙橀噺瀛樺偍鍦ㄥ叏灞€
                setMapEvent();        //璁剧疆鍦板浘浜嬩欢
                addMapControl();      //鍚戝湴鍥炬坊鍔犳帶浠�
                addMarker();          //鍚戝湴鍥句腑娣诲姞marker
            }
        }, markerArr[0].content);

        }
    }