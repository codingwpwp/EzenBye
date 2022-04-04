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
<link
	href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/base.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/login.css">
</head>
<body>
	<!-- 헤더 -->
	<header class="border-bottom border-dark">
		<%@include file="/WEB-INF/views/base/header.jsp"%>
	</header>

	<!-- 네비게이션 바 -->
	<nav
		class="navbar-expand-lg navbar-light bg-warning bg-gradient bg-opacity-25 fw-bold fs-5">
		<div class="row">
			<div class="col-lg-2 d-none d-lg-block"></div>

			<!--
                id="navLeftMenu"인 현재 주석 바로 아래의 태그는 페이지의 종류에 따른 왼쪽메뉴.
                네비게이션 바가 펼쳐질 때 알아서 태그가 안보이도록 설정.
                필요시에만 div태그 사이에 코드를 작성.
                작성시 border border-dark는 구분용으로만 작성했기 때문에 알아서 지우고 작업.
                작성하지 않는 경우는 절대 건들지 않음.
                base.js에 id="navLeftMenu"와 관련된 코드가 작성되어있음.
            -->
			<div class="col-2 col-sm-1 pe-0 d-lg-none border border-dark"
				id="navLeftMenu"></div>

			<%@include file="/WEB-INF/views/base/nav.jsp"%>

		</div>
	</nav>

	<!-- 섹션 -->
	<section class="mt-1">
		<div class="row">

			<!-- 왼쪽 사이드메뉴 -->
			<div class="col-lg-2 d-none d-lg-block">
				<aside></aside>
			</div>

			<!-- 메인 -->
			<div class="col-12 col-sm-9 col-md-10 col-lg-8">
				<article id="mainSection">

					<!--
                        헤딩.
                        필요하지 않는 사람은 <div>태그를 삭제.
                        필요한 사람은 <div>태그에 작성.
                    -->


					<form action="loginmain.do" name="frm" class="loginfrm" method="post">
						<div class="container">

							<div class="row">
								<div class="col-12 head">
									<h2>로그인</h2>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12 col-sm-12 md-1 id">
									<input type="text" placeholder="아이디 8~20 자리의 영문+숫자" class="form-control" name="id">
								</div>
								<div class="col-md-12 col-sm-12 mb-1 pw">
									<input type="password" placeholder="비밀번호 8~20 자리의 영문+숫자" class="form-control" name="pw">
								</div>
								
							</div>
							<div class="row code" style="display: none">
								<div class="col-md-12 col-sm-12 col-12">아래에 글자를 보이는대로
									입력해주세요!</div>
								<div class="col-md-12 col-sm-6 col-12 mb-1 auto">
									<input id="codeinput" type="text" name="output"
										placeholder="코드생성 버튼을 클릭하세요" class="form-control"> <input
										class="btn btn-secondary code" type="button" value="코드생성"
										onclick="populateform(this.form.thelength.value);">

								</div>
							
								<div class="col-md-12 col-sm-6 col-12 mb-1 autoin">
									<input id="codeinput" type="text" name="che" placeholder="문자를 입력해주세요" class="form-control">
									<input class="btn btn-secondary" type="button" value="코드확인"
										onclick="check();">
									<div hidden>
										<b>문자길이:</b> <input type="text" name="thelength" size="3"
											value="6">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12 col-sm-12 col-12 loginbtn">
									<button class="btn btn-secondary">로그인</button>
								</div>
							</div>

							<div class="row find">
								<div class="col-md-4 col-sm-3 col-4 idsave">
									<input type="radio" name="radio" id="radio"><label>아이디
										저장</label>
								</div>
								<div class="col-md-4 col-sm-3 col-4 idfind">
									<a href="<%=request.getContextPath()%>/id_find.do">아이디 찾기</a>
								</div>
								<div class="col-md-4 col-sm-3 col-4 pwfind">
									<a href="<%=request.getContextPath()%>/pw_find.do">비밀번호 찾기</a>
								</div>

							</div>
							<div class="row">
								<div class="col-md-12 col-sm-12 col-12 loginbtn">
									<button class="btn btn-dark">회원가입</button>
								</div>
							</div>
							<div class="row lookup">
								<div class="col-md-12 col-sm-12 col-12 loginbtn">
									<button class="btn btn-dark">비회원 배송 조회</button>
								</div>
							</div>

						</div>
					</form>
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
	<script src="https://kit.fontawesome.com/b30bc4e0a9.js"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/base.js"></script>
</body>
</html>