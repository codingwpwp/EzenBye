<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>주문배송조회</title>
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
	.nav1 {
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
				 
			        <p class="fs-6 lookup-fs-6">주문배송조회</p>
			        <hr />
			        <c:if test="${empty ordersList}">
			        <div class="lookupBorder">
			        	<p class="fs-6 lookup-fs-6">주문한 내역이 없습니다.</p>
		        	</div>
			        </c:if>
			        
			        <c:if test="${!empty ordersList}">
			        <c:forEach items="${ordersList}" var="list">
			        <div class="lookupBorder">
			        	<div class="row">
				        	<div class="col-sm-12 col-md-12 col-lg-5">
				        		<span class="good-date">${list.order_date}</span>
				        	</div>
				        	<div class="col-sm-12 col-md-12 col-lg-5">
				        		<span class="good-date">주문번호 : ${list.member_order_index }</span>
				        	</div>
				        	<div class="col-sm-12 col-lg-2 findT">
				        		<button type="button" class="btn btn-primary btn-sm" onclick="location.href='mypage_lookupView.do?member_order_index=${list.member_order_index}'">주문상세</button>
				        	</div>
				        </div>
				        	
				        	<c:forEach items="${opList}" var="opList">
				       
				        	<c:set var="i" value="${i+1}" /> 
				        	<c:set var="a" value="${a+1}" />
				        	<c:set var="b" value="${a+opListSize}" />
				        	<c:set var="c" value="${b+opListSize}" />
				        	<c:set var="d" value="${c+opListSize}" />
				        	<c:set var="e" value="${d+opListSize}" />	
				        	
				        	<c:if test="${list.member_order_index eq opList.member_order_index}"> 
					        	<div class="h-100 p-2 bg-light border rounded-3 card-good">
						        	<div class="row">
						        		<div class="col-sm-4">
						        			<span class="fw-bold">${opList.order_status }</span>
						        		</div>
						        		<div class="col-sm-8 number-good">
						        			<span class="fw-bold">상품 주문번호 : ${opList.orderItem_index }</span>
						        		</div>
						        	</div>
						        	<a href="productView.do?product_index=${opList.product_index }" class="productHref">
						        	<div class="row">
						        		<div class="col-sm-3">
						        			<img src="<%=request.getContextPath() %>/resources/img/${opList.brand}/${opList.middleSort}/${opList.thumbnail_image}" class="img-thumbnail" alt="상품사진">
						        		</div>
						        		<div class="col-sm-8 d-flex align-items-start flex-column mb-3">
									    	<div class="mb-auto p-2">${opList.product_name}</div>
									    	<div class="p-2"><fmt:formatNumber value="${opList.price / opList.order_quantity }" pattern="#,###" />원 | ${opList.order_quantity }개</div>
						        		</div>
						        	</div>
						        	</a>
						        	
						        	<c:if test="${opList.order_status eq '배송완료'}">
							        	<div class="d-grid gap-2 col-6 mx-auto">
							        	  <input type="hidden" name="orderItem_index" value="${opList.orderItem_index}"/>
							        	  <input type="hidden" name="member_index" value="${member.member_index}"/>
							        	  <input type="hidden" name="point" value="${opList.point}"/>
										  <button class="btn btn-outline-secondary" type="button" onclick="buyOk(this)">구매확정</button>
										</div>
									</c:if>
									
									<c:if test="${opList.order_status eq '구매확정' and opList.review_YN ne 'Y'}">
							        	<div class="d-grid gap-2 col-6 mx-auto">			  
										  <button class="btn btn-outline-secondary" type="button" data-bs-toggle="modal" data-bs-target="#staticBackdrop${i}">리뷰작성</button>
										</div>
										<form name="bannerRegisterForm" method="post" action="writeReview.do" enctype="multipart/form-data">
											<div class="modal fade" id="staticBackdrop${i}" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
											  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
											    <div class="modal-content">
											      <div class="modal-header">
											        <h5 class="modal-title" id="staticBackdropLabel">리뷰 작성</h5>
											        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
											      </div>
											      <div class="modal-body">
											        <div class="row">
										        		<div class="col-sm-3">
										        			<img src="<%=request.getContextPath() %>/resources/img/${opList.brand}/${opList.middleSort}/${opList.thumbnail_image}" class="img-thumbnail" alt="...">
										        		</div>
										        		<div class="col-sm-8">
													    	<span>${opList.product_name}</span>
										        		</div>
										        	</div>
										        	<p class="fs-6 lookup-fs-6">이 상품의 품질에 대해 얼마나 만족하시나요?</p>
										        	<div class="row">
										        		<div class="col">
										        			<div class="star-rating space-x-4">						        		
																<input type="radio" id="${e}-stars" name="rating" value="5" v-model="ratings"/>
																<label for="${e}-stars" class="star pr-4">★</label>
																<input type="radio" id="${d}-stars" name="rating" value="4" v-model="ratings"/>
																<label for="${d}-stars" class="star">★</label>
																<input type="radio" id="${c}-stars" name="rating" value="3" v-model="ratings"/>
																<label for="${c}-stars" class="star">★</label>
																<input type="radio" id="${b}-stars" name="rating" value="2" v-model="ratings"/>
																<label for="${b}-stars" class="star">★</label>
																<input type="radio" id="${a}-star" name="rating" value="1" v-model="ratings" />
																<label for="${a}-star" class="star">★</label>
															</div>
										        		</div>
										        		<div class="col">
										        			<div class="result-star"></div>
										        		</div>
										        	</div>
													<textarea class="reviewTextarea" name="contents" id="" cols="50" rows="10"></textarea>
													<input type="hidden" name="product_index" value="${opList.product_index }" />
													<input type="hidden" name="member_index" value="${memberInfor.member_index }" />
													<input type="hidden" name="orderItem_index" value="${opList.orderItem_index }" />
													<p class="fs-6 lookup-fs-6">리뷰 썸네일 등록</p>
													<div class="input-group mb-3">
													  <input type="file" class="form-control" name="reviewImage" accept="image/png, image/PNG" id="inputGroupFile02" onchange="bannerPreviewImage(event, this, 'bannerRegisterForm');">
													</div>
													<div class="imageContainer border border-dark mb-3" style="min-height: 100px;">
			                                            <span class="position-absolute fw-bold fs-5 bannerMessage">이미지가 없습니다.</span>
			                                            <img src="" class="w-100">
			                                        </div>
											      </div>
											      <div class="modal-footer">
											        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
											        <button type="button" class="btn btn-primary" onclick="reviewSumbit(this, 'bannerRegisterForm');">작성완료</button>
											      </div>
											    </div>
											  </div>
											</div>
										</form>
												
									</c:if> 
									
						        </div>
						        </c:if> 
				        	</c:forEach>
			        	</div>
			        	
			        </c:forEach>
			        </c:if>
			        
			        <div class="h-100 p-2 bg-light border rounded-3 card-good">
			        	<ul>
			        		<li>주문취소는 배송준비중 상태의 주문단위로만 가능합니다.</li>
			        		<li>리뷰는 구매확정한 상품만 가능합니다.</li>
			        	</ul>
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