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
    <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/base.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/recipemain.css">
    
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
            <div class="col-1 pe-0 d-lg-none border border-dark" id="navLeftMenu"><!-- 여기에 작성 --></div>

			<%@include file="/WEB-INF/views/base/nav.jsp"%>

        </div>
    </nav>

    <!-- 섹션 -->
    <section class="mt-1">
        <div class="row">

            <!-- 왼쪽 사이드메뉴 -->
            <div class="col-lg-2 d-none d-lg-block">
                <aside>
                  
                </aside> 
            </div>
            <!-- 메인 -->
            <div class="col-12 col-sm-9 col-md-10 col-lg-8">
                <article id="mainSection">
                    <!-- 실질적인 메인 내용 -->
                    <div class="fs-5 my-2 fw-bold">유저레시피</div>
                    <div style="border-bottom:1px solid black"> <strong>총<c:out value="${pu.total}"/>개의 레시피가 있습니다</strong></div>
                    <c:if test="${member==null}">
                    <button class="btnwr" onclick="alert('로그인 후 이용해주세요!!')"><span>레시피 작성</span></button>
                  	</c:if>
                  	 <c:if test="${member!=null}">
                    <button class="btnwr" onclick="location.href='recipewrite.do'"><span>레시피 작성</span></button>
                  	</c:if>
                   
                    <div class="container">
                       
                            <div class="row row-cols-1 row-cols-lg-3 row-cols-md-2 row-cols-sm-1 row-cols-xs-1 g-4 menu">
                            <c:forEach items="${recipeList}" var="list">	
                            <input type="hidden" value="${list.recipe_index}">
							<div class="col">
								<div class="card h-100">
								<c:if test="${list.best_rank==1}">
									<img src="<%=request.getContextPath()%>/resources/img/금메달.png" id="bestimg">
								</c:if>
								<c:if test="${list.best_rank==2}">
									<img src="<%=request.getContextPath()%>/resources/img/은메달.png" id="bestimg">
								</c:if>
								<c:if test="${list.best_rank==3}">
									<img src="<%=request.getContextPath()%>/resources/img/동메달.png" id="bestimg">
								</c:if>
									<img
										src="<%=request.getContextPath()%>/resources/img/recipe/${list.thumbnail_image}"
										class="card-img-top" alt="${list.thumbnail_image}" onclick="location.href='<%=request.getContextPath()%>/recipeview.do?recipe_index=${list.recipe_index}'">
									<div class="card-body">
										<h6 class="card-title">
										
											<div class="row">
												<div class="col-12 text-truncate fw-bold"><a href="<%=request.getContextPath()%>/recipeview.do?recipe_index=${list.recipe_index}"><c:out value="${list.title}"/></a></div>
											</div>
										</h6>
										<div class="row recipe-text">
											<%-- <div class="col">추천수(<c:out value="${list.thumb}"/>)</div> --%>
											<div class="col">조회수(<c:out value="${list.hit}"/>)</div>
											<div class="col">댓글(<c:out value="${list.reply_index}"/>)</div>
										</div>
									</div>
								</div>
							</div>
							</c:forEach>
                            </div>
                        
                    </div>
                    <div class="container">
                        <div class="row">

						<div class="col-12 seldiv">
						<!-- 	<form action="recipemain.do" class="selbox" method="get">
								<select class="form-select" name="searchType">
									<option>검색</option>
									<option value="title">제목</option>
									<option >작성자</option>
								</select> 
								<input type="text" class="form-control seltext" name="searchValue"> 
								<input type="submit" value="검색" class="btn btn-primary selbtn">
								<input type="hidden" name="nowPage" value="1">
								
								
							</form> -->
						</div>

						</div>
                        <div class="row">
                            <div class="col-md-12 col-12 page">
                                <ul class="pagination">
                                	
                                
                                    <li class="page-item">
                                    <c:if test="${nowPage > 1 }">
                                    <a class="page-link"  href="recipemain.do?nowPage=${nowPage-1}"><</a>
                                    </c:if>
                                    <c:if test="${nowPage <= 1 }">
                                    <a class="page-link"  href="recipemain.do?nowPage=1"><</a>
                                    </c:if>
                                    </li>
                                    
                                  <c:forEach  begin="${pu.startPage}" end="${pu.endPage}" varStatus="num">
                                    <li class="page-item"><a class="page-link" href="recipemain.do?nowPage=${num.count}">${num.count}</a></li>
                                    </c:forEach>
                                    
                                    <li class="page-item">
                                    <c:if test="${nowPage >= 1 }">
                                    <a class="page-link" href="recipemain.do?nowPage=${nowPage+1}">></a>
                                 	</c:if>
                                 	<c:if test="${nowPage = endPage }">
                                    <a class="page-link" href="recipemain.do?nowPage=${endPage}">></a>
                                 	</c:if>
                                    </li>
                                  </ul>
                            </div>
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
    <script src="<%=request.getContextPath()%>/resources/js/recipe.js"></script>
</body>
</html>