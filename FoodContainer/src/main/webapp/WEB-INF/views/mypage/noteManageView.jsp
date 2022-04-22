<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>쪽지관리</title>
    <!-- css링크 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/base.css">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/mypage.css" />
	<script src="<%=request.getContextPath() %>/resources/js/jquery-3.6.0.min.js"></script>
	<script src="<%=request.getContextPath() %>/resources/js/mypage.js"></script>
	
	<style>
	.nav10 {
		color: orange;
	}
	</style>
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
            
            <div class="col-2 col-sm-1 pe-0 d-lg-none" id="navLeftMenu">
            	<%@include file = "mypagenav2.jsp" %>
            </div>

			<%@include file="/WEB-INF/views/base/nav.jsp"%>

        </div>
    </nav>

    <!-- 섹션 -->
    <section class="mt-1">
        <div class="row">

            <!-- 왼쪽 사이드메뉴 -->
            <div class="col-lg-2 d-none d-lg-block">
                <aside id="leftAside">
                    <!-- 실질적인 왼쪽 사이드메뉴 내용 -->
                    <%@include file = "mypagenav.jsp" %>
                </aside>
            </div>

            <!-- 메인 -->
            <div class="col-12 col-sm-9 col-md-10 col-lg-8">
                <article id="mainSection \">
                    <!-- 실질적인 메인 내용 -->
                    <div class="col-md-11">
				 
			        <p class="fs-6 lookup-fs-6">쪽지 관리</p>
			        <hr />
			        
			        <div class="input-group mb-3 noteManageView-group1">
			          <button type="button" class="btn btn-secondary btn-sm" disabled>제목</button>
					  <input type="text" class="form-control" id="noteManageView-title" value="${messageListDetail.title}" aria-label="Recipient's username" aria-describedby="basic-addon2" disabled>
					  <button type="button" class="btn btn-secondary btn-sm" disabled>날짜</button>
					  <input type="text" class="form-control" value="${messageListDetail.send_date}" aria-label="Recipient's username" aria-describedby="basic-addon2" disabled>
					</div>
					
					<div class="input-group mb-3 noteManageView-group2">
			          <button type="button" class="btn btn-secondary btn-sm" disabled>제목</button>
					  <input type="text" class="form-control" id="noteManageView-title" value="${messageListDetail.title}" aria-label="Recipient's username" aria-describedby="basic-addon2" disabled>  
					</div>
					
					<div class="input-group mb-3 noteManageView-group3">
						<button type="button" class="btn btn-secondary btn-sm" disabled>날짜</button>
						<input type="text" class="form-control" value="${messageListDetail.send_date}" aria-label="Recipient's username" aria-describedby="basic-addon2" disabled>
					</div>
					
			    	<textarea class="form-control" id="exampleFormControlTextarea1" rows="15" disabled>${messageListDetail.contents}
			    	</textarea>
			    	
			    	<div class="d-flex justify-content-center mt-4 noteManageView-btn">
			    	  <input type="hidden" value="${messageListDetail.message_index}" name="message_index" />
			    	  <input type="hidden" value="${searchType}" name="searchType" />
			    	  <input type="hidden" value="${searchValue}" name="searchValue" />
			    	  <input type="hidden" value="${nowPage}" name="nowPage" />		
					  <button class="btn btn-secondary me-3 noteManageView-btn2" type="button" onclick="location.href='<%=request.getContextPath() %>/mypage_noteManage.do?searchType=${searchType}&searchValue=${searchValue}&nowPage=${nowPage}'">뒤로</button>
					  <button class="btn btn-dark noteManageView-btn2" type="button" onclick="messageDelete(this)">삭제</button>
					</div>
			    	
      				</div>
                </article>
            </div>

            <!-- 오른쪽 사이드메뉴 -->
            <div class="col-sm-3 col-md-2 col-lg-2 d-none d-sm-block">
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