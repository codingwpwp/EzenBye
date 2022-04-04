var sumPrice;
var deliveryPrice;
var totalPrice;
$(document).ready(function(){
    if(window.innerWidth >= 992){
        $(".phone").removeClass("w-75");
        $(".phone").css("width", "67%");
    }

    $(window).resize(function(){
        if(window.innerWidth >= 992){
            $(".phone").removeClass("w-75");
            $(".phone").css("width", "67%");
        }else{
            $(".phone").addClass("w-75");
            $(".phone").css("width", "");

        }
    });
    
    // 총 금액 따지기
    sumPrice = parseInt($("#productSumPrice").text());
    $(".productItem").each(function(){
		var price = $(this).find(".productPrice").text();
		var count = $(this).find(".productCount").text();
		sumPrice += price * count;
		$(".productSumPrice").text(sumPrice.toLocaleString('ko-KR'));
	});
	
	// 배송비 따지기
	deliveryPrice = parseInt($("#deliveryPrice").text());
	$(".productItem").each(function(){
		if($(this).find(".productDeliveryPrice").val() != 0){
			deliveryPrice = 3000;
			return false;
		}
	});
	if(sumPrice >= 50000){
		deliveryPrice = 0;
	}
    $(".deliveryPrice").text(deliveryPrice.toLocaleString('ko-KR'));
    
    // 최종 결제 가격 따지기
    totalPrice = sumPrice - deliveryPrice;
	$(".totalPrice").text(totalPrice.toLocaleString('ko-KR'));

    
});
var checkboxSw;
// 전체약관 동의
function checkedAllCheckbox(obj){
	if($(obj).is(":checked")){
		$(".checkboxs").find('input:checkbox').prop('checked',true);
		checkboxSw = 1;
	}else{
		$(".checkboxs").find('input:checkbox').prop('checked',false);
		checkboxSw = 0;
	}
}

// 첫번째 약관 동의
function checkedAgreeOneStatus(obj){
	if(!$(obj).is(":checked")){
		$("#agreeAllCheckbox").prop("checked",false);
		checkboxSw = 0;
	}else{
		if($("#agreeTwoCheckbox").is(":checked")){
			$("#agreeAllCheckbox").prop("checked",true);
			checkboxSw = 1;
		}
	}
}

// 두번째 약관 동의
function checkedAgreeTwoCheckbox(obj){
	if($(obj).is(":checked")){
		$(".agreeTwo").find('input:checkbox').prop('checked',true);
		if($("#agreeOneCheckbox").is(":checked")){
			$("#agreeAllCheckbox").prop("checked",true);
			checkboxSw = 1;
		}
	}else{
		$("#agreeAllCheckbox").prop("checked",false);
		$(".agreeTwo").find('input:checkbox').prop('checked',false);
		checkboxSw = 0;
	}
}

// 두번째 약관 안의 서브 약관들
function checkedAgreeTwo_SubStatus(obj){
	
}


// 결제하기 버튼 누를 때 유효성 검사 체크 스위치들
var receiverSw;
var addressSw;
var phoneSW;

// 받는분 onblur 유효성검사
function checkName(obj){
	var namereg = /^[가-힣]{2,4}$/;
	if(obj.value == "" || !namereg.test(obj.value)){
		$("#receiverSpan").css("color", "red");
		$("#receiverSpan").prev().text("*");
		setTimeout(function(){
            $("#receiverSpan").css("color", "black");
        },500);
	}else{
		$("#receiverSpan").css("color", "green");
		$("#receiverSpan").prev().text("");
		setTimeout(function(){
            $("#receiverSpan").css("color", "black");
        },500);
	}
}

// 주문자와 동일
function sameName(obj){
	if($(obj).is(":checked")){
		$("#receiver").val($("#name").val());
		$("#receiver").prop('readonly', true);
		$("#receiverSpan").css("color", "green");
		$("#receiverSpan").prev().text("");
		setTimeout(function(){
            $("#receiverSpan").css("color", "black");
        },300);
	}else{
		$("#receiver").val("");
		$("#receiver").prop('readonly', false);
		$("#receiverSpan").prev().text("*");
	}
}

// 카카오 주소지
function deliveryAddress() {
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
                // document.getElementById("extraAddress").value = extraAddr;
            
            } else {
                // document.getElementById("extraAddress").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('postcode').value = data.zonecode;
            document.getElementById("address").value = addr;
            
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("detailAddress").readOnly = false;
            document.getElementById("detailAddress").focus();
        }
    }).open();
}

// 상세주소 onblur 유효성검사
function checkAddress(obj){
	if(obj.value == "" ){
		$("#deliverySpan").css("color", "red");
		$("#deliverySpan").prev().text("*");
		setTimeout(function(){
            $("#deliverySpan").css("color", "black");
        },500);
	}else{
		$("#deliverySpan").css("color", "green");
		$("#deliverySpan").prev().text("");
		setTimeout(function(){
            $("#deliverySpan").css("color", "black");
        },500);
	}
}

// 연락처 최대길이 넘길때
function phoneMaxLength(obj){
	if($(obj).val().length > obj.maxLength){
            $(obj).val(obj.value.slice(0, obj.maxLength));
        }
}

// 연락처 onblur 유효성검사
var phoneSwOne;
var phoneSwTwo;
function phoneCheck(obj, lengths){
	if($(obj).val().length < lengths){
		$("#phoneSpan").css("color", "red");
		$("#phoneSpan").prev().text("*");
		setTimeout(function(){
            $("#phoneSpan").css("color", "black");
        },500);
        
        if(lengths == 3){
			phoneSwOne = 0;
		}else{
			phoneSwTwo = 0;
		}
	}else{
		if(lengths == 3){
			phoneSwOne = 1;
		}else{
			phoneSwTwo = 1;
		}
		
	}
	if(phoneSwOne + phoneSwTwo == 2){
		$("#phoneSpan").css("color", "green");
		$("#phoneSpan").prev().text("");
		setTimeout(function(){
            $("#phoneSpan").css("color", "black");
        },500);
	}
}

// 포인트 사용
function checkedPoint(obj){
	if($(obj).is(":checked")){
		$("#point").prop('readonly', false);
	}else{
		$("#point").val("0");
		$("#point").prop('readonly', true);
	}
}