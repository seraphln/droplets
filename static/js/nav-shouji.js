$(function(){

$(".cbtn-search").click(function(){$(".srch").slideToggle(300)});
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
});






function slideShow(wrap_id,bullets_id){
	var bullets=document.getElementById(bullets_id).getElementsByTagName('li');
	var wrap=document.getElementById(wrap_id);
	window.mySwipe=Swipe(wrap,{
		auto:3000,
		continuous:true,
		startSlide:0,
		stopPropagation:true,
		disableScroll:false,
		callback:function(pos){
			var i=bullets.length;
			while(i--){
				bullets[i].className=' ';
			}
			bullets[pos].className='on';
		}
	});
}

function searchpage()
{
	if($("#SeaStr").val()==""||$("#SeaStr").val()==null||$("#SeaStr").val()=="请输入搜索关键字...")
	{
		alert("请输入搜素关键字");
		return false;
	}
	else
	{
		return true;
	}
}
