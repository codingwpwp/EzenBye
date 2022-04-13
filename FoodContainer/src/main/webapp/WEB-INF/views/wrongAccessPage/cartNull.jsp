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
		alert("아무것도 담기지 않았습니다. 메인페이지로 이동합니다.");
		location.href='/controller/index.do';
	}
</script>
</html>