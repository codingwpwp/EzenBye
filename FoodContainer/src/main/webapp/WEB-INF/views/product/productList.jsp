<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Food Container-상품리스트</title>
    <!-- css링크 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/base.css">
    <link href="<%=request.getContextPath()%>/resources/css/index.css" rel="stylesheet">
</head>
<body>
	<!-- 헤더 -->
	<header class="border-bottom border-dark">
		<%@include file="/WEB-INF/views/base/header.jsp"%>
	</header>

    <!-- 네비게이션 바 -->
    <nav class="navbar-expand-lg navbar-light bg-warning bg-gradient bg-opacity-25 fw-bold fs-5" id="navBar">
        <div class="row">
            <div class="col-lg-2 d-none d-lg-block"></div>
            <div class="col-1 pe-0 d-lg-none" id="navLeftMenu">
            	<div class="filter">
	           		<i class="bi bi-funnel" data-bs-toggle="offcanvas" href="#offcanvasExample"></i>
	           		<%@include file="lAside.jsp"%>
	       		</div>
            </div>
			<%@include file="/WEB-INF/views/base/nav.jsp"%>
        </div>
    </nav>

    <!-- 섹션 -->
    <section class="mt-1">
        <div class="row">

            <!-- 왼쪽 사이드메뉴 -->
            <div class="col-lg-2 d-none d-lg-block" id="leftDiv">
                <aside id="leftAside">
                    <%@include file="lAside.jsp"%>
                   
                </aside>
            </div>

            <!-- 메인 -->
            <div class="col-12 col-sm-9 col-md-10 col-lg-8">
                <article id="mainSection">
               
               	<article>
					<p class="fs-3 topText">전체상품</p>
					<hr>
					<!-- 전체상품 -->
					<div class="container"> 
						<div class="row">
							<%for(int i=0; i<=15; i++){ %>
							<div class="col-12 col-sm-12 col-md-6 col-lg-4 col-xl-3 productAll d-flex justify-content-center">
								<div class="card" style="width: 18rem;">
								  <img src="<%=request.getContextPath()%>/resources/img/CJ/치킨,만두/2.jpg" class="card-img-top" alt="비비고만두" onclick="location.href='productView.do'">
								  <img src="<%=request.getContextPath()%>/resources/img/빈하트.png" class="img-fluid hoverHeart" alt="찜" onclick="heart(this)">
								  <img src="<%=request.getContextPath()%>/resources/img/카트2.png" class="img-fluid hoverCart" alt="장바구니" onclick="cart(this)">
									  
								  <div class="card-body" onclick="location.href='productView.do'">
								    <p class="card-text">
							    		<span style="color:red;"></span><br>
									   	<span class="productName">비비고왕교자</span><br>
									   	<span class="fs-4">10,000</span>원<br>
									   	<span>
									   		<i class="bi bi-star-fill"></i>
							        		<i class="bi bi-star-fill"></i>
							        		<i class="bi bi-star-fill"></i>
							        		<i class="bi bi-star-fill"></i>
							        		<i class="bi bi-star"></i>
								    	</span>
								    	<br>
								    	배송비 3,000원
								    </p>
								  </div>
								</div>
							</div>
							<%} %>
						</div>
					</div>
				</article>
					
              	</article>
                
           	</div>


            <!-- 오른쪽 사이드메뉴 -->
            <div class="ccol-sm-3 col-md-2 col-lg-2 d-none d-sm-block">
                <!-- 실질적인 오른쪽 사이드메뉴 내용 -->
                <%@include file="/WEB-INF/views/base/rightAside.jsp"%>
            </div>

        </div>

    </section>
    
    <!-- 장바구니 클릭 -->
    <div class="cartBack">
	    <div class="message"></div>
    </div>
    
    <!-- 모바일 top -->
    <div class="topM" onclick="moveTop();">
        ↑Top
    </div>
    
    <!-- 푸터 -->
    <footer class="py-3 my-4">
        <%@include file="/WEB-INF/views/base/footer.jsp"%>
    </footer>

    <!-- 자바스크립트 -->
    <script src="https://kit.fontawesome.com/b30bc4e0a9.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/base.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/index.js"></script>
</body>
</html>