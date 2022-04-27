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
	
	var member_index = $("input[name='messageNonReadCount']").val();
	
	$.ajax({
		type : 'POST',
		url : '/FoodContainer/messageNonReadCount.do',
		data : "member_index=" + member_index,
		success : function(data){
			if(data > 5){
				$(".header-badge").html("5+");
			}else{
				$(".header-badge").html(parseInt(data));
			}
		}
	});
	
	$.ajax({
		url : 'recentProduct.do',
		type : 'get',
		success : function(data){
			var recentHTML = "";
			for(var i=0; i<data.length; i++){
				recentHTML += "<div class='productImg'>";
				recentHTML += "<a href='productView.do?product_index="+data[i].product_index+"'>";
				recentHTML += "<img src='/FoodContainer/resources/img/"+data[i].brand+"/"+data[i].middleSort+"/"+data[i].thumbnail_image+"' class='w-75 img-fluid mt-2 mb-3 border' alt='"+data[i].product_name+"'></img>";
				recentHTML += "</a>";
				recentHTML += "</div>";
			}
				
				$("#recentProduct").html(recentHTML);
				
				
			var recentHTMLM = "<a href='shopBasket_main.do'><i class='bi bi-cart3 mobileCart'></i></a>";
				for(var i=0; i<data.length; i++){
					recentHTMLM += "<div class='rightAsideImgM'>";
					recentHTMLM += "<a href='productView.do?product_index="+data[i].product_index+"'>";
					recentHTMLM += "<img src='/FoodContainer/resources/img/"+data[i].brand+"/"+data[i].middleSort+"/"+data[i].thumbnail_image+"' class='img-fluid border' alt='"+data[i].product_name+"'></img>";
					recentHTMLM += "</a>";
					recentHTMLM += "</div>";
				}
				
				$("#recentProductM").html(recentHTMLM);
		},
		error : function(){
			console.log("error");
		}
	});
	
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

$("#search").keypress(function (e){
		if(e.keyCode === 13){
			$("#searchButton").click();
		}
	});

function search(obj){
	var value = $("#searchValue").val();
	location.href = "productList.do?search="+value+"";
}

//쿠키데이터
	function productCookie(obj){
		var name=$(obj).parent().find("#indexCookie").val();
		console.log(name);
		
		$.ajax({
			url : "/FoodContainer/viewProductCookie.do",
			type : "get",
			data : "name="+name,
			success : function(data){
		/*	var recentHTML = "";
				for(var i=0; i<data.length; i++){
					recentHTML += "<div class='productImg'>";
					recentHTML += "<a href='productView.do?product_index="+data[i].product_index+"'>";
					recentHTML += "<img src='/FoodContainer/resources/img/"+data[i].brand+"/"+data[i].middleSort+"/"+data[i].thumbnail_image+"' class='w-75 img-fluid mt-2 mb-3 border' alt='"+data[i].product_name+"'></img>";
					recentHTML += "</a>";
					recentHTML += "</div>";
				}
				
				$("#recentProduct").html(recentHTML);*/
			},
			error : function(){
				console.log("error");
			}
		});
	}
