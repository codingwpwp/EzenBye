<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	href="<%=request.getContextPath()%>/resources/css/notice.css">
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
			<div class="col-2 col-sm-1 pe-0 d-lg-none border border-dark"
				id="navLeftMenu"><!-- 여기에 작성 --></div>

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
					<div class="fs-5 my-2 fw-bold">공지사항</div>

					<div class="maindiv">
						<table class="table table-hover maintab">
							<thead>
								<tr>
									<th scope="col" class="center">번호</th>
									<th scope="col">제목</th>
									<th scope="col" class="center">날짜</th>
									<th scope="col" class="center">조회수</th>
								</tr>
							</thead>
							<tbody>
							
							<c:forEach items="${noticeList}" var="list">
							<c:set var="e" value="${e+1}" />
								<tr>
									<th scope="row" class="center">${e}</th>
									<td class="left"><a href="<%=request.getContextPath()%>/notice_view.do?notice_index=${list.notice_index}&nowPage=${paging.nowPage}"><span
											class="d-inline-block text-truncate">
												${list.title}
												 </span></a></td>
									<td class="center">${list.write_date}</td>
									<td class="center">${list.hit}</td>
								</tr>
							</c:forEach>
							
							</tbody>
						</table>
					</div>

					<div class="row">
					<c:if test="${!empty memberInfor && memberInfor.position eq '관리자'}">
					<div class="col-md-11 col-sm-11 col-12">
						<input value="등록" type="button" class="btn btn-primary insertbtn" onclick="location.href='notice_insert.do?nowPage=${paging.nowPage}'">
					</div>
					</c:if>
					<div class="col-12">
					
						<nav aria-label="Page navigation example">
					  <ul class="pagination review-paging">
					  <!-- <부분 -->
					  <c:if test="${paging.startPage > 1}">
					  <li class="page-item">
					      <a class="page-link" href="notice_main.do?nowPage=${paging.startPage - 1}" aria-label="Previous">
					        <span aria-hidden="true">&lt;</span>
					      </a>
					    </li>
					  </c:if>
					   
					  <c:if test="${paging.startPage <= 1}">
			  			<li class="page-item" style="visibility: hidden">
                               <a class="page-link" href="#" aria-label="Previous">
                                   <span aria-hidden="true">&lt;</span>
                               </a>
                           </li>
					  </c:if> 
					  
					  <!-- 각 페이지 -->
					  <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i" step="1">
					  	<c:if test="${i != paging.nowPage}">
					  		<li class="page-item">
					  			<a class="page-link" href="notice_main.do?nowPage=${i}">${i}</a>
					  		</li>
					  	</c:if>
					  	<c:if test="${i == paging.nowPage}">
					  		 <li class="page-item active" aria-current="page">
					  		 	<a class="page-link fw-bold" href="#">${i}</a>
					  		 </li>
					  	</c:if>
					  </c:forEach>
					   
				      <!-- >부분 -->
				      <c:if test="${paging.endPage != paging.lastPage}">
				      	<li class="page-item">
					      <a class="page-link" href="notice_main.do?nowPage=${paging.endPage + 1}" aria-label="Next">
					        <span aria-hidden="true">&gt;</span>
					      </a>
					    </li>
				      </c:if>
				      <c:if test="${paging.startPage == paging.lastPage}">
				      	<li class="page-item" style="visibility: hidden">
                            <a class="page-link" href="#" aria-label="Next">
                                <span aria-hidden="true">&gt;</span>
                            </a>
                        </li>
				      </c:if>
					    
					  </ul>
					</nav>
						
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
	<script src="https://kit.fontawesome.com/b30bc4e0a9.js"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/base.js"></script>
</body>
</html>