<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>탈퇴 리스트</title>
    <!-- css링크 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/base.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/adminPage.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/adminPage_leftMenu.css">
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

            <div class="col-2 col-sm-1 pe-0 d-lg-none" id="navLeftMenu">
				<%@include file="/WEB-INF/views/adminPage/nav_leftMenu.jsp"%>
            </div>

			<%@include file="/WEB-INF/views/base/nav.jsp"%>

        </div>
    </nav>

    <!-- 섹션 -->
    <section class="mt-1">
        <div class="row">

            <!-- 왼쪽 사이드메뉴 -->
            <div class="col-lg-2 d-none d-lg-block">
               <%@include file="/WEB-INF/views/adminPage/leftMenu.jsp"%>
            </div>

            <!-- 메인 -->
            <div class="col-12 col-sm-9 col-md-10 col-lg-8">
                <article id="mainSection">
    
                    <!-- 헤딩 -->
                    <div class="fs-5 my-2 fw-bold">
                        탈퇴 리스트
                    </div>

                    <!-- 테이블 -->
                    <div class="table-responsive">
                        <table class="table table-hover centerTable" style="min-width: 400px;">

                            <colgroup></colgroup>

                            <thead>
                                <tr>
                                    <th scope="col">아이디</th>
                                    <th scope="col">탈퇴 사유</th>
                                    <th scope="col">탈퇴일</th>
                                </tr>
                            </thead>
                            <tbody>
								<c:if test="${not empty memberList}">
								<c:forEach items="${memberList}" var="member">
	                                <tr>
	                                    <td>${member.id}</td>
	                                    <td><a href="dely_detail.do?nowPage=1&nowPage=1&member_index=${member.member_index}" class="link-primary">${member.del_reason}</a></td>
	                                    <td>${fn:substring(member.del_date, 0,10)}</td>
	                                </tr>
								</c:forEach>
                                </c:if>
								<c:if test="${empty memberList}">
									<tr>
										<td colspan="5" class="display-3 fw-bold p-3">
											탈퇴한 회원이 존재하지 않습니다.
										</td>
									</tr>
                                </c:if>
                            </tbody>
                        </table>
                    </div>
    
                    <!-- 페이징 -->
                    <div class="row mt-2">
                        <ul class="col-12 d-flex align-items-center justify-content-center pagination">
	                        <!-- <부분 -->
							<c:if test="${paging.startPage > 1}">
	                            <li class="page-item">
	                                <a class="page-link" href="member_list.do?nowPage=${paging.startPage - 1}" aria-label="Previous">
	                                    <span aria-hidden="true">&lt;</span>
	                                </a>
	                            </li>
	                        </c:if>
	                        <!-- 각 페이지 -->
							<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i" step="1">
								<c:if test="${i != paging.nowPage}">
									<li class="page-item">
										<a class="page-link" href="dely_list.do?nowPage=${i}">${i}</a>
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
	                                <a class="page-link" href="dely_list.do?nowPage=${paging.endPage + 1}" aria-label="Next">
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

                </article>
            </div>

            <!-- 오른쪽 사이드메뉴 -->
            <div class="col-sm-3 col-md-2 col-lg-2 d-none d-sm-block">
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
	<script src="<%=request.getContextPath()%>/resources/js/adminPage.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/adminPage_leftMenu.js"></script>
    <script type="text/javascript">
    window.onpageshow = function(event) {
        if ( event.persisted || (window.performance && window.performance.navigation.type == 2)) {
            location.reload();
        } 
    }
    </script>
</body>
</html>