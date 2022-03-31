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
    <link href="<%=request.getContextPath()%>/resources/css/index.css" rel="stylesheet">
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
            <div class="col-2 col-sm-1 pe-0 d-lg-none" id="navLeftMenu"></div>
			<%@include file="/WEB-INF/views/base/nav.jsp"%>
        </div>
    </nav>

    <!-- 섹션 -->
    <section class="mt-1">
        <div class="row">

            <!-- 왼쪽 사이드메뉴 -->
            <div class="col-lg-2 d-none d-lg-block" id="leftDiv">
                <aside id="leftAside">
                    <!-- 실질적인 왼쪽 사이드메뉴 내용 -->
                   
                </aside>
            </div>

            <!-- 메인 -->
            <div class="col-12 col-sm-9 col-md-10 col-lg-8">
                <article id="mainSection">
                   <!-- 배너 -->
                    <article>
						<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
						  <div class="carousel-indicators">
						    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
						    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
						    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
						  </div>
						  <div class="carousel-inner">
						    <div class="carousel-item active">
						      <img src="<%=request.getContextPath()%>/resources/img/배너1.png" class="card-img-top" class="d-block w-100" alt="배너1">
						    </div>
						    <div class="carousel-item">
						      <img src="<%=request.getContextPath()%>/resources/img/배너2.png" class="d-block w-100" alt="하림 삼각밥">
						    </div>
						    <div class="carousel-item">
						      <img src="<%=request.getContextPath()%>/resources/img/배너3.png" class="d-block w-100" alt="오뚜기 고추참치">
						    </div>
						  </div>
						  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
						    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
						    <span class="visually-hidden">Previous</span>
						  </button>
						  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
						    <span class="carousel-control-next-icon" aria-hidden="true"></span>
						    <span class="visually-hidden">Next</span>
						  </button>
						</div>
					</article>
					<br>
					
				<!-- pc화면 -->
					<!-- 인기메뉴 -->
					<article class="bestMenu">
						<p class="fs-5 my-2 fw-bold">인기메뉴</p>
						<hr>
							<div class="row">
								<%for(int i=0; i<=3; i++){ %>
								<div class="col-12 col-sm-12 col-md-6 col-lg-4 col-xl-3 popular d-flex justify-content-center">
									<div class="card" style="width: 18rem;">
									  <img src="<%=request.getContextPath()%>/resources/img/CJ/치킨,만두/1.png" class="card-img-top" alt="비비고만두">
									  <div class="indexSubImg">
									  	<img src="<%=request.getContextPath()%>/resources/img/빈하트.png" class="img-fluid hoverHeart" alt="찜" onclick="heart(this)">
										<img src="<%=request.getContextPath()%>/resources/img/카트2.png" class="img-fluid hoverCart" alt="장바구니" onclick="cart(this)">
									  </div>
									  
									  <div class="card-body">
									    <p class="card-text">
									    	<span style="color:red;">[인기]</span><br>
									    	<span class="productName">비비고왕교자</span><br>
									    	<span class="fs-4">10,000</span>원<br>
									    	<span class="discount">1</span>
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
					</article>
					<br>
					<!-- 베스트 레시피 -->
					<article class="bestRecipe">
						<p class="fs-5 my-2 fw-bold">베스트 레시피</p>
						<hr>
						<div class="container">
							<div class="row">
								<%for(int i=0; i<=2; i++){ %>
								<div class="col-12 col-sm-12 col-md-6 col-lg-4 col-xl-3 popular d-flex justify-content-center">
									<div class="card" style="width: 18rem;">
									  <img src="<%=request.getContextPath()%>/resources/img/CJ/치킨,만두/1.png" class="card-img-top" alt="비비고만두">
									  <%if(i==0){ %>
									  <img src="<%=request.getContextPath()%>/resources/img/금메달.png" class="img-fluid medal" alt="1등">
									  <%}else if(i==1){ %>
									  <img src="<%=request.getContextPath()%>/resources/img/은메달.png" class="img-fluid medal" alt="2등">
									  <%}else if(i==2){ %>
									  <img src="<%=request.getContextPath()%>/resources/img/동메달.png" class="img-fluid medal" alt="3등">
									  <%} %>
									  <div class="card-body">
									    <p class="card-text">
									    	[유저 닉네임]<br>
									    	비비고왕교자<br>
									    	조회수 2,500<br>
									    	추천수 3,000
									    </p>
									  </div>
									</div>
								</div>
								<%} %>
							</div>
						</div>
					</article>
					
				<!-- 모바일 화면 -->	
					<article class="bestMenuM">
						<p class="fs-5 my-2 fw-bold">인기메뉴</p>
						<hr>
						<div class="cardDivM">
							<%for(int i=0; i<4; i++){ %>
							<div class="cardM">
								<img src="<%=request.getContextPath()%>/resources/img/CJ/치킨,만두/1.png" class="img-fluid" alt="비비고만두">
								<div class="indexSubImgM">
									<img src="<%=request.getContextPath()%>/resources/img/빈하트.png" class="img-fluid hoverHeart" alt="찜" onclick="heart(this)">
									<img src="<%=request.getContextPath()%>/resources/img/카트2.png" class="img-fluid hoverCart" alt="장바구니" onclick="indexCart(this)">
								</div>
								<div class="cardMContent">
									<span style="color:red;">[인기]</span><br>
									<span class="productNameM">비비고왕교자</span><br>
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
								</div>
							</div>
							<%} %>
						</div>
					</article>
					<article class="bestRecipeM">
						<p class="fs-5 my-2 fw-bold">베스트 레시피</p>
						<hr>
						<div class="recipeCardM">
							<%for(int i=0; i<3; i++){ %>
							<div class="recipeMDiv">
								<div class="recipeMImg">
									<img src="<%=request.getContextPath()%>/resources/img/CJ/치킨,만두/1.png" class="img-fluid" alt="비비고만두">
								</div>
								<div class="recipeMContent">
									<img src="<%=request.getContextPath()%>/resources/img/금메달.png" class="img-fluid medalM" alt="1등">
									<div>[유저닉네임]</div>
									<div>비비고왕교자</div>
									<div>조회수</div>
									<div>추천수</div>
								</div>
							</div>
							<%} %>
						</div>
					</article>
                </article>
            </div>

            <!-- 오른쪽 사이드메뉴 -->
            <div class="col-sm-3 col-md-2 col-lg-2 d-none d-sm-block">
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