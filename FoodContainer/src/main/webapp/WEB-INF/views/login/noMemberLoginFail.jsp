<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body onload="alertMessage()">

</body>
<script type="text/javascript">
	function alertMessage(){
		alert("존재하지 않는 주문번호 이거나 잘못된 비밀번호 입니다.");
		location.href='noMemberLogin.do';
	}
</script>
</html>