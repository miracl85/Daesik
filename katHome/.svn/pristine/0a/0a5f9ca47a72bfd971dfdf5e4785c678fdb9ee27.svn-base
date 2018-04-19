$(document).ready(function(){
	$('#full_page').fullpage({
		'verticalCentered': false,
		'css3': true,
		'navigation': true,
		'navigationPosition': 'right',
		'navigationTooltips': ['Company', 'Powerful', 'Amazing', 'Simple'],

		'afterLoad': function(anchorLink, index){
			if(index == 1){
				$(".visual_txt").addClass('active');
				$('.slider').bxSlider({
					mode: 'fade',
					infiniteLoop: true,
					auto: true,
					controls:false,
					pager:false,
					speed:500
				});
			}else if(index == 2){
				$(".visual_txt2").addClass('active');
				$(".kat_box.family").addClass('active');
				$(".kat_box.fame").addClass('active');
				
			}else if(index == 3){
				$(".visual_txt3").addClass('active');
				$(".main_video_gp").addClass('active');
				$(".main_video.mv01").addClass('active');
				$(".main_video.mv02").addClass('active');
				$(".main_video.mv03").addClass('active');
				$(".main_video.mv04").addClass('active');
				
				/*var winWidth = $(window).width();
				if(winWidth <= 1025) {
					var cont ="";
					cont="<video class='the_video'>" +
						 "<source src='resource/img/main_video01.mp4' type='video/mp4'>" +
						 "</video>"
					$(".main_video").append(cont);
				} else if (winWidth < 1024) {
					$(".main_video video").remove();
				}*/
			}
		}
	});

	//navigation last remove
	$("#fp-nav li").last().remove();
});