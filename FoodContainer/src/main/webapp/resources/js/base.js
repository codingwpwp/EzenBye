// 오른쪽 메뉴 TOP버튼
function moveTop(){
    window.scrollTo(0,0);
}

// 네비게이션 바의 링크에 마우스를 올렸을 때
function changeColorFn1(obj){
    $(obj).find(".menu").removeClass("text-opacity-50");
}
// 네비게이션 바의 링크에 마우스를 벗어났을 때
function changeColorFn2(obj){
    $(obj).find(".menu").addClass("text-opacity-50");
}

$(document).ready(function(){

    // <nav>태그의 패딩값 조절
    if(window.innerWidth <= 992){
        $("#userLogin").addClass("py-2");
        if($("#navLeftMenu").text() != ""){
            $("#navCenterMenuDiv").addClass("ps-0");
        }
    }else{
        $("#userLogin").removeClass("py-2");
        $("#navCenterMenuDiv").removeClass("ps-0");
    }

    $(window).resize(function() {

        if(window.innerWidth <= 992){
            $("#userLogin").addClass("py-2");
            if($("#navLeftMenu").text() != ""){
                $("#navCenterMenuDiv").addClass("ps-0");
            }
        }else{
            $("#userLogin").removeClass("py-2");
            $("#navCenterMenuDiv").removeClass("ps-0");
        }

    });

    // #navLeftMenu인 <div>태그의 내용물이 없을때 → 네비게이션 중앙메뉴가 차지하는 공간을 1씩 늘려주는 코드
    if($("#navLeftMenu").text() == ""){

        $("#navLeftMenu").addClass("d-none");

        $("#navCenterMenuDiv").removeClass("col-4");
        $("#navCenterMenuDiv").removeClass("col-sm-4");
        $("#navCenterMenuDiv").removeClass("col-md-5");

        $("#navCenterMenuDiv").addClass("col-6");
        $("#navCenterMenuDiv").addClass("col-sm-5");
        $("#navCenterMenuDiv").addClass("col-md-6");

    }

});

//모바일 최근 본 상품 z-index
function rightAsideButtonM(){
	$(".rightAsideM").css("z-index","15");
	$("body").css("padding","0");
}

//필터 z-index
function filter(){
	$(".rightAsideM").css("z-index","0");
	$("body").css("padding","0");
}