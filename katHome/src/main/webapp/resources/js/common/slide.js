
$(document).ready(function() {
	$(".flexslider").flexslider({
		animation : "fade",
		slideshowSpeed : 3000,
		directionNav: true,
		pauseOnAction: false,
		controlNav: true,
		pausePlay: true,
		nextText: "다음 슬라이드",  
		prevText: "이전 슬라이드",
		pauseText: "슬라이드 정지",
		playText: "슬라이드 재생",
	});
	$(".flex-prev").attr('title','이전 슬라이드');
	$(".flex-next").attr('title','다음 슬라이드');
	$(".flex-pause").attr('title','슬라이드 정지');
	$(".flex-play").attr('title','슬라이드 재생');
});
