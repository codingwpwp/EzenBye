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
    <title>마이페이지</title>
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
                <article id="mainSection">
                    <!-- 실질적인 메인 내용 -->
                    <div class="col-md-11">
			        <div class="col-7 h-80 p-5 bg-secondary bg-gradient bg-opacity-25 border mx-auto rounded-3">
			          <p class="fs-2">${member.name }님</p>
			          	<div class="row point">
				          <div class="col-sm-8">
				          	<span class="text-point">포인트</span>
				          </div>
				          <div class="col-sm-4">
				          	<span class="number-point">${member.point }P</span>
				          </div>
			          	</div>
			          	<div class="row">
				          <div class="col-sm-8">
				          	<span class="text-point">할인쿠폰</span>
				          </div>
				          <div class="col-sm-4">
				          	<span class="number-point">${couponvo }장</span>
				          </div>
			          	</div>
			        </div>
			        
			        <p class="fs-6 lookup-fs-6">최근주문</p>
			        <hr />
			        <c:forEach items="${ordersList}" var="list">
			        	<div class="row">
				        	<div class="col-sm-12 col-md-12 col-lg-5">
				        		<span class="good-date">${list.order_date}</span>
				        	</div>
				        	<div class="col-sm-12 col-md-12 col-lg-5">
				        		<span class="good-date">주문번호 : ${list.member_order_index }</span>
				        	</div>
				        	<div class="col-sm-12 col-lg-2 findT">
				        		<a href="#" class="link-info"><span class="fw-bold">배송조회</span></a>
				        	</div>
				        </div>
				        
				        	<c:forEach items="${opList}" var="opList">
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
						        	<div class="row">
						        		<div class="col-sm-3">
						        			<img src="<%=request.getContextPath() %>/resources/img/${opList.brand}/${opList.middleSort}/${opList.thumbnail_image}" class="img-fluid img-thumbnail" alt="상품사진">
						        		</div>
						        		<div class="col-sm-8 d-flex align-items-start flex-column mb-3">
									    	<div class="mb-auto p-2">${opList.product_name}</div>
			  								<div class="p-2"><fmt:formatNumber value="${opList.origin_price }" pattern="#,###" />원 | ${opList.quantity }개</div>
						        		</div>
						        	</div>
						        	
						        	<div class="d-grid gap-2 col-6 mx-auto">
									  <button class="btn btn-outline-secondary" type="button">구매확정</button>
									</div>
						        </div>
						        </c:if> 
				        	</c:forEach>
			        	
			        </c:forEach>
			        
			        
			        
			        
			        <div class="row">
			        	<div class="col-sm-4 col-6">		        	
			        	</div>
			        	<div class="col-sm-5 col-6">			        		
			        	</div>
			        	<div class="col-sm-3 col-12 findT">
			        		<a href="#" class="link-info"><span class="fw-bold">배송조회</span></a>
			        	</div>
			        </div>
			        <div class="h-100 p-2 bg-light border rounded-3 card-good">
			        	<div class="row">
			        		<div class="col-sm-4">
			        			<span class="fw-bold">구매확정</span>
			        		</div>
			        		<div class="col-sm-8 number-good">
			        			<span class="fw-bold">상품 주문번호 : DFSD5649</span>
			        		</div>
			        	</div>
			        	<div class="row">
			        		<div class="col-sm-3">
			        			<img src="<%=request.getContextPath() %>/resources/img/mypage/good.jpg" class="img-thumbnail" alt="...">
			        		</div>
			        		<div class="col-sm-8 d-flex align-items-start flex-column mb-3">
						    	<div class="mb-auto p-2">비비고 진한고기만두400g*2번들</div>
  								<div class="p-2">4580원 | 5개</div>
			        		</div>
			        	</div>
			        	
			        	<div class="d-grid gap-2 col-6 mx-auto">
						  <button class="btn btn-outline-secondary" type="button">리뷰작성</button>
						</div>
			        </div>
			        
			        <p class="fs-6 lookup-fs-6">최근 문의내역</p>
			        <hr />
			        <div class="main-table">
				        <table class="table table-hover main-table2">
						  <thead>
						    <tr>
						      <th scope="col">답변상태</th>
						      <th scope="col">제목</th>
						      <th scope="col">유형</th>
						      <th scope="col">날짜</th>
						    </tr>
						  </thead>
						  <tbody>
						  <c:forEach items="${list}" var="list">
						    <tr>
						      <th scope="row">${list.progress }</th>
						      <td>${list.title }</td>
						      <td>${list.sort2 }</td>
						      <td>${list.write_date }</td>
						    </tr>
					      </c:forEach>
						  </tbody>
						</table>
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