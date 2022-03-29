<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관심상품</title>
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
	
	<style>
	.nav3 {
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
				 
			        <p class="fs-6 lookup-fs-6">관심상품</p>
			        <p class="fs-6 lookup-fs-6">3개의 상품이 있습니다.</p>
			        <hr />
			        
			        <div class="h-100 p-2 bg-light border rounded-3 card-good">
			        	<div class="row">
			        		<div class="col-sm-3">
			        			<img src="<%=request.getContextPath() %>/resources/img/mypage/good.jpg" class="img-thumbnail" alt="...">
			        		</div>
			        		<div class="col-sm-6 d-flex align-items-start flex-column mb-3">
						    	<div class="mb-auto p-2">비비고 진한고기만두400g*2번들</div>
  								<div class="p-2">4580원 | 5개</div>
			        		</div>
			        		<div class="col-sm-3 interItem-icon">
						    	<i class="bi bi-trash" style="font-size: 3rem;"></i>
			        		</div>
			        	</div>
			        	
			        	<div class="d-grid gap-4 d-md-flex justify-content-md-center">
						  <button class="btn btn-dark interItem-btn" type="button">장바구니 담기</button>
						  <button class="btn btn-secondary interItem-btn" type="button">바로구매</button>
						</div>
			        </div>
			        
			        <div class="h-100 p-2 bg-light border rounded-3 card-good">
			        	<div class="row">
			        		<div class="col-sm-3">
			        			<img src="<%=request.getContextPath() %>/resources/img/mypage/good.jpg" class="img-thumbnail" alt="...">
			        		</div>
			        		<div class="col-sm-6 d-flex align-items-start flex-column mb-3">
						    	<div class="mb-auto p-2">비비고 진한고기만두400g*2번들</div>
  								<div class="p-2">4580원 | 5개</div>
			        		</div>
			        		<div class="col-sm-3 interItem-icon">
						    	<i class="bi bi-trash" style="font-size: 3rem;"></i>
			        		</div>
			        	</div>
			        	
			        	<div class="d-grid gap-4 d-md-flex justify-content-md-center">
						  <button class="btn btn-dark interItem-btn" type="button">장바구니 담기</button>
						  <button class="btn btn-secondary interItem-btn" type="button">바로구매</button>
						</div>
			        </div>
			        
			        <div class="h-100 p-2 bg-light border rounded-3 card-good">
			        	<div class="row">
			        		<div class="col-sm-3">
			        			<img src="<%=request.getContextPath() %>/resources/img/mypage/good.jpg" class="img-thumbnail" alt="...">
			        		</div>
			        		<div class="col-sm-6 d-flex align-items-start flex-column mb-3">
						    	<div class="mb-auto p-2">비비고 진한고기만두400g*2번들</div>
  								<div class="p-2">4580원 | 5개</div>
			        		</div>
			        		<div class="col-sm-3 interItem-icon">
						    	<i class="bi bi-trash" style="font-size: 3rem;"></i>
			        		</div>
			        	</div>
			        	
			        	<div class="d-grid gap-4 d-md-flex justify-content-md-center">
						  <button class="btn btn-dark interItem-btn" type="button">장바구니 담기</button>
						  <button class="btn btn-secondary interItem-btn" type="button">바로구매</button>
						</div>
			        </div>
			        
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