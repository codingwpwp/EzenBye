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
    
                    <!-- 메인컨텐츠 -->
                    <div class="container">

                        <div class="row mainContent">
                            <div class="col-12">

                                <div class="bg-primary bg-gradient bg-opacity-75 p-2 border border-dark border-2 rounded-top">
                                    <span class="h4 fw-bold">이달의 매출</span><span class="more_content"><a href="#" class="link-dark fw-bold float-end">[더보기]</a></span>
                                </div>

                                <div class="border border-dark border border-dark border-2">
                                    여기는 맨 마지막에 할 예정입니다<br>
                                    여기는 맨 마지막에 할 예정입니다<br>
                                    여기는 맨 마지막에 할 예정입니다<br>
                                </div>

                            </div>
                        </div>

                        <br>

                        <div class="row mainContent">

                            <div class="col-lg-6 col-md-12">
                                <div class="bg-danger bg-opacity-75 p-2 border border-dark border-2 rounded-top">
                                    <span class="h4 fw-bold">신고리스트</span><span class="more_content"><a href="#" class="link-dark fw-bold float-end">[더보기]</a></span>
                                </div>

                                <table class="table table-hover border border-dark border-2">

                                    <thead>
                                        <tr class="table-light">
                                            <th scope="col">번호</th>
                                            <th scope="col">사유</th>
                                            <th scope="col">날짜</th>
                                        </tr>
                                    </thead>

                                    <tbody>
                                        <tr>
                                            <th scope="row">1</th>
                                            <td><a href="#" class="link-primary">패드립</a></td>
                                            <td>2022-02-03</td>
                                        </tr>
                                        <tr>
                                            <th scope="row">2</th>
                                            <td><a href="#" class="link-primary">사기</a></td>
                                            <td>2022-02-03</td>
                                        </tr>
                                        <tr>
                                            <th scope="row">3</th>
                                            <td><a href="#" class="link-primary">음란패설</a></td>
                                            <td>2022-02-03</td>
                                        </tr>
                                    </tbody>

                                </table>
                            </div>
                            
                            <div class="col-lg-6 col-md-12">
                                <div class="bg-info bg-gradient bg-opacity-75 p-2 border border-dark border-2 rounded-top">
                                    <span class="h4 fw-bold">고객센터</span><span class="more_content"><a href="#" class="link-dark fw-bold float-end">[더보기]</a></span>
                                </div>

                                <table class="table table-hover border border-dark border-2">

                                    <thead>
                                        <tr class="table-light">
                                            <th scope="col">번호</th>
                                            <th scope="col">제목</th>
                                            <th scope="col">날짜</th>
                                        </tr>
                                    </thead>

                                    <tbody>
                                        <tr>
                                            <th scope="row">1</th>
                                            <td><a href="#" class="link-primary">해줘</a></td>
                                            <td>2022-02-03</td>
                                        </tr>
                                        <tr>
                                            <th scope="row">2</th>
                                            <td><a href="#" class="link-primary">이렇게 장사를 하...</a></td>
                                            <td>2022-02-03</td>
                                        </tr>
                                        <tr>
                                            <th scope="row">3</th>
                                            <td><a href="#" class="link-primary">배송이 안와요</a></td>
                                            <td>2022-02-03</td>
                                        </tr>
                                    </tbody>

                                </table>
                            </div>
                            
                        </div>

                        <div class="row mainContent">

                            <div class="col-lg-6 col-md-12">
                                <div class="bg-success bg-gradient bg-opacity-50 p-2 border border-dark border-2 rounded-top">
                                    <span class="h4 fw-bold"><span class="d-none d-sm-inline">등록중인 </span>배너</span><span class="more_content"><a href="#" class="link-dark fw-bold float-end">[더보기]</a></span>
                                </div>

                                <table class="table table-hover border border-dark border-2">

                                    <colgroup>
                                        <col width="45%" />
                                    </colgroup>

                                    <tbody>
                                        <tr>
                                            <td scope="row"><img src="<%=request.getContextPath()%>/resources/img/배너1.png" class="img-fluid"></td>
                                            <td class="align-middle fw-bold">이것은 배너입니다</td>
                                        </tr>
                                        <tr>
                                            <td scope="row"><img src="<%=request.getContextPath()%>/resources/img/배너1.png" class="img-fluid"></td>
                                            <td class="align-middle fw-bold">이것은 배너입니다2이벤트!!!</td>
                                        </tr>
                                        <tr>
                                            <td scope="row"><img src="<%=request.getContextPath()%>/resources/img/배너1.png" class="img-fluid"></td>
                                            <td class="align-middle fw-bold">무슨이벤트일까요저도잘...</td>
                                        </tr>
                                    </tbody>

                                </table>
                            </div>
                            
                            <div class="col-lg-6 col-md-12">
                                <div class="bg-primary bg-gradient bg-opacity-50 p-2 border border-dark border-2 rounded-top">
                                    <span class="h4 fw-bold">매진 상품</span><span class="more_content"><a href="#" class="link-dark fw-bold float-end">[더보기]</a></span>
                                </div>

                                <table class="table table-hover border border-dark border-2" id="table_four">

                                    <colgroup>
                                        <col width="45%" />
                                    </colgroup>

                                    <tbody>
                                        <tr>
                                            <td scope="row"><img src="<%=request.getContextPath()%>/resources/img/배너1.png" class="img-fluid"></td>
                                            <td class="align-middle fw-bold">이것은 배너입니다</td>
                                        </tr>
                                        <tr>
                                            <td scope="row"><img src="<%=request.getContextPath()%>/resources/img/배너1.png" class="img-fluid"></td>
                                            <td class="align-middle fw-bold">이것은 배너입니다2이벤트!!!</td>
                                        </tr>
                                        <tr>
                                            <td scope="row"><img src="<%=request.getContextPath()%>/resources/img/배너1.png" class="img-fluid"></td>
                                            <td class="align-middle fw-bold">무슨이벤트일까요저도잘...</td>
                                        </tr>
                                    </tbody>

                                </table>
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