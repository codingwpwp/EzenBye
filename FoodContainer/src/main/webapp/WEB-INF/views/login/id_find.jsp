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
    <nav class="navbar-expand-lg navbar-light bg-light fw-bold">
        <%@include file="/WEB-INF/views/base/nav.jsp"%>
    </nav>

    <!-- 섹션 -->
    <section class="mt-3">
        <div class="row">

            <!-- 왼쪽 사이드메뉴 -->
            <div class="col-sm-2 col-2" id="leftDiv">
                <aside id="leftAside">
                  
                </aside>
            </div>

            <!-- 메인 -->
            <div class="col-8">
                <article id="mainSection">
                    <!-- 실질적인 메인 내용 -->
                    <div class="container head">
                    <div class="row head">
                        <div class="col-12">
                            <h2>아이디 찾기</h2>
                        </div>
                        <div class="col-12">
                            아이디가 기억나지 않으세요? 원하시는 방법을 선택해 아이디를 확인하실 수 있습니다.
                        </div>
                    </div>
                   </div>
                   <div class="container from">
                       <div class="row findform">
                        <div class="col-md-6 col-sm-6 col-12 mb-1 mail">
                            <form class="easyfind" action="<%=request.getContextPath()%>/id_easy_check.do" method="get">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-12">
                                            <h4>간편 아이디 찾기</h4>
                                        </div>
                                        <div class="col-12">
                                            <p>입력하신 정보는 <strong>아이디 찾기</strong>에만 사용되며 <strong>저장되지 않습니다.</strong></p>
                                        </div>
                                        <div class="col-12">
                                            <input type="text" class="findinput" placeholder="이름를 입력해주세요">
                                        </div>
                                        <div class="col-12">
                                            <input type="text" class="findinput" placeholder="핸드폰 뒤 7~8자리를 입력 해주세요">
                                        </div>
                                        <div class="col-12">
                                            <input type="submit" value="아이디 찾기" class="btn btn-secondary findbtn">
                                        </div>
                                    </div>
                                </div>
                            </form>
                           
                        </div>
                        <div class="col-md-6 col-sm-6 col-12 mb-1">
                            <form class="emailfind" action="<%=request.getContextPath()%>/id_email_check.do" method="get">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-12">
                                            <h4>이메일 아이디 찾기</h4>
                                        </div>
                                        <div class="col-md-12 col-sm-12 col-12">
                                            <p>인증번호는 <strong>이메일로 발송되며,</strong> 인증 이외의 용도로 이용 또는 <strong>저장 되지 않습니다.</strong></p>
                                        </div>
                                        <div class="col-md-12 col-sm-12 col-12">
                                            <input type="text" class="findinput" placeholder="이름를 입력해주세요">
                                        </div>
                                        <div class="col-md-12 col-sm-12 col-12 ">
                                            <input type="text" class="findinput" placeholder="이메일을 입력해주세요">
                                            <button class="btn btn-secondary emailbtn">인증번호 발송</button>
                                        </div>
                                        <div class="col-md-12 col-sm-12 col-12 ">
                                            <input type="text" class="findinput" placeholder="인증번호 입력해주세요">
                                            
                                        </div>
                                        <div class="col-md-12 col-sm-12 col-12">
                                            <input type="submit" value="확인" class="btn btn-secondary findbtn">
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
            <div class="col-2 d-none d-sm-block" id="rightdiv">
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