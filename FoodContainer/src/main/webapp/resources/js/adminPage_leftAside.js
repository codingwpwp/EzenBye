$(document).ready(function(){

    var size_sw = 0;
    var left_aside = $("#leftAside");
    var size_up = $("#menu_size_up");
    var size_down = $("#menu_size_down");
    var left_full_menu = $("#asdieMenu");

    $("#menu_size_down").hide();

    // 페이지가 로드되었을때 브라우저 크기를 기준으로 설정
    if(window.innerWidth <= 992){
        left_full_menu.hide();
        left_aside.css("width","59px");
    }else{
        size_up.hide();
        left_aside.css("width","150px");
    }



    $(window).resize(function() {

        if(window.innerWidth <= 992){

            if(size_sw == 0){
                left_aside.css("width","59px");
                left_full_menu.hide();
                size_up.show();
            }

        }else{

            left_aside.css("width","150px");
            left_full_menu.show();
            size_up.hide();
            size_down.hide();
            size_sw = 0;

        }

    });

    $(size_up).click(function() {

        left_aside.css("width","150px");
        left_full_menu.show();
        size_down.show();
        size_up.hide();

        size_sw = 1;

    });

    $(size_down).click(function() {

        left_aside.css("width","59px");
        left_full_menu.hide();
        size_down.hide();
        size_up.show();

        size_sw = 0;

    });

});