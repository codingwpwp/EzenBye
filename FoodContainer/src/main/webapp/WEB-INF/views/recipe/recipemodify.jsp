<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Food Container</title>
<!-- css링크 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
	<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/recipewrite.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/base.css">


<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
	rel="stylesheet">
	

</head>
<body>
	<!-- 헤더 -->
	<header class="border-bottom border-dark">
		<%@include file="/WEB-INF/views/base/header.jsp"%>
	</header>

	<!-- 네비게이션 바 -->
	<nav
		class="navbar-expand-lg navbar-light bg-warning bg-gradient bg-opacity-25 fw-bold fs-5">
		<div class="row">
			<div class="col-lg-2 d-none d-lg-block"></div>

			<!--
                id="navLeftMenu"인 현재 주석 바로 아래의 태그는 페이지의 종류에 따른 왼쪽메뉴.
                네비게이션 바가 펼쳐질 때 알아서 태그가 안보이도록 설정.
                필요시에만 div태그 사이에 코드를 작성.
                작성시 border border-dark는 구분용으로만 작성했기 때문에 알아서 지우고 작업.
                작성하지 않는 경우는 절대 건들지 않음.
                base.js에 id="navLeftMenu"와 관련된 코드가 작성되어있음.
            -->
			<div class="col-2 col-sm-1 pe-0 d-lg-none border border-dark" id="navLeftMenu">
				<!-- 여기에 작성 -->
			</div>

			<%@include file="/WEB-INF/views/base/nav.jsp"%>

		</div>
	</nav>

	<!-- 섹션 -->
	<section class="mt-1">
		<div class="row">

			<!-- 왼쪽 사이드메뉴 -->
			<div class="col-lg-2 d-none d-lg-block">
				<aside></aside>
			</div>

			<!-- 메인 -->
			<div class="col-12 col-sm-9 col-md-10 col-lg-8">
				<article id="mainSection">

					<!--
                        헤딩.
                        필요하지 않는 사람은 <div>태그를 삭제.
                        필요한 사람은 <div>태그에 작성.
                    -->
					 <div class="fs-5 my-2 fw-bold">레시피 수정</div> 
					<form action="recipemodify" method="post" id="recipewr" enctype="multipart/form-data">
					<input type="hidden" name="recipe_index" value="${vo.recipe_index}">
						<div class="container">
							
							<div class="row title">
								<div class="px-0 col-md-1 col-sm-3 col-2" id="tit">
									<strong>제목</strong>
								</div>
								<div class="px-0 col-md-6 col-sm-6 col-10">
									<input type="text" class="form-control" name="title" value="${read.title}">
								</div>
							</div>
							<div class="row content">
								<div class="px-0 col-md-1 col-sm-3 col-2">
									<strong>내용</strong>
								</div>
								<div class="px-0 col-md-6 col-sm-7 col-10 ">
									
									<textarea id="summernote" name="contents">${read.contents}</textarea>
								</div>
								<div class="col-md-3 col-sm-3  col-12 thumnail" id="thumnail">
									<div id=thumnailstrong>
										<strong>수정하실 새로운을 사진을 등록해주세요</strong>
									</div>
									
								</div>
							
							</div>
							<!-- 대표이미지 -->
							<div class="row my-3 imageRow d-flex justify-content-center">

								<!-- 대표이미지 문구 -->
								<div
									class="col-5 col-md-3 col-lg-2 d-flex justify-content-center">
									<span class="infoTitle p-1"><span class="text-danger">*</span>대표이미지</span>
								</div>

								<div class="col-11 col-md-6 col-lg-8 d-flex mt-2 inputImageFile">
									<!-- 파일 등록 -->
									<input class="form-control check" name="tumnailImage" type="file" accept="image/png" onchange="previewImage(event,this);previewImage2(event,this);">
								</div>
								<div
									class="col-7 col-md-3 col-lg-2 d-flex justify-content-end imagePreview">
									<!-- 이미지 미리보기 -->
									<button type="button" class="btn btn-secondary previewButton" data-bs-toggle="modal" data-bs-target="#tumnailImageModal">미리보기</button>
								</div>
							</div>
							  <!-- 대표이미지 미리보기 모달 -->
							<div class="modal fade" id="tumnailImageModal" tabindex="-1"
								aria-labelledby="tumnailImageModalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="tumnailImageModalLabel">대표이미지</h5>
											<button type="button" class="btn-close"
												data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body">
											<div class="imageContainer">
												<span class="fs-5">이미지가 없습니다.</span>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="row hap">
								<div class="col-sm-2 col-12" id="hap">
									<strong>조합 상품</strong>
								</div>
								
								<div class="px-1 col-sm-3 col-4 sel1" id="selbox">
									<select name="product_index1" id="sel" class="select1">
										<option value="${read.product_index1}">${read.product_name1}</option>
										<c:forEach items="${productListAll}" var="productListAll" varStatus="status">
										<option value="${productListAll.product_index}">[${productListAll.brand}]${productListAll.product_name}</option>
										</c:forEach>
										
									
									</select>
									
								</div>
								<div class="px-1 col-sm-3 col-4 sel2" id="selbox">
									<select name="product_index2" id="sel" class="select1">		
											<option value="${read.product_index2}">${read.product_name2}</option>							
										<c:forEach items="${productListAll}" var="productListAll" varStatus="status">
										<option value="${productListAll.product_index}">[${productListAll.brand}]${productListAll.product_name}</option>
										</c:forEach>
									</select>
								</div>
								<div class="px-1 col-sm-3 col-4 sel3" id="selbox">
									<select name="product_index3" id="sel" class="select1">
										<option value="${read.product_index3}">${read.product_name3}</option>
										<c:forEach items="${productListAll}" var="productListAll" varStatus="status">
										<option value="${productListAll.product_index}">[${productListAll.brand}]${productListAll.product_name}</option>
										</c:forEach>
									</select>
								</div>

							</div>
							<div class="row">
								<div class="col-sm-6 col-5 bt">
									<input type="submit" value="등록" class="btn btn-primary">
								</div>
								<div class="col-sm-6 col-5">
									<input type="button" value="취소" class="btn btn-primary"
										onclick="location.href='recipemain.do'">
								</div>
							</div>
						</div>

					</form>

				</article>
			</div>

			<!-- 오른쪽 사이드메뉴 -->
			<div class="col-sm-3 col-md-2 col-lg-2 d-none d-sm-block">
				<%@include file="/WEB-INF/views/base/rightAside.jsp"%>
			</div>

		</div>
	</section>

	<!-- 푸터 -->
	<footer class="py-3 my-4">
		<%@include file="/WEB-INF/views/base/footer.jsp"%>
	</footer>

	<!-- 자바스크립트 -->
	<script src="https://kit.fontawesome.com/b30bc4e0a9.js"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/base.js"></script>
	<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js">
	</script>
	<script src="<%=request.getContextPath()%>/resources/js/recipe.js"></script>
	
</body>
</html>