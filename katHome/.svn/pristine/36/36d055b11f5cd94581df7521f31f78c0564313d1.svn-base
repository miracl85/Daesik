$(document).ready(function(){
	$('.slider').bxSlider({
		mode: 'fade',
		auto: true,
		autoControls:true,
		stopAutoOnClick:false,
		pager:false,
		speed:400
	});
	
});

function specClick(param) {
	if($("#" + param).css("display") == "none"){
		$("#" + param).css({"display":"block", "z-index":"4"});
		$("." + param).addClass("active");
		$(".bg_transparent").show();
	} else {
		$("#" + param).css({"display":"none", "z-index":"0"});
		$("." + param).removeClass("active");
		$(".bg_transparent").hide();
	}
}
function specClose() {
	$(".spec_cont").hide();
	$(".spec_grid").removeClass("active");
	$(".bg_transparent").hide();
}

function scrolling(seq) {
   var offset = $(".scro_" + seq).offset();
   $('html, body').animate({scrollTop : offset.top}, 400);
}

