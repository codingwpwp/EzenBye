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
					
                    <div class="container">

                        <div class="form-check my-2">

                            <input class="form-check-input border border-success" type="checkbox" value="" id="flexCheckDefault">
                            <label class="form-check-label me-3 text-success fw-bold" for="flexCheckDefault">
                                전체
                            </label>

                            <button type="button" class="btn btn-outline-danger btn-sm p-1 fw-bold">선택 삭제처리</button>    

                        </div>

                        <table class="table table-hover">

                            <colgroup></colgroup>

                            <thead>
                                <tr>
                                    <th scope="col">선택</th>
                                    <th scope="col" class="d-none d-lg-table-cell">신고 유형</th>
                                    <th scope="col">신고내용</th>
                                    <th scope="col" class="d-none d-sm-table-cell">신고자</th>
                                    <th scope="col" class="d-none d-md-table-cell">시간</th>
                                </tr>
                            </thead>

                            <tbody>

                                <tr>
                                    <td class="col1">
                                        <input class="form-check-input border border-dark" type="checkbox" value="" id="flexCheckDefault">
                                    </td>
                                    <td class="col2 d-none d-lg-table-cell">
                                        댓글
                                    </td>
                                    <td class="col3">
                                        <a class="link-dark fw-bold reportContent" data-bs-toggle="modal" data-bs-target="#replyModal">
                                            댓글신고경우
                                        </a>
                                    </td>
                                    <td class="col4 d-none d-sm-table-cell">
                                        <div class="position-relative">
                                            <span class="reportId">tester2
                                                <br>
                                                <button type="button" class="reportIdSubButton position-absolute btn btn-outline-success p-1" data-bs-toggle="modal" data-bs-target="#messageModal">
                                                    <i class="bi bi-envelope"></i> 쪽지
                                                </button>
                                            </span>
                                        </div>
                                        
                                    </td>
                                    <td class="col5 d-none d-md-table-cell">
                                        2022-01-01 12:10
                                    </td>
                                </tr>

                                <tr>
                                    <td class="col1">
                                        <input class="form-check-input border border-dark" type="checkbox" value="" id="flexCheckDefault">
                                    </td>
                                    <td class="col2 d-none d-lg-table-cell">
                                        리뷰
                                    </td>
                                    <td class="col3">
                                        <a class="link-dark fw-bold reportContent" data-bs-toggle="modal" data-bs-target="#reviewModal">
                                            리뷰신고경우
                                        </a>
                                    </td>
                                    <td class="col4 d-none d-sm-table-cell">
                                        <div class="position-relative">
                                            <span class="reportId">tester2
                                                <br>
                                                <button type="button" class="reportIdSubButton position-absolute btn btn-outline-success p-1" data-bs-toggle="modal" data-bs-target="#messageModal">
                                                    <i class="bi bi-envelope"></i> 쪽지
                                                </button>
                                            </span>
                                        </div>
                                        
                                    </td>
                                    <td class="col5 d-none d-md-table-cell">
                                        2022-01-01 12:10
                                    </td>
                                </tr>

                                <tr>
                                    <td class="col1">
                                        <input class="form-check-input border border-dark" type="checkbox" value="" id="flexCheckDefault">
                                    </td>
                                    <td class="col2 d-none d-lg-table-cell">
                                        레시피
                                    </td>
                                    <td class="col3">
                                        <a class="link-dark fw-bold reportContent" data-bs-toggle="modal" data-bs-target="#recipeModal">
                                            레시피신고경우
                                        </a>
                                    </td>
                                    <td class="col4 d-none d-sm-table-cell">
                                        <div class="position-relative">
                                            <span class="reportId">tester2
                                                <br>
                                                <button type="button" class="reportIdSubButton position-absolute btn btn-outline-success p-1" data-bs-toggle="modal" data-bs-target="#messageModal">
                                                    <i class="bi bi-envelope"></i> 쪽지
                                                </button>
                                            </span>
                                        </div>
                                        
                                    </td>
                                    <td class="col5 d-none d-md-table-cell">
                                        2022-01-01 12:10
                                    </td>
                                </tr>

                            </tbody>

                        </table>

                    </div>

                    <!-- 검색&페이징 -->
                    <div id="searchMember" class="row container mt-3">

                        <div class="col-12 col-lg-6">

                            <form class="row" method="get" action="#">
                                <select class="col-3 form-select form-select-sm">
                                    <option>신고자</option>
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

                    <!-- 쪽지 -->
                    <div class="modal fade" id="messageModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title fw-bold" id="staticBackdropLabel"> <i class="bi bi-envelope"></i> 쪽지 보내기</h5>
                                </div>
                                <div class="modal-body">

                                    <div class="row mb-3">
                                        <div class="col-3 col-md-2">
                                            <span>받는 회원</span>
                                        </div>
                                        <div class="col-9 col-md-4 mb-3">
                                            <input type="text" class="form-control" value="tester1" disabled>
                                        </div>


                                        <div class="col-3 col-md-2">
                                            <span>날짜</span>
                                        </div>
                                        <div class="col-9 col-md-4">
                                            <input type="text" class="form-control" value="2022-01-01" disabled>
                                        </div>
                                    </div>

                                    <div class="row mb-3">
                                        <div class="col-3 col-md-2">
                                            <span>제목</span>
                                        </div>
                                        <div class="col-9 col-md-10">
                                            <input type="text" class="form-control" placeholder="제목을 입력하세요">
                                        </div>
                                    </div>

                                    <div class="row mb-3">
                                        <div class="col-3 col-md-2">
                                            <span>내용</span>
                                        </div>
                                        <div class="col-9 col-md-10">
                                            <textarea class="form-control bg-warning bg-gradient bg-opacity-25" id="exampleFormControlTextarea1" rows="3" maxlength="100" placeholder="내용을 입력하세요">쪽지내용내용내용</textarea>
                                        </div>
                                    </div>

                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">취소</button>
                                    <button type="button" class="btn btn-outline-success">보내기</button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- 댓글 -->
                    <div class="modal fade" id="replyModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title fw-bold" id="staticBackdropLabel"> <i class="bi bi-chat-dots-fill"></i> 댓글</h5>
                                </div>
                                <div class="modal-body">

                                    <div class="row mb-3">
                                        <div class="col-3 col-md-2">
                                            <span>신고자</span>
                                        </div>
                                        <div class="col-9 col-md-4 mb-3">
                                            <input type="text" class="form-control" value="tester1" disabled>
                                        </div>


                                        <div class="col-3 col-md-2">
                                            <span>날짜</span>
                                        </div>
                                        <div class="col-9 col-md-4">
                                            <input type="text" class="form-control" value="2022-01-01" disabled>
                                        </div>
                                    </div>

                                    <div class="row mb-3">
                                        <div class="col-3 col-md-2">
                                            <span>신고내용</span>
                                        </div>
                                        <div class="col-9 col-md-10">
                                            <input type="text" class="form-control fw-bold" value="사기죄" disabled>
                                        </div>
                                    </div>

                                    <hr>

                                    <div class="row mb-3">
                                        <div class="col-3 col-md-2">
                                            <span>작성자</span>
                                        </div>
                                        <div class="col-5">
                                            <input type="text" class="form-control" value="tester1" disabled>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-3 col-md-2">
                                            <span>댓글내용</span>
                                        </div>
                                        <div class="col-9 col-md-10">
                                            <textarea class="form-control bg-warning bg-gradient bg-opacity-25" id="exampleFormControlTextarea1" rows="4" disabled>댓글내용입니다.</textarea>
                                        </div>
                                    </div>

                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">닫기</button>
                                    <button type="button" class="btn btn-outline-danger">삭제</button>
                                    <button type="button" class="btn btn-outline-dark">블랙리스트 추가</button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- 리뷰 -->
                    <div class="modal fade" id="reviewModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title fw-bold" id="staticBackdropLabel"> <i class="fa-solid fa-eye"></i> 리뷰</h5>
                                </div>
                                <div class="modal-body">

                                    <div class="row mb-3">
                                        <div class="col-3 col-md-2">
                                            <span>신고자</span>
                                        </div>
                                        <div class="col-9 col-md-4 mb-3">
                                            <input type="text" class="form-control" value="tester1" disabled>
                                        </div>


                                        <div class="col-3 col-md-2">
                                            <span>날짜</span>
                                        </div>
                                        <div class="col-9 col-md-4">
                                            <input type="text" class="form-control" value="2022-01-01" disabled>
                                        </div>
                                    </div>

                                    <div class="row mb-3">
                                        <div class="col-3 col-md-2">
                                            <span>신고내용</span>
                                        </div>
                                        <div class="col-9 col-md-10">
                                            <input type="text" class="form-control fw-bold" value="사기죄" disabled>
                                        </div>
                                    </div>

                                    <hr>

                                    <div class="row mb-3">
                                        <div class="col-3 col-md-2">
                                            <span>작성자</span>
                                        </div>
                                        <div class="col-5">
                                            <input type="text" class="form-control" value="tester1" disabled>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-3 col-md-2">
                                            <span>리뷰내용</span>
                                        </div>
                                        <div class="col-9 col-md-10">
                                            <textarea class="form-control bg-warning bg-gradient bg-opacity-25" id="exampleFormControlTextarea1" rows="4" disabled>댓글내용입니다.</textarea>
                                        </div>
                                    </div>

                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">닫기</button>
                                    <button type="button" class="btn btn-outline-danger">삭제</button>
                                    <button type="button" class="btn btn-outline-dark">블랙리스트 추가</button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- 레시피 -->
                    <div class="modal fade" id="recipeModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title fw-bold" id="staticBackdropLabel"> <i class="fa-solid fa-spoon"></i> 레시피</h5>
                                </div>
                                <div class="modal-body">

                                    <div class="row mb-3">
                                        <div class="col-3 col-md-2">
                                            <span>신고자</span>
                                        </div>
                                        <div class="col-9 col-md-4 mb-3">
                                            <input type="text" class="form-control" value="tester1" disabled>
                                        </div>


                                        <div class="col-3 col-md-2">
                                            <span>날짜</span>
                                        </div>
                                        <div class="col-9 col-md-4">
                                            <input type="text" class="form-control" value="2022-01-01" disabled>
                                        </div>
                                    </div>

                                    <div class="row mb-3">
                                        <div class="col-3 col-md-2">
                                            <span>신고내용</span>
                                        </div>
                                        <div class="col-9 col-md-10">
                                            <input type="text" class="form-control fw-bold" value="사기죄" disabled>
                                        </div>
                                    </div>

                                    <hr>

                                    <div class="row mb-3 d-flex align-items-center">
                                        <div class="col-3 col-md-2">
                                            <span>작성자</span>
                                        </div>
                                        <div class="col-5">
                                            <input type="text" class="form-control" value="tester1" disabled>
                                        </div>
                                        <div class="col">
                                            <button type="button" class="btn btn-outline-primary btn-sm">글 보러가기</button>
                                        </div>
                                    </div>

                                    

                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">닫기</button>
                                    <button type="button" class="btn btn-outline-danger">삭제</button>
                                    <button type="button" class="btn btn-outline-dark">블랙리스트 추가</button>
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