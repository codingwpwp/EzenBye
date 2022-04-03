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
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/adminPage_leftMenu.css">
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
				<%@include file="/WEB-INF/views/adminPage/adminPage_nav_leftMenu.jsp"%>
            </div>

			<%@include file="/WEB-INF/views/base/nav.jsp"%>

        </div>
    </nav>

    <!-- 섹션 -->
    <section class="mt-1">
        <div class="row">

            <!-- 왼쪽 사이드메뉴 -->
            <div class="col-lg-2 d-none d-lg-block">
               <%@include file="/WEB-INF/views/adminPage/leftAside.jsp"%>
            </div>

            <!-- 메인 -->
            <div class="col-12 col-sm-9 col-md-10 col-lg-8">
                <article id="mainSection">
    
                    <!-- 헤딩 -->
                    <div class="fs-5 my-2 fw-bold">
                        신고 리스트
                    </div>

                    <!-- 메인컨텐츠 -->
                    <div>

                        <div class="form-check my-2">
                            <input class="form-check-input border border-dark" type="checkbox" value="" id="reportCheckbox">
                            <label class="form-check-label me-3 text-dark fw-bold" for="reportCheckbox">
                                전체
                            </label>
                            <button type="button" class="btn btn-outline-danger btn-sm p-1 fw-bold">선택 삭제</button>
                        </div>

                        <div class="table-responsive">
                            <table class="table table-hover centerTable" style="min-width: 550px;">

                                <colgroup></colgroup>
    
                                <thead>
                                    <tr>
                                        <th scope="col">선택</th>
                                        <th scope="col">신고 유형</th>
                                        <th scope="col">신고내용</th>
                                        <th scope="col">신고자</th>
                                        <th scope="col">신고시간</th>
                                    </tr>
                                </thead>
    
                                <tbody>
    
                                    <tr>

                                        <td>
                                            <input class="form-check-input border border-dark" type="checkbox" value="">
                                        </td>

                                        <td>
                                            댓글
                                        </td>

                                        <td>
                                            <a class="link-dark fw-bold reportContent" data-bs-toggle="modal" data-bs-target="#replyModal">
                                                댓글신고경우
                                            </a>
                                        </td>

                                        <td>
                                            <div class="position-relative">
                                                <span class="reportId">testertester12345
                                                    <button type="button" class="reportIdSubButton position-absolute btn btn-outline-success p-1" data-bs-toggle="modal" data-bs-target="#messageModal">
                                                        <i class="bi bi-envelope"></i> 쪽지
                                                    </button>
                                                </span>
                                            </div>
                                        </td>

                                        <td>
                                            2022-01-01 12:10
                                        </td>
                                        
                                    </tr>
    
                                    <tr>

                                        <td>
                                            <input class="form-check-input border border-dark" type="checkbox" value="">
                                        </td>

                                        <td>
                                            리뷰
                                        </td>

                                        <td>
                                            <a class="link-dark fw-bold reportContent" data-bs-toggle="modal" data-bs-target="#reviewModal">
                                                리뷰신고경우
                                            </a>
                                        </td>

                                        <td>
                                            <div class="position-relative">
                                                <span class="reportId">tester2
                                                    <button type="button" class="reportIdSubButton position-absolute btn btn-outline-success p-1" data-bs-toggle="modal" data-bs-target="#messageModal">
                                                        <i class="bi bi-envelope"></i> 쪽지
                                                    </button>
                                                </span>
                                            </div>
                                        </td>

                                        <td>
                                            2022-01-01 12:10
                                        </td>

                                    </tr>
    
                                    <tr>

                                        <td>
                                            <input class="form-check-input border border-dark" type="checkbox" value="">
                                        </td>

                                        <td>
                                            레시피
                                        </td>

                                        <td>
                                            <a class="link-dark fw-bold reportContent" data-bs-toggle="modal" data-bs-target="#recipeModal">
                                                레시피신고경우
                                            </a>
                                        </td>

                                        <td>
                                            <div class="position-relative">
                                                <span class="reportId">tester2
                                                    <button type="button" class="reportIdSubButton position-absolute btn btn-outline-success p-1" data-bs-toggle="modal" data-bs-target="#messageModal">
                                                        <i class="bi bi-envelope"></i> 쪽지
                                                    </button>
                                                </span>
                                            </div>
                                        </td>

                                        <td>
                                            2022-01-01 12:10
                                        </td>

                                    </tr>
    
                                </tbody>
    
                            </table>
                        </div>

                    </div>


                    <!-- 쪽지 -->
                    <div class="modal fade" id="messageModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="messageModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">

                                <div class="modal-header">
                                    <span class="modal-title fs-3 fw-bold" id="messageModalLabel">
                                        <i class="bi bi-envelope"></i> 쪽지
                                    </span>
                                </div>
                                
                                <div class="modal-body">
                                
                                    <div class="row d-flex align-items-center mb-3">

                                        <div class="col-12 col-sm-6 d-flex align-items-center mb-3">

                                            <div class="col-3 col-sm-4">
                                                <span class="infoTitle p-1">받는 회원</span>
                                            </div>
            
                                            <div class="col-9 col-sm-8">
                                                <input type="text" class="form-control" value="testertester12345" disabled>
                                            </div>

                                        </div>

                                        <div class="col-12 col-sm-6 d-flex align-items-center mb-3">

                                            <div class="col-3 col-sm-4">
                                                <span class="infoTitle p-1">날짜</span>
                                            </div>
            
                                            <div class="col-9 col-sm-8">
                                                <input type="text" class="form-control" value="2022-03-03" disabled>
                                            </div>

                                        </div>

                                    </div>

                                    <div class="row d-flex align-items-center mb-3">
                                        <div class="col-12 d-flex align-items-center">

                                            <div class="col-3 col-sm-2">
                                                <span class="infoTitle p-1">제목</span>
                                            </div>
            
                                            <div class="col-9 col-sm-10">
                                                <input type="text" class="form-control" value="" placeholder="제목을 입력하세요">
                                            </div>

                                        </div>
                                    </div>

                                    <div class="row d-flex align-items-center">
                                        <div class="col-12 d-flex align-items-center">

                                            <div class="col-3 col-sm-2">
                                                <span class="infoTitle p-1">내용</span>
                                            </div>
            
                                            <div class="col-9 col-sm-10">
                                                <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" placeholder="내용을 작성하세요" maxlength="100"></textarea>
                                            </div>

                                        </div>
                                    </div>

                                </div>

                                <div class="modal-footer d-flex justify-content-start">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                                    <button type="button" class="btn btn-primary">보내기</button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- 댓글 -->
                    <div class="modal fade" id="replyModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="replyModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">

                                <div class="modal-header">
                                    <span class="modal-title fs-3 fw-bold" id="replyModalLabel"> <i class="bi bi-chat-dots-fill"></i> 댓글</span>
                                </div>

                                <div class="modal-body">

                                    <div class="row d-flex align-items-center mb-1">

                                        <div class="col-12 col-sm-6 d-flex align-items-center mb-3">

                                            <div class="col-3 col-sm-4">
                                                <span class="infoTitle p-1">신고자</span>
                                            </div>
            
                                            <div class="col-9 col-sm-8">
                                                <input type="text" class="form-control" value="testertester12345" disabled>
                                            </div>

                                        </div>

                                        <div class="col-12 col-sm-6 d-flex align-items-center mb-3">

                                            <div class="col-3 col-sm-4">
                                                <span class="infoTitle p-1">날짜</span>
                                            </div>
            
                                            <div class="col-9 col-sm-8">
                                                <input type="text" class="form-control" value="2022-03-03" disabled>
                                            </div>

                                        </div>

                                    </div>

                                    <div class="row mb-3 d-flex align-items-center">

                                        <div class="col-3 col-sm-2 pe-0">
                                            <span class="infoTitle p-1">신고내용</span>
                                        </div>

                                        <div class="col-9 col-sm-10 ps-1">
                                            <input type="text" class="form-control" value="사기죄" disabled>
                                        </div>
                                        
                                    </div>

                                    <hr>

                                    <div class="row mb-3 d-flex align-items-center">
                                        <div class="col-3 col-sm-2">
                                            <span class="infoTitle p-1">작성자</span>
                                        </div>
                                        <div class="col-9 col-sm-10 ps-1">
                                            <input type="text" class="form-control" value="tester1" disabled>
                                        </div>
                                    </div>

                                    <div class="row d-flex align-items-center">

                                        <div class="col-3 col-sm-2 pe-0">
                                            <span class="infoTitle p-1">댓글내용</span>
                                        </div>

                                        <div class="col-9 col-sm-10 ps-1">
                                            <textarea class="form-control" id="exampleFormControlTextarea1" rows="4" disabled>댓글내용입니다.</textarea>
                                        </div>

                                    </div>

                                </div>
                                
                                <div class="modal-footer d-flex justify-content-start">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                                    <button type="button" class="btn btn-danger">댓글 삭제</button>
                                    <button type="button" class="btn btn-dark">블랙리스트 추가</button>
                                </div>

                            </div>
                        </div>
                    </div>

                    <!-- 리뷰 -->
                    <div class="modal fade" id="reviewModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="reviewModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">

                                <div class="modal-header">
                                    <span class="modal-title fs-3 fw-bold" id="reviewModalLabel"> <i class="fa-solid fa-eye"></i> 리뷰</span>
                                </div>

                                <div class="modal-body">

                                    <div class="row d-flex align-items-center mb-1">

                                        <div class="col-12 col-sm-6 d-flex align-items-center mb-3">

                                            <div class="col-3 col-sm-4">
                                                <span class="infoTitle p-1">신고자</span>
                                            </div>
            
                                            <div class="col-9 col-sm-8">
                                                <input type="text" class="form-control" value="testertester12345" disabled>
                                            </div>

                                        </div>

                                        <div class="col-12 col-sm-6 d-flex align-items-center mb-3">

                                            <div class="col-3 col-sm-4">
                                                <span class="infoTitle p-1">날짜</span>
                                            </div>
            
                                            <div class="col-9 col-sm-8">
                                                <input type="text" class="form-control" value="2022-03-03" disabled>
                                            </div>

                                        </div>

                                    </div>

                                    <div class="row mb-3 d-flex align-items-center">

                                        <div class="col-3 col-sm-2 pe-0">
                                            <span class="infoTitle p-1">신고내용</span>
                                        </div>

                                        <div class="col-9 col-sm-10 ps-1">
                                            <input type="text" class="form-control" value="사기죄" disabled>
                                        </div>

                                    </div>

                                    <hr>

                                    <div class="row mb-3 d-flex align-items-center">
                                        <div class="col-3 col-sm-2">
                                            <span class="infoTitle p-1">작성자</span>
                                        </div>
                                        <div class="col-9 col-sm-10 ps-1">
                                            <input type="text" class="form-control" value="tester1" disabled>
                                        </div>
                                    </div>

                                    <div class="row d-flex align-items-center">
                                        <div class="col-3 col-sm-2 pe-0">
                                            <span class="infoTitle p-1">리뷰내용</span>
                                        </div>
                                        <div class="col-9 col-sm-10 ps-1">
                                            <textarea class="form-control" id="exampleFormControlTextarea1" rows="4" disabled>리뷰내용입니다.</textarea>
                                        </div>
                                    </div>

                                </div>

                                <div class="modal-footer d-flex justify-content-start">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                                    <button type="button" class="btn btn-danger">리뷰 삭제</button>
                                    <button type="button" class="btn btn-dark">블랙리스트 추가</button>
                                </div>

                            </div>
                        </div>
                    </div>

                    <!-- 레시피 -->
                    <div class="modal fade" id="recipeModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="recipeModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">

                                <div class="modal-header">
                                    <span class="modal-title fs-3 fw-bold" id="recipeModalLabel"> <i class="fa-solid fa-spoon"></i> 레시피</span>
                                </div>

                                <div class="modal-body">

                                    <div class="row d-flex align-items-center mb-1">

                                        <div class="col-12 col-sm-6 d-flex align-items-center mb-3">

                                            <div class="col-3 col-sm-4">
                                                <span class="infoTitle p-1">신고자</span>
                                            </div>
            
                                            <div class="col-9 col-sm-8">
                                                <input type="text" class="form-control" value="testertester12345" disabled>
                                            </div>

                                        </div>

                                        <div class="col-12 col-sm-6 d-flex align-items-center mb-3">

                                            <div class="col-3 col-sm-4">
                                                <span class="infoTitle p-1">날짜</span>
                                            </div>
            
                                            <div class="col-9 col-sm-8">
                                                <input type="text" class="form-control" value="2022-03-03" disabled>
                                            </div>

                                        </div>

                                    </div>

                                    <div class="row mb-3 d-flex align-items-center">

                                        <div class="col-3 col-sm-2 pe-0">
                                            <span class="infoTitle p-1">신고내용</span>
                                        </div>

                                        <div class="col-9 col-sm-10 ps-1">
                                            <input type="text" class="form-control" value="사기죄" disabled>
                                        </div>

                                    </div>

                                    <hr>

                                    <div class="row mb-3 d-flex align-items-center">

                                        <div class="col-3 col-sm-2">
                                            <span class="infoTitle p-1">작성자</span>
                                        </div>

                                        <div class="col-5 ps-1">
                                            <input type="text" class="form-control" value="tester1" disabled>
                                        </div>

                                        <div class="col-3">
                                            <button type="button" class="btn btn-outline-primary" style="white-space: nowrap;">글 보러가기</button>
                                        </div>

                                    </div>

                                </div>

                                <div class="modal-footer d-flex justify-content-start">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                                    <button type="button" class="btn btn-danger">삭제</button>
                                    <button type="button" class="btn btn-dark">블랙리스트 추가</button>
                                </div>

                            </div>
                        </div>
                    </div>
    
                </article>
            </div>

            <!-- 오른쪽 사이드메뉴 -->
            <div class="col-sm-3 col-md-2 col-lg-2 d-none d-sm-block">
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
	<script src="<%=request.getContextPath()%>/resources/js/adminPage.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/adminPage_leftMenu.js"></script>
</body>
</html>