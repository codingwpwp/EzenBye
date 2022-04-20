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
	href="<%=request.getContextPath()%>/resources/css/base.css">
	<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/recipeview.css">
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
	<nav class="navbar-expand-lg navbar-light bg-warning bg-gradient bg-opacity-25 fw-bold fs-5">
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
            <div class="col-2 col-sm-1 pe-0 d-lg-none border border-dark" id="navLeftMenu"><!-- 여기에 작성 --></div>

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
					<div class="fs-5 my-2 fw-bold"></div>

					<div class="container">
						<div class="row hd">
						
							<div class="col-sm-9 col-xs-3 col-12">
								<h3>${read.title}</h3>
							</div>


							<div class="col-sm-3 col-11">추천수 : (${read.thumb}) | 조회수 : (${read.hit}) | 댓글(${read.reply_index})</div>
						</div>

						<div class="row body">

							<div class="col-sm-8 col-10">
								<table>
							<%-- 	<c:forEach items="${product_index}" var="productListAll" varStatus="status"> --%>
									<tr>
										<th class="tdimg"><img src="<%=request.getContextPath()%>/resources/img/${read.product_img1}" width="150"
											height="150"></th>
										
										<td class="tdtx">${read.product_name1}</td>
									</tr>
									<%-- </c:forEach> --%>
									<c:if test="${not empty read.product_index2}">
									<tr>
										<th class="plus"><strong>+</strong></th>
									</tr>
									<tr>
										<th class="tdimg"><img src="<%=request.getContextPath()%>/resources/img/${read.product_img2}" width="150"
											height="150"></th>
										<td class="tdtx">${read.product_name2}</td>
									</tr>
									</c:if>
									<c:if test="${not empty read.product_index3}">
									<tr>
										<th class="plus"><strong>+</strong></th>
									</tr>
									<tr>
										<th class="tdimg"><img src="<%=request.getContextPath()%>/resources/img/${read.product_img3}" width="150"
											height="150"></th>
										<td class="tdtx">${read.product_name3}</td>

									</tr>
									</c:if>

								</table>

							</div>
							<div class="col-sm-2  col-12">
								<div class="thumnail" name="thumnailimg">
									<svg xmlns="http://www.w3.org/2000/svg" width="140"
										height="140" fill="currentColor" class="bi bi-images"
										viewBox="0 0 16 16">
                                    <path
											d="M4.502 9a1.5 1.5 0 1 0 0-3 1.5 1.5 0 0 0 0 3z" />
                                    <path
											d="M14.002 13a2 2 0 0 1-2 2h-10a2 2 0 0 1-2-2V5A2 2 0 0 1 2 3a2 2 0 0 1 2-2h10a2 2 0 0 1 2 2v8a2 2 0 0 1-1.998 2zM14 2H4a1 1 0 0 0-1 1h9.002a2 2 0 0 1 2 2v7A1 1 0 0 0 15 11V3a1 1 0 0 0-1-1zM2.002 4a1 1 0 0 0-1 1v8l2.646-2.354a.5.5 0 0 1 .63-.062l2.66 1.773 3.71-3.71a.5.5 0 0 1 .577-.094l1.777 1.947V5a1 1 0 0 0-1-1h-10z" />
                                </svg>
								</div>
							</div>
							<div class="col-sm-12 col-12" id="">
								<textarea readonly id="summernote">${read.contents}</textarea>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-12 col-12 good">
								 <a href="#" onclick="insertThumb(); return false;" name="thumb">
								<svg xmlns="http://www.w3.org/2000/svg"
										width="50" height="50" fill="currentColor"
										class="bi bi-hand-thumbs-up-fill" viewBox="0 0 16 16">
                                    <path
											d="M6.956 1.745C7.021.81 7.908.087 8.864.325l.261.066c.463.116.874.456 1.012.965.22.816.533 2.511.062 4.51a9.84 9.84 0 0 1 .443-.051c.713-.065 1.669-.072 2.516.21.518.173.994.681 1.2 1.273.184.532.16 1.162-.234 1.733.058.119.103.242.138.363.077.27.113.567.113.856 0 .289-.036.586-.113.856-.039.135-.09.273-.16.404.169.387.107.819-.003 1.148a3.163 3.163 0 0 1-.488.901c.054.152.076.312.076.465 0 .305-.089.625-.253.912C13.1 15.522 12.437 16 11.5 16H8c-.605 0-1.07-.081-1.466-.218a4.82 4.82 0 0 1-.97-.484l-.048-.03c-.504-.307-.999-.609-2.068-.722C2.682 14.464 2 13.846 2 13V9c0-.85.685-1.432 1.357-1.615.849-.232 1.574-.787 2.132-1.41.56-.627.914-1.28 1.039-1.639.199-.575.356-1.539.428-2.59z" />
                                  </svg></a>
                                <!--   <button type="button"onclick="insertThumb(); return false;" name="thumb">
								<svg xmlns="http://www.w3.org/2000/svg"
										width="50" height="50" fill="currentColor"
										class="bi bi-hand-thumbs-up-fill" viewBox="0 0 16 16">
                                    <path
											d="M6.956 1.745C7.021.81 7.908.087 8.864.325l.261.066c.463.116.874.456 1.012.965.22.816.533 2.511.062 4.51a9.84 9.84 0 0 1 .443-.051c.713-.065 1.669-.072 2.516.21.518.173.994.681 1.2 1.273.184.532.16 1.162-.234 1.733.058.119.103.242.138.363.077.27.113.567.113.856 0 .289-.036.586-.113.856-.039.135-.09.273-.16.404.169.387.107.819-.003 1.148a3.163 3.163 0 0 1-.488.901c.054.152.076.312.076.465 0 .305-.089.625-.253.912C13.1 15.522 12.437 16 11.5 16H8c-.605 0-1.07-.081-1.466-.218a4.82 4.82 0 0 1-.97-.484l-.048-.03c-.504-.307-.999-.609-2.068-.722C2.682 14.464 2 13.846 2 13V9c0-.85.685-1.432 1.357-1.615.849-.232 1.574-.787 2.132-1.41.56-.627.914-1.28 1.039-1.639.199-.575.356-1.539.428-2.59z" />
                                  </svg></button> -->
								<div name="">(${read.thumb})</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-12 col-12">
								<div class="d-flex button">
								<input type="button" value="목록" class="btn btn-primary" onclick="location.href='recipemain.do'">
								<c:if test="${member.member_index==read.member_index}">
								<input type="button" value="수정" class="btn btn-secondary" onclick="location.href='recipemodify.do'">
								<input type="button" value="삭제" class="btn btn-danger">
								</c:if>
								
								</div> 
							</div>
							<div class="col-sm-12 col-12">
								<button onclick="best();" class="btn btn-success">베스트
									레시피 선정</button>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-12 col-12">
								<h4>댓글 ${read.reply_index}</h4>
							</div>
						</div>
						
						<form method="post" action="wirteReply" id="writeReply">
						<input type="hidden" value="${read.recipe_index}" name="recipe_index">
						<div class="row rp">
							
							<div class="col-sm-8 col-9 reply-write">
								<input type="text" name="contents" placeholder="로그인 후 댓글 작성이 가능합니다.">
							</div>
							<div class="col-sm-2 col-3">
								<button class="btn btn-secondary" type="submit">등록</button>
							</div>
							
						</div>
						</form>
						
						
						<div class="row rpt">
 						<c:forEach items="${replyList}" var="re"> 
 							
							<div class="col-3 col-sm-2 col-md-2 col-lg-2 replyview">
								<p>${re.name}</p>
							</div>
							<div class="col-lg-2 col-md-2 col-sm-2 col-6 wday">${re.reply_date}
							</div>
							<div class="col-md-2 col-sm-2 col-3 report">
								<a href="#">신고<i class="bi bi-brightness-alt-high"></i></a>
								<c:if test="${member.member_index==read.member_index}">
							<!-- 	<a hrep="recipeview_reply_modify.do" onclick="recipeview_reply_modify.do">수정</a> -->
								<input type="button" value="수정" onclick="updateReply();">
								<a>삭제</a>
								</c:if>
							</div>
							<div name="replycontent" class="col-12 replycontent">┗ &nbsp;<input type="text" value="${re.contents}">
							<input type="hidden" value="${re.contents}">
							
							</div>
								
							 </c:forEach>	 
						</div>
						
					</div>

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
<script src="https://kit.fontawesome.com/b30bc4e0a9.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/base.js"></script>
    <script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js">
	</script>
	<script src="<%=request.getContextPath()%>/resources/js/recipe2.js"></script>
</body>
</html>