<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>주문 상세조회</title>
    <!-- css링크 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/base.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/adminPage.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/adminPage_leftMenu.css">
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
				<%@include file="/WEB-INF/views/adminPage/nav_leftMenu.jsp"%>
            </div>

			<%@include file="/WEB-INF/views/base/nav.jsp"%>

        </div>
    </nav>

    <!-- 섹션 -->
    <section class="mt-1">
        <div class="row">

            <!-- 왼쪽 사이드메뉴 -->
            <div class="col-lg-2 d-none d-lg-block">
               <%@include file="/WEB-INF/views/adminPage/leftMenu.jsp"%>
            </div>

            <!-- 메인 -->
            <div class="col-12 col-sm-9 col-md-10 col-lg-8">
                <article id="mainSection">
                    <div class="col-md-11">
    
                        <!-- 헤딩 : 상세 주문 정보 -->
                        <div class="fs-5 my-2 fw-bold">
                            ${order.id}님의 상세주문정보
                        </div>
                        <hr>

                        <!-- 날짜&주문번호 -->
                        <div class="row fs-4 fw-bold mb-3">
                            <div class="col-12 col-md-5 mb-3 mb-md-0">
                                <span>${fn:substring(order.order_date, 0,16)}</span>
                            </div>
                            <div class="col-12 col-md-7 mb-3 mb-md-0">
                                <span class="float-sm-end">주문번호 : ${order.member_order_index}</span>
                            </div>
                        </div>
                        
                        <!-- 상품가격&포인트 -->
                        <c:set var="totalPrice" value="0"/>
                        <c:set var="totalPoint" value="0"/>
                        <!-- 각 주문들 -->
                        <c:forEach items="${opList}" var="list">
							<div class="findT">
	                            <a href="#"><span>배송조회</span></a>
	                        </div>
	                        
	                        <div class="h-100 p-2 bg-light border rounded-3 card-good fw-bold">
	
	                            <div class="row">
	                                <div class="col-sm-4">
	                                    <span class="orderStatus">${list.order_status}</span>
	                                </div>
	                                <div class="col-sm-8 number-good">
	                                    <span>상품 주문번호 : ${list.orderItem_index}</span>
	                                </div>
	                            </div>
	
	                            <div class="row">
	                                <div class="col-sm-3">
	                                    <img src="<%=request.getContextPath()%>/resources/img/${list.brand}/${list.middleSort}/${list.thumbnail_image}" class="img-thumbnail" alt="${list.product_name}">
	                                </div>
	                                <div class="col-sm-6 col-md-7 d-flex align-items-start flex-column mb-3">
	                                    <div class="mb-auto p-2">${list.product_name}</div>
	                                    <div class="p-2"><fmt:formatNumber value="${list.price}" pattern="#,###"/>원 | ${list.order_quantity}개</div>
	                                    <c:set var="totalPrice" value="${totalPrice + (list.price * list.order_quantity)}" />
	                                    <c:set var="totalPoint" value="${totalPoint + list.point}" />
	                                </div>
	                                <div class="col-sm-3 col-md-2 d-flex justify-content-center align-items-center p-0">
	                                	<c:if test="${list.order_status eq '배송준비중'}">
	                                		<button class="btn btn-primary btn-sm p-1" onclick="deliveryOk('${list.orderItem_index}', this)">배송완료처리</button>
	                                	</c:if>
	                                </div>
	                            </div>
	                            
	                        </div>
                        </c:forEach>

				        <p class="fs-5 lookup-fs-6">결제정보</p>
				        
				        <hr>
				        
				        <div class="h-100 p-2 bg-light border rounded-3 card-good fw-bold">
				        	<div><span class="fw-bold">상품가격 :</span>
				        		<fmt:formatNumber value="${totalPrice}" pattern="#,###" />원
				        	</div>
				        	
				        	<div class="lookupView-infmoney"><span class="fw-bold">배송비 :</span>
				        		<c:if test="${order.delivery_free_YN eq 'Y'}">
				        			없음
				        		</c:if>
				        		<c:if test="${order.delivery_free_YN eq 'N'}">
				        			<fmt:formatNumber value="3000" pattern="#,###" />원
				        		</c:if>
				        	 </div>
				        	 
				        	<div class="lookupView-infmoney"><span class="fw-bold">쿠폰적용 :</span>
				        	 	<c:if test="${orderCoupon eq null}">
				        	 		없음
			        	 		</c:if>
			        	 		<c:if test="${orderCoupon ne null}">
			        	 			${orderCoupon.coupon_title}
			        	 		</c:if>
				        	 </div>
				        	 
				        	 <div class="lookupView-infmoney"><span class="fw-bold">포인트 사용 :</span> 
				        	 	<fmt:formatNumber value="${order.used_point}" pattern="#,###"/>p
		        	    	 </div>
				        	 
				        	 <div class="lookupView-infmoney">
				        	 	<span class="fw-bold">총 결제금액 :</span> <fmt:formatNumber value="${order.pay_price}" pattern="#,###"/>원
				        	 	<span class="fw-bold fs-5">/</span> 
				        	 	<span class="fw-bold">예상 포인트 적립 :</span> <fmt:formatNumber value="${totalPoint}" pattern="#,###"/>p
				        	 </div>
				        </div>
				        
				        <p class="fs-5 lookup-fs-6">배송지정보</p>
				        
				        <hr>
				        
				        <div class="h-100 p-2 bg-light border rounded-3 card-good fw-bold">
				        	<div><span class="fw-bold">받는분 :</span> ${order.reciever}</div>
				        	<div class="lookupView-infmoney"><span class="fw-bold">주소 :</span> ${order.address}</div>
				        	<div class="lookupView-infmoney"><span class="fw-bold">연락처 :</span> ${order.phone}</div>
				        	<div class="lookupView-infmoney"><span class="fw-bold">요청사항 :</span> ${order.request}</div>
				        </div>
				       
	    			    <div class="d-grid gap-2 col-4 mx-auto lookupView-btn">
						  <button type="button" class="btn btn-primary fw-bold" onclick="location.href='member_order_list.do?searchValue=${searchValue}&nowPage=${nowPage}'">주문목록으로</button>
						</div>

                    </div>
                </article>
            </div>

            <!-- 오른쪽 사이드메뉴 -->
            <div class="col-sm-3 col-md-2 col-lg-2 d-none d-sm-block">
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
	<script src="<%=request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/base.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/adminPage.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/adminPage_leftMenu.js"></script>
    <script type="text/javascript">
    window.onpageshow = function(event) {
        if ( event.persisted || (window.performance && window.performance.navigation.type == 2)) {
            location.reload();
        } 
    }
    </script>
</body>
</html>