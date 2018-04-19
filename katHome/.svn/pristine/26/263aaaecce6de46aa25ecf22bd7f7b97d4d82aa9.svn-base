	
	$(document).ready(function() {	
		
		var currentPosition = parseInt($(".remote").css("top"));
		$(window).scroll(function() {
			var scrollTop = $(window).scrollTop();
			var screenHeigth = $(document).height() - $(window).height();
			var screenWidth = $(document).width();
			
			var newPosition = scrollTop + currentPosition + "px";
			if(scrollTop >= (screenHeigth - 200)){
				newPosition = screenHeigth - 200;
				if(screenWidth >= 1000 && screenWidth <= 1100){
					newPosition = screenHeigth - 300;
				}
			}
			
			$(".remote").stop().animate({
				"top" : newPosition
			}, {
				"duration" : 500,
				"complete" : function() {
				}
			});
		}).scroll();
		
		var didScroll; 
		$(window).scroll(function(event) {
			didScroll = true;
		});
		
		setInterval(function() {
			if(didScroll) {
				$(".btn_top").attr("disabled", false);
				didScroll = false;
			}
		}, 250);
		
	});
	
	function remoteTop() {
		$(".remote").css("top","60px");
		$( 'html, body' ).animate( { scrollTop : 0 }, 400 );
		$(".btn_top").attr("disabled", true);
		return false;
	}