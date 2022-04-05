var sumPrice;
var deliveryPrice;
var totalPrice;
var couponPrice = 0;
var pointPrice = 0;
var expectedPoint = 0;
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
	
	// 적립 예정 포인트 따지기
	expectedPoint = Math.floor(totalPrice * 0.05);
	// console.log(expectedPoint);
	$(".expectedPoint").text(expectedPoint);

    
});

// 결제하기 버튼 누를 때 유효성 검사 체크 스위치들
var addressSw = 0;
var checkboxSw = 0;
var receiverSw = 0;
var receiverPhoneSw = 0;

// 비회원 전용 추가 유효성 검사 체크 스위치들
var passwordSw = 0;
var orderNameSw = 0;
var orderPhoneSw = 0;


// 회원 비회원 공통 유효성 검사
// 전체약관 동의
function checkedAll(obj){
	if($(obj).is(":checked")){
		$(".checkboxs").find('input:checkbox').prop('checked',true);
		checkboxSw = 1;
	}else{
		$(".checkboxs").find('input:checkbox').prop('checked',false);
		checkboxSw = 0;
	}
}

// 첫번째 약관 동의
function checkedOne(obj){
	$("#agreeAllCheckbox").prop('checked',false);
	checkboxSw = 0;
	
	if($(obj).is(":checked") && $("#agreeTwoCheckbox").is(":checked")){
		if($("#agreeThreeCheckbox").val() != undefined){
			
			if($("#agreeThreeCheckbox").is(":checked")){
				
				$("#agreeAllCheckbox").prop('checked',true);
				checkboxSw = 1;
			}
			
		}else{
			
			$("#agreeAllCheckbox").prop('checked',true);
			checkboxSw = 1;
			
		}
	}
}

// 두번째 약관 동의
function checkedTwo(obj){
	$("#agreeAllCheckbox").prop('checked',false);
	checkboxSw = 0;
	
	if($(obj).is(":checked")){
		
		$(".agreeTwo").find('input:checkbox').prop('checked',true);
		
		if($("#agreeOneCheckbox").is(":checked")){
			if($("#agreeThreeCheckbox").val() != undefined){
				
				if($("#agreeThreeCheckbox").is(":checked")){
					$("#agreeAllCheckbox").prop('checked',true);
					checkboxSw = 1;
				}
				
			}else{
				
				$("#agreeAllCheckbox").prop('checked',true);
				checkboxSw = 1;
			}
		}
		
	}else{
		$(".agreeTwo").find('input:checkbox').prop('checked',false);
	}
}

// 두번째 서브 약관 동의
function checkedTwoSub(){
	var checkboxTwoSubSw = 0;
	$("#agreeAllCheckbox").prop('checked',false);
	checkboxSw = 0;
	
	$(".agreeTwo").each(function(){
		if($(this).find("input:checkbox").is(":checked")){
			checkboxTwoSubSw++;
		}else{
			$("#agreeTwoCheckbox").prop('checked',false);
			return false;
		}
	});
	
	if(checkboxTwoSubSw == 3){
		$("#agreeTwoCheckbox").prop('checked',true);
		
		if($("#agreeOneCheckbox").is(":checked")){
			
			if($("#agreeThreeCheckbox").val() != undefined){
				if($("#agreeThreeCheckbox").is(":checked")){
					$("#agreeAllCheckbox").prop('checked',true);
					checkboxSw = 1;
				}
			}else{
				$("#agreeAllCheckbox").prop('checked',true);
				checkboxSw = 1;
			}

		}
	}
	
}

// 세번째 약관 동의
function checkedThree(obj){
	$("#agreeAllCheckbox").prop('checked',false);
	checkboxSw = 0;
	
	if($(obj).is(":checked") && $("#agreeOneCheckbox").is(":checked") && $("#agreeTwoCheckbox").is(":checked")){
		$("#agreeAllCheckbox").prop('checked',true);
		checkboxSw = 1;
	}
}

// 주문자명&받는분 onblur 유효성검사
function checkName(obj){
	var nameReg = /^[가-힣]{2,5}$/;
	if(obj.value == "" || !nameReg.test(obj.value)){
		if($(obj).attr("name") == "orderName"){
			$("#orderNameSpan").css("color", "red");
			$("#orderNameSpan").prev().text("*");
			setTimeout(function(){
	            $("#orderNameSpan").css("color", "black");
	        },500);
	        orderNameSw = 0;
		}else{
			$("#receiverSpan").css("color", "red");
			$("#receiverSpan").prev().text("*");
			setTimeout(function(){
	            $("#receiverSpan").css("color", "black");
	        },500);
	        receiverSw = 0;
		}
	}else{
		if($(obj).attr("name") == "orderName"){
			$("#orderNameSpan").css("color", "green");
			$("#orderNameSpan").prev().text("");
			setTimeout(function(){
	            $("#orderNameSpan").css("color", "black");
	        },500);
			orderNameSw = 1;
		}else{
			$("#receiverSpan").css("color", "green");
			$("#receiverSpan").prev().text("");
			setTimeout(function(){
	            $("#receiverSpan").css("color", "black");
	        },500);
	        receiverSw = 1;
		}
	}
	// console.log(receiverSw);
	// console.log(orderNameSw);
}

// 주문자와 동일
function sameName(obj){
	var nameReg = /^[가-힣]{2,5}$/;

	if($(obj).is(":checked")){
		// 유효성검사에 통과했을때
		if(document.getElementById("orderName").value != "" && nameReg.test(document.getElementById("orderName").value)){
			$("#receiver").val($("#orderName").val());
			$("#receiver").prop('readonly', true);
			$("#receiverSpan").css("color", "green");
			$("#receiverSpan").prev().text("");
			setTimeout(function(){
	            $("#receiverSpan").css("color", "black");
	        },300);
	        orderNameSw = 1;
	        receiverSw = 1;
	        
		}else{ // 유효성검사에 통과하지 못했을때
			$("#orderNameSpan").css("color", "red");
			$("#orderNameSpan").prev().text("*");
			$(obj).prop("checked", false);
			setTimeout(function(){
	            $("#orderNameSpan").css("color", "black");
	        },500);
	        orderNameSw = 0;
		}
	}else{
		$("#receiver").val("");
		$("#receiver").prop('readonly', false);
		$("#receiverSpan").prev().text("*");
		receiverSw = 0;
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
	if(obj.value == ""){
		$("#deliverySpan").css("color", "red");
		$("#deliverySpan").prev().text("*");
		setTimeout(function(){
            $("#deliverySpan").css("color", "black");
        },500);
        addressSw = 0;
	}else{
		$("#deliverySpan").css("color", "green");
		$("#deliverySpan").prev().text("");
		setTimeout(function(){
            $("#deliverySpan").css("color", "black");
        },500);
        addressSw = 1;
	}
}

// 연락처 최대길이 넘길때
function phoneMaxLength(obj){
	if($(obj).val().length > obj.maxLength){
    	$(obj).val(obj.value.slice(0, obj.maxLength));
    }
}

// 비회원 주문자 연락처 onblur 유효성검사
var orderPhoneSwOne;
var orderPhoneSwTwo;
function orderPhoneCheck(obj, lengths){
	console.log(obj.value);
	if($(obj).val().length < lengths){
		$("#orderPhoneSpan").css("color", "red");
		$("#orderPhoneSpan").prev().text("*");
		setTimeout(function(){
            $("#orderPhoneSpan").css("color", "black");
        },500);
        
        if(lengths == 3){
			orderrPhoneSwOne = 0;
		}else{
			orderPhoneSwTwo = 0;
		}
        orderPhoneSw = 0;
	}else{
		if(lengths == 3){
			orderPhoneSwOne = 1;
		}else{
			orderPhoneSwTwo = 1;
		}
		
	}
	if(orderPhoneSwOne + orderPhoneSwTwo == 2){
		$("#orderPhoneSpan").css("color", "green");
		$("#orderPhoneSpan").prev().text("");
		setTimeout(function(){
            $("#orderPhoneSpan").css("color", "black");
        },500);
        orderPhoneSw = 1;
	}else{
        orderPhoneSw = 0;
	}
}

// 받는 사람 연락처 onblur 유효성검사
var receiverPhoneSwOne;
var receiverPhoneSwTwo;
function receiverPhoneCheck(obj, lengths){
	if($(obj).val().length < lengths){
		$("#receiverPhoneSpan").css("color", "red");
		$("#receiverPhoneSpan").prev().text("*");
		setTimeout(function(){
            $("#receiverPhoneSpan").css("color", "black");
        },500);
        
        if(lengths == 3){
			receiverPhoneSwOne = 0;
		}else{
			receiverPhoneSwTwo = 0;
		}
        receiverPhoneSw = 0;
	}else{
		if(lengths == 3){
			receiverPhoneSwOne = 1;
		}else{
			receiverPhoneSwTwo = 1;
		}
		
	}
	if(receiverPhoneSwOne == 1 && receiverPhoneSwTwo == 1){
		$("#receiverPhoneSpan").css("color", "green");
		$("#receiverPhoneSpan").prev().text("");
		setTimeout(function(){
            $("#receiverPhoneSpan").css("color", "black");
        },500);
        
        receiverPhoneSw = 1;
	}else{
		receiverPhoneSw = 0;
	}
}

// 비회원 비밀번호 onfocus 알림창
function passwordAlert(){
	alert("8 ~ 15자리의 대문자 + 소문자 + 숫자 + 특수문자 형식으로 입력하세요");
}

// 비회원 비밀번호 onblur 유효성검사
var passwordOneSw = 0;
var passwordTwoSw = 0;
function passwordCheck(obj, passwordSort){
	var passwordValue = obj.value;
	var passwordReg = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{8,15}/;
	if(passwordSort == "passwordOne"){
		
		if(!passwordReg.test(passwordValue)){
			$("#passwordOneSpan").css("color", "red");
			$("#passwordOneSpan").prev().text("*");
			setTimeout(function(){
	            $("#passwordOneSpan").css("color", "black");
	        },500);
	        
			passwordOneSw = 0;
		}else{
			$("#passwordOneSpan").css("color", "green");
			$("#passwordOneSpan").prev().text("");
			setTimeout(function(){
	            $("#passwordOneSpan").css("color", "black");
	        },500);
	        
	        passwordOneSw = 1;
		}
		
	}else{
		
		if(!passwordReg.test(passwordValue)){
			$("#passwordTwoSpan").css("color", "red");
			$("#passwordTwoSpan").prev().text("*");
			setTimeout(function(){
	            $("#passwordTwoSpan").css("color", "black");
	        },500);
	        
			passwordTwoSw = 0;
		}else{
			if($("#password").val() != passwordValue){
				$("#passwordTwoSpan").css("color", "red");
				$("#passwordTwoSpan").prev().text("*");
				setTimeout(function(){
		            $("#passwordTwoSpan").css("color", "black");
		        },500);
				
				passwordTwoSw = 0;
			}else{
				$("#passwordTwoSpan").css("color", "green");
				$("#passwordTwoSpan").prev().text("");
				setTimeout(function(){
		            $("#passwordTwoSpan").css("color", "black");
		        },500);
		        
		        passwordTwoSw = 1;
			}
		}
		
	}
	
	if(passwordOneSw == 1 && passwordTwoSw == 1){
		passwordSw = 1;
	}else{
		passwordSw = 0;
	}
}

// 쿠폰 사용할 때
function checkedCoupon(obj){
	var coupon_index = $(obj).val();
	// console.log(coupon_index);
	$.ajax({
		url: "couponCheck.do",
		type: "post",
		data: "coupon_index=" + coupon_index,
		success: function(data){
			var discount_percent = parseInt(data.trim());
			if(totalPrice > 0){
				couponPrice = (sumPrice + deliveryPrice) * (discount_percent * 0.01);
				totalPrice = sumPrice + deliveryPrice - couponPrice - pointPrice;
				if(totalPrice < 0 ){
					totalPrice = 0;
				}
				
				$(".couponPrice").text(couponPrice.toLocaleString('ko-KR'));
				$(".totalPrice").text(totalPrice.toLocaleString('ko-KR'));
				
				expectedPoint = Math.floor(totalPrice * 0.05);
				$(".expectedPoint").text(expectedPoint);
				
				$("#couponUsedSpan").text($(obj).find("option:selected").text());
			}else{
				alert("최종 결제 가격이 0원 입니다.");
			}
		}
	});

}

// 쿠폰 적용 초기화 버튼
function couponResetbutton(){
	couponPrice = 0;
	
	$(".couponPrice").text(couponPrice.toLocaleString('ko-KR'));
	
	$("#couponUsedSpan").text("적용한 쿠폰이 없습니다.");
	totalPrice = sumPrice + deliveryPrice - couponPrice - pointPrice;
	
	$(".totalPrice").text(totalPrice.toLocaleString('ko-KR'));
	expectedPoint = Math.floor(totalPrice * 0.05);
	$(".expectedPoint").text(expectedPoint);
	
	$("select[name='coupon']").find("option[id='notUsed']").prop("selected", true);
}

// 포인트 사용을 체크하는 함수
function checkedPoint(obj){
	if($(obj).is(":checked")){
		$("#point").prop('readonly', false);
	}else{
		$("#point").val("0");
		pointPrice = $("#point").val();
		$(".pointPrice").text("0");
		$("#point").prop('readonly', true);
		totalPrice = sumPrice + deliveryPrice - couponPrice - pointPrice;
		$(".totalPrice").text(totalPrice.toLocaleString('ko-KR'));
		
		expectedPoint = Math.floor(totalPrice * 0.05);
		$(".expectedPoint").text(expectedPoint);
	}
}

// 포인트 입력하는 중에 유효성 검사
function pointReg(obj){
	var pointReg = /[1-9]\d*/g;
	if(!pointReg.test(obj.value)){
		obj.value = "";
	}
}

// 사용가능한 포인트를 초과할 때
function pointMax(obj){
	if(parseInt(obj.value) > parseInt($("#availablePoint").val())){
		
		$(obj).val(obj.value.slice(0, $("#availablePoint").val().length - 1));
		
    	$("#availablePointCommaVer").css("color", "red");
		setTimeout(function(){
            $("#availablePointCommaVer").css("color", "black");
        },500);
        
    }
}

// 포인트를 입력하고 onblur 적용하는 함수
function usePoint(obj){
	var point = parseInt(obj.value);
	pointPrice = point;
	var numberReg = /[^0-9]/g;
	if(numberReg.test(point)){
		$(obj).val("");
	}else{
		if(sumPrice + deliveryPrice - couponPrice - point >= 0){
			$(".pointPrice").text(point.toLocaleString('ko-KR'));
			totalPrice = sumPrice + deliveryPrice - couponPrice - point;
			$(".totalPrice").text(totalPrice.toLocaleString('ko-KR'));
			
			expectedPoint = Math.floor(totalPrice * 0.05);
			$(".expectedPoint").text(expectedPoint);
		}else{
			$(obj).val("");
			$(".totalPrice").css("color", "#0d6efd");
			setTimeout(function(){
	            $(".totalPrice").css("color", "#dc3545");
	        },500);
		}
		
	}
}


function requestPay(){
	var requiredSw = 0;
	/*
	console.log("addressSw :" + addressSw);
	console.log("checkboxSw :" + checkboxSw);
	console.log("receiverSw :" + receiverSw);
	console.log("receiverPhoneSw :" + receiverPhoneSw);
	console.log("passwordSw :" + passwordSw);
	console.log("orderNameSw :" + orderNameSw);
	console.log("orderPhoneSw :" + orderPhoneSw);
	*/
	var totalSw = addressSw + checkboxSw + receiverSw + receiverPhoneSw + passwordSw + orderNameSw + orderPhoneSw;
	
	if($("#agreeThreeCheckbox").val() == undefined){
		requiredSw = 5;
	}else{
		requiredSw = 7;
	}
	
	if(totalSw == requiredSw){
		
		var order_index;
		var orderPhone;
		if($("#agreeThreeCheckbox").val() == undefined){
			orderPhone = $("#orderPhone").val();
		}else{
			orderPhone = $("select[name='orderPhone1']:selected").val() + "-" + "" + "-" + "";
		}
		
		var IMP = window.IMP;
	    IMP.init("imp13071934");
	    
	    IMP.request_pay({ // param
	        pg: "html5_inicis",                    // pg사 선택
	        pay_method: "card",                    // 지불 수단
	        merchant_uid: "ORD20180131-0000011",   // 주문번호
	        name: "푸드컨테이너 상품",              		   // 상품이름
	        amount: totalPrice,                          // 가격
	        buyer_email: $("#email").val(),      // 구매자 이메일
	        buyer_name: $("#orderName").val(),                   // 구매자 이름
	        buyer_tel: "010-4242-4242",            // 구매자 번호
	        buyer_addr: "서울특별시 강남구 신사동",   // 구매자 주소
	        buyer_postcode: "01181",               // 구매자 우편번호
	        m_redirect_url: "https://naver.com"     //  결제 후에 이동 될 주소
	    }, function (rsp) { // callback
	    
	        if (rsp.success) {
	            alert("결제성공");
	        } else {
	            alert("결제에 실패하였습니다 (" +  rsp.error_msg + ")");
	        }
	        
	    });
		
	}else{
		alert("입력부족");
	}

}
