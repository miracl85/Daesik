//공지사항 search
jQuery(function($){
    // Input Clear
    var i_text = $('.item>.search_label').next('.search_txt');
    $('.item>.search_label').css('position','absolute');
    i_text.focus(function(){
            $(this).prev('.search_label').css('visibility','hidden');
        })
        .blur(function(){
            if($(this).val() == ''){
                $(this).prev('.search_label').css('visibility','visible');
            } else {
                $(this).prev('.search_label').css('visibility','hidden');
            }
        })
        .change(function(){
            if($(this).val() == ''){
                $(this).prev('.search_label').css('visibility','visible');
            } else {
                $(this).prev('.search_label').css('visibility','hidden');
            }
        })
        .blur();
    $('.search_label').click(function(){
        $(this).css('visibility','hidden');
        $(this).next('.search_txt').focus();   
    });
});