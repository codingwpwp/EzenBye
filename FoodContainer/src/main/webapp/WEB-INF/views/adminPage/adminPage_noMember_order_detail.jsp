<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Food Container</title>
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
                            홍길동님의 상세주문정보
                        </div>
                        <hr>
                        
                        <!-- 날짜&주문번호 -->
                        <div class="row fs-4 fw-bold">
                            <div class="col-sm-3 col-5">
                                <span>2022.3.15 12:30</span>
                            </div>
                            <div class="col-sm-6 col-7">
                                <span>주문번호 : ADDF1325</span>
                            </div>
                        </div>

                        <!-- 각 주문들 -->
                        <div class="findT">
                            <a href="#"><span>배송조회</span></a>
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
                                    <img src="<%=request.getContextPath()%>/resources/img/good.png" class="img-thumbnail" alt="...">
                                </div>
                                <div class="col-sm-8 d-flex align-items-start flex-column mb-3">
                                    <div class="mb-auto p-2">비비고 진한고기만두400g*2번들</div>
                                    <div class="p-2">4580원 | 5개</div>
                                </div>
                            </div>
                            
                        </div>
                        
                        <div class="row">
                            <div class="col-sm-3"></div>
                            <div class="col-sm-6"></div>
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
                                    <img src="<%=request.getContextPath()%>/resources/img/good.png" class="img-thumbnail" alt="...">
                                </div>
                                <div class="col-sm-8 d-flex align-items-start flex-column mb-3">
                                    <div class="mb-auto p-2">비비고 진한고기만두400g*2번들</div>
                                    <div class="p-2">4580원 | 5개</div>
                                </div>
                            </div>

                        </div>
                        
                        <div class="row">
                            <div class="col-sm-3"></div>
                            <div class="col-sm-6"></div>
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
                                    <img src="<%=request.getContextPath()%>/resources/img/good.png" class="img-thumbnail" alt="...">
                                </div>
                                <div class="col-sm-8 d-flex align-items-start flex-column mb-3">
                                    <div class="mb-auto p-2">비비고 진한고기만두400g*2번들</div>
                                    <div class="p-2">4580원 | 5개</div>
                                </div>
                            </div>

                        </div>
                        
                        <!-- 헤딩 : 결제 정보 -->
                        <div class="fs-5 my-2 fw-bold">
                            결제 정보
                        </div>
                        <hr>

                        <!-- 결제 정보 내용 -->
                        <div class="h-100 p-2 bg-light border rounded-3 card-good">
                            <div>상품가격 : </div>
                            <div class="lookupView-infmoney">배송비 : </div>
                            <div class="lookupView-infmoney">총 결제금액 : </div>
                        </div>
                        
                        <!-- 헤딩 : 주문자 정보 -->
                        <div class="fs-6 lookup-fs-6">주문자정보</div>
                        <hr>

                        <!-- 주문자 정보 내용 -->
                        <div class="h-100 p-2 bg-light border rounded-3 card-good">
                            <div>주문자명 : </div>
                            <div class="lookupView-infmoney">연락처 : </div>
                            <div class="lookupView-infmoney">이메일 : </div>
                        </div>
                        
                        <!-- 헤딩 : 배송지 정보 -->
                        <div class="fs-6 lookup-fs-6">배송지정보</div>
                        <hr>

                        <!-- 배송지 정보 내용 -->
                        <div class="h-100 p-2 bg-light border rounded-3 card-good">
                            <div>받는분 : </div>
                            <div class="lookupView-infmoney">주소 : </div>
                            <div class="lookupView-infmoney">연락처 : 010 - 1234 - 5678 </div>
                            <div class="lookupView-infmoney">요청사항 : </div>
                        </div>
                        
                        <!-- 뒤로가는 버튼 -->
                        <div class="d-grid gap-2 col-4 mx-auto lookupView-btn">
                            <button class="btn btn-secondary" type="button">주문목록으로</button>
                        </div>

                        <!-- 주의사항 -->
                        <div class="h-100 p-2 bg-light border rounded-3 card-good2">
                            <ul class="mb-0">
                                <li>주문취소는 배송준비중 상태의 주문단위로만 가능합니다.</li>
                            </ul>
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
</body>
</html>