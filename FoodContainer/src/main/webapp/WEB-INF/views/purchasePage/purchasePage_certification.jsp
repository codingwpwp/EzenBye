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
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/sign.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/purchasePage.css">
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
    <section>
        <div class="row">

            <!-- 왼쪽 사이드메뉴 -->
            <div class="col-lg-2 d-none d-lg-block"></div>

            <!-- 메인 -->
            <div class="col-12 col-sm-9 col-md-10 col-lg-8">
                <article id="mainSection">

                    <!-- 메인컨텐츠 -->
                    <form class="p-3" id="emailCertificationForm" action="noMember.do" name="emailCertificationForm" method="post" onsubmit="return checkForm()">
                        <div class="container">

                            <div class="row">
                                <div class="col-12 signhead">
                                    <h3 class="fw-bold">비회원 이메일 인증</h3>
                                </div>
                            </div>

                            <div class="row">

                                <div class="col-12 tit mb-1 fw-bold fs-5">
                                    <label for="name">이름</label>
                                </div>

                                <div class="col-sm-9 col-12">
                                    <input type="text" class="form-control pwinput" name="name" id="name" placeholder="이름을 입력하세요" autocomplete="off">
                                </div>

                                
                                <div class="col-sm-12 col-12 tit mb-1 fw-bold fs-5">
                                    <label for="email">이메일</label>
                                </div>

                                <div class="col-sm-9 col-8">
                                    <input type="text" class="form-control recominput" name="receiveMail" id="email" placeholder="이메일을 입력해주세요"  autocomplete="off" oninput="emailCheck(this)">
                                </div>

                                <div class="col-sm-3 col-4 px-0">
                                    <input type="button" class="btn btn-secondary mailnum fw-bold" id="emailCheckBtn" value="번호발송" onclick="sendEmail()">
                                </div>

                                <div class="col-sm-12 col-12 tit mb-1 fw-bold fs-5">
                                    <label for="emailcheck">인증번호&nbsp;</label>&nbsp;&nbsp;<span class="fs-6 fw-bold text-danger" id="timer"></span>
                                </div>

                                <div class="col-sm-9 col-8">
                                    <input type="text" class="form-control emailinput" id="randomNum" placeholder="인증번호를 입력해주세요" autocomplete="off">
                                </div>
                                
                                <div class="col-sm-3 col-4 px-0">
                                    <input type="button" class="btn btn-secondary mailnum fw-bold" id="emailCheckOkBtn" value="인증하기" onclick="checkNum()">
                                </div>
                                
                                <span class="fw-bold" id="emailMessageSpan" style="font-size: small;"></span>

								<div class="row mt-5">
	                                <div class="col-sm-6 col-6 d-flex justify-content-center">
	                                    <input type="button" value="취소" class="btn btn-secondary fw-bold w-75">
	                                </div>
	
	                                <div class="col-sm-6 col-6 d-flex justify-content-center">
	                                    <input type="submit" value="구매하러가기" class="btn btn-primary fw-bold w-75 px-0" disabled>
	                                </div>
								</div>

                            </div>

                        </div>
                    </form>
    
                </article>
            </div>

            <!-- 오른쪽 사이드메뉴 -->
            <div class="col-sm-3 col-md-2 col-lg-2 d-none d-sm-block"></div>
            
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
    <script src="<%=request.getContextPath()%>/resources/js/purchasePage.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/purchasePage_certification.js"></script>
</body>
</html>