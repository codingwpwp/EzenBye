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
    <title>나의 리뷰</title>
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
	.nav5 {
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
				 
			        <p class="fs-6 lookup-fs-6">나의 리뷰</p>
			        <p class="fs-6 lookup-fs-6">${countList }개의 리뷰가 있습니다.</p>
			        <hr />
			        
			        <c:if test="${empty reviewList}">
			        <div class="lookupBorder">
			        	<p class="fs-6 lookup-fs-6">작성하신 리뷰가 없습니다.</p>
		        	</div>
			        </c:if>
			        
			        <c:if test="${!empty reviewList}">
			         <div class="main-table">
				        <table class="table table-hover align-middle">
						  <thead>
						    <tr>
						      <th scope="col">별점</th>
						      <th scope="col">상품</th>
						      <th scope="col">리뷰</th>
						      <th></th>
						      <th scope="col">작성일</th>
						    </tr>
						  </thead>
						  <tbody>
						  <c:forEach items="${reviewList }" var="list">
						  <c:set var="i" value="${i+1}" />
						    <tr>
						    <c:if test="${list.star_count eq 1}">
						    	<td class="fw-bold"><span class="review-starColor">★☆☆☆☆</span><br />매우 나빠요</td>
						    </c:if>
						    <c:if test="${list.star_count eq 2}">
						    	<td class="fw-bold"><span class="review-starColor">★★☆☆☆</span><br />나빠요</td>
						    </c:if>
						    <c:if test="${list.star_count eq 3}">
						    	<td class="fw-bold"><span class="review-starColor">★★★☆☆</span><br />보통</td>
						    </c:if>
						    <c:if test="${list.star_count eq 4}">
						    	<td class="fw-bold"><span class="review-starColor">★★★★☆</span><br />좋아요</td>
						    </c:if>
						    <c:if test="${list.star_count eq 5}">
						    	<td class="fw-bold"><span class="review-starColor">★★★★★</span><br />매우 좋아요</td>
						    </c:if>
						      
						      <td>
						      <span class="d-inline-block text-truncate" style="max-width: 150px;">
								  <c:if test="${list.del_YN eq 'N'}">
						          <a href="<%=request.getContextPath() %>/productView.do?product_index=${list.product_index }" class="productHref" onclick="productCookie(this)">
					        	  </c:if>
					        	  <c:if test="${list.del_YN eq 'Y'}">
					        	  <a href="javascript:alert('삭제된 상품입니다.');" class="productHref">
					        	  </c:if>
								  ${list.brand} ${list.product_name}
								  </a>
								  <input id="indexCookie" type="hidden" value="${list.product_index}" />
							  </span>
						      </td>
						      <td>
						      <span class="d-inline-block text-truncate" style="max-width: 150px;">
								  ${list.contents}
							  </span>
						      </td>
						      <td>
							      <a data-bs-toggle="collapse" href="#collapseExample${i}" role="button" aria-expanded="false" aria-controls="collapseExample">
								    <i class="bi bi-arrow-down" style="color: cornflowerblue;" data-toggle=”collapse” data-target=”#demo“></i>
								  </a>
						      </td>
						      <td class="main-table2">${list.review_date}</td>
						    </tr>
						    <tr>
						      <td colspan="4">
						      	<div class="collapse" id="collapseExample${i}">
						      		<div class="review-title">
						      			<c:if test="${list.del_YN eq 'N'}">
							        	<a href="<%=request.getContextPath() %>/productView.do?product_index=${list.product_index }" class="productHref" onclick="productCookie(this)">
							        	</c:if>
							        	<c:if test="${list.del_YN eq 'Y'}">
							        	<a href="javascript:alert('삭제된 상품입니다.');" class="productHref">
							        	</c:if>
						      			<img src="<%=request.getContextPath() %>/resources/img/${list.brand}/${list.middleSort}/${list.thumbnail_image}" class="img-thumbnail" alt="..." width="10%"> 상품명 : ${list.brand} ${list.product_name}
						      			</a>
						      			<input id="indexCookie" type="hidden" value="${list.product_index}" />
						      		</div>
						      		<c:if test="${!empty list.image}">	
									<img src="<%=request.getContextPath() %>/resources/img/review/${list.image}" class="img-thumbnail" alt="...">
									</c:if>
									<div class="review-content">
						      			${list.contents}
						      		</div>
								</div>
						      </td>
						    </tr>
						    </c:forEach>
						  </tbody>
						</table>
					</div>
					
					<nav aria-label="Page navigation example">
					  <ul class="pagination review-paging">
					  <!-- <부분 -->
					  <c:if test="${paging.startPage > 1}">
					  <li class="page-item">
					      <a class="page-link" href="<%=request.getContextPath() %>/mypage_review.do?nowPage=${paging.startPage - 1}" aria-label="Previous">
					        <span aria-hidden="true">&lt;</span>
					      </a>
					    </li>
					  </c:if>
					   
					  <c:if test="${paging.startPage <= 1}">
			  			<li class="page-item" style="visibility: hidden">
                               <a class="page-link" href="#" aria-label="Previous">
                                   <span aria-hidden="true">&lt;</span>
                               </a>
                           </li>
					  </c:if> 
					  
					  <!-- 각 페이지 -->
					  <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="a" step="1">
					  	<c:if test="${a != paging.nowPage}">
					  		<li class="page-item">
					  			<a class="page-link" href="<%=request.getContextPath() %>/mypage_review.do?nowPage=${a}">${a}</a>
					  		</li>
					  	</c:if>
					  	<c:if test="${a == paging.nowPage}">
					  		 <li class="page-item active" aria-current="page">
					  		 	<a class="page-link fw-bold" href="#">${a}</a>
					  		 </li>
					  	</c:if>
					  </c:forEach>
					   
				      <!-- >부분 -->
				      <c:if test="${paging.endPage != paging.lastPage}">
				      	<li class="page-item">
					      <a class="page-link" href="<%=request.getContextPath() %>/mypage_review.do?nowPage=${paging.endPage + 1}" aria-label="Next">
					        <span aria-hidden="true">&gt;</span>
					      </a>
					    </li>
				      </c:if>
				      <c:if test="${paging.startPage == paging.lastPage}">
				      	<li class="page-item" style="visibility: hidden">
                            <a class="page-link" href="#" aria-label="Next">
                                <span aria-hidden="true">&gt;</span>
                            </a>
                        </li>
				      </c:if>
					    
					  </ul>
					</nav>
					
					</c:if>
					
					<div class="h-100 p-2 bg-light border rounded-3 card-good">
			        	<ul>
			        		<li>후기는 주문배송조회 목록에서 구매확정을 한 이후에 등록할 수 있습니다.</li>
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