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
     <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/recipeview.css">
      <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/js/recipe.js">
      
      
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
    integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
    crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
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
                    왼쪽왼쪽왼쪽왼쪽왼쪽왼쪽왼쪽왼쪽왼쪽왼쪽왼쪽왼쪽
                </aside>
            </div>

            <!-- 메인 -->
            <div class="col-8">
                <article id="mainSection">
                    <!-- 실질적인 메인 내용 -->
                    <div class="container">
						<div class="row hd">
							<div class="col-sm-8 col-xs-3 col-12">
								<strong>중식의 특유의 그 맛이 땡기는 날! 멀리 기다릴 필요도 없어요</strong>
							</div>

						</div>
						<div class="row">
							<div class="col-11">추천수 : 20 | 조회수 : 67 | 댓글(3)</div>
						</div>
						<div class="row body">
							<div class="d-none d-sm-block col-sm-2 col-2">
								<div class="sumnail" name="sumnailimg">
									<svg xmlns="http://www.w3.org/2000/svg" width="140"
										height="140" fill="currentColor" class="bi bi-images"
										viewBox="0 0 16 16">
                                    <path
											d="M4.502 9a1.5 1.5 0 1 0 0-3 1.5 1.5 0 0 0 0 3z" />
                                    <path
											d="M14.002 13a2 2 0 0 1-2 2h-10a2 2 0 0 1-2-2V5A2 2 0 0 1 2 3a2 2 0 0 1 2-2h10a2 2 0 0 1 2 2v8a2 2 0 0 1-1.998 2zM14 2H4a1 1 0 0 0-1 1h9.002a2 2 0 0 1 2 2v7A1 1 0 0 0 15 11V3a1 1 0 0 0-1-1zM2.002 4a1 1 0 0 0-1 1v8l2.646-2.354a.5.5 0 0 1 .63-.062l2.66 1.773 3.71-3.71a.5.5 0 0 1 .577-.094l1.777 1.947V5a1 1 0 0 0-1-1h-10z" />
                                </svg>
								</div>
							</div>
							<div class="col-sm-10 col-10">
								<table>
									<tr>
										<th class="tdimg"><img src="로고.png" width="100"
											height="100"></th>
										<td class="tdtx">햇반 컵밥입니다</td>
									</tr>
									<tr>
										<th class="plus"><strong>+</strong></th>
									</tr>
									<tr>
										<th class="tdimg"><img src="로고.png" width="100"
											height="100"></th>
										<td class="tdtx">햇반 컵밥입니다</td>
									</tr>
									<tr>
										<th class="plus"><strong>+</strong></th>
									</tr>
									<tr>
										<th class="tdimg"><img src="로고.png" width="100"
											height="100"></th>
										<td class="tdtx">햇반 컵밥입니다</td>

									</tr>

								</table>

							</div>
						</div>
						<div class="row">
							<div class="col-12 good">
								<a href="#"><svg xmlns="http://www.w3.org/2000/svg"
										width="50" height="50" fill="currentColor"
										class="bi bi-hand-thumbs-up-fill" viewBox="0 0 16 16">
                                    <path
											d="M6.956 1.745C7.021.81 7.908.087 8.864.325l.261.066c.463.116.874.456 1.012.965.22.816.533 2.511.062 4.51a9.84 9.84 0 0 1 .443-.051c.713-.065 1.669-.072 2.516.21.518.173.994.681 1.2 1.273.184.532.16 1.162-.234 1.733.058.119.103.242.138.363.077.27.113.567.113.856 0 .289-.036.586-.113.856-.039.135-.09.273-.16.404.169.387.107.819-.003 1.148a3.163 3.163 0 0 1-.488.901c.054.152.076.312.076.465 0 .305-.089.625-.253.912C13.1 15.522 12.437 16 11.5 16H8c-.605 0-1.07-.081-1.466-.218a4.82 4.82 0 0 1-.97-.484l-.048-.03c-.504-.307-.999-.609-2.068-.722C2.682 14.464 2 13.846 2 13V9c0-.85.685-1.432 1.357-1.615.849-.232 1.574-.787 2.132-1.41.56-.627.914-1.28 1.039-1.639.199-.575.356-1.539.428-2.59z" />
                                  </svg></a>
								<div name="">3</div>
							</div>
						</div>
						<div class="row">
							<div class="col-12">
								<div class="d-flex button">
									<button onclick="" class="btn btn-primary">목록</button>
									<button onclick="location.href='recipeinsert.do'" class="btn btn-warning">수정</button>
									<button class="btn btn-secondary">삭제</button>
								</div>
							</div>
							<div class="col-12">
								<button onclick="best();" class="btn btn-success">베스트
									레시피 선정</button>
							</div>
						</div>
						<div class="row">
							<div class="col-12">
								<h4>댓글 3</h4>
							</div>
						</div>
						<div class="row rp">
							<div class=" col-8 reply-write">
								<input type="text" placeholder="로그인 후 댓글 작성이 가능합니다.">
							</div>
							<div class="col-2">
								<button class="btn btn-secondary">등록</button>
							</div>
						</div>
						<div class="row">

							<div class="replyview">
								<div class="name">
									<p>홍길동</p>
								</div>
								<div class="wday">2022.03.17 12:00</div>
								<div class="report">
									<a href="#">신고<i class="bi bi-telephone-fill"></i></a>
								</div>

							</div>
						</div>
						<div class="row recont">

							<div name="replycontent" class="replycontent">정말 맛있어요~~</div>

						</div>
						</div>
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
    <script src="<%=request.getContextPath()%>/resources/js/recipe.js"></script>
</body>
</html>