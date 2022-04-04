<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>배송지 관리</title>
    <!-- css링크 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/base.css">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/mypage.css" />
	<script src="<%=request.getContextPath() %>/resources/js/jquery-3.6.0.min.js"></script>
	<script src="<%=request.getContextPath() %>/resources/js/mypage.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
	<style>
	.nav9 {
		color: orange;
	}
	</style>
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
            	<%@include file = "mypagenav2.jsp" %>
            </div>

			<%@include file="/WEB-INF/views/base/nav.jsp"%>

        </div>
    </nav>

    <!-- 섹션 -->
    <section class="mt-1">
        <div class="row">

            <!-- 왼쪽 사이드메뉴 -->
            <div class="col-lg-2 d-none d-lg-block">
                <aside id="leftAside">
                    <!-- 실질적인 왼쪽 사이드메뉴 내용 -->
                    <%@include file = "mypagenav.jsp" %>
                </aside>
            </div>

            <!-- 메인 -->
            <div class="col-12 col-sm-9 col-md-10 col-lg-8">
                <article id="mainSection \">
                    <!-- 실질적인 메인 내용 -->
                    <div class="col-md-11">
				 
			        <p class="fs-6 lookup-fs-6">배송지 관리</p>
			        <hr />
			        
			        <p class="fs-6 lookup-fs-6">기본 배송지</p>
			        <div class="input-group mb-3 addressManage-1">
					  <span class="input-group-text fw-bold" id="inputGroup-sizing-default">우편번호</span>
					  <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" disabled>
					</div>
			        <div class="input-group mb-3 addressManage-2">
					  <span class="input-group-text fw-bold" id="inputGroup-sizing-default">주소</span>
					  <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" disabled>
					</div>
					<div class="input-group addressManage-3">
					  <span class="input-group-text fw-bold">상세주소</span>
					  <input type="text" aria-label="Last name" class="form-control" disabled>
					  <input type="hidden" aria-label="Last name" class="form-control" disabled>
					</div>
					
					<form action="">
						<p class="fs-6 lookup-fs-6">기본 배송지 변경</p>
				        <div class="input-group mb-3 addressManage-4">
						  <span class="input-group-text fw-bold" id="inputGroup-sizing-default">우편번호</span>
						  <input type="text" id="sample6_postcode" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
						  <button type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="btn btn-secondary btn-sm fw-bold">주소검색</button>
						</div>
				        <div class="input-group mb-3 addressManage-5">
						  <span class="input-group-text fw-bold" id="inputGroup-sizing-default">주소</span>
						  <input type="text" id="sample6_address" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
						</div>
						<div class="input-group addressManage-6">
						  <span class="input-group-text fw-bold">상세주소</span>
						  <input type="text" id="sample6_detailAddress" aria-label="Last name" class="form-control">
						  <input type="hidden" id="sample6_extraAddress" aria-label="Last name" class="form-control">
						</div>
						<div class="d-grid addressManage-btn col-5 mx-auto">
						  <button class="btn btn-dark" type="button">기본 배송지 변경</button>
						</div>
					</form>
					
      			</div>
                </article>
            </div>

            <!-- 오른쪽 사이드메뉴 -->
            <div class="col-sm-3 col-md-2 col-lg-2 d-none d-sm-block">
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