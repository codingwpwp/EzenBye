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
                    여기에 왼쪽 사이드메뉴내용을 작성.여기에 왼쪽 사이드메뉴내용을 작성여기에 왼쪽 사이드메뉴내용을 작성.
                    여기에 왼쪽 사이드메뉴내용을 작성.여기에 왼쪽 사이드메뉴내용을 작성여기에 왼쪽 사이드메뉴내용을 작성.
                    여기에 왼쪽 사이드메뉴내용을 작성.여기에 왼쪽 사이드메뉴내용을 작성여기에 왼쪽 사이드메뉴내용을 작성.
                    여기에 왼쪽 사이드메뉴내용을 작성.여기에 왼쪽 사이드메뉴내용을 작성여기에 왼쪽 사이드메뉴내용을 작성.
                    여기에 왼쪽 사이드메뉴내용을 작성.여기에 왼쪽 사이드메뉴내용을 작성여기에 왼쪽 사이드메뉴내용을 작성.
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
                    <div class="fs-5 my-2 fw-bold">헤딩</div>

                    메인내용을 작성하는 구간. 메인내용을 작성하는 구간. 메인내용을 작성하는 구간. 메인내용을 작성하는 구간.
                    메인내용을 작성하는 구간. 메인내용을 작성하는 구간. 메인내용을 작성하는 구간. 메인내용을 작성하는 구간.
                    메인내용을 작성하는 구간. 메인내용을 작성하는 구간. 메인내용을 작성하는 구간. 메인내용을 작성하는 구간.
                    메인내용을 작성하는 구간. 메인내용을 작성하는 구간. 메인내용을 작성하는 구간. 메인내용을 작성하는 구간.
                    메인내용을 작성하는 구간. 메인내용을 작성하는 구간. 메인내용을 작성하는 구간. 메인내용을 작성하는 구간.

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