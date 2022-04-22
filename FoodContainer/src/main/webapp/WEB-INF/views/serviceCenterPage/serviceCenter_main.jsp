<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/base.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/notice.css">
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

			<div class="col-2 col-sm-1 pe-0 d-lg-none border border-dark" id="navLeftMenu"></div>

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

					<div class="fs-5 my-2 fw-bold">고객센터</div>
					
					<div class="row mb-3">
						<div class="col-3 mx-0 px-0">
							<button class="btn btn-secondary w-100 fs-5 fw-bold sortBtns" onclick="changeSort('상품')" <c:if test="${sort2 eq '상품'}">disabled</c:if>>상품</button>
						</div>
						<div class="col-3 mx-0 px-0">
							<button class="btn btn-secondary w-100 fs-5 fw-bold sortBtns" onclick="changeSort('배송')" <c:if test="${sort2 eq '배송'}">disabled</c:if>>배송</button>
						</div>
						<div class="col-3 mx-0 px-0">
							<button class="btn btn-secondary w-100 fs-5 fw-bold sortBtns" onclick="changeSort('취소')" <c:if test="${sort2 eq '취소'}">disabled</c:if>>취소</button>
						</div>
						<div class="col-3 mx-0 px-0">
							<button class="btn btn-secondary w-100 fs-5 fw-bold sortBtns" onclick="changeSort('회원')" <c:if test="${sort2 eq '회원'}">disabled</c:if>>회원</button>
						</div>
					</div>

					<div class="table-responsive">
						<table class="table table-hover maintab" style="text-align: center; min-width: 600px;">
							
							<colgroup>
								<col width="10%">
								<col width="60%">
								<col width="20%">
								<col width="20%">
							</colgroup>
							
							<thead>
								<tr>
									<th scope="col" class="fs-5">번호</th>
									<th scope="col" class="fs-5">제목</th>
									<th scope="col" class="fs-5">작성자</th>
									<th scope="col" class="fs-5">날짜</th>
								</tr>
							</thead>
							
							<tbody id="serviceTableBody">
							<c:if test="${not empty FAQList}">
							<c:forEach items="${FAQList}" var="FAQ">
								<tr class="fw-bold FAQ" data-bs-toggle="collapse" data-bs-target="#collapse${FAQ.serviceCenter_index}" aria-expanded="false">
									<th scope="row">-</th>
									<td>
										<span class="d-inline-block text-truncate">${FAQ.title}</span>
									</td>
									<td>관리자</td>
									<td>${fn:substring(FAQ.write_date, 0,10)}</td>
								</tr>
								<tr class="FAQ">
								  <td colspan="4" class="collapse collapse-horizontal p-5" id="collapse${FAQ.serviceCenter_index}">${FAQ.contents}</td>
								</tr>
							</c:forEach>
							</c:if>
							
							<c:if test="${not empty sList}">
							<c:set var="cnt" value="${paging.total - ( (paging.nowPage - 1) * paging.perPage )}" />
							<c:forEach items="${sList}" var="list" step="1">
								<tr class="OneByOne">
									<th scope="row">${cnt}</th>
									<td class="fw-bold">
									<c:if test="${member != null and (list.member_index == member.member_index or member.position eq '관리자')}"></c:if>
										<a href="serviceCenter_view.do?sort2=${sort2}&nowPage=${paging.nowPage}&serviceCenter_index=${list.serviceCenter_index}">
											<span class="d-inline-block text-truncate">${list.title}</span>
										</a>
									</td>
									<td>${list.name}</td>
									<td>${fn:substring(list.write_date, 0,10)}</td>
									<c:set var="cnt" value="${cnt - 1}"/>
								</tr>
							</c:forEach>
							</c:if>
							
							</tbody>
						</table>
					</div>

					<div class="row">
						<div class="col-9 row" id="paging">
	                        <!-- 페이징 -->
	                        <ul class="col-12 col-md-4 d-flex align-items-center justify-content-center pagination mt-2 my-md-0">
		                        <!-- <부분 -->
								<c:if test="${paging.startPage > 1}">
		                            <li class="page-item">
		                                <a class="page-link" href="serviceCenter.do?sort2=${sort2}&nowPage=${paging.startPage - 1}" aria-label="Previous">
		                                    <span aria-hidden="true">&lt;</span>
		                                </a>
		                            </li>
		                        </c:if>
		                        <c:if test="${paging.startPage <= 1}">
		                            <li class="page-item" style="visibility: hidden">
		                                <a class="page-link" href="#" aria-label="Previous">
		                                    <span aria-hidden="true"></span>
		                                </a>
		                            </li>
		                        </c:if>
		                        
		                        <!-- 각 페이지 -->
								<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i" step="1">
									<c:if test="${i != paging.nowPage}">
										<li class="page-item">
											<a class="page-link" href="serviceCenter.do?sort2=${sort2}&nowPage=${i}">${i}</a>
										</li>
									</c:if>
									<c:if test="${i == paging.nowPage}">
										<li class="page-item active" aria-current="page">
											<span class="page-link fw-bold">${i}</span>
										</li>
									</c:if>
								</c:forEach>
								
								<!-- >부분 -->
								<c:if test="${paging.endPage != paging.lastPage}">
		                            <li class="page-item">
		                                <a class="page-link" href="serviceCenter.do?sort2=${sort2}&nowPage=${paging.endPage + 1}" aria-label="Next">
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
						</div>
						<div class="col-3 d-flex justify-content-center">
							<c:if test="${member.position ne null and member.position eq '관리자'}"><input value="FAQ 등록" type="button" class="btn btn-primary"></c:if>
							<c:if test="${member.position ne null and member.position eq '일반'}"><input value="문의 하기" type="button" class="btn btn-secondary"></c:if>
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
	<script src="<%=request.getContextPath()%>/resources/js/serviceCenter.js"></script>
</body>
</html>