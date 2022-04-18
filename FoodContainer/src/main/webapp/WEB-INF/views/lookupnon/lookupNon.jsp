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
    <title>비회원 주문조회</title>
    <!-- css링크 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/base.css">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/lookupnon.css" />
	<script src="<%=request.getContextPath() %>/resources/js/jquery-3.6.0.min.js"></script>
	<script src="<%=request.getContextPath() %>/resources/js/lookupnon.js"></script>
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
                    
                </aside>
            </div>

            <!-- 메인 -->
            <div class="col-12 col-sm-9 col-md-10 col-lg-8">
                <article id="mainSection \">
                    <!-- 실질적인 메인 내용 -->
                    <div class="col-md-11">
				 
			        <p class="fs-6 lookupNon-fs6">비회원 주문조회</p>
			        <hr />
			        
			        <div class="row">
			        	<div class="col-sm-12 col-md-12 col-lg-5">
			        		<span class="good-date">${noMemberOrdersList.order_date}</span>
			        	</div>
			        	<div class="col-sm-12 col-md-12 col-lg-5">
			        		<span class="good-date">주문번호 : ${noMemberOrdersList.no_member_order_index}</span>
			        	</div>
			        	<div class="col-sm-12 col-lg-2 findT">
			        		<a href="#" class="link-info fw-bold"><span>배송조회</span></a>
			        	</div>
			        </div>
			        
			        <c:set var="totalPrice" value="0" />
			        <c:forEach items="${opList}" var="opList">
			        <c:if test="${noMemberOrdersList.no_member_order_index eq opList.no_member_order_index}"> 
			        <div class="h-100 p-2 bg-light border rounded-3 card-good">
			        	<div class="row">
			        		<div class="col-sm-4">
			        			<span class="fw-bold">${opList.order_status }</span>
			        		</div>
			        		<div class="col-sm-8 number-good">
			        			<span class="fw-bold">상품 주문번호 : ${opList.orderItem_index }</span>
			        		</div>
			        	</div>
			        	
			        	<c:if test="${opList.del_YN eq 'N'}">
			        	<a href="productView.do?product_index=${opList.product_index }" class="productHref">
			        	</c:if>
			        	<c:if test="${opList.del_YN eq 'Y'}">
			        	<a href="javascript:alert('삭제된 상품입니다.');" class="productHref">
			        	</c:if>
			        	<div class="row">
			        		<div class="col-sm-3">
			        			<img src="<%=request.getContextPath() %>/resources/img/${opList.brand}/${opList.middleSort}/${opList.thumbnail_image}" class="img-thumbnail" alt="...">
			        		</div>
			        		<div class="col-sm-8 d-flex align-items-start flex-column mb-3">
						    	<div class="mb-auto p-2">${opList.brand} ${opList.product_name}</div>
  								
  								<div class="p-2"><fmt:formatNumber value="${opList.price / opList.order_quantity }" pattern="#,###" />원 | ${opList.order_quantity }개</div>
  								<c:set var="totalPrice" value="${totalPrice + opList.price}" />
			        		
			        		</div>
			        	</div>
			        	</a>
			        	
			        </div>
			        </c:if>
			        </c:forEach>
			        
					<p class="fs-6 lookup-fs-6">결제정보</p>
			        <hr />
			        <div class="h-100 p-2 bg-light border rounded-3 card-good">
			        	<div><span class="fw-bold">상품가격 :</span> 
			        		<fmt:formatNumber value="${totalPrice}" pattern="#,###" />원
			        	</div>
			        	
			        	<div class="lookupView-infmoney"><span class="fw-bold">배송비 :</span> 
			        		<c:if test="${noMemberOrdersList.delivery_free_YN eq 'Y' }">
			        			없음
			        		</c:if>
			        		<c:if test="${noMemberOrdersList.delivery_free_YN eq 'N' }">
			        			<fmt:formatNumber value="3000" pattern="#,###" />원
			        		</c:if>
			        	</div>
			        	
			        	<div class="lookupView-infmoney"><span class="fw-bold">총 결제금액 :</span> <fmt:formatNumber value="${noMemberOrdersList.pay_price }" pattern="#,###" />원 </div>
			        </div>
			        
			        <p class="fs-6 lookup-fs-6">주문자정보</p>
			        <hr />
			        <div class="h-100 p-2 bg-light border rounded-3 card-good">
			        	<div><span class="fw-bold">주문자명 :</span> ${noMemberOrdersList.name} </div>
			        	<div class="lookupView-infmoney"><span class="fw-bold">연락처 :</span> ${noMemberOrdersList.phone} </div>
			        	<div class="lookupView-infmoney"><span class="fw-bold">이메일 :</span> ${noMemberOrdersList.email}</div>
			        </div>
			        
			        <p class="fs-6 lookup-fs-6">배송지정보</p>
			        <hr />
			        <div class="h-100 p-2 bg-light border rounded-3 card-good">
			        	<div><span class="fw-bold">받는분 :</span> ${noMemberOrdersList.reciever} </div>
			        	<div class="lookupView-infmoney"><span class="fw-bold">주소 :</span> ${noMemberOrdersList.address} </div>
			        	<div class="lookupView-infmoney"><span class="fw-bold">연락처 :</span> ${noMemberOrdersList.reciever_phone} </div>
			        	<div class="lookupView-infmoney"><span class="fw-bold">요청사항 :</span> ${noMemberOrdersList.request} </div>
			        </div>
			        
			        <div class="h-100 p-2 bg-light border rounded-3 card-good2">
			        	<ul>
			        		<li>주문취소는 배송준비중 상태의 주문단위로만 가능합니다.</li>
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