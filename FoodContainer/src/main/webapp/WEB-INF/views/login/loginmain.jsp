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
            <div class="col-2 pe-0" id="leftDiv">
                <aside id="leftAside">
                    <!-- 실질적인 왼쪽 사이드메뉴 내용 -->
                 
                </aside>
            </div>

            <!-- 메인 -->
            <div class="col-8">
                <article id="mainSection">
                    <!-- 실질적인 메인 내용 -->
                         <form action="#" name="frm" class="loginfrm">
                        <div class="container">

                            <div class="row">
                                <div class="col-12 head">
                                    <h2>로그인</h2>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12 col-sm-12 md-1 id">
                                    <input type="text" placeholder="아이디 8~20 자리의 영문+숫자">
                                </div>
                                <div class="col-md-12 col-sm-12 mb-1 pw">
                                    <input type="text" placeholder="비밀번호 8~20 자리의 영문+숫자">
                                </div>
                                <div class="col-md-12 col-sm-12 col-12">
                                    아래에 글자를 보이는대로 입력해주세요!
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12 col-sm-6 col-12 mb-1 auto">
                                    <input type="text" name="output" placeholder="코드생성 버튼을 클릭하세요">

                                    <input class="btn btn-secondary code" type="button" value="코드생성"
                                        onclick="populateform(this.form.thelength.value);">

                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12 col-sm-6 col-12 mb-1 autoin">
                                    <input type="text" name="che" placeholder="문자를 입력해주세요">
                                    <input class="btn btn-secondary" type="button" value="코드확인" onclick="check();">
                                    <div hidden> <b>문자길이:</b> <input type="text" name="thelength" size="3" value="6">
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
                                    <input type="radio" name="radio" id="radio"><label>아이디 저장</label>
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
     <script src="<%=request.getContextPath()%>/resources/js/login.js"></script>
</body>
</html>