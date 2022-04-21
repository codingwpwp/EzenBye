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
            <div class="col-12 col-sm-9 col-md-10 col-lg-8">
                <article id="mainSection">
                  
 					<div class="container head">
	                    <div class="row head">
	                        <div class="col-12">
	                            <h2>비밀번호 찾기</h2>
	                        </div>
	                        <div class="col-12">
	                            비밀번호가 기억나지 않으세요? 원하시는 방법을 &nbsp;선택해 비밀번호를 확인하실 수 있습니다.
	                        </div>
	                    </div>
                   </div>
                   <div class="container from">
                       <div class="row pwfindform">
	                        <div class="col-md-12 col-sm-12 col-12">
	                            <form class="pwfind" name="emailPwForm" method="post" action="pw_email_check.do">
	                                <div class="container">
	                                    <div class="row rows">
	                                        <div class="col-12">
	                                            <h4>새로운 비밀번호 발급하기</h4>
	                                        </div>
	                                        <div class="col-md-12 col-sm-12 col-12">
	                                            <div id="timer" class="text-danger fw-bold"></div>
	                                        </div>
	                                        <div class="col-md-10 col-sm-10 col-12">
	                                            <input type="text" class="form-control findinput" name="name" placeholder="2 ~ 6자리의 이름" maxlength="6" autocomplete="off" oninput="checkNamePw(this)">
	                                        </div>
	                                        <div class="col-md-10 col-sm-10 col-12">
	                                            <input type="text" class="form-control findinput" name="id" placeholder="8 ~ 20자리의 영문 + 숫자" maxlength="20" autocomplete="off" oninput="checkIdPw(this)">
	                                        </div>
	                                        <div class="col-md-12 col-sm-12 col-12">
	                                            <input type="text" class="form-control findemailinput" name="email" id="email" placeholder="이메일"  oninput="checkEmailPw(this)" maxlength="50" autocomplete="off">
	                                            <button type="button" class="btn btn-secondary emailbtn" id="emailBtn" disabled onclick="sendEmailPwBtn()">인증번호 발송</button>
	                                        </div>
	                                        <div class="col-md-10 col-sm-10 col-12 ">
	                                            <input type="text" class="form-control findinput" id="randomNum" placeholder="인증번호 입력해주세요" maxlength="6"  autocomplete="off">
	                                        </div>
	                                        <span id="emailMessageSpan" class="fw-bold"></span>
	                                        <div class="col-md-12 col-sm-12 col-12">
	                                            <input type="button" value="비밀번호 발급" id="emailPwSubmitBtn" class="btn btn-secondary pwfindbtn" onclick="pwFindFormSubmitBtn()" disabled>
	                                        </div>
	                                    </div>
	                                </div>
	                            </form>
	                        </div>
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
    <script src="<%=request.getContextPath()%>/resources/js/login.js"></script>
</body>
</html>