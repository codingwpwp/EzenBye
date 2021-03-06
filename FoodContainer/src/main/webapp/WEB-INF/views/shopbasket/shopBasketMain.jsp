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
    <title>장바구니</title>
    <!-- css링크 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/base.css">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/shopbasket.css" />
	<script src="<%=request.getContextPath() %>/resources/js/jquery-3.6.0.min.js"></script>
	<script src="<%=request.getContextPath() %>/resources/js/shopbasket.js"></script>
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
            
            

			<%@include file="/WEB-INF/views/base/nav.jsp"%>

        </div>
    </nav>

    <!-- 섹션 -->
    <section class="mt-1">
        <div class="row">

            <!-- 왼쪽 사이드메뉴 -->
            <div class="col-lg-2 d-none d-lg-block">
                <aside></aside>
            </div>

            <!-- 메인 -->
            <div class="col-12 col-sm-9 col-md-10 col-lg-8">
                <article id="mainSection \">
                    <!-- 실질적인 메인 내용 -->
                    
                    <div class="col-md-12">
				 
			        <p class="fs-6 shopbasket-fs6">장바구니</p>
			        <hr />
			        
			        <div class="row shopbasket-checkbox">
			        	<div class="col-xxl-2 col-xl-3 col-lg-3 col-md-4">
			        		<div class="form-check form-check-inline">
							  <input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="selectall" name="shopbasketAll">
							  <label class="form-check-label" for="inlineCheckbox1">전체 선택</label>
							</div>
			        	</div>
			        	<c:if test="${member.member_index != null}">
			        	<div class="col-xxl-4 col-xl-5 col-xl-5 col-lg-5 col-md-5">
			        		<button type="button" class="btn btn-secondary btn-sm" onclick="chooseDelete(this)">선택 상품 삭제</button>
			        	</div>
			        	</c:if>
			        	<c:if test="${member.member_index == null}">
			        	<div class="col-xxl-4 col-xl-5 col-xl-5 col-lg-5 col-md-5">
			        		<button type="button" class="btn btn-secondary btn-sm" onclick="chooseDeleteNon(this)">선택 상품 삭제</button>
			        	</div>
			        	</c:if>
					</div>
					
					<!-- 비로그인 냉동 -->
				    <c:if test="${member.member_index == null}">
				    <form name="frms" action="purchase/certification.do" method="post">
					<div class="shopbasket-title rounded lookupBorder">
					<p class="fs-4 shopbasket-fs4 fw-bold text-primary text-opacity-50"><i class="bi bi-snow2"></i>냉동식품</p>	
					
						<c:forEach items="${noMemberCart}" var="noMemberCart" varStatus="status">
							<c:if test="${noMemberCart.bigSort == '냉동식품'}">
							<div class="row d-flex align-items-center shopbasket-card">
								<div class="col-lg-2 col-md-2 d-flex justify-content-center shopbasket-checkbox">
								
									<c:forEach items="${noMemberCartCookie}" var="noMemberCartCookie">
										<c:set var="pCnt" value="${noMemberCartCookie}" />
										<c:set var="length" value="${fn:length(pCnt)}"/>
											<c:if test="${length < 7}">
												<c:if test="${noMemberCart.product_index == fn:substring(pCnt,0,length-1)}">
													<input class="form-check-input cart_indexCheck" type="checkbox" id="iceCheckbox${status.index}" value="${fn:substring(pCnt,length-1,length)}" name="${fn:substring(pCnt,0,length-1)}" onclick="itemSum(this)">
												</c:if>
											</c:if>
											<c:if test="${length == 7}">
												<c:if test="${noMemberCart.product_index == fn:substring(pCnt,0,length-2)}">
													<input class="form-check-input cart_indexCheck" type="checkbox" id="iceCheckbox${status.index}" value="${fn:substring(pCnt,length-2,length)}" name="${fn:substring(pCnt,0,length-2)}" onclick="itemSum(this)">
												</c:if>
											</c:if>
										</c:forEach>	
									
								</div>
								<div class="col-lg-8 col-md-8">
									<div class="h-100 p-2 bg-light border rounded-3 card-good">
									
									<c:forEach items="${noMemberCartCookie}" var="noMemberCartCookie">
										<c:set var="pCnt" value="${noMemberCartCookie}" />
										<c:set var="length" value="${fn:length(pCnt)}"/>
											<c:if test="${length < 7}">
												<c:if test="${noMemberCart.product_index == fn:substring(pCnt,0,length-1)}">
													<a href="productView.do?product_index=${fn:substring(pCnt,0,length-1)}" class="productHref" onclick="productCookie(this)">
													<input id="indexCookie" type="hidden" value="${fn:substring(pCnt,0,length-1)}" />
												</c:if>
											</c:if>
											<c:if test="${length == 7}">
												<c:if test="${noMemberCart.product_index == fn:substring(pCnt,0,length-2)}">
													<a href="productView.do?product_index=${fn:substring(pCnt,0,length-2)}" class="productHref" onclick="productCookie(this)">
													<input id="indexCookie" type="hidden" value="${fn:substring(pCnt,0,length-1)}" />
												</c:if>
											</c:if>
										</c:forEach>
									
							        	<div class="row">
							        		<div class="col-sm-3">
							        			<img src="<%=request.getContextPath() %>/resources/img/${noMemberCart.brand}/${noMemberCart.middleSort}/${noMemberCart.thumbnail_image}" class="img-thumbnail" alt="${noMemberCart.product_name}">
							        		</div>
							        		<div class="col-sm-9 d-flex align-items-start flex-column mb-3">
										    	<div class="mb-auto p-2 confirmProductName">${noMemberCart.brand} ${noMemberCart.product_name}</div>
				  								<c:if test="${noMemberCart.sale_price == -1}">
				  								
				  									<c:forEach items="${noMemberCartCookie}" var="noMemberCartCookie">
													<c:set var="pCnt" value="${noMemberCartCookie}" />
													<c:set var="length" value="${fn:length(pCnt)}"/>
														<c:if test="${length < 7}">
															<c:if test="${noMemberCart.product_index == fn:substring(pCnt,0,length-1)}">
																<div class="p-2 productPrice"><span class="productPrice3"><fmt:formatNumber value="${noMemberCart.origin_price * fn:substring(pCnt,length-1,length)}" pattern="#,###" /></span>원</div>
																<input type="hidden" name="origin_price" class="productPrice4" value="${noMemberCart.origin_price}" />
															</c:if>
														</c:if>
														<c:if test="${length == 7}">
															<c:if test="${noMemberCart.product_index == fn:substring(pCnt,0,length-2)}">
																<div class="p-2 productPrice"><span class="productPrice3"><fmt:formatNumber value="${noMemberCart.origin_price * fn:substring(pCnt,length-2,length)}" pattern="#,###" /></span>원</div>
																<input type="hidden" name="origin_price" class="productPrice4" value="${noMemberCart.origin_price}" />
															</c:if>
														</c:if>
													</c:forEach>
				  								
				  								</c:if>
				  								
				  								<c:if test="${noMemberCart.sale_price != -1}">
				  								
				  									<c:forEach items="${noMemberCartCookie}" var="noMemberCartCookie">
													<c:set var="pCnt" value="${noMemberCartCookie}" />
													<c:set var="length" value="${fn:length(pCnt)}"/>
														<c:if test="${length < 7}">
															<c:if test="${noMemberCart.product_index == fn:substring(pCnt,0,length-1)}">
																<div class="p-2 productPrice2"><span class="productPrice3"><fmt:formatNumber value="${noMemberCart.sale_price * fn:substring(pCnt,length-1,length)}" pattern="#,###" /></span>원</div>
																<input type="hidden" name="sale_price" class="productPrice4" value="${noMemberCart.sale_price}" />
															</c:if>
														</c:if>
														<c:if test="${length == 7}">
															<c:if test="${noMemberCart.product_index == fn:substring(pCnt,0,length-2)}">
																<div class="p-2 productPrice2"><span class="productPrice3"><fmt:formatNumber value="${noMemberCart.sale_price * fn:substring(pCnt,length-2,length)}" pattern="#,###" /></span>원</div>
																<input type="hidden" name="sale_price" class="productPrice4" value="${noMemberCart.sale_price}" />
															</c:if>
														</c:if>
													</c:forEach>
				  									
				  								</c:if>
							        		</div>
							        	</div>
							        	</a>
						        	
							        	<div class="d-grid gap-4 d-md-flex justify-content-md-center mt-2 shopbasket-btn">
										  <button class="btn btn-secondary col-lg-3 col-md-4" type="button" onclick="shopbasketDeleteNon(this)">삭제</button>
										  <button class="btn btn-dark col-lg-3 col-md-4" type="button" onclick="OneBuyProductNon(this)">바로 구매</button>
										</div>
						        	</div>
								</div>
								<div class="col-lg-2 col-md-2 d-flex justify-content-center shopbasket-number">
									<i class="bi bi-dash shopbasket-icon" onclick="minusFn(this)"></i>&nbsp; 
										<c:forEach items="${noMemberCartCookie}" var="noMemberCartCookie">
										<c:set var="pCnt" value="${noMemberCartCookie}" />
										<c:set var="length" value="${fn:length(pCnt)}"/>
											<c:if test="${length < 7}">
												<c:if test="${noMemberCart.product_index == fn:substring(pCnt,0,length-1)}">
													<div>${fn:substring(pCnt,length-1,length)}</div>
													<input type="hidden" value="${noMemberCart.product_index}">
												</c:if>
											</c:if>
											<c:if test="${length == 7}">
												<c:if test="${noMemberCart.product_index == fn:substring(pCnt,0,length-2)}">
													<div>${fn:substring(pCnt,length-2,length)}</div>
													<input type="hidden" value="${noMemberCart.product_index}">
												</c:if>
											</c:if>
										</c:forEach> 
									&nbsp; <i class="bi bi-plus shopbasket-icon" onclick="plusFn(this)"></i>
											<input type="hidden" value="${noMemberCart.inventory}" />
								</div>
							</div>
						</c:if>
						</c:forEach>
						</div>
						
					<!-- 비로그인 즉석 -->	
					<div class="shopbasket-title rounded lookupBorder">
					<p class="fs-4 shopbasket-fs4 fw-bold text-success text-opacity-50"><i class="fa-solid fa-utensils"></i>즉석식품</p>
					
						<c:forEach items="${noMemberCart}" var="noMemberCart" varStatus="status">	
						<c:if test="${noMemberCart.bigSort == '즉석식품'}">
							<div class="row d-flex align-items-center shopbasket-card">
								<div class="col-lg-2 col-md-2 d-flex justify-content-center shopbasket-checkbox">
								
									<c:forEach items="${noMemberCartCookie}" var="noMemberCartCookie">
										<c:set var="pCnt" value="${noMemberCartCookie}" />
										<c:set var="length" value="${fn:length(pCnt)}"/>
											<c:if test="${length < 7}">
												<c:if test="${noMemberCart.product_index == fn:substring(pCnt,0,length-1)}">
													<input class="form-check-input cart_indexCheck" type="checkbox" id="iceCheckbox${status.index}" value="${fn:substring(pCnt,length-1,length)}" name="${fn:substring(pCnt,0,length-1)}" onclick="itemSum(this)">
												</c:if>
											</c:if>
											<c:if test="${length == 7}">
												<c:if test="${noMemberCart.product_index == fn:substring(pCnt,0,length-2)}">
													<input class="form-check-input cart_indexCheck" type="checkbox" id="iceCheckbox${status.index}" value="${fn:substring(pCnt,length-2,length)}" name="${fn:substring(pCnt,0,length-2)}" onclick="itemSum(this)">
												</c:if>
											</c:if>
										</c:forEach>
									
								</div>
								<div class="col-lg-8 col-md-8">
									<div class="h-100 p-2 bg-light border rounded-3 card-good">
										
										<c:forEach items="${noMemberCartCookie}" var="noMemberCartCookie">
										<c:set var="pCnt" value="${noMemberCartCookie}" />
										<c:set var="length" value="${fn:length(pCnt)}"/>
											<c:if test="${length < 7}">
												<c:if test="${noMemberCart.product_index == fn:substring(pCnt,0,length-1)}">
													<a href="productView.do?product_index=${fn:substring(pCnt,0,length-1)}" class="productHref" onclick="productCookie(this)">
													<input id="indexCookie" type="hidden" value="${fn:substring(pCnt,0,length-1)}" />
												</c:if>
											</c:if>
											<c:if test="${length == 7}">
												<c:if test="${noMemberCart.product_index == fn:substring(pCnt,0,length-2)}">
													<a href="productView.do?product_index=${fn:substring(pCnt,0,length-2)}" class="productHref" onclick="productCookie(this)">
													<input id="indexCookie" type="hidden" value="${fn:substring(pCnt,0,length-1)}" />
												</c:if>
											</c:if>
										</c:forEach>
										
							        	<div class="row">
							        		<div class="col-sm-3">
							        			<img src="<%=request.getContextPath() %>/resources/img/${noMemberCart.brand}/${noMemberCart.middleSort}/${noMemberCart.thumbnail_image}" class="img-thumbnail" alt="${noMemberCart.product_name}">
							        		</div>
							        		<div class="col-sm-9 d-flex align-items-start flex-column mb-3">
										    	<div class="mb-auto p-2 confirmProductName">${noMemberCart.brand} ${noMemberCart.product_name}</div>
				  								<c:if test="${noMemberCart.sale_price == -1}">
				  								
				  									<c:forEach items="${noMemberCartCookie}" var="noMemberCartCookie">
													<c:set var="pCnt" value="${noMemberCartCookie}" />
													<c:set var="length" value="${fn:length(pCnt)}"/>
														<c:if test="${length < 7}">
															<c:if test="${noMemberCart.product_index == fn:substring(pCnt,0,length-1)}">
																<div class="p-2 productPrice"><span class="productPrice3"><fmt:formatNumber value="${noMemberCart.origin_price * fn:substring(pCnt,length-1,length)}" pattern="#,###" /></span>원</div>
																<input type="hidden" name="origin_price" class="productPrice4" value="${noMemberCart.origin_price}" />
															</c:if>
														</c:if>
														<c:if test="${length == 7}">
															<c:if test="${noMemberCart.product_index == fn:substring(pCnt,0,length-2)}">
																<div class="p-2 productPrice"><span class="productPrice3"><fmt:formatNumber value="${noMemberCart.origin_price * fn:substring(pCnt,length-2,length)}" pattern="#,###" /></span>원</div>
																<input type="hidden" name="origin_price" class="productPrice4" value="${noMemberCart.origin_price}" />
															</c:if>
														</c:if>
													</c:forEach>
				  								
				  									
				  								</c:if>
				  								
				  								<c:if test="${noMemberCart.sale_price != -1}">
				  								
				  									<c:forEach items="${noMemberCartCookie}" var="noMemberCartCookie">
													<c:set var="pCnt" value="${noMemberCartCookie}" />
													<c:set var="length" value="${fn:length(pCnt)}"/>
														<c:if test="${length < 7}">
															<c:if test="${noMemberCart.product_index == fn:substring(pCnt,0,length-1)}">
																<div class="p-2 productPrice2"><span class="productPrice3"><fmt:formatNumber value="${noMemberCart.sale_price * fn:substring(pCnt,length-1,length)}" pattern="#,###" /></span>원</div>
																<input type="hidden" name="sale_price" class="productPrice4" value="${noMemberCart.sale_price}" />
															</c:if>
														</c:if>
														<c:if test="${length == 7}">
															<c:if test="${noMemberCart.product_index == fn:substring(pCnt,0,length-2)}">
																<div class="p-2 productPrice2"><span class="productPrice3"><fmt:formatNumber value="${noMemberCart.sale_price * fn:substring(pCnt,length-2,length)}" pattern="#,###" /></span>원</div>
																<input type="hidden" name="sale_price" class="productPrice4" value="${noMemberCart.sale_price}" />
															</c:if>
														</c:if>
													</c:forEach>
				  									
				  								</c:if>
							        		</div>
							        	</div>
						        		</a>
						        		
							        	<div class="d-grid gap-4 d-md-flex justify-content-md-center mt-2 shopbasket-btn">
										  <button class="btn btn-secondary col-lg-3 col-md-4" type="button" onclick="shopbasketDeleteNon(this)">삭제</button>
										  <button class="btn btn-dark col-lg-3 col-md-4" type="button" onclick="OneBuyProductNon(this)">바로 구매</button>
										</div>
						        	</div>
								</div>
								<div class="col-lg-2 col-md-2 d-flex justify-content-center shopbasket-number">
									<i class="bi bi-dash shopbasket-icon" onclick="minusFn(this)"></i>&nbsp; 
										<c:forEach items="${noMemberCartCookie}" var="noMemberCartCookie">
										<c:set var="pCnt" value="${noMemberCartCookie}" />
										<c:set var="length" value="${fn:length(pCnt)}"/>
											<c:if test="${length < 7}">
												<c:if test="${noMemberCart.product_index == fn:substring(pCnt,0,length-1)}">
													<div>${fn:substring(pCnt,length-1,length)}</div>
													<input type="hidden" value="${noMemberCart.product_index}">
												</c:if>
											</c:if>
											<c:if test="${length == 7}">
												<c:if test="${noMemberCart.product_index == fn:substring(pCnt,0,length-2)}">
													<div>${fn:substring(pCnt,length-2,length)}</div>
													<input type="hidden" value="${noMemberCart.product_index}">
												</c:if>
											</c:if>
										</c:forEach>  
									&nbsp; <i class="bi bi-plus shopbasket-icon" onclick="plusFn(this)"></i>
											<input type="hidden" value="${noMemberCart.inventory}" />
								</div>
							</div>
						</c:if>
						</c:forEach>
					
					</div>
					</form>	
					</c:if>
					
					<!-- 로그인 냉동 -->
					<c:if test="${member.member_index != null}">
					<form name="frm" action="purchase/member.do" method="post">
					<div class="shopbasket-title rounded lookupBorder">
					<p class="fs-4 shopbasket-fs4 fw-bold text-primary text-opacity-50"><i class="bi bi-snow2"></i>냉동식품</p>
					
					<c:forEach items="${selectList}" var="list" varStatus="status">
					<c:if test="${list.bigSort == '냉동식품' && list.del_YN == 'N'}">
						<div class="row d-flex align-items-center shopbasket-card">
							<div class="col-lg-2 col-md-2 d-flex justify-content-center shopbasket-checkbox">
								<input class="form-check-input cart_indexCheck" type="checkbox" id="iceCheckbox${status.index}" value="${list.cart_index}" name="cart_index" onclick="itemSum(this)">
							</div>
							<div class="col-lg-8 col-md-8">
								<div class="h-100 p-2 bg-light border rounded-3 card-good">
								
						        	<a href="productView.do?product_index=${list.product_index }" class="productHref" onclick="productCookie(this)">
						        	<input id="indexCookie" type="hidden" value="${list.product_index}" />
						        	<div class="row">
						        		<div class="col-sm-3">
						        			<img src="<%=request.getContextPath() %>/resources/img/${list.brand}/${list.middleSort}/${list.thumbnail_image}" class="img-thumbnail" alt="${list.product_name}">
						        		</div>
						        		<div class="col-sm-9 d-flex align-items-start flex-column mb-3">
									    	<div class="mb-auto p-2 confirmProductName">${list.brand} ${list.product_name}</div>
			  								<c:if test="${list.sale_price == -1}">
			  									<div class="p-2 productPrice"><span class="productPrice3"><fmt:formatNumber value="${list.origin_price * list.cart_count}" pattern="#,###" /></span>원</div>
			  									<input type="hidden" name="origin_price" class="productPrice4" value="${list.origin_price}" />
			  								</c:if>
			  								<c:if test="${list.sale_price != -1}">
			  									<div class="p-2 productPrice2"><span class="productPrice3"><fmt:formatNumber value="${list.sale_price * list.cart_count}" pattern="#,###" /></span>원</div>
			  									<input type="hidden" name="sale_price" class="productPrice4" value="${list.sale_price}" />
			  								</c:if>
						        		</div>
						        	</div>
						        	</a>
					        	
						        	<div class="d-grid gap-4 d-md-flex justify-content-md-center mt-2 shopbasket-btn">
									  <button class="btn btn-secondary col-lg-3 col-md-4" type="button" onclick="shopbasketDelete(this)">삭제</button>
									  <button class="btn btn-dark col-lg-3 col-md-4" type="button" onclick="OneBuyProduct(this)">바로 구매</button>
									</div>
					        	</div>
							</div>
							<div class="col-lg-2 col-md-2 d-flex justify-content-center shopbasket-number">
								<i class="bi bi-dash shopbasket-icon" onclick="minusCount(this)"></i>&nbsp; 
									<div>${list.cart_count}</div>
									<input type="hidden" value="${list.cart_index}" />
								&nbsp; <i class="bi bi-plus shopbasket-icon" onclick="plusCount(this)"></i>
									<input type="hidden" value="${list.inventory}" />
							</div>
						</div>
					</c:if>
					
					</c:forEach>
					
					</div>
					
					<!-- 로그인 즉석 -->
					<div class="shopbasket-title rounded lookupBorder">
					<p class="fs-4 shopbasket-fs4 fw-bold text-success text-opacity-50"><i class="fa-solid fa-utensils"></i>즉석식품</p>
					
					<c:forEach items="${selectList}" var="list" varStatus="status">
					
					<c:if test="${list.bigSort == '즉석식품' && list.del_YN == 'N'}">
						<div class="row d-flex align-items-center shopbasket-card">
							<div class="col-lg-2 col-md-2 d-flex justify-content-center shopbasket-checkbox">
								<input class="form-check-input cart_indexCheck" type="checkbox" id="iceCheckbox${status.index}" value="${list.cart_index}" name="cart_index" onclick="itemSum(this)">
							</div>
							<div class="col-lg-8 col-md-8">
								<div class="h-100 p-2 bg-light border rounded-3 card-good">
									
									<a href="productView.do?product_index=${list.product_index }" class="productHref" onclick="productCookie(this)">
									<input id="indexCookie" type="hidden" value="${list.product_index}" />
						        	<div class="row">
						        		<div class="col-sm-3">
						        			<img src="<%=request.getContextPath() %>/resources/img/${list.brand}/${list.middleSort}/${list.thumbnail_image}" class="img-thumbnail" alt="${list.product_name}">
						        		</div>
						        		<div class="col-sm-9 d-flex align-items-start flex-column mb-3">
									    	<div class="mb-auto p-2 confirmProductName">${list.brand} ${list.product_name}</div>
			  								<c:if test="${list.sale_price == -1}">
			  									<div class="p-2 productPrice"><span class="productPrice3"><fmt:formatNumber value="${list.origin_price * list.cart_count}" pattern="#,###" /></span>원</div>
			  									<input type="hidden" name="origin_price" class="productPrice4" value="${list.origin_price}" />
			  								</c:if>
			  								<c:if test="${list.sale_price != -1}">
			  									<div class="p-2 productPrice2"><span class="productPrice3"><fmt:formatNumber value="${list.sale_price * list.cart_count}" pattern="#,###" /></span>원</div>
			  									<input type="hidden" name="sale_price" class="productPrice4" value="${list.sale_price}" />
			  								</c:if>
						        		</div>
						        	</div>
						        	</a>
					        	
						        	<div class="d-grid gap-4 d-md-flex justify-content-md-center mt-2 shopbasket-btn">
									  <button class="btn btn-secondary col-lg-3 col-md-4" type="button" onclick="shopbasketDelete(this)">삭제</button>
									  <button class="btn btn-dark col-lg-3 col-md-4" type="button" onclick="OneBuyProduct(this)">바로 구매</button>
									</div>
					        	</div>
							</div>
							<div class="col-lg-2 col-md-2 d-flex justify-content-center shopbasket-number">
								<i class="bi bi-dash shopbasket-icon" onclick="minusCount(this)"></i>&nbsp; 
									<div>${list.cart_count}</div>
									<input type="hidden" value="${list.cart_index}" />
								&nbsp; <i class="bi bi-plus shopbasket-icon" onclick="plusCount(this)"></i>
									<input type="hidden" value="${list.inventory}" />
							</div>
						</div>
					</c:if>
					
					</c:forEach>
					</div>
					</form>
					</c:if>
					
					<div class="d-flex justify-content-center shopbasket-sum">선택 상품 합계 :&nbsp;<span class="shopbasket-sum2"> 0</span>원</div>
					
					<c:if test="${member.member_index != null}">
					<div class="d-flex justify-content-center shopbasket-btn2">
						<button type="button" class="btn btn-outline-dark col-5" onclick="buyProduct(this)">구매하기</button>
					</div>
					</c:if>
					<c:if test="${member.member_index == null}">
					<div class="d-flex justify-content-center shopbasket-btn2">
						<button type="button" class="btn btn-outline-dark col-5" onclick="buyProductNon(this)">구매하기</button>
					</div>
					</c:if>
      				
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