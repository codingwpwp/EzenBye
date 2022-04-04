<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
            <div class="col-2 col-sm-1 pe-0 d-lg-none" id="navLeftMenu">
            	<div class="filter">
	           		<i class="bi bi-funnel" data-bs-toggle="offcanvas" href="#offcanvasExample" onclick="filter()"></i>
	           		<%@include file="lAsideM.jsp"%>
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
               	<!-- pc버전 -->
               	<article class="pList">
					<div class="fs-5 my-2 fw-bold topText">전체상품</div>
					<hr>
					<!-- 전체상품 -->
					<div class="container"> 
						<div class="row">
							<c:forEach items="${productListAll}" var="ProductVO">
							<div class="col-12 col-sm-12 col-md-6 col-lg-4 col-xl-3 productAll d-flex justify-content-center">
								<div class="card" style="width: 18rem;" onclick="location.href='productView.do'; productCookie(this);">
								  <img src="<%=request.getContextPath()%>/resources/img/${ProductVO.brand}/${ProductVO.middleSort}/${ProductVO.thumbnail_image}" class="card-img-top" alt="${ProductVO.product_name }">
								  <div class="card-body">
								    <p class="card-text">
							    		<span style="color:red;"></span><br>
									   	<span class="productName">${ProductVO.product_name}</span><br>
									   	<span class="fs-4">
											<fmt:formatNumber value="${ProductVO.origin_price}" pattern="#,###"/>
										</span>원<br>
									   	<c:if test="${ProductVO.sale_price != ''}">
									   	<span class="discount">
									   		<fmt:formatNumber value="${ProductVO.sale_price}" pattern="#,###"/>
									   	</span>
									   	</c:if>
									   	<span class="productListStar">
									   		<i class="bi bi-star-fill"></i>
							        		<i class="bi bi-star-fill"></i>
							        		<i class="bi bi-star-fill"></i>
							        		<i class="bi bi-star-fill"></i>
							        		<i class="bi bi-star"></i>
								    	</span>
								    	<br>
								    	<c:set var="delivery" value="${ProductVO.delivery_free_YN}" />
								    	<c:choose>
								    		<c:when test="${delivery == 'n'}">
								    			배송비 3,000원
								    		</c:when>
								    		
								    		<c:when test="${delivery == 'y'}">
								    			무료배송
								    		</c:when>
								    	</c:choose>
								    </p>
								  </div>
								</div>
								<input type="hidden" name="index" value="${ProductVO.product_index}">
								<div class="indexSubImg">
									<img src="<%=request.getContextPath()%>/resources/img/빈하트.png" class="img-fluid hoverHeart" alt="찜" onclick="heart(this)">
									<img src="<%=request.getContextPath()%>/resources/img/카트2.png" class="img-fluid hoverCart" alt="장바구니" onclick="cart(this)">
								</div>
							</div>
							</c:forEach>
						</div>
					</div>
				</article>
				
				
				<!-- 모바일 버전 -->	
				<article class="pListM">
					<div class="fs-5 my-2 fw-bold topText">전체상품</div>
					<hr>
					<div class="productListCardM">
						<c:forEach items="${productListAll}" var="ProductVO">
						<div class="productListMDiv">
							<div class="productListMImg">
								<img src="<%=request.getContextPath()%>/resources/img/${ProductVO.brand}/${ProductVO.middleSort}/${ProductVO.thumbnail_image}" class="img-fluid" alt="${ProductVO.product_name}" onclick="location.href='productView.do'">
								<div class="productListStarM">
									<i class="bi bi-star-fill"></i>
							        <i class="bi bi-star-fill"></i>
							        <i class="bi bi-star-fill"></i>
							      	<i class="bi bi-star-fill"></i>
							       	<i class="bi bi-star"></i>
								</div>
							</div>
							<div class="productListContent">
								<span style="color:red;"></span>
								<div class="productNameM" onclick="location.href='productView.do'">${ProductVO.product_name}</div>
								<div>
									<fmt:formatNumber value="${ProductVO.origin_price}" pattern="#,###"/>원
								</div>
								<c:if test="${ProductVO.sale_price != ''}">
								<div class="discountM">
									<fmt:formatNumber value="${ProductVO.sale_price}" pattern="#,###"/>
								</div>
								</c:if>
								<c:set var="delivery" value="${ProductVO.delivery_free_YN}" />
								    	<c:choose>
								    		<c:when test="${delivery == 'n'}">
								    			<div>배송비 3,000원</div>
								    		</c:when>
								    		
								    		<c:when test="${delivery == 'y'}">
								    			<div>무료배송</div>
								    		</c:when>
								    	</c:choose>
							</div>
							<div class="pListSubImgM">
								<img src="<%=request.getContextPath()%>/resources/img/빈하트.png" class="img-fluid hoverHeart" alt="찜" onclick="heart(this)">
								<img src="<%=request.getContextPath()%>/resources/img/카트2.png" class="img-fluid hoverCart" alt="장바구니" onclick="pListCart(this)">
							</div>
						</div>
						</c:forEach>
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
    
    <!-- 모바일 가격 메세지 -->
    <div class="priceAlertM">
	    <div class="priceAlertMessageM"></div>
    </div>
    
    <!-- 모바일 top -->
    <div class="topM" onclick="moveTop();">
        ↑Top
    </div>
    
    <!-- 모바일 최근본 상품 -->
    <div class="rightAsideM">
    	<%@ include file = "/WEB-INF/views/base/rightAsideM.jsp" %>
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
    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/productLAside.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/productList.js"></script>
</body>
</html>