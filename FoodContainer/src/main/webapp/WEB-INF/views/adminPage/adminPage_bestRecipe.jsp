<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>베스트 레시피</title>
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
                        베스트 레시피
                    </div>

                    <!-- 메인컨텐츠 -->
                    <div>

                        <div class="form-check my-2">
                        <c:if test="${not empty bestRecipeList}">
                            <input class="form-check-input border border-dark" type="checkbox" id="totalCheckbox" onchange="selectAllRecipeCheckbox(this)">
                            <label class="form-check-label me-3 text-dark fw-bold" for="totalCheckbox">
                                전체
                            </label>
                            <button type="button" class="btn btn-dark btn-sm p-1 fw-bold" onclick="cancelSelectedRecipe()">선택 해제</button>
                        </c:if>
                        </div>

                        <!-- 베스트 레시피 테이블 -->
                        <form class="table-responsive" name="frm" method="post" action="bestRecipe.do">
                            <table class="table table-hover centerTable verticalAlignTable" style="white-space: nowrap;" id="recipeTable">

                                <colgroup></colgroup>

                                <thead>
                                    <tr>
                                        <th scope="col"></th>
                                        <th scope="col">순위</th>
                                        <th scope="col">조회수 | 댓글수</th>
                                        <th scope="col">레시피 제목</th>
                                        <th scope="col">작성일</th>
                                        <th scope="col">관리</th>
                                    </tr>
                                </thead>
                                
                                <tbody>
									<c:if test="${not empty bestRecipeList}">
									<c:forEach items="${bestRecipeList}" var="list">
	                                    <tr>
	                                        <th>
	                                            <input class="form-check-input border border-dark recipeCheckbox" type="checkbox" name="recipe_index" value="${list.recipe_index}" onchange="recipeCheckbox()">
	                                        </th>
	                                        <td class="w-25">
	                                            <img src="<%=request.getContextPath()%>/resources/img/<c:if test="${list.best_rank == 1}">금메달.png</c:if><c:if test="${list.best_rank == 2}">은메달.png</c:if><c:if test="${list.best_rank == 3}">동메달.png</c:if>" class="img-fluid medal">
	                                        </td>
	                                        <th>${list.hit} | ${list.reply_index}</th>
	                                        <td>
	                                        	<a href="<%=request.getContextPath()%>/recipeview.do?recipe_index=${list.recipe_index}" class="link-primary" target="blank">
	                                        		<span class="d-inline-block text-truncate">${list.title}</span>
	                                        	</a>
	                                        </td>
	                                        <td>${fn:substring(list.write_date, 0,10)}</td>
	                                        <td>
	                                            <button class="btn btn-dark py-0" onclick="cancelRecipe(this)">해제</button>
	                                        </td>
	                                    </tr>
									</c:forEach>
									</c:if>
									
									<c:if test="${empty bestRecipeList}">
										<td colspan="6" class="display-3 fw-bold p-3">
											베스트 레시피가 없습니다.
										</td>
									</c:if>
                                </tbody>
                                
                            </table>
                        </form>

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