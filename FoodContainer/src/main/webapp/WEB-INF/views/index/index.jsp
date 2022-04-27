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
    <section>
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
						  <c:forEach items="${mainBannerList }" var="mainBannerList" varStatus="status">
						  	<c:if test="${status.index == 0 }">
							    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide${status.index }"></button>
							</c:if> 
							<c:if test="${status.index != 0 }">   
							    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="${status.index }" aria-label="Slide${status.index }"></button>
							</c:if>  
						  </c:forEach>
						  </div>
						  <div class="carousel-inner">
						  <c:forEach items="${mainBannerList }" var="mainBannerList" varStatus="status">
						  	<c:if test="${status.index == 0}">
							    <div class="carousel-item active">
							      <c:if test="${mainBannerList.link_YN == 'Y' }">
							      	<a href="${mainBannerList.link }">
							      		<c:set var="name" value="${mainBannerList.link}" />
										<c:set var="length" value="${fn:length(name)}"/>
										
							      		<img src="<%=request.getContextPath()%>/resources/img/배너/${mainBannerList.image}" class="card-img-top" class="d-block w-100" alt="${mainBannerList.name }" title="${mainBannerList.name }" onclick="bannerFn(this); productCookie(this);">
							      		<input type="hidden" name="index" value="${fn:substring(name,length-5,length)}">
							      		<input type="hidden" name="link" value="${mainBannerList.link }">
							      	</a>
							      </c:if>
							      <c:if test="${mainBannerList.link_YN == 'N' }">
							      	<img src="<%=request.getContextPath()%>/resources/img/배너/${mainBannerList.image}" class="card-img-top" class="d-block w-100" alt="${mainBannerList.name }" title="${mainBannerList.name }">
							      </c:if>
							    </div>
							</c:if>
							<c:if test="${status.index != 0}">
							    <div class="carousel-item">
							      <c:if test="${mainBannerList.link_YN == 'Y' }">
							      	<a href="${mainBannerList.link }">
							      		<c:set var="name" value="${mainBannerList.link}" />
										<c:set var="length" value="${fn:length(name)}"/>
							      		
							      		<img src="<%=request.getContextPath()%>/resources/img/배너/${mainBannerList.image}" class="card-img-top" class="d-block w-100" alt="${mainBannerList.name }" title="${mainBannerList.name }" onclick="bannerFn(this); productCookie(this);">
							      		<input type="hidden" name="index" value="${fn:substring(name,length-5,length)}">
							      		<input type="hidden" name="link" value="${mainBannerList.link }">
							      	</a>
							      </c:if>
							      <c:if test="${mainBannerList.link_YN == 'N' }">
							      	<img src="<%=request.getContextPath()%>/resources/img/배너/${mainBannerList.image}" class="card-img-top" class="d-block w-100" alt="${mainBannerList.name }" title="${mainBannerList.name }">
							      </c:if>
							    </div>
							</c:if>
						  </c:forEach>
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
								<c:set var="ran"><%= java.lang.Math.round(java.lang.Math.random() * 10) %></c:set>
								<c:forEach items="${popularList}" var="popularList" begin="${ran}" end="${ran+3}" varStatus="status">
								<div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-3 popular d-flex justify-content-center">
									<div class="card" style="width: 18rem;">
									<a href="productView.do?product_index=${popularList.product_index}" onclick="productCookie(this)">
									  <div>
										  <img src="<%=request.getContextPath()%>/resources/img/${popularList.brand}/${popularList.middleSort }/${popularList.thumbnail_image}" class="card-img-top" id="cardImg" alt="${popularList.product_name }">
										  <c:if test="${popularList.inventory == 0 }">
									  	  	<img src="<%=request.getContextPath()%>/resources/img/매진.png" class="card-img-top indexSold">
									  	  	<div class="soldout"></div>
									  	  </c:if>
									  	  <input type="hidden" class="inventory${status.index}" value="${popularList.inventory}">
									  </div>
									  
									  <div class="card-body">
									    <p class="card-text">
									    	<span style="color:red;">[인기]</span>
									    	<span>[${popularList.brand }]</span>
									    	<br>
									    	<span class="productName">${popularList.product_name }</span><br>
									    	<span class="fs-4">
									    		<fmt:formatNumber value="${popularList.origin_price}" pattern="#,###"/>
									    	</span>원<br>
									    	<c:if test="${popularList.sale_price != -1 }">
									    		<span class="discount">
									    			<fmt:formatNumber value="${popularList.sale_price}" pattern="#,###"/>원
									    			<c:set var="sale" value="${((popularList.origin_price - popularList.sale_price)/popularList.origin_price)*100}" />
				          							(<fmt:formatNumber value="${sale}" pattern="##.#"/>%)<br>
									    		</span>
									    	</c:if>
									    	<span class="indexStar">
									    		<c:set var="sum" value="0" />
										        <c:set var="length" value="0" />
										        <c:set var="avrg" />
										   		
										   		<c:forEach items="${viewReview}" var="viewReview">
											   		<c:if test="${popularList.product_index == viewReview.product_index}">
									        			<c:set var="sum" value="${sum+viewReview.star_count}" />
												   	</c:if>
											   	</c:forEach>
											   	
											   	<c:forEach items="${viewReview}" var="viewReview">
											   		<c:if test="${popularList.product_index == viewReview.product_index}">
									        			<c:set var="length" value="${length+1}" />
												   	</c:if>
											   	</c:forEach>
									        	
										      	<c:set var="avrg" value="${sum/length}" />
										       	
										       	<c:if test="${length == 0 }">
										       		<c:set var="avrg" value="0" />
										       	</c:if>
										       	
										        <c:forEach begin="1" end="5" varStatus="reStatus">
													<c:if test="${reStatus.index <= avrg}">
													   	<i class="bi bi-star-fill"></i>
													</c:if>
													<c:if test="${reStatus.index > avrg}">
														<i class="bi bi-star"></i>
													</c:if>
												</c:forEach>
									    	</span>
									    	<br>
									    	<c:set var="delivery" value="${popularList.delivery_free_YN}" />
									    	<c:choose>
									    		<c:when test="${delivery == 'N'}">
									    			배송비 3,000원
									    		</c:when>
									    		
									    		<c:when test="${delivery == 'Y'}">
									    			무료배송
									    		</c:when>
									    	</c:choose>
									    </p>
									  </div>
									  </a>
									  <input type="hidden" name="index" value="${popularList.product_index}">
									  <div class="indexSubImg">
									  	<c:if test="${member.id != null }">
								  		<c:set var="heartCheck" value="0" />
										  	<c:forEach items="${userDibsList}" var="userDibsList">
										  		<c:if test="${userDibsList.member_index == member.member_index && popularList.product_index == userDibsList.product_index}">
										  			<img src="<%=request.getContextPath()%>/resources/img/찬하트.png" class="img-fluid hoverHeart" alt="찜" onclick="heart(this)">
										  			<c:set var="heartCheck" value="1" />
										  		</c:if>
										  	</c:forEach>
										  	<c:if test="${heartCheck == '0'}">
										  		<img src="<%=request.getContextPath()%>/resources/img/빈하트.png" class="img-fluid hoverHeart" alt="찜" onclick="heart(this)">
										  	</c:if>
									  	
								  		</c:if>
									  	<c:if test="${member.id == null}">
										  	<img src="<%=request.getContextPath()%>/resources/img/빈하트.png" class="img-fluid hoverHeart" alt="찜" onclick="heart(this)">
									  	</c:if>
										<img src="<%=request.getContextPath()%>/resources/img/카트2.png" class="img-fluid hoverCart" alt="장바구니" onclick="cart(this)">
										<input type="hidden" value="${status.index}">
									  </div>
									</div>
								</div>
								</c:forEach>
								<input type="hidden" id="pListLoginCheck" value="${member.member_index}">
							</div>
					</article>
					<br>
					<!-- 베스트 레시피 -->
					<article class="bestRecipe">
						<p class="fs-5 my-2 fw-bold">베스트 레시피</p>
						<hr>
						<div class="container">
							<div class="row">
								<c:forEach items="${recipeList}" var="recipeList">
								<c:if test="${recipeList.best_rank < 4}">
									<c:if test="${recipeList.best_rank == 1}">
										<div class="col-12 col-sm-12 col-md-6 col-lg-4 col-xl-3 popular d-flex justify-content-center">
											<div class="card" style="width: 18rem;">
											<a href = "<%=request.getContextPath()%>/recipeview.do?recipe_index=${recipeList.recipe_index}">
											  <img src="<%=request.getContextPath()%>/resources/img/recipe/${recipeList.thumbnail_image}" class="card-img-top recipeImg" alt="${recipeList.thumbnail_image}">
											  <img src="<%=request.getContextPath()%>/resources/img/금메달.png" class="img-fluid medal" alt="1등">
											  <div class="card-body">
											    <p class="card-text">
											    	<c:forEach items="${MemberList}" var="MemberList">
														<c:if test="${MemberList.member_index == recipeList.member_index}">
															[닉네임 : ${MemberList.nickname}]<br>
														</c:if>
													</c:forEach>
											    	제목 : ${recipeList.title}<br>
											    	조회 : ${recipeList.hit}<br>
													추천 : ${recipeList.thumb}
											    </p>
											  </div>
											</a>	
											</div>
										</div>
									</c:if>
									
									
									<c:if test="${recipeList.best_rank == 2}">
										<div class="col-12 col-sm-12 col-md-6 col-lg-4 col-xl-3 popular d-flex justify-content-center">
											<div class="card" style="width: 18rem;">
											<a href = "<%=request.getContextPath()%>/recipeview.do?recipe_index=${recipeList.recipe_index}">
											  <img src="<%=request.getContextPath()%>/resources/img/recipe/${recipeList.thumbnail_image}" class="card-img-top recipeImg" alt="${recipeList.thumbnail_image}">
											  <img src="<%=request.getContextPath()%>/resources/img/은메달.png" class="img-fluid medal" alt="2등">
											  <div class="card-body">
											    <p class="card-text">
											    	<c:forEach items="${MemberList}" var="MemberList">
														<c:if test="${MemberList.member_index == recipeList.member_index}">
															[닉네임 : ${MemberList.nickname}]<br>
														</c:if>
													</c:forEach>
											    	제목 : ${recipeList.title}<br>
											    	조회 : ${recipeList.hit}<br>
													추천 : ${recipeList.thumb}
											    </p>
											  </div>
											</a>
											</div>
										</div>
									</c:if>
									
									<c:if test="${recipeList.best_rank == 3}">
										<div class="col-12 col-sm-12 col-md-6 col-lg-4 col-xl-3 popular d-flex justify-content-center">
											<div class="card" style="width: 18rem;">
											<a href = "<%=request.getContextPath()%>/recipeview.do?recipe_index=${recipeList.recipe_index}">
											  <img src="<%=request.getContextPath()%>/resources/img/recipe/${recipeList.thumbnail_image}" class="card-img-top recipeImg" alt="${recipeList.thumbnail_image}">
											  <img src="<%=request.getContextPath()%>/resources/img/동메달.png" class="img-fluid medal" alt="3등">
											  <div class="card-body">
											    <p class="card-text">
											    	<c:forEach items="${MemberList}" var="MemberList">
														<c:if test="${MemberList.member_index == recipeList.member_index}">
															[닉네임 : ${MemberList.nickname}]<br>
														</c:if>
													</c:forEach>
											    	제목 : ${recipeList.title}<br>
											    	조회 : ${recipeList.hit}<br>
													추천 : ${recipeList.thumb}
											    </p>
											  </div>
											</a>
											</div>
										</div>
									</c:if>
								</c:if>
								
								</c:forEach>
							</div>
						</div>
					</article>
					
				<!-- 모바일 화면 -->	
					<article class="bestMenuM">
						<p class="fs-5 my-2 fw-bold">인기메뉴</p>
						<hr>
						<div class="cardDivM">
							<c:set var="ran"><%= java.lang.Math.round(java.lang.Math.random() * 10) %></c:set>
							<c:forEach items="${popularList}" var="popularList" begin="${ran}" end="${ran+3}" varStatus="status">
								<div class="cardM">
								<a href="productView.do?product_index=${popularList.product_index}" onclick="productCookie(this)">
									<div class="imgAreaM">
										<img src="<%=request.getContextPath()%>/resources/img/${popularList.brand}/${popularList.middleSort }/${popularList.thumbnail_image}" class="img-fluid" id="cardMimg" alt="${popularList.product_name }">
										<c:if test="${popularList.inventory == 0 }">
									  	  	<img src="<%=request.getContextPath()%>/resources/img/매진.png" class="card-img-top indexSoldM">
									  		<div class="soldout"></div>
									  	</c:if>
									  	<input type="hidden" class="inventoryM${status.index}" value="${popularList.inventory}">
									</div>
									<div class="cardMContent">
										<span style="color:red;">[인기]</span>
										<span>[${popularList.brand }]</span>
										<br>
										<span class="productNameM">${popularList.product_name }</span><br>
										<c:if test="${popularList.sale_price == -1 }">
										<span class="fs-4">
									    	<fmt:formatNumber value="${popularList.origin_price}" pattern="#,###"/>
									    </span>원<br>
									    </c:if>
									    	<c:if test="${popularList.sale_price != -1 }">
									    		<span class="discountM">
									    			<fmt:formatNumber value="${popularList.sale_price}" pattern="#,###"/>원
									    			<c:set var="sale" value="${((popularList.origin_price - popularList.sale_price)/popularList.origin_price)*100}" />
				          							(<fmt:formatNumber value="${sale}" pattern="##.#"/>%)<br>
									    		</span>
									    	</c:if>
										<span class="indexStarM">
											<c:set var="sum" value="0" />
										        <c:set var="length" value="0" />
										        <c:set var="avrg" />
										   		
										   		<c:forEach items="${viewReview}" var="viewReview">
											   		<c:if test="${popularList.product_index == viewReview.product_index}">
									        			<c:set var="sum" value="${sum+viewReview.star_count}" />
												   	</c:if>
											   	</c:forEach>
											   	
											   	<c:forEach items="${viewReview}" var="viewReview">
											   		<c:if test="${popularList.product_index == viewReview.product_index}">
									        			<c:set var="length" value="${length+1}" />
												   	</c:if>
											   	</c:forEach>
									        	
										      	<c:set var="avrg" value="${sum/length}" />
										       	
										       	<c:if test="${length == 0 }">
										       		<c:set var="avrg" value="0" />
										       	</c:if>
										       	
										        <c:forEach begin="1" end="5" varStatus="reStatus">
													<c:if test="${reStatus.index <= avrg}">
													   	<i class="bi bi-star-fill"></i>
													</c:if>
													<c:if test="${reStatus.index > avrg}">
														<i class="bi bi-star"></i>
													</c:if>
												</c:forEach>
										</span>
										<br>
										<c:set var="delivery" value="${popularList.delivery_free_YN}" />
									    	<c:choose>
									    		<c:when test="${delivery == 'N'}">
									    			배송비 3,000원
									    		</c:when>
									    		
									    		<c:when test="${delivery == 'Y'}">
									    			무료배송
									    		</c:when>
									    	</c:choose>
									</div>
									</a>
									<input type="hidden" name="index" value="${popularList.product_index}">
									<div class="indexSubImgM">
										<c:if test="${member.id != null }">
								  		<c:set var="heartCheck" value="0" />
										  	<c:forEach items="${userDibsList}" var="userDibsList">
										  		<c:if test="${userDibsList.member_index == member.member_index && popularList.product_index == userDibsList.product_index}">
										  			<img src="<%=request.getContextPath()%>/resources/img/찬하트.png" class="img-fluid hoverHeart" alt="찜" onclick="heart(this)">
										  			<c:set var="heartCheck" value="1" />
										  		</c:if>
										  	</c:forEach>
										  	<c:if test="${heartCheck == '0'}">
										  		<img src="<%=request.getContextPath()%>/resources/img/빈하트.png" class="img-fluid hoverHeart" alt="찜" onclick="heart(this)">
										  	</c:if>
									  	
								  		</c:if>
									  	<c:if test="${member.id == null}">
										  	<img src="<%=request.getContextPath()%>/resources/img/빈하트.png" class="img-fluid hoverHeart" alt="찜" onclick="heart(this)">
									  	</c:if>
									  	
										<img src="<%=request.getContextPath()%>/resources/img/카트2.png" class="img-fluid hoverCart" alt="장바구니" onclick="indexCart(this)">
										<input type="hidden" value="${status.index}">
									</div>
								</div>
							</c:forEach>
						</div>
					</article>
					<article class="bestRecipeM">
						<p class="fs-5 my-2 fw-bold">베스트 레시피</p>
						<hr>
						<c:forEach items="${recipeList}" var="recipeList">
						<c:if test="${recipeList.best_rank < 4 && recipeList.best_rank != ''}">
						<div class="recipeCardM">
							<div class="recipeMDiv">
								<c:if test="${recipeList.best_rank == 1}">
								<div class="recipeMImg">
									<img src="<%=request.getContextPath()%>/resources/img/recipe/${recipeList.thumbnail_image}" class="img-fluid" alt="${recipeList.thumbnail_image}">
								</div>
								<div class="recipeMContent">
									<img src="<%=request.getContextPath()%>/resources/img/금메달.png" class="img-fluid medalM" alt="1등">
									<c:forEach items="${MemberList}" var="MemberList">
										<c:if test="${MemberList.member_index == recipeList.member_index}">
											<div>[닉네임 : ${MemberList.nickname}]</div>
										</c:if>
									</c:forEach>
									<div class="recipTitleM">제목 : ${recipeList.title}</div>
									<div>조회 : ${recipeList.hit}</div>
									<div>추천 : ${recipeList.thumb}</div>
								</div>
								</c:if>
								
								<c:if test="${recipeList.best_rank == 2}">
								<div class="recipeMImg">
									<img src="<%=request.getContextPath()%>/resources/img/recipe/${recipeList.thumbnail_image}" class="img-fluid" alt="${recipeList.thumbnail_image}">
								</div>
								<div class="recipeMContent">
									<img src="<%=request.getContextPath()%>/resources/img/은메달.png" class="img-fluid medalM" alt="2등">
									<c:forEach items="${MemberList}" var="MemberList">
										<c:if test="${MemberList.member_index == recipeList.member_index}">
											<div>[닉네임 : ${MemberList.nickname}]</div>
										</c:if>
									</c:forEach>
									<div class="recipTitleM">제목 : ${recipeList.title}</div>
									<div>조회 : ${recipeList.hit}</div>
									<div>추천 : ${recipeList.thumb}</div>
								</div>
								</c:if>
								
								<c:if test="${recipeList.best_rank == 3}">
								<div class="recipeMImg">
									<img src="<%=request.getContextPath()%>/resources/img/recipe/${recipeList.thumbnail_image}" class="img-fluid" alt="${recipeList.thumbnail_image}">
								</div>
								<div class="recipeMContent">
									<img src="<%=request.getContextPath()%>/resources/img/동메달.png" class="img-fluid medalM" alt="3등">
									<c:forEach items="${MemberList}" var="MemberList">
										<c:if test="${MemberList.member_index == recipeList.member_index}">
											<div>[닉네임 : ${MemberList.nickname}]</div>
										</c:if>
									</c:forEach>
									<div class="recipTitleM">제목 : ${recipeList.title}</div>
									<div>조회 : ${recipeList.hit}</div>
									<div>추천 : ${recipeList.thumb}</div>
								</div>
								</c:if>
							</div>
						</div>
						</c:if>
						</c:forEach>
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
</body>
</html>