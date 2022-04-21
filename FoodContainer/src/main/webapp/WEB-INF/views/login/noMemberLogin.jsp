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
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/login.css">
</head>
<body onselectstart="return false;" oncontextmenu="return false;">
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
	<section>
		<div class="row">

			<!-- 왼쪽 사이드메뉴 -->
			<div class="col-lg-2 d-none d-lg-block">
				<aside></aside>
			</div>

			<!-- 메인 -->
			<div class="col-12 col-sm-9 col-md-10 col-lg-8">
				<article id="mainSection">

					<form action="noMemberLogin.do" name="frm" id="noMemberLoginForm" class="loginfrm" method="post">
						<div class="container">
						
							<p class="display-5 my-3 fw-bold">비회원 주문조회</p>
							
							<div class="row" id="inputIdPw">
								<div class="col-md-12 col-sm-12 mb-3 id">
									<input type="text" value="" placeholder="주문번호를 입력하세요" class="form-control" name="no_member_order_index" maxlength="20" autocomplete="off">
								</div>
								<div class="col-md-12 col-sm-12 pw">
									<input type="password" placeholder="8 ~ 15 대+소문자+숫자+특문" class="form-control" name="pw">
								</div>	
							</div>
							
							<div class="row">
								<div class="col-md-12 col-sm-12 col-12 loginbtn">
									<input type="submit" class="btn bg-gradient noMemberBtn" style="background: #a840ff; color: white;" value="주문 조회">
								</div>
							</div>
							
							<div class="row mb-5">
								<div class="col-md-12 col-sm-12 col-12 loginbtn">
									<input type="button" class="btn bg-gradient noMemberBtn" data-bs-toggle="modal" data-bs-target="#exampleModal" style="background: #a840ff; color: white;" value="주문 비밀번호 찾기">
								</div>
							</div>
							
							
							<div class="row mt-3">
								<div class="col-md-12 col-sm-12 col-12 loginbtn">
									<button class="btn btn-dark" type="button" onclick="location.href='<%=request.getContextPath()%>/loginmain.do'">로그인</button>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12 col-sm-12 col-12 loginbtn">
									<button class="btn btn-dark" type="button" onclick="location.href='<%=request.getContextPath()%>/member_sign.do'">회원가입</button>
								</div>
							</div>
							
						</div>
					</form>
					
					<!-- 주문 비밀번호 찾기 -->
					<div class="modal fade" data-bs-backdrop="static" data-bs-keyboard="false" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					  <form class="modal-dialog" id="noMemberFindOrderForm" method="post" onsubmit="return false;">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title " id="exampleModalLabel">주문 비밀번호 찾기</h5>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					      </div>
					      <div class="modal-body" style="text-align: center;">
					      	<p class="my-2"><i class="bi bi-envelope" style="font-size: 95px;"></i><br><span style="font-size: 45px; position: relative; bottom: 30px;">주문번호&이메일 입력</span></p>
					      	<span id="noMemberSpan"></span>
					      	<div class="row d-flex justify-content-center">
					      		<div class="col-10 mb-3">
					      			<input class="fs-5 fw-bold form-control" type="text" name="no_member_order_index" maxlength="50" value="" placeholder="구매시 입력한 주문번호를 입력하세요" autocomplete="off" oninput="noMemberCheckIndex(this)">
					      		</div>
					      		<div class="col-10">
					      			<input class="fs-5 fw-bold form-control" type="text" name="email" value="" maxlength="60" placeholder="구매시 입력한 이메일을 입력하세요" autocomplete="off" oninput="noMemberCheckEmail(this)">
					      		</div>
					      	</div>
					      	<span class="text-danger">*주문시 입력한 이메일로 <span class="fw-bold">새로운 주문 비밀번호</span>가 발송됩니다.</span>
					      </div>
					      <div class="modal-footer">
					        <button type="submit" id="noMemberSendEmailBtn" class="btn btn-primary" onclick="noMemberSendEmailFn()" disabled>이메일 보내기</button>
					      </div>
					    </div>
					  </form>
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
	<script src="<%=request.getContextPath()%>/resources/js/login.js"></script>
</body>
</html>