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

            <!--
                id="navLeftMenu"인 현재 주석 바로 아래의 태그는 페이지의 종류에 따른 왼쪽메뉴.
                네비게이션 바가 펼쳐질 때 알아서 태그가 안보이도록 설정.
                필요시에만 div태그 사이에 코드를 작성.
                작성시 border border-dark는 구분용으로만 작성했기 때문에 알아서 지우고 작업.
                작성하지 않는 경우는 절대 건들지 않음.
                base.js에 id="navLeftMenu"와 관련된 코드가 작성되어있음.
            -->
            <div class="col-2 col-sm-1 pe-0 d-lg-none border border-dark" id="navLeftMenu"><!-- 여기에 작성 --></div>

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
                    

                <div class="container">
                        <div class="row">
                            <div class="col-md-12 col-sm-12 col-12">
                                <form action="member_sign.do" name="frm" method="post">
                                    <div class="container">
                                        <div class="row">
                                            <div class="col-12 signhead">
                                                <h3>회원가입</h3>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-12 tit">
                                                <label for="id">아이디<span class="red">*</span></label>
                                            </div>
                                            <div class="col-sm-9 col-8">
                                                <input type="text" class="idinput" name="id" id="id"
                                                    placeholder="8~20 영문+숫자" >
                                               
                                            </div>
                                            <div class="col-sm-3 col-4">
                                                <input type="button" class="btn btn-secondary ckinput" value="중복확인">
                                                <span class="check"></span>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-12 col-12 tit">
                                                <label for="pw">비밀번호<span class="red">*</span></label>
                                            </div>
                                            <div class="col-sm-9 col-12">
                                                <input type="password" class="pwinput" name="pw" id="pw"
                                                    placeholder="8~20 영문+숫자+특수문자" >
                                                <span class="check"></span>
                                            </div>
                                            <div class="col-sm-12 col-12 tit">
                                                <label for="pw">비밀번호 확인<span class="red">*</span></label>
                                            </div>
                                            <div class="col-sm-9 col-12">
                                                <input type="password" class="pwinput" name="password" id="password"
                                                    placeholder="8~20 영문+숫자+특수문자">
                                                <span class="check"></span>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-12 tit">
                                                <label for="name">이름</label>
                                            </div>
                                            <div class="col-sm-9 col-12">
                                                <input type="text" class="pwinput" name="name" id="name"
                                                    placeholder="이름를 입력하세요" >
                                                <span class="check"></span>
                                            </div>
                                            <div class="col-sm-12 col-12 tit">
                                                <label for="ph">연락처</label>
                                            </div>
                                            <div class="col-sm-8 col-12">
                                                <select name="phone" id="phone1" class="phselect">
                                                    <option value="010">010</option>
                                                    <option value="011">011</option>
                                                    <option value="016">016</option>
                                                    <option value="017">017</option>
                                                </select>&nbsp;-
                                                <input onblur="fn6(this)" type="text" class="phinput" name="phone"
                                                    id="phone" placeholder="연락처2" maxlength="4" >&nbsp;-
                                                <input onblur="fn7(this)" type="text" class="phinput" name="phone"
                                                    id="phone3" placeholder="연락처3" maxlength="4" >
                                                <span class="check"></span>
                                            </div>
                                            <div class="col-sm-12 col-12 tit">
                                                <label for="nick">닉네임<span class="red">*</span></label>
                                            </div>
                                            <div class="col-sm-9 col-8">
                                                <input type="text" class="nkinput" name="nickname" id="nickname"
                                                    placeholder="2~8 한글+영문+숫자 중 선택" >
                                                <span class="check"></span>
                                            </div>
                                            <div class="col-sm-3 col-4">
                                                <input type="button" class="btn btn-secondary ckinput" value="중복확인">
                                            </div>
                                            <div class="col-sm-12 col-12 tit">
                                                <label for="email">이메일<span class="red">*</span></label>
                                            </div>
                                            <div class="col-sm-9 col-12">
                                                <input type="text" class="emailinput" name="email" id="email"
                                                    placeholder="이메일을 입력해주세요" >
                                                <span class="check"></span>
                                            </div>
                                            <div class="col-12 tit">
                                                <label for="recommender">추천인<span class="red">*</span></label>
                                            </div>
                                            <div class="col-sm-9 col-8">
                                                <input type="text" class="recominput" name="recommender" id="recom"
                                                    placeholder="추천인 아이디를 입력해주세요">
                                            </div>
                                            <div class="col-sm-3 col-4">
                                                <input type="button" class="btn btn-secondary ckinput" value="추천인확인">
                                            </div>
                                            <div class="col-sm-6 col-6 btndiv">
                                                <input type="button" value="취소" class="btn btn-secondary can">
                                            </div>
                                            <div class="col-sm-6 col-6 btndiv">
                                                <input type="submit" value="회원가입" class="btn btn-dark">
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
</body>
</html>