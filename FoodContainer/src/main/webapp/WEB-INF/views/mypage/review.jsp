<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/bootstrap.min.css" />
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
    <nav class="navbar-expand-lg navbar-light bg-light fw-bold">
        <%@include file="/WEB-INF/views/base/nav.jsp"%>
    </nav>

    <!-- 섹션 -->
    <section class="mt-3">
        <div class="row">

            <!-- 왼쪽 사이드메뉴 -->
            <div class="col-2 pe-0" id="leftDiv">
                <aside id="leftAside">
                    <!-- 실질적인 왼쪽 사이드메뉴 내용 -->
                    <%@include file = "mypagenav.jsp" %>
                </aside>
            </div>

            <!-- 메인 -->
            <div class="col-8">
                <article id="mainSection \">
                    <!-- 실질적인 메인 내용 -->
                    <div class="col-md-11">
				 
			        <p class="fs-6 lookup-fs-6">나의 리뷰</p>
			        <p class="fs-6 lookup-fs-6">3개의 리뷰가 있습니다.</p>
			        <hr />
			        
			         <div class="table-responsive">
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
						    <tr>
						      <td>★★★★★<br />매우좋아요</td>
						      <td>
						      <span class="d-inline-block text-truncate" style="max-width: 150px;">
								  비비고 진한고기만두400g*2번들
							  </span>
						      </td>
						      <td>
						      <span class="d-inline-block text-truncate" style="max-width: 150px;">
								  불량이에요 제품이 터졌네요 ㅡㅡ
							  </span>
						      </td>
						      <td>
							      <a data-bs-toggle="collapse" href="#collapseExample1" role="button" aria-expanded="false" aria-controls="collapseExample">
								    <i class="bi bi-arrow-down" style="color: cornflowerblue;" data-toggle=”collapse” data-target=”#demo“></i>
								  </a>
						      </td>
						      <td>2022-01-26</td>
						    </tr>
						    <tr>
						      <td colspan="4">
						      	<div class="collapse" id="collapseExample1">
						      		<div class="review-title">
						      			<img src="<%=request.getContextPath() %>/resources/img/mypage/good.jpg" class="img-thumbnail" alt="..." width="10%"> 상품명 : 비비고 진한고기만두400g*2번들
						      		</div>	
									<img src="<%=request.getContextPath() %>/resources/img/mypage/good.jpg" class="img-thumbnail" alt="...">
									<div class="review-content">
						      			불량이에요 제품이 터졌네요 ㅡㅡ
						      		</div>
								</div>
						      </td>
						    </tr>
						    <tr>
						      <td>★★★★★<br />매우좋아요</td>
						      <td>
						      <span class="d-inline-block text-truncate" style="max-width: 150px;">
								  비비고 진한고기만두400g*2번들
							  </span>
						      </td>
						      <td>
						      <span class="d-inline-block text-truncate" style="max-width: 150px;">
								  불량이에요 제품이 터졌네요 ㅡㅡ
							  </span>
						      </td>
						      <td>
							      <a data-bs-toggle="collapse" href="#collapseExample2" role="button" aria-expanded="false" aria-controls="collapseExample">
								    <i class="bi bi-arrow-down" style="color: cornflowerblue;" data-toggle=”collapse” data-target=”#demo“></i>
								  </a>
						      </td>
						      <td>2022-01-26</td>
						    </tr>
						    <tr>
						      <td colspan="4">
						      	<div class="collapse" id="collapseExample2">
						      		<div class="review-title">
						      			<img src="<%=request.getContextPath() %>/resources/img/mypage/good.jpg" class="img-thumbnail" alt="..." width="10%"> 상품명 : 비비고 진한고기만두400g*2번들 
						      		</div>	
									<img src="<%=request.getContextPath() %>/resources/img/mypage/good.jpg" class="img-thumbnail" alt="...">
									<div class="review-content">
						      			불량이에요 제품이 터졌네요 ㅡㅡ
						      		</div>
								</div>
						      </td>
						    </tr>
						    <tr>
						      <td>★★★★★<br />매우좋아요</td>
						      <td>
						      <span class="d-inline-block text-truncate" style="max-width: 150px;">
								  비비고 진한고기만두400g*2번들
							  </span>
						      </td>
						      <td>
						      <span class="d-inline-block text-truncate" style="max-width: 150px;">
								  불량이에요 제품이 터졌네요 ㅡㅡ
							  </span>
						      </td>
						      <td>
							      <a data-bs-toggle="collapse" href="#collapseExample3" role="button" aria-expanded="false" aria-controls="collapseExample">
								    <i class="bi bi-arrow-down" style="color: cornflowerblue;" data-toggle=”collapse” data-target=”#demo“></i>
								  </a>
						      </td>
						      <td>2022-01-26</td>
						    </tr>
						    <tr>
						      <td colspan="4">
						      	<div class="collapse" id="collapseExample3">
						      		<div class="review-title">
						      			<img src="<%=request.getContextPath() %>/resources/img/mypage/good.jpg" class="img-thumbnail" alt="..." width="10%"> 상품명 : 비비고 진한고기만두400g*2번들
						      		</div>	
									<img src="<%=request.getContextPath() %>/resources/img/mypage/good.jpg" class="img-thumbnail" alt="...">
									<div class="review-content">
						      			불량이에요 제품이 터졌네요 ㅡㅡ
						      		</div>
								</div>
						      </td>
						    </tr>
						  </tbody>
						</table>
					</div>
					
					<nav aria-label="Page navigation example">
					  <ul class="pagination review-paging">
					    <li class="page-item">
					      <a class="page-link" href="#" aria-label="Previous">
					        <span aria-hidden="true">&laquo;</span>
					      </a>
					    </li>
					    <li class="page-item"><a class="page-link" href="#">1</a></li>
					    <li class="page-item"><a class="page-link" href="#">2</a></li>
					    <li class="page-item"><a class="page-link" href="#">3</a></li>
					    <li class="page-item">
					      <a class="page-link" href="#" aria-label="Next">
					        <span aria-hidden="true">&raquo;</span>
					      </a>
					    </li>
					  </ul>
					</nav>
					
					<div class="h-100 p-2 bg-light border rounded-3 card-good">
			        	<ul>
			        		<li>후기는 주문배송조회 목록에서 구매확정을 한 이후에 등록할 수 있습니다.</li>
			        	</ul>
			        </div> 
			        			        		        
      			</div>
                </article>
            </div>

            <!-- 오른쪽 사이드메뉴 -->
            <div class="col-2 d-none d-sm-block">
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