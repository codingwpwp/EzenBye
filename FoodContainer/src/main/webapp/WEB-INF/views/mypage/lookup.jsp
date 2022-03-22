<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/bootstrap.min.css" />
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
				 
			        <p class="fs-6 lookup-fs-6">주문배송조회</p>
			        <hr />
			        <div class="row">
			        	<div class="col-sm-3">
			        		<span>2022.3.15</span>
			        	</div>
			        	<div class="col-sm-3">
			        		<span>주문번호 : ADDF1325</span>
			        	</div>
			        	<div class="col-sm-3">
			        		<button type="button" class="btn btn-primary btn-sm" onclick="location.href='mypage_lookupView.do'">주문상세</button>
			        	</div>
			        	<div class="col-sm-3 findT">
			        		<a href="#"><span>배송조회</span></a>
			        	</div>
			        </div>
			        
			        <div class="h-100 p-2 bg-light border rounded-3 card-good">
			        	<div class="row">
			        		<div class="col-sm-4">
			        			<span>배송완료</span>
			        		</div>
			        		<div class="col-sm-8 number-good">
			        			<span>상품 주문번호 : DFSD5649</span>
			        		</div>
			        	</div>
			        	<div class="row">
			        		<div class="col-sm-3">
			        			<img src="<%=request.getContextPath() %>/resources/img/mypage/good.jpg" class="img-thumbnail" alt="...">
			        		</div>
			        		<div class="col-sm-8">
						    	<span>비비고 진한고기만두400g*2번들</span>
			        		</div>
			        	</div>
			        	
			        	<div class=row>
			        		<div class="col-sm-3"></div>
			        		<div class="col-sm-8"><span>4580원 | 5개</span></div>
			        	</div>
			        	
			        	<div class="d-grid gap-2 col-6 mx-auto">
						  <button class="btn btn-outline-secondary" type="button">구매확정</button>
						</div>
			        </div>
			        
			        <div class="row">
			        	<div class="col-sm-3">		        	
			        	</div>
			        	<div class="col-sm-6">			        		
			        	</div>
			        	<div class="col-sm-3 findT">
			        		<a href="#"><span>배송조회</span></a>
			        	</div>
			        </div>
			        <div class="h-100 p-2 bg-light border rounded-3 card-good">
			        	<div class="row">
			        		<div class="col-sm-4">
			        			<span>구매확정</span>
			        		</div>
			        		<div class="col-sm-8 number-good">
			        			<span>상품 주문번호 : DFSD5649</span>
			        		</div>
			        	</div>
			        	<div class="row">
			        		<div class="col-sm-3">
			        			<img src="<%=request.getContextPath() %>/resources/img/mypage/good.jpg" class="img-thumbnail" alt="...">
			        		</div>
			        		<div class="col-sm-8">
						    	<span>비비고 진한고기만두400g*2번들</span>
			        		</div>
			        	</div>
			        	
			        	<div class=row>
			        		<div class="col-sm-3"></div>
			        		<div class="col-sm-8"><span>4580원 | 5개</span></div>
			        	</div>
			        	
			        	<div class="d-grid gap-2 d-md-flex justify-content-md-end">			  
						  <button class="btn btn-outline-secondary" type="button" data-bs-toggle="modal" data-bs-target="#writeRivew">리뷰작성</button>
						</div>
						
						<form action="#">
							<div class="modal fade" id="writeRivew" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
							  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
							    <div class="modal-content">
							      <div class="modal-header">
							        <h5 class="modal-title" id="staticBackdropLabel">리뷰 작성</h5>
							        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							      </div>
							      <div class="modal-body">
							        <div class="row">
						        		<div class="col-sm-3">
						        			<img src="<%=request.getContextPath() %>/resources/img/mypage/good.jpg" class="img-thumbnail" alt="...">
						        		</div>
						        		<div class="col-sm-8">
									    	<span>비비고 진한고기만두400g*2번들</span>
						        		</div>
						        	</div>
						        	<p class="fs-6 lookup-fs-6">이 상품의 품질에 대해 얼마나 만족하시나요?</p>
						        	
						        	<div class="row">
						        		<div class="col">
						        			<div class="star-rating space-x-4">						        		
												<input type="radio" id="5-stars" name="rating" value="5" v-model="ratings"/>
												<label for="5-stars" class="star pr-4">★</label>
												<input type="radio" id="4-stars" name="rating" value="4" v-model="ratings"/>
												<label for="4-stars" class="star">★</label>
												<input type="radio" id="3-stars" name="rating" value="3" v-model="ratings"/>
												<label for="3-stars" class="star">★</label>
												<input type="radio" id="2-stars" name="rating" value="2" v-model="ratings"/>
												<label for="2-stars" class="star">★</label>
												<input type="radio" id="1-star" name="rating" value="1" v-model="ratings" />
												<label for="1-star" class="star">★</label>
											</div>
						        		</div>
						        		<div class="col">
						        			<div id="result-star"></div>
						        		</div>
						        	</div>
						        	
									<textarea class="reviewTextarea" name="content" id="" cols="50" rows="10" placeholder="내용을 입력해주세요."></textarea>
									<div class="input-group mb-3">
									  <input type="file" class="form-control" id="inputGroupFile02">
									  <label class="input-group-text" for="inputGroupFile02">Upload</label>
									</div>
							      </div>
							      <div class="modal-footer">
							        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
							        <button type="submit" class="btn btn-primary">작성완료</button>
							      </div>
							    </div>
							  </div>
							</div>
						</form>
						
			        </div>
			        
			        <div class="row">
			        	<div class="col-sm-3">
			        		<span>2022.3.15</span>
			        	</div>
			        	<div class="col-sm-3">
			        		<span>주문번호 : ADDF1325</span>
			        	</div>
			        	<div class="col-sm-3">
			        		<button type="button" class="btn btn-primary btn-sm">주문상세</button>
			        	</div>
			        	<div class="col-sm-3 findT">
			        		<a href="#"><span>배송조회</span></a>
			        	</div>
			        </div>
			        
			        <div class="h-100 p-2 bg-light border rounded-3 card-good">
			        	<div class="row">
			        		<div class="col-sm-4">
			        			<span>배송준비중</span>
			        		</div>
			        		<div class="col-sm-8 number-good">
			        			<span>상품 주문번호 : DFSD5649</span>
			        		</div>
			        	</div>
			        	<div class="row">
			        		<div class="col-sm-3">
			        			<img src="<%=request.getContextPath() %>/resources/img/mypage/good.jpg" class="img-thumbnail" alt="...">
			        		</div>
			        		<div class="col-sm-8">
						    	<span>비비고 진한고기만두400g*2번들</span>
			        		</div>
			        	</div>
			        	
			        	<div class=row>
			        		<div class="col-sm-3"></div>
			        		<div class="col-sm-8"><span>4580원 | 5개</span></div>
			        	</div>       
			        </div>
			        
			        <div class="d-grid gap-2 col-6 mx-auto">
					  <button class="btn btn-secondary cancle-btn" type="button" data-bs-toggle="modal" data-bs-target="#cancle-good">취소신청</button>
					</div>
					<form action="#">
							<div class="modal fade" id="cancle-good" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
							  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
							    <div class="modal-content">
							      <div class="modal-header">
							        <h5 class="modal-title" id="staticBackdropLabel">주문 취소</h5>
							        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							      </div>
							      <div class="modal-body">
						        	<p class="fs-6 lookup-fs-6">주문날짜 : </p>
						        	<p class="fs-6 lookup-fs-6">주문번호 : </p>
						        	<p class="fs-6 lookup-fs-6">주문한 상품 : </p>
						        	<p class="fs-6 lookup-fs-6">취소 사유를 입력해 주세요.</p>
						        	
									<textarea class="cancleTextarea" name="content" id="" cols="50" rows="10" placeholder="내용을 입력해주세요."></textarea>
									
							      </div>
							      <div class="modal-footer">
							        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
							        <button type="submit" class="btn btn-primary">상품취소</button>
							      </div>
							    </div>
							  </div>
							</div>
						</form>
			        
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