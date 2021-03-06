<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>고객센터 상세조회</title>
    <!-- css링크 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/base.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/notice.css">
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"rel="stylesheet">
	
</head>
<body onselectstart="return false;">
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
 
                    <div class="fs-5 my-2 fw-bold">1:1문의</div>

                 	<div class="maindiv" style="max-width: 900px;">
						<table class="table">
							<thead class="fw-bold fs-6">
								<tr>
									<th scope="col">제목</th>
									<td class="title">${view.title}</td>
									<td style="text-align: left; font-size: small;">${fn:substring(view.write_date, 0,10)}</td>
								</tr>
							</thead>
							<tbody>
								<tr class="fw-bold fs-6">
									<th scope="row">작성자</th>
									<td>${view.name}</td>
									<td style="text-align: left;">${view.sort2}</td>
								</tr>
								<tr>
									<td colspan="3">
										<div class='p-3 w-100 mt-4 border border-dark rounded-2' style="min-height: 300px;">${view.contents}</div>
									</td>
								</tr>
							</tbody>
						</table>
						
						<!-- 답변들 -->
						<c:if test ="${not empty reply}">
							<div class="my-3 container fw-bold row d-flex align-items-center">
								<div class="col-4 col-md-3 col-xl-2" style="display: flex;align-items: center;flex-wrap: wrap;justify-content: center;">
									<span class='bg-warning bg-opacity-50 p-1 border border-warning rounded-2'>
										<img src="<%=request.getContextPath()%>/resources/img/adminicon.png" width="20"> 관리자
									</span>
									<br>
									<span>${fn:substring(reply.reply_date, 0,10)}</span>
								</div>
								<div class="col-5 col-md-7 col-xl-8 p-3">
									${reply.contents}
								</div>
							</div>
						</c:if>

						
						<!-- 답변 쓰는 곳 -->
						<c:if test ="${empty reply}">
						<c:if test="${member.position ne null and member.position eq '관리자'}">
							<form class="row d-flex align-items-center mt-5" action="replyInsert.do" method="post" id="replyForm" onsubmit="return replySubmit();">
								<div class="col-10 col-xl-11 pe-2">
									<input type="hidden" name="serviceCenter_index" value="${view.serviceCenter_index}">
									<textarea style="max-height: 65px; border-radius: 3px;" placeholder="답변을 두 번이상 등록할 수 없습니다." name="contents" maxlength="100"></textarea>
								</div>
								<div class="col-2 col-xl-1 px-0">
									<button class="btn btn-primary" type="submit">등록</button>
								</div>
							</form>
						</c:if>
						</c:if>
						
						<!-- 버튼 -->
						<hr>
						<div class="row">
							<div class="col-md-2 col-sm-2 col-3 leftbtn">
								<input value="목록" type="button" class="btn btn-primary listbtn" onclick="location.href='serviceCenter.do?sort2=${sort2}&nowPage=${nowPage}'">
							</div>
							<div class="col-md-10 col-sm-10 col-9 rightbtn">
								<c:if test="${member.position ne null and member.position eq '관리자'}">
									<input value="삭제" type="button" class="btn btn-secondary updatebtn" onclick="location.href='serviceCenter_delete.do?serviceCenter_index=${view.serviceCenter_index}'">
								</c:if>
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
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
        <script src="<%=request.getContextPath()%>/resources/js/notice.js"></script>
</body>
</html>