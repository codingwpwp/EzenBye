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
		alert("잘못된 접근입니다");
		location.href='<%=request.getContextPath()%>/index.do';
	}
</script>
</html>