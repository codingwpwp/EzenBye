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

                   <div class="container">
                        <div class="row">
                            <div class="col-md-12 col-sm-12 col-12">
                                <form action="member_sign.do" name="mailSendfrm" method="get" id="email_sign">
                                    <div class="container">
                                        <div class="row">
                                            <div class="col-12 signhead">
                                                <h3>회원가입</h3>
                                            </div>
                                        </div>

                                        <div class="col-sm-12 col-12">
                                            <h4>이메일 인증</h4>
                                          </div>
                                  
                                        <div class="row">
                                            <div class="col-12 tit">
                                                <label for="name">이름</label>
                                            </div>
                                            <div class="col-sm-9 col-12">
                                                <input type="text" class="pwinput" name="name" id="name" 
                                                    placeholder="이름를 입력하세요" autocomplete="off" value="" oninput="nameChk(this)">
                                               
                                            </div>
                                           
                                            
                                            <div class="col-sm-12 col-12 tit">
                                                <label for="email">이메일</label>
                                            </div>
                                            <div class="col-sm-9 col-8 ">
                                                <input type="text" class="recominput" name="email" id="email" 
                                                    placeholder="이메일을 입력해주세요" autocomplete="off" oninput="emailChk(this)">
                                            </div>
                                            <div class="col-sm-3 col-4 px-0">
                                                <input type="button" class="btn btn-secondary mailnum" value="인증번호 발송"  onclick="emailsendFn()" id="sendEmail" disabled>
                                            </div>
                                            <div class="col-sm-12 col-12 tit">
                                                <label for="emailcheck">인증번호</label>
                                            </div>
                                            <div class="col-sm-9 col-12">
                                                <input type="text" class="emailinput"  id="randomNum"
                                                    placeholder="인증번호를 입력해주세요" maxlength="6"  autocomplete="off">
                                                <span id="emailspan"></span>
                                            </div>
                                          <div class="col-sm-12 col-12 h4">
                                            <h4>이용약관 확인</h4>
                                          </div>
                                          <div class="col-sm-12 col-12 form-check">
                                            <input class="form-check-input" type="checkbox" name="checkOne" id="flexCheckDefault1">
                                            <label class="form-check-label" for="flexCheckDefault1">
                                                 쇼핑정보 수신(선택)에 동의합니다.
                                            </label>
                                          </div>
                                          <div class="col-sm-12 col-12 form-check">
                                            <input class="form-check-input" type="checkbox" name="checkTwo" id="flexCheckDefault2">
                                            <label class="form-check-label" for="flexCheckDefault2">
                                                [필수] 이용약관 동의
                                            </label>
                                            
                                          </div>
                                          <div class="col-sm-12 col-12 form-check">
                                            <input class="form-check-input" type="checkbox" name="checkThree" id="flexCheckDefault3">
                                            <label class="form-check-label" for="flexCheckDefault3">
                                                [필수] 개인정보 수집 및 이용 동의
                                            </label>
                                          </div>
                                            <div class="col-sm-6 col-6 btndiv">
                                                <input type="button" value="취소" class="btn btn-secondary can">
                                            </div>
                                            <div class="col-sm-6 col-6 btndiv">
                                              <!--   <input type="submit" value="회원가입" class="btn btn-dark"disabled> -->
                                                 <input type="button" value="회원가입" class="btn btn-dark" id="singOk" onclick="emailChksubmit()" disabled>
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
       <script src="<%=request.getContextPath()%>/resources/js/sign.js"></script>
</body>
</html>