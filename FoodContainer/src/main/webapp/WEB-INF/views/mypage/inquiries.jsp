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
    <title>문의내역</title>
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
	.nav7 {
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
				 
			        <p class="fs-6 lookup-fs-6">문의내역</p>
			        <p class="fs-6 lookup-fs-6">${countServiceCenter}개의 문의내역이 있습니다.</p>
			        <hr />
			        
			        <c:if test="${empty serviceCenterList}">
			        <div class="lookupBorder">
			        	<p class="fs-6 lookup-fs-6">문의하신 내역이 없습니다.</p>
		        	</div>
			        </c:if>
			        
			        <c:if test="${!empty serviceCenterList}">
			        <div class="main-table">
				        <table class="table table-hover coupon-table main-table2">
						  <thead>
						    <tr>
						      <th scope="col">답변상태</th>
						      <th scope="col">제목</th>
						      <th scope="col">날짜</th>
						    </tr>
						  </thead>
						  <tbody>
						  <c:forEach items="${serviceCenterList}" var="list">
						    <tr>
						      <c:if test="${list.progress eq '처리완료'}">
						      <th scope="row">${list.progress}</th>
						      </c:if>
						      <c:if test="${list.progress eq '처리중'}">
						      <th scope="row" style="color: red;">${list.progress}</th>
						      </c:if>
						      <td><a class="centerHref fw-bold" href="<%=request.getContextPath() %>/serviceCenter_view.do?serviceCenter_index=${list.serviceCenter_index}">[${list.sort2}] ${list.title}</a></td>
						      <td class="fw-bold">${list.write_date}</td>
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
					      <a class="page-link" href="<%=request.getContextPath() %>/mypage_inquiries.do?nowPage=${paging.startPage - 1}" aria-label="Previous">
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
					  <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i" step="1">
					  	<c:if test="${i != paging.nowPage}">
					  		<li class="page-item">
					  			<a class="page-link" href="<%=request.getContextPath() %>/mypage_inquiries.do?nowPage=${i}">${i}</a>
					  		</li>
					  	</c:if>
					  	<c:if test="${i == paging.nowPage}">
					  		 <li class="page-item active" aria-current="page">
					  		 	<a class="page-link fw-bold" href="#">${i}</a>
					  		 </li>
					  	</c:if>
					  </c:forEach>
					   
				      <!-- >부분 -->
				      <c:if test="${paging.endPage != paging.lastPage}">
				      	<li class="page-item">
					      <a class="page-link" href="<%=request.getContextPath() %>/mypage_inquiries.do?nowPage=${paging.endPage + 1}" aria-label="Next">
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
			        		<li>고객센터에서 문의하실 수 있습니다.</li>
			        		<li>제목을 누르시면 답변페이지로 이동하실 수 있습니다.</li>
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