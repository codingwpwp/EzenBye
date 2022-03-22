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

					<!-- 회원리스트테이블 -->
                    <div class="container">
                        <table class="table table-hover">

                            <colgroup></colgroup>

                            <thead>
                                <tr>
                                    <th scope="col" class="d-none d-sm-table-cell"><span class="d-none d-md-inline">회원 </span>번호</th>
                                    <th scope="col">아이디</th>
                                    <th scope="col" class="d-none d-md-table-cell">닉네임</th>
                                    <th scope="col">이름</th>
                                    <th scope="col" class="d-none d-lg-table-cell">가입일</th>
                                </tr>
                            </thead>

                            <tbody>
                                <tr>
                                    <th class="col1 d-none d-sm-table-cell">1</th>
                                    <td class="col2"><a href="#" class="link-primary">tester1</a></td>
                                    <td class="col3 d-none d-md-table-cell">닉네임테스터</td>
                                    <td class="col4">테스터일</td>
                                    <td class="col5 d-none d-lg-table-cell">2022-01-01</td>
                                </tr>
                                <tr>
                                    <th class="col1 d-none d-sm-table-cell">2</th>
                                    <td class="col2"><a href="#" class="link-primary">tester23</a></td>
                                    <td class="col3 d-none d-md-table-cell">듀강개또</td>
                                    <td class="col4">테스터이</td>
                                    <td class="col5 d-none d-lg-table-cell">2022-01-01</td>
                                </tr>
                                <tr>
                                    <th class="col1 d-none d-sm-table-cell">1</th>
                                    <td class="col2"><a href="#" class="link-primary">tester1</a></td>
                                    <td class="col3 d-none d-md-table-cell">닉네임테스터</td>
                                    <td class="col4">테스터일</td>
                                    <td class="col5 d-none d-lg-table-cell">2022-01-01</td>
                                </tr>
                                <tr>
                                    <th class="col1 d-none d-sm-table-cell">2</th>
                                    <td class="col2"><a href="#" class="link-primary">tester23</a></td>
                                    <td class="col3 d-none d-md-table-cell">듀강개또</td>
                                    <td class="col4">테스터이</td>
                                    <td class="col5 d-none d-lg-table-cell">2022-01-01</td>
                                </tr>
                                <tr>
                                    <th class="col1 d-none d-sm-table-cell">1</th>
                                    <td class="col2"><a href="#" class="link-primary">tester1</a></td>
                                    <td class="col3 d-none d-md-table-cell">닉네임테스터</td>
                                    <td class="col4">테스터일</td>
                                    <td class="col5 d-none d-lg-table-cell">2022-01-01</td>
                                </tr>
                                <tr>
                                    <th class="col1 d-none d-sm-table-cell">2</th>
                                    <td class="col2"><a href="#" class="link-primary">tester23</a></td>
                                    <td class="col3 d-none d-md-table-cell">듀강개또</td>
                                    <td class="col4">테스터이</td>
                                    <td class="col5 d-none d-lg-table-cell">2022-01-01</td>
                                </tr>
                                <tr>
                                    <th class="col1 d-none d-sm-table-cell">1</th>
                                    <td class="col2"><a href="#" class="link-primary">tester1</a></td>
                                    <td class="col3 d-none d-md-table-cell">닉네임테스터</td>
                                    <td class="col4">테스터일</td>
                                    <td class="col5 d-none d-lg-table-cell">2022-01-01</td>
                                </tr>
                                <tr>
                                    <th class="col1 d-none d-sm-table-cell">2</th>
                                    <td class="col2"><a href="#" class="link-primary">tester23</a></td>
                                    <td class="col3 d-none d-md-table-cell">듀강개또</td>
                                    <td class="col4">테스터이</td>
                                    <td class="col5 d-none d-lg-table-cell">2022-01-01</td>
                                </tr>
                                <tr>
                                    <th class="col1 d-none d-sm-table-cell">1</th>
                                    <td class="col2"><a href="#" class="link-primary">tester1</a></td>
                                    <td class="col3 d-none d-md-table-cell">닉네임테스터</td>
                                    <td class="col4">테스터일</td>
                                    <td class="col5 d-none d-lg-table-cell">2022-01-01</td>
                                </tr>
                                <tr>
                                    <th class="col1 d-none d-sm-table-cell">2</th>
                                    <td class="col2"><a href="#" class="link-primary">tester23</a></td>
                                    <td class="col3 d-none d-md-table-cell">듀강개또</td>
                                    <td class="col4">테스터이</td>
                                    <td class="col5 d-none d-lg-table-cell">2022-01-01</td>
                                </tr>
                            </tbody>
                            
                        </table>
                    </div>

                    <!-- 검색&페이징 -->
                    <div id="searchMember" class="row container mt-3">

                        <div class="col-12 col-lg-6">

                            <form class="row" method="get" action="#">
                                <select class="col-3 form-select form-select-sm">
                                    <option>아이디</option>
                                    <option>이름</option>
                                    <option>닉네임</option>
                                </select>

                                <input type="text" class="col-6 form-control w-50" placeholder="검색어를 입력" value="">
                                
                                <button type="submit" class="btn btn-outline-primary btn-sm col-3 col-sm-2">검색</button>
                            </form>

                        </div>

                        <div class="col-12 col-lg-6 d-flex justify-content-center">

                            <ul class="pagination mt-1">
                                <li class="page-item">
                                    <a class="page-link" href="#" aria-label="Previous">
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </li>
                                <li class="page-item"><a class="page-link" href="#">1</a></li>
                                <li class="page-item"><a class="page-link" href="#">2</a></li>
                                <li class="page-item"><a class="page-link" href="#">3</a></li>
                                <li class="page-item">
                                    <a class="page-link" href="#" aria-label="Next">
                                        <span aria-hidden="true">&raquo;</span>
                                    </a>
                                </li>
                            </ul>

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