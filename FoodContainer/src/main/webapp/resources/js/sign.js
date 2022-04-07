function fn_idChk(){
	var id =$("#id").val();
	$.ajax({
		url:"idChk",
		type:"post",
		data:id,
		success:function(data){
			if(data==1){
				alert("중복된 아이디 입니다.");
			}else if(data==0){
				$("#idChk").attr("value","Y");
				alert("사용가능한 아이디입니다.");
			}	
		},
		error:function(){
			
		}
	})

}









function checkAll() {
	
	var checkId = /^[a-z][a-zA-Z0-9]{4,11}/g;
	var checkPw = /^.*(?=^.{6,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
	var checkName = /^[가-힣]{2,6}$/g; 
	var checkEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/g;
	var checkphone2 = /^[0-9]{3,4}/g;
	var checkphone3 = /^[0-9]{4}/g;

   //var checkEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;


	
	 	var id =  document.getElementById("test"); 
        var pw = document.getElementById("pw"); 
        var pwchk = document.getElementById("pwchk");
        var name = document.getElementById("name");
        var nickname = document.getElementById("nickname");
        var email = document.getElementById("email"); 
        var phone2 = document.getElementById("phone2");
        var phone3 = document.getElementById("phone3");
	//아이디
	if (id.value == "") {
		alert("ID를 입력해주세요!");
		return false;
	}

	if (!checkId.test(id.value)) {
		alert("id는 5~12자리의 영문 및 영문숫자 가능");
		return false;
	}
	//비밀번호
	if (pw.value == "") {
		alert("비밀번호를 입력해주세요!");
		return false;
	}
	if (!checkPw.test(pw.value)) {
		alert("password는 6~12자리의 영문 대소문자와숫로만 가능");
		return false;
	}

	if (pw.value != pwchk.value) {
		alert("비밀번호가 틀립니다. 다시 확인하여 입력하세요!")
		return false;
	}
	//이름
	if (name.value == "") {
		alert("이름을 입력해주세요!");
		return false;
	}
	if (!checkName.test(name.value)) {
		alert("특수문자,영어,숫자는 사용할 수 없습니다. 한글만 입력해주세요!");
		return false;
	}
	//연락처
	if(phone2.value==""){
		alert("연락처2를 입력해주세요!");
		return false;
	}
	if(!checkphone2.test(phone2.value)){
		alert("숫자3~4자리를 입력해주세요!");
		return false;
	}
	if(phone3.value==""){
		alert("연락처3를 입력해주세요!");
		return false;
	}
	if(!checkphone3.test(phone3.value)){
		alert("숫자3~4자리를 입력해주세요!");
		return false;
	}
	//닉네임
	if(nickname.value==""){
		alert("닉네임을 입력해주세요!");
		return false;
	}
	
	
	//이메일
	if (email.value == "") {
		alert("이메일을 입력해주세요!");
		return false;
	}
	if (!checkEmail.test(email.value)) {
		alert("올바른 이메일 형식이 아닙니다.");
		return false;
	}
	
	
}








