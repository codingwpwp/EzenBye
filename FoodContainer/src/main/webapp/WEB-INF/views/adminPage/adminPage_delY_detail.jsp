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
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/adminPage.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/adminPage_leftAside.css">
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
                    <%@include file="/WEB-INF/views/adminPage/leftAside.jsp"%>
                </aside>
            </div>

            <!-- 메인 -->
            <div class="col-8">
                <article id="mainSection">
                
                    <!-- 헤딩 -->
					<%@include file="/WEB-INF/views/adminPage/headingMenu.jsp"%>
					
					<!-- 회원정보 -->
                    <div class="container" id="memberInfo">

                    	<h3 class="fw-bold">회원 정보</h3>
                        <div class="row" id="rows">

                            <div class="col-4 col-md-2 mb-2">
                                <span id="memberCol1">아이디</span>
                            </div>

                            <div class="col-8 col-md-4 mb-2">
                                <input type="text" class="form-control bg-warning bg-gradient bg-opacity-25" value="tester1" disabled>
                            </div>
                            
                            <div class="col-4 col-md-2 mb-2">
                                <span id="memberCol1">탈퇴일</span>
                            </div>
                            
                            <div class="col-8 col-md-4 mb-2">
                                <input type="text" class="form-control bg-warning bg-gradient bg-opacity-25" value="2022-01-01" disabled>
                            </div>

                        </div>


                        <div class="row" id="rows">

                            <div class="col-4 col-md-2">
                                <span id="memberCol1"><span class="d-none d-sm-inline">탈퇴 </span>사유</span>
                            </div>

                            <div class="col-8 col-md-10">
                                <textarea class="form-control bg-warning bg-gradient bg-opacity-25" id="exampleFormControlTextarea1" rows="4" disabled>가나다라마바사아자차</textarea>
                            </div>

                        </div>
                    </div>
                    
                    <div>
                        <button type="button" class="btn btn-outline-primary btn-sm">뒤로가기</button>
                    </div>
                    
                </article>
            </div>

            <!-- 오른쪽 사이드메뉴 -->
            <div class="col-2 d-none d-sm-block">
                <!-- 실질적인 오른쪽 사이드메뉴 내용 -->
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
	<script src="<%=request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/adminPage.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/adminPage_leftAside.js"></script>
</body>
</html>