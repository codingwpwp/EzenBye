<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원탈퇴</title>
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
	.nav11 {
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
				 
			        <p class="fs-6 lookup-fs-6">회원탈퇴</p>
			        <hr />
			    	<p class="fs-6 lookup-fs-6">회원탈퇴 전 안내사항을 꼭 확인해주세요.</p>
			    	
			    	<div class="accordion-item">
				    	<div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse show" aria-labelledby="panelsStayOpen-headingOne">
					      <div class="accordion-body">
					        <strong>적립금, 쿠폰 및 포인트 소멸 안내</strong>
					        <ul class="memberSecession-li">
					        	<li>회원 탈퇴 시 보유하고 계신 포인트, 쿠폰 등은 자동 소멸되며 복원되지 않습니다.</li>
					        </ul>
					        <strong>탈퇴 불가 안내</strong>
					        <ul class="memberSecession-li">
					        	<li>진행 중인 전자상거래 이용내역(결제/배송/취소 중인 상태)이 있거나 고객상담 및 이용하신 서비스가 완료되지 않은 경우 서비스 철회하실 수 없습니다.</li>
					        	<li>연결된 SNS 계정을 해체하시고 탈퇴해주십시오. 연결해제 없이 계속 진행하시는 경우 SNS 서비스 내에서 삭제되지 않습니다.</li>
					        </ul>
					        <strong>개인정보 파기</strong>
					        <ul class="memberSecession-li">
					        	<li>고객님께서 보유하셨던 주문내역, 1:1문의, 리뷰, 알람 설정등의 모든 정보는 삭제되며 재가입 시 복원이 불가능합니다.</li>
					        </ul>
					      </div>
					    </div>
				    </div>
			    	
			    	<p class="fs-6 lookup-fs-6">탈퇴사유</p>
			        <hr />
			        <select class="form-select form-select-lg mb-3 memberSecession-select" aria-label=".form-select-lg example">
					  <option selected>선택해주세요</option>
					  <option value="1">배송 불만</option>
					  <option value="2">취소 불만</option>
					  <option value="3">사용이 불편함</option>
					  <option value="3">자주 사용하지 않음</option>
					  <option value="3">상품의 다양성/가격 품질 불만</option>
					  <option value="3">실질적인 혜택 부족</option>
					  <option value="3">개인정보 유출 우려</option>
					</select>
					<div class="d-grid gap-5 d-md-flex justify-content-md-center noteManageView-btn">
					  <button class="btn btn-primary me-md-2 noteManageView-btn2" type="button">탈퇴하기</button>
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