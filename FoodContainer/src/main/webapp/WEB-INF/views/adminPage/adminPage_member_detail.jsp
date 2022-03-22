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
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/adminPage.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/adminPage_leftAside.css">
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
                    <%@include file="/WEB-INF/views/adminPage/leftAside.jsp"%>
                </aside>
            </div>

            <!-- 메인 -->
            <div class="col-8">
                <article id="mainSection">
                
                    <!-- 헤딩 -->
					<%@include file="/WEB-INF/views/adminPage/headingMenu.jsp"%>

					<!-- 회원정보 -->
                    <div class="container" id="memberInfo">
						
						<h3 class="fw-bold">회원 정보</h3>
                        
                        <div class="row rows">
                            <div class="col-4 pe-0"><span class="memberCol1"><span class="d-none d-sm-inline">회원 </span>번호</span></div>
                            <div class="col-8 pe-0">
                                <input type="text" class="form-control bg-warning bg-gradient bg-opacity-25" value="1" disabled>
                            </div>
                        </div>

                        <div class="row rows">
                            <div class="col-4 pe-0"><span class="memberCol1">아이디</span></div>
                            <div class="col-8 pe-0">
                                <input type="text" class="form-control bg-warning bg-gradient bg-opacity-25" value="tester1" disabled>
                            </div>
                        </div>

                        <div class="row rows">
                            <div class="col-4 pe-0"><span class="memberCol1">닉네임</span></div>
                            <div class="col-8 pe-0">
                                <input type="text" class="form-control bg-warning bg-gradient bg-opacity-25" value="나는테스터" disabled>
                            </div>
                        </div>

                        <div class="row rows">
                            <div class="col-4 pe-0"><span class="memberCol1">가입일</span></div>
                            <div class="col-8 pe-0">
                                <input type="text" class="form-control bg-warning bg-gradient bg-opacity-25" value="2022-01-01" disabled>
                            </div>
                        </div>

                        <div class="row rows">
                            <div class="col-4 pe-0"><span class="memberCol1">이름</span></div>
                            <div class="col-8 pe-0">
                                <input type="text" class="form-control bg-warning bg-gradient bg-opacity-25" value="테스터일" disabled>
                            </div>
                        </div>

                        <div class="row rows">
                            <div class="col-4 pe-0"><span class="memberCol1">연락처</span></div>
                            <div class="col-8 pe-0">
                                <input type="text" class="form-control bg-warning bg-gradient bg-opacity-25" value="010-3333-1111" disabled>
                            </div>
                        </div>

                        <div class="row rows">
                            <div class="col-4 pe-0"><span class="memberCol1">이메일</span></div>
                            <div class="col-8 pe-0">
                                <input type="text" class="form-control bg-warning bg-gradient bg-opacity-25" value="dkek@naver.com" disabled>
                            </div>
                        </div>

                        <div class="row rows">
                            <div class="col-4 pe-0"><span class="memberCol1"><span class="d-none d-sm-inline">기본 </span>배송지</span></div>
                            <div class="col-8 pe-0">
                                <textarea class="form-control bg-warning bg-gradient bg-opacity-25" id="exampleFormControlTextarea1" rows="4" disabled>전라북도 전주시 덕진구 금암1동 667-52</textarea>
                            </div>
                        </div>

                    </div>

                    <div class="row">
                        <div class="col-12">
                            <button type="button" class="btn btn-outline-primary btn-sm me-2">뒤로</button>
                            <button type="button" class="btn btn-outline-danger btn-sm me-2">회원추방</button>
                            <button type="button" class="btn btn-outline-dark btn-sm" data-bs-toggle="modal" data-bs-target="#staticBackdrop">블랙 리스트 추가</button>
                        </div>
                    </div>
                    
                    <!-- 블랙 리스트 추가 -->
                    <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="staticBackdropLabel">블랙 리스트</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>

                                <div class="modal-body">
                                
                                    <div class="row d-flex align-items-center mb-3">
                                        <div class="col-2">
                                            <span>아이디</span>
                                        </div>

                                        <div class="col-4">
                                            <input type="text" class="form-control" value="tester1" disabled>
                                        </div>

                                        <div class="col-6">
                                            <div class="row d-flex align-items-center">

                                                <div class="col-3">
                                                    <span>날짜</span>
                                                </div>

                                                <div class="col-9">
                                                    <input type="text" class="form-control" value="2022-01-01" disabled>
                                                </div>
                                                
                                            </div>
                                        </div>

                                    </div>

                                    <div class="row d-flex align-items-center">
                                        <div class="col-2">
                                            사유
                                        </div>

                                        <div class="col-10">
                                            <textarea class="form-control bg-warning bg-gradient bg-opacity-25" id="exampleFormControlTextarea1" rows="3">얼굴이 못생겨서 블랙!</textarea>
                                        </div>

                                    </div>

                                </div>

                                <div class="modal-footer">
                                    <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">닫기</button>
                                    <button type="button" class="btn btn-outline-dark">블랙 리스트 추가</button>
                                </div>
                            </div>
                        </div>
                    </div>

                </article>
            </div>

            <!-- 오른쪽 사이드메뉴 -->
            <div class="col-2 d-none d-sm-block">
                <!-- 실질적인 오른쪽 사이드메뉴 내용 -->
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
    <script src="<%=request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/adminPage.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/adminPage_leftAside.js"></script>
</body>
</html>