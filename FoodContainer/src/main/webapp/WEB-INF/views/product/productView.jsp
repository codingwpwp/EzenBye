<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Food Container-상품상세보기</title>
    <!-- css링크 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/base.css">
    <link href="<%=request.getContextPath()%>/resources/css/index.css" rel="stylesheet">
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
                   
                </aside>
            </div>

            <!-- 메인 -->
            <div class="col-8">
                <article id="mainSection">
                
                	<!-- view 상단 -->
                	<div class="pViewCard">
				      <div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
				        <div class="col-auto d-lg-block viewStarM">
				        	<img src="<%=request.getContextPath()%>/resources/img/CJ/컵밥,햇반/2.jpg" alt="d" class="img-fluid viewImg">
				        	<div>
				        		<span class="viewStar">평점 : 
				        		<span class="fs-4 ">
				        			<i class="bi bi-star-fill"></i>
				        			<i class="bi bi-star-fill"></i>
				        			<i class="bi bi-star-fill"></i>
				        			<i class="bi bi-star-fill"></i>
				        			<i class="bi bi-star"></i>
				        		</span>
				        		</span>
				        	</div>
				        </div>
				        <div class="col p-4 d-flex flex-column position-static">
				          <strong class="d-inline-block mb-2 text-danger">[인기]</strong>
				          <p class="mb-0">[CJ] 햇반/컵반 버터장조림 비빔밥</p>
				          <hr>
				          <h3 class="viewPrice">10,000<small>원</small></h3>
				          <div class="text-muted">포인트 적립 1%</div>
				          <hr>
				          <p class="card-text mdName">[CJ] 햇반/컵반 버터장조림 비빔밥 <span class="mdPrice">10,000원</span></p>
				          <p class="card-text mb-auto productNum fs-4"><i class="bi bi-dash-square-fill" onclick="minusFn(this)"></i> 1 <i class="bi bi-plus-square-fill" onclick="plusFn(this)"></i></p>
				          <div><span class="fs-5 totalPrice">합계 : <span class="fs-3">10,000원</span></span></div>
				          <div class="d-flex justify-content-evenly">
					          <button class="viewButton btn btn-outline-success me-2">장바구니 담기</button>
					          <button class="viewButton btn btn-success me-2">바로구매</button>
				          </div>
				        </div>
				      </div>
				    </div>
				    <!-- subMenu -->
				    <div class="subMenuGroup">
					  <input type="radio" class="subMenuCheck" name="subRadio" id="subRadio1" onclick="subRadio1()">
					  <label class="subMenuButton" for="subRadio1">상세 정보</label>
					
					  <input type="radio" class="subMenuCheck" name="subRadio" id="subRadio2" onclick="subRadio2()">
					  <label class="subMenuButton" for="subRadio2">배송 정보</label>
					
					  <input type="radio" class="btn-check" name="subRadio" id="subRadio3" onclick="subRadio3()">
					  <label class="subMenuButton" for="subRadio3">취소 규정</label>
					  
					  <input type="radio" class="subMenuCheck" name="subRadio" id="subRadio4" onclick="subRadio4()">
					  <label class="subMenuButton" for="subRadio4">리뷰</label>
					</div>
					
					<!-- 펼치기 -->
					<div class="unfold">
						<!-- 상세페이지 -->
						<div class="d-flex justify-content-center" id="pView">
							<img src="<%=request.getContextPath()%>/resources/img/CJ/볶음밥/1_1.jpg" alt="상세페이지" class="img-fluid">
						</div>
						
						<!-- 배송정보 -->
						<div class="d-flex justify-content-center" id="pDelivery">
							<img src="<%=request.getContextPath()%>/resources/img/배송.png" alt="배송안내" class="img-fluid">
						</div>
					
						<!-- 취소 규정 -->
						<div class="d-flex justify-content-center" id="pCancel">
							<img src="<%=request.getContextPath()%>/resources/img/취소.png" alt="취소규정" class="img-fluid">
						</div>
					   
					</div>
					    <!-- 상품 더보기 버튼 -->
					    <div class="plusView" onclick="unfold()">
					    	+ 자세히보기
					    </div>
					
					<!-- 리뷰 -->
					<div id="review">
					
					
						<div class="fs-2" id="reviewTop">리뷰</div>
						<table id="reviewTable" class="table table-sm">
							<thead>
								<tr>
									<th scope="col">별점</th>
									<th scope="col">리뷰</th>
									<th scope="col">닉네임</th>
									<th scope="col">작성일</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>
										<span>
									    	<i class="bi bi-star-fill"></i>
							        		<i class="bi bi-star-fill"></i>
							        		<i class="bi bi-star-fill"></i>
							        		<i class="bi bi-star-fill"></i>
							        		<i class="bi bi-star"></i>
							        		<br>
							        		좋음
									    </span>
									</td>
									<td class="reviewContent">
										<div class="row">
											<div class="reViewImg col-3 align-self-center">
												<img src="<%=request.getContextPath()%>/resources/img/로고.png" class="img-fluid">
											</div>
											<div class="reviewTitle align-self-center col" data-bs-toggle="collapse" href="#reviewExtend0" role="button" aria-expanded="false" aria-controls="collapseExample">
												좋아요
											</div>
											<div class="col-1 align-self-center">
												<i class="bi bi-caret-down reviewDown" data-bs-toggle="collapse" href="#reviewExtend0" role="button" aria-expanded="false" aria-controls="collapseExample"></i>
											</div>
										</div>
										<div class="collapse reviewCard" id="reviewExtend0">
											<img src="<%=request.getContextPath()%>/resources/img/로고.png" class="img-fluid reviewCardImg">
											<div>좋아요</div>
										</div>
									</td>
									<td>홍길동</td>
									<td>2022-03-22</td>
								</tr>
								<tr>
									<td>
										<span>
									    	<i class="bi bi-star-fill"></i>
							        		<i class="bi bi-star-fill"></i>
							        		<i class="bi bi-star-fill"></i>
							        		<i class="bi bi-star-fill"></i>
							        		<i class="bi bi-star"></i>
							        		<br>
							        		좋음
									    </span>
									</td>
									<td id="reviewContent">
										<div class="row">
											<div class="reViewImg col-3 align-self-center">
											</div>
											<div class="reviewTitle align-self-center col">
												좋아요
											</div>
											<div class="col-1 align-self-center">
											</div>
										</div>
									</td>
									<td>홍길동</td>
									<td>2022-03-22</td>
								</tr>
								<tr>
									<td>
										<span>
									    	<i class="bi bi-star-fill"></i>
							        		<i class="bi bi-star-fill"></i>
							        		<i class="bi bi-star-fill"></i>
							        		<i class="bi bi-star-fill"></i>
							        		<i class="bi bi-star"></i>
							        		<br>
							        		좋음
									    </span>
									</td>
									<td class="reviewContent">
										<div class="row">
											<div class="reViewImg col-3 align-self-center">
												<img src="<%=request.getContextPath()%>/resources/img/로고.png" class="img-fluid">
											</div>
											<div class="reviewTitle align-self-center col" data-bs-toggle="collapse" href="#reviewExtend1" role="button" aria-expanded="false" aria-controls="collapseExample">
												좋아요
											</div>
											<div class="col-1 align-self-center">
												<i class="bi bi-caret-down reviewDown" data-bs-toggle="collapse" href="#reviewExtend1" role="button" aria-expanded="false" aria-controls="collapseExample"></i>
											</div>
										</div>
										<div class="collapse reviewCard" id="reviewExtend1">
											<img src="<%=request.getContextPath()%>/resources/img/로고.png" class="img-fluid reviewCardImg">
											<br>
											<div>좋아요</div>
										</div>
									</td>
									<td>홍길동</td>
									<td>2022-03-22</td>
								</tr>
								<tr>
									<td>
										<span>
									    	<i class="bi bi-star-fill"></i>
							        		<i class="bi bi-star-fill"></i>
							        		<i class="bi bi-star-fill"></i>
							        		<i class="bi bi-star-fill"></i>
							        		<i class="bi bi-star"></i>
							        		<br>
							        		좋음
									    </span>
									</td>
									<td id="reviewContent">
										<div class="row">
											<div class="reViewImg col-3 align-self-center">
											</div>
											<div class="reviewTitle align-self-center col">
												좋아요
											</div>
											<div class="col-1 align-self-center">
											</div>
										</div>
									</td>
									<td>홍길동</td>
									<td>2022-03-22</td>
								</tr>
								<tr>
									<td>
										<span>
									    	<i class="bi bi-star-fill"></i>
							        		<i class="bi bi-star-fill"></i>
							        		<i class="bi bi-star-fill"></i>
							        		<i class="bi bi-star-fill"></i>
							        		<i class="bi bi-star"></i>
							        		<br>
							        		좋음
									    </span>
									</td>
									<td class="reviewContent">
										<div class="row">
											<div class="reViewImg col-3 align-self-center">
												<img src="<%=request.getContextPath()%>/resources/img/로고.png" class="img-fluid">
											</div>
											<div class="reviewTitle align-self-center col" data-bs-toggle="collapse" href="#reviewExtend2" role="button" aria-expanded="false" aria-controls="collapseExample">
												좋아요
											</div>
											<div class="col-1 align-self-center">
												<i class="bi bi-caret-down reviewDown" data-bs-toggle="collapse" href="#reviewExtend2" role="button" aria-expanded="false" aria-controls="collapseExample"></i>
											</div>
										</div>
										<div class="collapse reviewCard" id="reviewExtend2">
											<img src="<%=request.getContextPath()%>/resources/img/로고.png" class="img-fluid reviewCardImg">
											<br>
											<div>좋아요</div>
										</div>
									</td>
									<td>홍길동</td>
									<td>2022-03-22</td>
								</tr>
							</tbody>
						</table>
						
						
						
						<!-- 리뷰 모바일 -->
						<table id="reviewTableM" class="table table-sm">
							<thead>
								<tr>
									<th>리뷰</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>
										<div>
											<img src="<%=request.getContextPath()%>/resources/img/로고.png" class="img-fluid">
										</div>
										<div>
											<span>홍길동 | 22.03.24</span>
											<div>
												<i class="bi bi-star-fill"></i>
								        		<i class="bi bi-star-fill"></i>
								        		<i class="bi bi-star-fill"></i>
								        		<i class="bi bi-star-fill"></i>
								        		<i class="bi bi-star"></i>
											</div>
											<div>
												좋아요
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>
										<div>
										</div>
										<div>
											<span>홍길동 | 22.03.24</span>
											<div>
												<i class="bi bi-star-fill"></i>
								        		<i class="bi bi-star-fill"></i>
								        		<i class="bi bi-star-fill"></i>
								        		<i class="bi bi-star-fill"></i>
								        		<i class="bi bi-star"></i>
											</div>
											<div>
												좋아요
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>
										<div>
											<img src="<%=request.getContextPath()%>/resources/img/로고.png" class="img-fluid">
										</div>
										<div>
											<span>홍길동 | 22.03.24</span>
											<div>
												<i class="bi bi-star-fill"></i>
								        		<i class="bi bi-star-fill"></i>
								        		<i class="bi bi-star-fill"></i>
								        		<i class="bi bi-star-fill"></i>
								        		<i class="bi bi-star"></i>
											</div>
											<div>
												좋아요
											</div>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
						
						
						
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
    <script src="<%=request.getContextPath()%>/resources/js/base.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/index.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/productView.js"></script>
</body>
</html>