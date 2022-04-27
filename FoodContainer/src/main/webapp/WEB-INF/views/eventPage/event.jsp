<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>룰렛 이벤트</title>
    <!-- css링크 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/base.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/eventPage.css">
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

            <div class="col-2 col-sm-1 pe-0 d-lg-none border border-dark" id="navLeftMenu"></div>

			<%@include file="/WEB-INF/views/base/nav.jsp"%>

        </div>
    </nav>

    <!-- 섹션 -->
    <section class="mt-1">
        <div class="row">

            <!-- 왼쪽 사이드메뉴 -->
            <div class="col-lg-2 d-none d-lg-block">
                <aside>
                </aside> 
            </div>

            <!-- 메인 -->
            <div class="col-12 col-sm-9 col-md-10 col-lg-8 col-xl-7">
                <article id="mainSection">
                    <p class="h1 fw-bold p-2">[룰렛]이벤트</p>
                    <hr>
                    <div id="wrap" class="bg-warning bg-opacity-25 px-4 py-3 col-md-10 mx-auto border border-dark rounded-2">
                        <h1 class="display-4 fw-bold pb-3" id="eventTitle">
                            🔥회원 감사 이벤트🔥
                        </h1><br>
                        <p class="h3 fw-bold">룰렛만 돌리면~😃</p>
                        <p class="h3 fw-bold py-2">
                            <span class="text-danger">쿠폰🎫</span> 받고 <span class="text-danger">적립금💰</span>도 챙기고~
                        </p>
                        <p class="h3 fw-bold pb-2">꽝이 없는 이벤트!!😲</p>
                        <p class="h3 fw-bold">원하는거 다 받아가세요~🥳</p>
                        <div class="text-danger fw-bold" style="font-size: small;">* 본 화면은 PC에 최적화 되어있습니다.</div>

                        <div id="gameContainer" class="col-9 d-flex justify-content-center align-items-center">
                            <div class="board_start join rounded-circle d-flex justify-content-center align-items-center fs-5">
                                <span>
                                    <span id="pointer">▲</span>
                                    <br>
                                    <span id="eventStart">돌리기</span>
                                </span>
                            </div>
                            <div class="board_on obj" style="background-image: url('<%=request.getContextPath()%>/resources/img/이벤트/roulette_bg.png');">
                                <img src="<%=request.getContextPath()%>/resources/img/이벤트/coupon1.png">
                                <img src="<%=request.getContextPath()%>/resources/img/이벤트/coupon2.png">
                                <img src="<%=request.getContextPath()%>/resources/img/이벤트/coupon3.png">
                                <img src="<%=request.getContextPath()%>/resources/img/이벤트/coupon4.png">
                                <img src="<%=request.getContextPath()%>/resources/img/이벤트/coupon5.png">
                                <img src="<%=request.getContextPath()%>/resources/img/이벤트/coupon6.png">
                            </div>
                        </div>

                        <div id="popup_gift" class="popup">
                            <div class="lottery_present">

                            </div>
                            <a class="close">닫기</a>
                        </div>

                        <div class="fs-4 fw-bold <c:if test="${empty member}"> d-flex align-items-center </c:if>">
                        <c:if test="${not empty member}">
                           	${member.id}님의 남은 응모권 <br><br>
                           	<span id="event_ticket">${member.event_ticket}</span>개                                                
                        </c:if>
                        <c:if test="${empty member}">
                           	회원만 참여가 가능합니다. &nbsp;<button class="btn btn-primary" onclick="location.href='loginmain.do'">로그인</button>                                                
                        </c:if>

                        </div><br>
                        <div class="text-danger" style="font-size: small;">
                        	* 비회원은 참여할 수 없습니다.<br>
                            * 물품을 한번 결제할 때마다 결제 가격 및 물품의 갯수와 상관없이 응모권이 1장 주어집니다.<br>
                            * 한번 사용한 응모권은 되돌릴 수 없습니다.<br>
                            * 쿠폰에 당첨된 경우, 모든 상품에 대해 적용이 가능합니다.<br>
                            * 같은 쿠폰의 경우, 중복 소지가 가능합니다.<br>
                            * 각 경품당 확률이 동일하지 않을 수 있습니다.
                        </div>
                    </div>
                </article>
            </div>

            <!-- 오른쪽 사이드메뉴 -->
            <div class="col-sm-3 col-md-2 col-lg-2 d-none d-sm-block">
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
    <script src="<%=request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/base.js"></script>
    <script src="http://cdnjs.cloudflare.com/ajax/libs/gsap/latest/plugins/CSSPlugin.min.js"></script>
    <script src="http://cdnjs.cloudflare.com/ajax/libs/gsap/latest/easing/EasePack.min.js"></script>
    <script src="http://cdnjs.cloudflare.com/ajax/libs/gsap/latest/TweenLite.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/eventPage.js"></script>
</body>
</html>