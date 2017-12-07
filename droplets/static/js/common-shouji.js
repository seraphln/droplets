/* ==|== js    Producer  2015-08-12    ======================================
   ========================================================================== */
//对根元素字体初始化 star
var xRoot = (function(xw){
	var xHtml = document.getElementsByTagName('html')[0],
		xScale = 1;
	var init = function(){
		var xWinWidth = document.documentElement && document.documentElement.clientWidth || document.body.clientWidth;	
		xScale = parseFloat( xWinWidth / 320 );
		window.scale = xScale;
		var i = Math.round( xScale*10 );
		xHtml.style.fontSize = i+'px';
		if( xWinWidth >= 640 ){
			xHtml.style.fontSize = '20px';	
		}		
	}	
	if(xw.attachEvent){
		xw.attachEvent('orientationchange resize',init);	
	}else{
		xw.addEventListener('orientationchange resize', init);		
	}	
	return{
		init : init,
		scale : xScale	
	}	
})(window);

xRoot.init();

window.onresize = function(){
	xRoot.init();
};	
//对根元素字体初始化 end


	
$(function(){
	
	//搜索	
	$('.btn-search,.search-form .search-textbox').on('focuse click',function(){
		$('.search-form').slideDown();
		return false;
	});
	$(document).click(function(){
		$('.search-form').slideUp();		
	});
	
	//返回顶部
	$(window).scroll(function(){
		if($(window).scrollTop()>40){
		 $('.cbtn-top').fadeIn();
		 }else{
			 $('.cbtn-top').fadeOut();  
		 }
	});
	$('.cbtn-top').click(function(){
		$('body,html').animate({scrollTop:0},500)
	});
		
	if($("#slide").length>0){
		slideShow("slide","slide-pos");
	}
	
	$(".second").pageslide({ direction: "left", modal: true });  //导航
	
	function orient() {	
		if (window.orientation == 0 || window.orientation == 180) {//竖屏状态
			$("body").removeClass('landscape').addClass('portrait');
			orientation = 'portrait';
			return false;			
		}
		else if (window.orientation == 90 || window.orientation == -90) {//横屏状态
			$("body").removeClass('portrait').addClass('landscape');
			orientation = 'landscape';
			return false;
		}
	}
	orient(); //判断手机旋转
	$(window).bind( 'orientationchange', function(e){
		orient();
	});
});
