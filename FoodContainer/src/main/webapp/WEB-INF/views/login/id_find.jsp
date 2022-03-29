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

            <!--
                id="navLeftMenu"인 현재 주석 바로 아래의 태그는 페이지의 종류에 따른 왼쪽메뉴.
                네비게이션 바가 펼쳐질 때 알아서 태그가 안보이도록 설정.
                필요시에만 div태그 사이에 코드를 작성.
                작성시 border border-dark는 구분용으로만 작성했기 때문에 알아서 지우고 작업.
                작성하지 않는 경우는 절대 건들지 않음.
                base.js에 id="navLeftMenu"와 관련된 코드가 작성되어있음.
            -->
            <div class="col-2 col-sm-1 pe-0 d-lg-none border border-dark" id="navLeftMenu">d<!-- 여기에 작성 --></div>

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
                    
                    <!--
                        헤딩.
                        필요하지 않는 사람은 <div>태그를 삭제.
                        필요한 사람은 <div>태그에 작성.
                    -->
                   

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
                   <div class="container">
                       <div class="row findform">
                        <div class="col-md-6 col-sm-6 col-12 mb-1 mail">
                            <form class="easyfind" action="<%=request.getContextPath()%>/id_easy_check.do" method="get">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-12 ">
                                            <h4>간편 아이디 찾기</h4>
                                        </div>
                                        <div class="col-12 leftform">
                                            <p>입력하신 정보는 <strong>아이디 찾기</strong>에만 사용되며 <strong>저장되지 않습니다.</strong></p>
                                        </div>
                                        <div class="col-12 leftform">
                                            <input type="text" class="findinput" placeholder="이름를 입력해주세요">
                                        </div>
                                        <div class="col-12 leftform">
                                            <input type="text" class="findinput" placeholder="핸드폰 뒤 7~8자리를 입력 해주세요">
                                        </div>
                                        <div class="col-12 leftform">
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
                                        <div class="col-12 ">
                                            <h4>이메일 아이디 찾기</h4>
                                        </div>
                                        <div class="col-md-12 col-sm-12 col-12 rightform">
                                            <p>인증번호는 <strong>이메일로 발송되며,</strong> 인증 이외의 용도로 이용 또는 <strong>저장 되지 않습니다.</strong></p>
                                        </div>
                                        <div class="col-md-12 col-sm-12 col-12 rightform">
                                            <input type="text" class="findinput" placeholder="이름를 입력해주세요">
                                        </div>
                                        <div class="col-md-12 col-sm-12 col-12 rightform">
                                            <input type="text" class="findinput" placeholder="이메일을 입력해주세요" id="emailinput">
                                           <input class="btn btn-secondary emailbtn" type="button" value="인증번호 발송" id="emailbtn">
                                        </div>
                                        <div class="col-md-12 col-sm-12 col-12 rightform">
                                            <input type="text" class="findinput" placeholder="인증번호 입력해주세요">
                                            
                                        </div>
                                        <div class="col-md-12 col-sm-12 col-12 rightform">
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