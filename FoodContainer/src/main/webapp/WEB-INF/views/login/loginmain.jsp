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

					<form action="loginmain.do" name="frm" id="loginForm" class="loginfrm" method="post">
						<div class="container">
						
							<p class="display-5 my-3 fw-bold">로그인</p>
							
							<div class="row" id="inputIdPw">
								<div class="col-md-12 col-sm-12 mb-3 id">
									<input type="text" value="${idCookie}" placeholder="아이디 8~20 자리의 영문+숫자" class="form-control" name="id" autocomplete="off">
								</div>
								<div class="col-md-12 col-sm-12 pw">
									<input type="password" placeholder="비밀번호 8~20 자리의 영문+숫자" class="form-control" name="pw">
								</div>	
							</div>
							
							<!-- 3회이상 실패했을 때 나오는 자동입력방지문구 -->
							<div class="row" <c:if test="${loginFailCnt < 3}">style="display: none;"</c:if>>
								<div class="col-12 fw-bold my-3 fs-4 text-danger">
									3회 이상 로그인에 실패하였습니다!<br>
									<span class="fs-6" id="codeStatus">혹시...로봇?</span>
								</div>
								<div class="col-12 mb-1 row mx-auto d-flex align-items-center">
									<div class="col-2 d-none d-md-block"></div>
									<div class="col-6 col-sm-5 col-md-3">
										<span id="codeSpan" style="padding : 8px; border-radius: 3px;"></span>
									</div>
									<div class="col-6 col-sm-7 d-flex justify-content-start">
										<input type="text" id="codeInput" class="form-control" placeholder="영어만 입력하세요" style="max-width: 245px;" maxlength="6" autocomplete="off" oninput="replaceSpelling(this)">
									</div>
								</div>
							</div>
							
							<div class="row">
								<div class="col-md-12 col-sm-12 col-12 loginbtn">
									<input type="button" class="btn btn-secondary" value="로그인" onclick="loginCheck()">
								</div>
							</div>

							<div class="row find">
								<div class="col-md-4 col-sm-3 col-4 idsave">
									<input type="checkbox" name="rememberIdYN" value="Y" id="radio" <c:if test="${not empty idCookie}">checked</c:if> >
										<label for="radio" class="fw-bold">&nbsp;아이디 저장</label>
								</div>
								<div class="col-md-4 col-sm-3 col-4 idfind">
									<a href="<%=request.getContextPath()%>/id_find.do" class="link-dark fw-bold">아이디 찾기</a>
								</div>
								<div class="col-md-4 col-sm-3 col-4 pwfind">
									<a href="<%=request.getContextPath()%>/pw_find.do" class="link-dark fw-bold">비밀번호 찾기</a>
								</div>

							</div>
							<div class="row">
								<div class="col-md-12 col-sm-12 col-12 loginbtn">
									<button class="btn btn-dark" type="button" onclick="location.href='<%=request.getContextPath()%>/member_sign.do'">회원가입</button>
								</div>
							</div>
							<div class="row lookup">
								<div class="col-md-12 col-sm-12 col-12 loginbtn">
									<button class="btn btn-dark">비회원 주문 조회</button>
								</div>
							</div>
							
						</div>
					</form>
					<input type="hidden" id="loginFailCnt" value="${loginFailCnt}">
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