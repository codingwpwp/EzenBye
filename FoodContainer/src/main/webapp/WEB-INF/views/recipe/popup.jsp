<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	<h2>파일을 선택 해주세요!</h2>
	<input type="file" id="sumnailimg" accept="image/*"
		onchange="setThumbnail(event,this);">
		<div id="image_container">
		</div>
	<script>
		function setThumbnail(event,obj) {
			var reader = new FileReader();
			reader.onload = function(event) {
				var img = document.createElement("img");
				img.setAttribute("recipewrite.do", event.target.result);
				document.querySelector("div#thumnail").appendChild(img);
			};
			reader.readAsDataURL(event.target.files[0]);
		}
	</script>

</body>
</html>