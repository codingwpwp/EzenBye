var email = "";
var emailCheckSw = 0;
var sendEmailTimeSw = 0;
var checkNumSw = 0;
var randomNum = "";
var time = 0;
var min = "";
var sec = "";

function emailCheck(obj){
	var emailReg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/g;
	
	if(emailReg.test(obj.value)){
		$("#emailCheckBtn").removeClass("btn-secondary");
		$("#emailCheckBtn").addClass("btn-primary");
		emailCheckSw = 1;
	}else{
		$("#emailCheckBtn").removeClass("btn-primary");
		$("#emailCheckBtn").addClass("btn-secondary");
		emailCheckSw = 0;
	}
}


function sendEmail(){
	if(emailCheckSw == 0){
		alert("이메일을 입력하지 않았거나 형식에 맞지 않는 이메일입니다");
	}else if(emailCheckSw == 1){
		
		if(sendEmailTimeSw == 0){
			email = $("#email").val();
			sendEmailTimeSw = 1;
			$("#timer").html("보내는중...");
			$.ajax({
				url : "emailCertification.do",
				type : "post",
				data : $("form[name='emailCertificationForm']").serialize(),
				success : function(data){
					randomNum = data.trim();
					$("#emailMessageSpan").html("해당 이메일로 인증번호를 발송했습니다.<br>3분 이내에 입력하세요");
					time = 180;
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
							}
						}else{
							$("#timer").html("인증완료");
						}

						
					}, 1000);
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
	if($("#emailCheckOkBtn").hasClass("btn-primary")){
		
		if(checkNumSw == 0){
			if($("#randomNum").val() == randomNum){
				alert("인증이 완료되었습니다");
				$("#email").val(email);
				$("#email").attr("readonly", true);
				$("input[type='submit']").attr("disabled", false);
				checkNumSw = 1;
			}else{
				alert("인증번호가 틀렸습니다. 다시 입력 하세요");
			}			
		}else if(checkNumSw == 1){
			alert("이미 인증하였습니다");
		}
		
	}else{
		alert("먼저 인증번호 발송부터 진행하세요");
	}
}

function checkForm(){
	var flag = true;
	var nameReg = /^[가-힣]{2,6}$/g; 
	if($("#name").val() == ""){
		flag = false;
	}else if (!nameReg.test($("#name").val())){
		flag = false;
	}
	
	if(flag == false){
		$("#emailMessageSpan").html("이름을 입력하세요");
	}
	
	return flag;
}
