<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form id="frm" action="lookupNon.do" method="post">
		<input type="hidden" name = "no_member_order_index" value="${no_member_order_index}">
	</form>
</body>
<script type="text/javascript">
	window.onload = function(){
		document.getElementById('frm').submit();
	}
</script>
</html>