// 로그인 페이지
var loginFormSubmitSw = 0;
var keylist="ABCDEFGHIJKLMNOPQRSTUVWXYZ";
var key = "";
var cnt = $("#loginFailCnt").val();

$(document).ready(function(){
	if(cnt >= 3){
		for(var i = 0; i < 6; i++){
			key += keylist.charAt(Math.floor(Math.random()*keylist.length));
		}
		spanColor();
		//$("#codeSpan").text(key);
	}
	
});

function loginCheck(){
	if(cnt >= 3){
		if($("#codeInput").val() == key){
			loginFormSubmitSw = 1;
		}else{
			$("#codeSpan").html("");
			$("#codeStatus").text("삐비빅!! (틀렸습니다!!)");
			key = "";
			for(var i = 0; i < 6; i++){
				key += keylist.charAt(Math.floor(Math.random()*keylist.length));
			}
			spanColor();
			$("#codeInput").val("");
			loginFormSubmitSw = 0;
		}
	}else{
		loginFormSubmitSw = 1;
	}
	
	if(loginFormSubmitSw == 1){
		$("#loginForm").submit();
	}
}

document.oncontextmenu = function(){return false;}

function spanColor(){
	var random = Math.floor(Math.random() * 4);
	
	if(random == 0){
		$("#codeSpan").css("background-color", "yellow");
	}else if(random == 1){
		$("#codeSpan").css("background-color", "#2a2727");
	}else if(random == 2){
		$("#codeSpan").css("background-color", "skyblue");
	}else{
		$("#codeSpan").css("background-color", "green");
	}
	
	for(var i = 0; i < 6; i++){
		var random1 = Math.floor(Math.random() * 2);
		var random2 = Math.floor(Math.random() * 2);
		var random3 = Math.floor(Math.random() * 3);
		
		var span = $("<span>");
		$(span).css("font-size", Math.floor(Math.random() * 8) + 16 + "px");
		if(random1 == 0){
			$(span).css("font-weight", "700");
		}else{
			$(span).css("font-weight", "500");
		}
		
		if(random2 == 0){
			$(span).css("font-style", "italic");
		}else{
			$(span).css("font-style", "normal");
		}
		
		if(random3 == 0){
			$(span).css("color", "blue");
		}else if(random3 == 1){
			$(span).css("color", "red");
		}else{
			$(span).css("color", "gray");
		}
		
		$(span).text(key.charAt(i) + " ");
		
		$("#codeSpan").append(span);	
	}
}

function replaceSpelling(obj){
	obj.value = obj.value.replace(/[^a-zA-Z]/g, "");
	obj.value = obj.value.toUpperCase();
}

// 간편 아이디 찾기
var nSw = 0;	// 이름 스위치
var eSw = 0;	// 이메일 스위티
// 이름 실시간
function checkName(obj){
	var nameReg = /^[가-힣]{2,6}$/g;
	if(!nameReg.test(obj.value)){
		nSw = 0;
	}else{
		nSw = 1;
	}
	
	if(nSw == 1 && eSw == 1){
		$("#easyFindIdSubmitBtn").removeClass("btn-secondary");
		$("#easyFindIdSubmitBtn").addClass("btn-primary");
		$("#easyFindIdSubmitBtn").attr("disabled", false);
	}else{
		$("#easyFindIdSubmitBtn").removeClass("btn-primary");
		$("#easyFindIdSubmitBtn").addClass("btn-secondary");
		$("#easyFindIdSubmitBtn").attr("disabled", true);
	}
}
// 핸드폰번호 실시간
function checkPhone(obj){
	var phoneReg = /^[0-9]{7,8}/g;
	if(!phoneReg.test(obj.value)){
		eSw = 0;
	}else{
		eSw = 1;
	}
	
	if(nSw == 1 && eSw == 1){
		$("#easyFindIdSubmitBtn").removeClass("btn-secondary");
		$("#easyFindIdSubmitBtn").addClass("btn-primary");
		$("#easyFindIdSubmitBtn").attr("disabled", false);
	}else{
		$("#easyFindIdSubmitBtn").removeClass("btn-primary");
		$("#easyFindIdSubmitBtn").addClass("btn-secondary");
		$("#easyFindIdSubmitBtn").attr("disabled", true);
	}
}

// 이메일 아이디 찾기
var email = "";
var emailCheckSw = 0;
var sendEmailTimeSw = 0;
var checkNumSw = 0;
var randomNum = "";
var time = 0;
var min = "";
var sec = "";

function emailCheck(obj){
	var emailReg = /^([\w\.\_\-])*[a-zA-Z0-9]+([\w\.\_\-])*([a-zA-Z0-9])+([\w\.\_\-])+@([a-zA-Z0-9]+\.)+[a-zA-Z0-9]{2,8}$/g;
	
	if(emailReg.test(obj.value)){
		$("#emailbtn").removeClass("btn-secondary");
		$("#emailbtn").addClass("btn-primary");
		emailCheckSw = 1;
	}else{
		$("#emailbtn").removeClass("btn-primary");
		$("#emailbtn").addClass("btn-secondary");
		emailCheckSw = 0;
	}
}

function sendEmail(){
	if(emailCheckSw == 0){
		alert("이메일을 입력하지 않았거나 형식에 맞지 않는 이메일입니다");
	}else if(emailCheckSw == 1){
		
		if(sendEmailTimeSw == 0 && checkNumSw == 0){
			sendEmailTimeSw = 1;
			email = $("#email").val();
			$("#timer").html("보내는중...");
			$.ajax({
				url : "purchase/emailCertification.do",
				type : "post",
				data : $("form[name='emailFindIdForm']").serialize(),
				success : function(data){
					randomNum = data.trim();
					$("input#emailCheckOkBtn").attr("disabled", false);
					time = 179;
					$("#emailCheckOkBtn").removeClass("btn-secondary");
					$("#emailCheckOkBtn").addClass("btn-primary");
					setInterval(function(){
						if(checkNumSw == 0){
							min = parseInt(time / 60);
							sec = time % 60;
							$("#timer").html(min + "분 " + sec + "초");
							time--;
							
							if(time < 0){
								clearInterval();
								$("#timer").html("시간초과");
								randomNum = "";
								sendEmailTimeSw = 0;
								$("#emailMessageSpan").html("");
								$("#emailCheckOkBtn").removeClass("btn-primary");
								$("#emailCheckOkBtn").addClass("btn-secondary");
								$("#emailCheckOkBtn").attr("disabled", true);
							}
						}else{
							$("#timer").html("인증완료");
						}

					}, 1000);
					$("#emailMessageSpan").html("해당 이메일로 인증번호를 발송했습니다.<br>3분 이내에 입력하세요");
				}
			});
		}else if(sendEmailTimeSw == 1 && checkNumSw == 1){
			alert("이미 인증하였습니다");
		}else if(sendEmailTimeSw == 1 && checkNumSw == 0){
			alert("이미 발송 했습니다 3분내에 입력하세요");
		}
		
	}
}

function checkNum(){
	var nameReg = /^[가-힣]{2,6}$/g;
	var form = $("form[name='emailFindIdForm']");
	if(checkNumSw == 0){
		if($("#randomNum").val() == randomNum){
			$("#email").val(email);
			$("#email").attr("readonly", true);
			
			checkNumSw = 1;
			
			if(!nameReg.test(form.find("input[name='name']").val())){
				alert("인증이 완료되었지만 이름을 정확히 입력해야 합니다");
			}else{
				$("form[name='emailFindIdForm']").submit();
			}
			
		}else{
			alert("인증번호가 틀렸습니다. 다시 입력 하세요");
		}			
	}else if(checkNumSw == 1){
		if(!nameReg.test(form.find("input[name='name']").val())){
			alert("인증이 완료되었지만 이름을 정확히 입력해야 합니다");
		}else{
			$("form[name='emailFindIdForm']").submit();
		}
	}
}



// 비밀번호 찾기
var pwNameSw = 0;
var pwIdSw = 0;
var pwEmailSw = 0;

var pwEmailBtnSw = 0;
var pwRandomNum = "";

function checkNamePw(obj){
	var nameReg = /^[가-힣]{2,6}$/g;
	if(!nameReg.test(obj.value)){
		pwNameSw = 0;
	}else{
		pwNameSw = 1;
	}
	
	if(pwNameSw == 1 && pwIdSw == 1 && pwEmailSw == 1){
		$("#emailBtn").attr("disabled", false);
	}else{
		$("#emailBtn").attr("disabled", true);
	}
}

function checkIdPw(obj){
	var idReg = /^[a-z][a-zA-Z0-9]{7,19}/g;
	if(!idReg.test(obj.value)){
		pwIdSw = 0;
	}else{
		pwIdSw = 1;
	}
	
	if(pwIdSw == 1 && pwIdSw == 1 && pwEmailSw == 1){
		$("#emailBtn").attr("disabled", false);
	}else{
		$("#emailBtn").attr("disabled", true);
	}
}

function checkEmailPw(obj){
	var emailReg = /^([\w\.\_\-])*[a-zA-Z0-9]+([\w\.\_\-])*([a-zA-Z0-9])+([\w\.\_\-])+@([a-zA-Z0-9]+\.)+[a-zA-Z0-9]{2,8}$/g;
	if(!emailReg.test(obj.value)){
		pwEmailSw = 0;
	}else{
		pwEmailSw = 1;
	}
	
	if(pwIdSw == 1 && pwIdSw == 1 && pwEmailSw == 1){
		$("#emailBtn").attr("disabled", false);
	}else{
		$("#emailBtn").attr("disabled", true);
	}
}

function sendEmailPwBtn(){
	if(pwEmailBtnSw == 1){
		
	}else{
		pwEmailBtnSw = 1;
		$.ajax({
			url : "sendEmailPw.do",
			type : "post",
			data : $("form[name='emailPwForm']").serialize(),
			success : function(data){
				pwRandomNum = data.trim();
				if(pwRandomNum == "none"){
					alert("일치하는 회원 정보가 없습니다");
					pwEmailBtnSw = 0;
				}else{
					$("input#emailPwSubmitBtn").attr("disabled", false);
					$("input[name='name']").attr("readonly", true);
					$("input[name='id']").attr("readonly", true);
					$("input[name='email']").attr("readonly", true);
					$("input#emailBtn").attr("disabled", true);
					time = 179;
					setInterval(function(){
						min = parseInt(time / 60);
						sec = time % 60;
						$("#timer").html(min + "분 " + sec + "초");
						time--;
						
						if(time < 0){
							clearInterval();
							$("#timer").html("시간초과");
							pwRandomNum = "";
							pwEmailBtnSw = 0;
							$("input#emailPwSubmitBtn").attr("disabled", true);
							$("input[name='name']").attr("readonly", false);
							$("input[name='id']").attr("readonly", false);
							$("input[name='email']").attr("readonly", false);
							$("input#emailBtn").attr("disabled", false);
							
							$("#emailMessageSpan").html("");
						}
		
					}, 1000);
					$("#emailMessageSpan").html("해당 이메일로 인증번호를 발송했습니다.<br>3분 이내에 입력하세요");					
				}

			}
		});		

	}

}

function pwFindFormSubmitBtn(){
	
	if($("#randomNum").val() == pwRandomNum){
		$("form[name='emailPwForm']").submit();
	}else{
		alert("인증번호가 틀렸습니다. 다시 입력 하세요");
	}
}

// 비회원 주문 비밀번호 찾기
var noMemIndexSw = 0;
var noMemEmailSw = 0;
var noMemSendSw = 0;

function noMemberCheckIndex(obj){
	if(obj.value != ""){
		noMemIndexSw = 1;
	}else{
		noMemIndexSw = 0;
	}
	if(noMemIndexSw == 1 && noMemEmailSw == 1){
		$("#noMemberSendEmailBtn").attr("disabled", false);
	}else{
		$("#noMemberSendEmailBtn").attr("disabled", true);
	}
}
function noMemberCheckEmail(obj){
	var emailReg = /^([\w\.\_\-])*[a-zA-Z0-9]+([\w\.\_\-])*([a-zA-Z0-9])+([\w\.\_\-])+@([a-zA-Z0-9]+\.)+[a-zA-Z0-9]{2,8}$/g;
	if(emailReg.test(obj.value)){
		noMemEmailSw = 1;
	}else{
		noMemEmailSw = 0;
	}
	if(noMemIndexSw == 1 && noMemEmailSw == 1){
		$("#noMemberSendEmailBtn").attr("disabled", false);
	}else{
		$("#noMemberSendEmailBtn").attr("disabled", true);
	}
}
function noMemberSendEmailFn(){
	var form = $("#noMemberFindOrderForm");
	if(noMemSendSw == 1){
		
	}else{
		noMemSendSw = 1;
		$("#noMemberSpan").text("보내는중...");
		$.ajax({
			url : "noMembersendEmailPw.do",
			type : "post",
			data : $(form).serialize(),
			success : function(data){
				$("#noMemberSpan").text("");
				$("#noMemberSendEmailBtn").attr("disabled", true);
				if(data.trim() == "none"){
					alert("관련 정보가 존재 하지 않습니다");
					noMemSendSw = 0;
				}else{
					noMemSendSw = 0;
					alert(data.trim() + "님의 해당 이메일로 주문 비밀번호를 발송했습니다");
					form.find(".btn-close").trigger('click');
				}
				
			}
		});
	}
}