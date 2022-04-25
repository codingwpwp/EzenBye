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
		alert("로그인이 필요합니다");
		location.href='<%=request.getContextPath()%>/loginmain.do';
	}
</script>
</html>