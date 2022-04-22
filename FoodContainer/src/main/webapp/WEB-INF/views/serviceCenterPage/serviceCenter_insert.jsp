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
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/notice.css">
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"rel="stylesheet">
	
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
                
                </aside> 
            </div>

            <!-- 메인 -->
            <div class="col-12 col-sm-9 col-md-10 col-lg-8">
                <article id="mainSection">
                    
                    <div class="fs-5 my-2 fw-bold">${sort1}</div>

                 	<form class="maindiv" id="serviceCenterForm" action="serviceCenter_insert.do" method="post">
						<table class="table">
							<thead>
								<tr>
									<th scope="col" style="vertical-align: middle;">제목</th>
									<td class="title">
										<input type="text" name="title" class="form-control" maxlength="20" autocomplete="off">
									</td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th scope="row">작성자</th>
									<td>${member.name}</td>
									<td>
										<select class="form-select form-select-sm fw-bold" name="sort2" onchange="changeColorFn(this)">
											<option value="no" disabled selected style="display: none;">종류를 선택하세요</option>
		                                    <option class="fw-bold bg-primary bg-gradient bg-opacity-50" value="상품">상품</option>
		                                    <option class="fw-bold bg-success bg-gradient bg-opacity-50" value="배송">배송</option>
		                                    <option class="fw-bold bg-warning bg-gradient bg-opacity-50" value="취소">취소</option>
		                                    <option class="fw-bold bg-info bg-gradient bg-opacity-50" value="회원">회원</option>
		                                </select>
									</td>
								</tr>
								<tr>
									<td colspan="3">
										<textarea id="summernote" name="contents"></textarea>
									</td>
								</tr>
							</tbody>
						</table>
						<div class="row">
						<div class="col-md-2 col-sm-2 col-4 leftbtn">
							<input value="목록" type="button" class="btn btn-secondary listbtn" onclick="location.href='serviceCenter.do?sort2=${sort2}&nowPage=${nowPage}'">
						</div>
						<div class="col-md-10 col-sm-10 col-8 rightbtn">
							<input value="등록" type="button" class="btn btn-primary insertbtn" onclick="submitFn()">
						</div>
						</div>

					</form>

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
        <script src="<%=request.getContextPath()%>/resources/js/serviceCenter.js"></script>
</body>
</html>