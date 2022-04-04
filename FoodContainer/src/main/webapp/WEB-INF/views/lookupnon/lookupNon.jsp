<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			        	<div class="col-sm-4 col-6">
			        		<span class="good-date">2022.3.15</span>
			        	</div>
			        	<div class="col-sm-5 col-6">
			        		<span class="good-date">주문번호 : ADDF1325</span>
			        	</div>
			        	<div class="col-sm-3 col-12 findT">
			        		<a href="#" class="link-info fw-bold"><span>배송조회</span></a>
			        	</div>
			        </div>
			        
			        <div class="h-100 p-2 bg-light border rounded-3 card-good">
			        	<div class="row">
			        		<div class="col-sm-4">
			        			<span class="fw-bold">배송준비중</span>
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
			        </div>
			        
			        <div class="row">
			        	<div class="col-sm-3">
			        		
			        	</div>
			        	<div class="col-sm-6">
			        		
			        	</div>
			        	<div class="col-sm-3 findT">
			        		<a href="#" class="link-info fw-bold"><span>배송조회</span></a>
			        	</div>
			        </div>
			        
			        <div class="h-100 p-2 bg-light border rounded-3 card-good">
			        	<div class="row">
			        		<div class="col-sm-4">
			        			<span class="fw-bold">배송준비중</span>
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
			        </div>
			        
			        <div class="row">
			        	<div class="col-sm-3">
			        		
			        	</div>
			        	<div class="col-sm-6">
			        		
			        	</div>
			        	<div class="col-sm-3 findT">
			        		<a href="#" class="link-info fw-bold"><span>배송조회</span></a>
			        	</div>
			        </div>
			        
			        <div class="h-100 p-2 bg-light border rounded-3 card-good">
			        	<div class="row">
			        		<div class="col-sm-4">
			        			<span class="fw-bold">배송준비중</span>
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
			        </div>
			        
			        <div class="d-grid gap-2 col-5 mx-auto">
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
					
					<p class="fs-6 lookup-fs-6">결제정보</p>
			        <hr />
			        <div class="h-100 p-2 bg-light border rounded-3 card-good">
			        	<div><span class="fw-bold">상품가격 :</span> </div>
			        	<div class="lookupView-infmoney"><span class="fw-bold">배송비 :</span> </div>
			        	<div class="lookupView-infmoney"><span class="fw-bold">할인가격 :</span> </div>
			        	<div class="lookupView-infmoney"><span class="fw-bold">총 결제금액 :</span> </div>
			        </div>
			        
			        <p class="fs-6 lookup-fs-6">주문자정보</p>
			        <hr />
			        <div class="h-100 p-2 bg-light border rounded-3 card-good">
			        	<div><span class="fw-bold">주문자명 :</span> </div>
			        	<div class="lookupView-infmoney"><span class="fw-bold">연락처 :</span> </div>
			        	<div class="lookupView-infmoney"><span class="fw-bold">이메일 :</span> </div>
			        </div>
			        
			        <p class="fs-6 lookup-fs-6">배송지정보</p>
			        <hr />
			        <div class="h-100 p-2 bg-light border rounded-3 card-good">
			        	<div><span class="fw-bold">받는분 :</span> </div>
			        	<div class="lookupView-infmoney"><span class="fw-bold">주소 :</span> </div>
			        	<div class="lookupView-infmoney"><span class="fw-bold">연락처 :</span> 010 - 1234 - 5678 </div>
			        	<div class="lookupView-infmoney"><span class="fw-bold">요청사항 :</span> </div>
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