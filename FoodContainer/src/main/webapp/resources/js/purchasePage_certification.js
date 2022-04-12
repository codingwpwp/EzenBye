var emailCheckSw = 0;
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
		alert("이메일을 발송했습니다");
		$.ajax({
			url : "certification.do",
			type : "post",
			data : $("form[name='emailCertificationForm']").serialize(),
			success : function(data){
				var result = data.trim();
				if(result == "success") {
					alert("보내기 성공");
				} else {
					alert("삭제 실패");
				}
			}
		});
	}
}