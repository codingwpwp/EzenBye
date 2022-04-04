$(document).ready(function(){
	
    var size_sw = 0;
    var left_full_menu = $("#asdieMenu");

    $("#menu_size_down").hide();

    // 페이지가 로드되었을때 브라우저 크기를 기준으로 설정
    if(window.innerWidth <= 992){
        left_full_menu.hide();
    }
	
	if(window.innerWidth <= 576){
			$(".findT").css("text-align","left");
			$(".order-btn").addClass("mt-1 mb-1");
			$(".cancle-seeVIew-btn").addClass("mt-2");
			$(".number-good").css("text-align","left");
			$(".cancleView-btn").attr("class","d-grid gap-2 d-md-flex justify-content-md-center cancleView-btn");
			$(".interItem-icon").css({"text-align":"left", "margin-top":"0px"});
			$(".interItem-btn").attr("class","d-grid gap-2 d-md-flex justify-content-md-center mt-2 interItem-btn");
			$(".changeInfor-input").css("width","90%");
			$(".changeInforOk-inputId, .changeInforOk-inputName, .changeInforOk-inputPhone, .changeInforOk-inputNicName, .changeInforOk-inputEmail").css("width","100%");
			$(".changeInforOk-btn").attr("class","d-flex justify-content-center changeInforOk-btn");
			$(".addressManage-1, .addressManage-2, .addressManage-3, .addressManage-4, .addressManage-5, .addressManage-6").css("width","100%");
			$(".noteManage-btn").addClass("mb-3");
			$("#noteManageView-title").css("width","23%");
			$(".memberSecession-select2").addClass("d-flex justify-content-center");
			$(".noteManageView-group1").hide();
			$(".noteManageView-group2").show();
			$(".noteManageView-group3").show();
		}else {
			$(".findT").css("text-align","right");
			$(".order-btn").removeClass("mt-1 mb-1");
			$(".cancle-seeVIew-btn").removeClass("mt-2");
			$(".number-good").css("text-align","right");
			$(".cancleView-btn").attr("class","d-grid gap-4 d-md-flex justify-content-md-center cancleView-btn");
			$(".interItem-icon").css({"text-align":"right", "margin-top":"20px"});
			$(".interItem-btn").attr("class","d-grid gap-4 d-md-flex justify-content-md-center mt-2 interItem-btn");
			$(".changeInfor-input").css("width","70%");
			$(".changeInforOk-inputId, .changeInforOk-inputName, .changeInforOk-inputPhone, .changeInforOk-inputNicName, .changeInforOk-inputEmail").css("width","90%");
			$(".changeInforOk-btn").attr("class","changeInforOk-btn");
			$(".addressManage-1, .addressManage-2, .addressManage-3, .addressManage-4, .addressManage-5, .addressManage-6").css("width","90%");
			$(".noteManage-btn").removeClass("mb-3");
			$("#noteManageView-title").css("width","35%");
			$(".memberSecession-select2").removeClass("d-flex justify-content-center");
			$(".noteManageView-group1").show();
			$(".noteManageView-group2").hide();
			$(".noteManageView-group3").hide();
		}
	
    $(window).resize(function() {
		if(window.innerWidth <= 576){
			$(".findT").css("text-align","left");
			$(".order-btn").addClass("mt-1 mb-1");
			$(".cancle-seeVIew-btn").addClass("mt-2");
			$(".number-good").css("text-align","left");
			$(".cancleView-btn").attr("class","d-grid gap-2 d-md-flex justify-content-md-center cancleView-btn");
			$(".interItem-icon").css({"text-align":"left", "margin-top":"0px"});
			$(".interItem-btn").attr("class","d-grid gap-2 d-md-flex justify-content-md-center mt-2 interItem-btn");
			$(".changeInfor-input").css("width","90%");
			$(".changeInforOk-inputId, .changeInforOk-inputName, .changeInforOk-inputPhone, .changeInforOk-inputNicName, .changeInforOk-inputEmail").css("width","100%");
			$(".changeInforOk-btn").attr("class","d-flex justify-content-center changeInforOk-btn");
			$(".addressManage-1, .addressManage-2, .addressManage-3, .addressManage-4, .addressManage-5, .addressManage-6").css("width","100%");
			$(".noteManage-btn").addClass("mb-3");
			$("#noteManageView-title").css("width","23%");
			$(".memberSecession-select2").addClass("d-flex justify-content-center");
			$(".noteManageView-group1").hide();
			$(".noteManageView-group2").show();
			$(".noteManageView-group3").show();
		}else {
			$(".findT").css("text-align","right");
			$(".order-btn").removeClass("mt-1 mb-1");
			$(".cancle-seeVIew-btn").removeClass("mt-2");
			$(".number-good").css("text-align","right");
			$(".cancleView-btn").attr("class","d-grid gap-4 d-md-flex justify-content-md-center cancleView-btn");
			$(".interItem-icon").css({"text-align":"right", "margin-top":"20px"});
			$(".interItem-btn").attr("class","d-grid gap-4 d-md-flex justify-content-md-center mt-2 interItem-btn");
			$(".changeInfor-input").css("width","70%");
			$(".changeInforOk-inputId, .changeInforOk-inputName, .changeInforOk-inputPhone, .changeInforOk-inputNicName, .changeInforOk-inputEmail").css("width","90%");
			$(".changeInforOk-btn").attr("class","changeInforOk-btn");
			$(".addressManage-1, .addressManage-2, .addressManage-3, .addressManage-4, .addressManage-5, .addressManage-6").css("width","90%");
			$(".noteManage-btn").removeClass("mb-3");
			$("#noteManageView-title").css("width","35%");
			$(".memberSecession-select2").removeClass("d-flex justify-content-center");
			$(".noteManageView-group1").show();
			$(".noteManageView-group2").hide();
			$(".noteManageView-group3").hide();
		}
		
		if(window.innerWidth <= 992){

            if(size_sw == 0){
                left_full_menu.hide();
            }

        }else{
            left_full_menu.show();
            size_sw = 0;
        }
	
    });
    
    // 리뷰작성 평점
    $(".star-rating input[type=radio]").click(function(){
		var star_rating = $(".star-rating input[type=radio]:checked").val();
		if(star_rating == 1){
			$("#result-star").html("매우 나빠요");
		}else if(star_rating == 2){
			$("#result-star").html("나빠요");
		}else if(star_rating == 3){
			$("#result-star").html("보통");
		}else if(star_rating == 4){
			$("#result-star").html("좋아요");
		}else if(star_rating == 5){
			$("#result-star").html("매우 좋아요");
		}
	});
	
});

// 배송지 관리 주소검색
function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }

// 쪽지관리 전체선택
function selectAll(obj)  {
	  const checkboxes 
	       = document.getElementsByName('note');
	  
	  checkboxes.forEach((checkbox) => {
	    checkbox.checked = obj.checked;
	  })
}