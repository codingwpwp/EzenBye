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

// 아이디 찾기 페이지
function easyFindIdBtn(){
	var form = $("#easyFindIdForm");
	var flag = true;
	var nameReg = /^[가-힣]{2,6}$/g;
	var phoneReg = /^[0-9]{7,8}/g;
	if(form.find("input[name='name']").val() == ""){
		flag = false;
	}else if(form.find("input[name='phone']").val() == ""){
		flag = false;
	}else if(!nameReg.test(form.find("input[name='name']").val())){
		flag = false;
	}else if(!phoneReg.test(form.find("input[name='phone']").val())){
		flag = false;
	}
	
	
	if(flag){
		form.submit();
	}else{
		alert("정확히 입력하세요");
	}
}