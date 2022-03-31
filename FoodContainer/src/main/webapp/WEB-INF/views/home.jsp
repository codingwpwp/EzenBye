<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	<c:forEach items="${list}" var="list">
	${list.name } <br>
	${list.point } <br>
	${list.roulette_ticket }
	</c:forEach>
</h1>
</body>
</html>
