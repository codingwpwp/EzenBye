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
    <nav class="navbar-expand-lg navbar-light bg-light fw-bold">
        <%@include file="/WEB-INF/views/base/nav.jsp"%>
    </nav>

    <!-- 섹션 -->
    <section class="mt-3">
        <div class="row">

            <!-- 왼쪽 사이드메뉴 -->
            <div class="col-2 pe-0" id="leftDiv">
                <aside id="leftAside">
                    <!-- 실질적인 왼쪽 사이드메뉴 내용 -->
                    왼쪽왼쪽왼쪽왼쪽왼쪽왼쪽왼쪽왼쪽왼쪽왼쪽왼쪽왼쪽
                </aside>
            </div>

            <!-- 메인 -->
            <div class="col-8">
                <article id="mainSection">
                    <!-- 실질적인 메인 내용 -->
                     <div class="maintitle"><h1>유저레시피</h1></div>
                    <div style="border-bottom:1px solid black"> <strong>총123,456개의 레시피가 있습니다</strong></div>
                    <button class="btnwr"><a href="recipewrite.do"><span>레시피 작성</span></a></button>
                    <select class="select1" name="searchType">
                        <option>정렬</option>
                        <option value="">추천순</option>
                        <option value="">최신순</option>
                    </select>
                    <div class="container">
                        <div class="row">
                            <div class="row row-cols-1 row-cols-lg-3 row-cols-md-2 row-cols-sm-1 row-cols-xs-1 g-4 menu">
                                <div class="card shadow-sm">
                                    <img src="<%=request.getContextPath()%>/resources/img/CJ/국/1.jpg" width="100%" height="190">
                                    <div class="card-body">
                                        <p class="card-text">중식 특유의 그 맛이 땡기는 날! 멀리 배달 기다릴 필요도 없음</p>
                                        <div class="d-flex justify-content-between align-items-center">
                                          <div class="card-body">
                                            <p class="card-text">작성자:관리자</p>
                                            <p class="card-text">추천수:20 | 조회수:67 | 댓글(3)</p>
                                          </div>
                                        </div>
                                      </div>
                                </div>
                           
                                <div class="card shadow-sm">
                                    <img src="<%=request.getContextPath()%>/resources/img/CJ/국/1.jpg" width="100%" height="190">
                                    <div class="card-body">
                                        <p class="card-text">중식 특유의 그 맛이 땡기는 날! 멀리 배달 기다릴 필요도 없음</p>
                                        <div class="d-flex justify-content-between align-items-center">
                                          <div class="card-body">
                                            <p class="card-text">작성자:관리자</p>
                                            <p class="card-text">추천수:20 | 조회수:67 | 댓글(3)</p>
                                          </div>
                                        </div>
                                      </div>
                                </div>
                            
                                <div class="card shadow-sm">
                                    <img src="<%=request.getContextPath()%>/resources/img/CJ/국/1.jpg" width="100%" height="190">
                                    <div class="card-body">
                                        <p class="card-text">중식 특유의 그 맛이 땡기는 날! 멀리 배달 기다릴 필요도 없음</p>
                                        <div class="d-flex justify-content-between align-items-center">
                                          <div class="card-body">
                                            <p class="card-text">작성자:관리자</p>
                                            <p class="card-text">추천수:20 | 조회수:67 | 댓글(3)</p>
                                          </div>
                                        </div>
                                      </div>
                                </div>
                           
                        
                       
                                <div class="card shadow-sm">
                                    <img src="<%=request.getContextPath()%>/resources/img/CJ/국/1.jpg" width="100%" height="190">
                                    <div class="card-body">
                                        <p class="card-text">중식 특유의 그 맛이 땡기는 날! 멀리 배달 기다릴 필요도 없음</p>
                                        <div class="d-flex justify-content-between align-items-center">
                                          <div class="card-body">
                                            <p class="card-text">작성자:관리자</p>
                                            <p class="card-text">추천수:20 | 조회수:67 | 댓글(3)</p>
                                          </div>
                                        </div>
                                      </div>
                                </div>
                           
                                <div class="card shadow-sm">
                                    <img src="<%=request.getContextPath()%>/resources/img/CJ/국/1.jpg" width="100%" height="190">
                                    <div class="card-body">
                                        <p class="card-text">중식 특유의 그 맛이 땡기는 날! 멀리 배달 기다릴 필요도 없음</p>
                                        <div class="d-flex justify-content-between align-items-center">
                                          <div class="card-body">
                                            <p class="card-text">작성자:관리자</p>
                                            <p class="card-text">추천수:20 | 조회수:67 | 댓글(3)</p>
                                          </div>
                                        </div>
                                      </div>
                                </div>
                          
                                <div class="card shadow-sm">
                                    <img src="<%=request.getContextPath()%>/resources/img/CJ/국/1.jpg" width="100%" height="190">
                                    <div class="card-body">
                                        <p class="card-text">중식 특유의 그 맛이 땡기는 날! 멀리 배달 기다릴 필요도 없음</p>
                                        <div class="d-flex justify-content-between align-items-center">
                                          <div class="card-body">
                                            <p class="card-text">작성자:관리자</p>
                                            <p class="card-text">추천수:20 | 조회수:67 | 댓글(3)</p>
                                          </div>
                                        </div>
                                      </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="container">
                        <div class="row">
                            
                     
                            <form action="#" class="selbox">    
                                <div class="row row-cols-3 row-cols-lg-12 row-cols-md-12 row-cols-sm-12 g-12"">         
                                <select class="select2">               
                                    <option>검색</option>
                                    <option>상품이름</option>
                                    <option>작성자</option>
                                </select>
                                <input type="text" size="40px" >
                                <input type="button" value="검색" class="btn btn-primary">
                            </div>
                            </form>
                           
                        </div>
                    </div>
                </article>
            </div>

            <!-- 오른쪽 사이드메뉴 -->
            <div class="col-2 d-none d-sm-block">
                <!-- 실질적인 오른쪽 사이드메뉴 내용 -->
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
    <script src="<%=request.getContextPath()%>/resources/js/base.js"></script>
</body>
</html>