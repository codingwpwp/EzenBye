<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Food Container-상품상세</title>
    <!-- css링크 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/base.css">
    <link href="<%=request.getContextPath()%>/resources/css/index.css" rel="stylesheet">
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
                   
                </aside>
            </div>

            <!-- 메인 -->
            <div class="col-8">
                <article id="mainSection">
                
                	<!-- view 상단 -->
                	<div class="col-12">
				      <div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
				        <div class="col-auto d-flex d-lg-block">
				        	<img src="<%=request.getContextPath()%>/resources/img/CJ/컵밥,햇반/2.jpg" alt="d" class="img-fluid viewImg">
				        	<div><span class="viewStar">평점 : 
				        		<span class="fs-4">
				        			<i class="bi bi-star-fill"></i>
				        			<i class="bi bi-star-fill"></i>
				        			<i class="bi bi-star-fill"></i>
				        			<i class="bi bi-star-fill"></i>
				        			<i class="bi bi-star"></i>
				        		</span>
				        	</span></div>
				        </div>
				        <div class="col p-4 d-flex flex-column position-static">
				          <strong class="d-inline-block mb-2 text-danger">[인기]</strong>
				          <p class="mb-0">[CJ] 햇반/컵반 버터장조림 비빔밥</p>
				          <hr>
				          <h3 class="viewPrice">10,000<small>원</small></h3>
				          <div class="text-muted">포인트 적립 1%</div>
				          <hr>
				          <p class="card-text mdName">[CJ] 햇반/컵반 버터장조림 비빔밥 <span class="mdPrice">10,000원</span></p>
				          <p class="card-text mb-auto productNum fs-4"><i class="bi bi-dash-square-fill" onclick="minusFn(this)"></i> 1 <i class="bi bi-plus-square-fill" onclick="plusFn(this)"></i></p>
				          <div><span class="fs-5 totalPrice">합계 : <span class="fs-3">10,000원</span></span></div>
				          <div class="d-flex justify-content-evenly">
					          <button class="viewButton btn btn-outline-success me-2">장바구니 담기</button>
					          <button class="viewButton btn btn-success me-2">바로구매</button>
				          </div>
				        </div>
				      </div>
				    </div>
				    <!-- subMenu -->
				    <div class="btn-group subMenuGroup d-flex justify-content-center" role="group" aria-label="Basic radio toggle button group">
					  <input type="radio" class="btn-check" name="btnradio" id="btnradio1" autocomplete="off" onclick="location.href='#pView'">
					  <label class="btn btn-outline-secondary subMenuButton" for="btnradio1">상세 정보</label>
					
					  <input type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off" onclick="location.href='#pDelivery'">
					  <label class="btn btn-outline-secondary subMenuButton" for="btnradio2">배송 정보</label>
					
					  <input type="radio" class="btn-check" name="btnradio" id="btnradio3" autocomplete="off" onclick="location.href='#pCancel'">
					  <label class="btn btn-outline-secondary subMenuButton" for="btnradio3">취소 규정</label>
					  
					  <input type="radio" class="btn-check" name="btnradio" id="btnradio4" autocomplete="off">
					  <label class="btn btn-outline-secondary subMenuButton" for="btnradio4">리뷰</label>
					</div>
					
					<!-- 상세페이지 -->
					<div class="d-flex justify-content-center" id="pView">
						<img src="<%=request.getContextPath()%>/resources/img/CJ/볶음밥/1_1.jpg" alt="상세페이지" class="img-fluid">
					</div>
					
					<!-- 배송정보 -->
					<div class="d-flex justify-content-center" id="pDelivery">
						<img src="<%=request.getContextPath()%>/resources/img/배송.png" alt="배송안내" class="img-fluid">
					</div>
					
					<!-- 취소 규정 -->
					<div class="d-flex justify-content-center" id="pCancel">
						<img src="<%=request.getContextPath()%>/resources/img/취소.png" alt="취소규정" class="img-fluid">
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
    
    <!-- 장바구니 클릭 -->
    <div class="cartBack">
	    <div class="message"></div>
    </div>

    <!-- 푸터 -->
    <footer class="py-3 my-4">
        <%@include file="/WEB-INF/views/base/footer.jsp"%>
    </footer>

    <!-- 자바스크립트 -->
    <script src="https://kit.fontawesome.com/b30bc4e0a9.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/base.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/index.js"></script>
</body>
</html>