<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원 상세조회</title>
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
				<%@include file="/WEB-INF/views/adminPage/nav_leftMenu.jsp"%>
            </div>

			<%@include file="/WEB-INF/views/base/nav.jsp"%>

        </div>
    </nav>

    <!-- 섹션 -->
    <section class="mt-1">
        <div class="row">

            <!-- 왼쪽 사이드메뉴 -->
            <div class="col-lg-2 d-none d-lg-block">
               <%@include file="/WEB-INF/views/adminPage/leftMenu.jsp"%>
            </div>

            <!-- 메인 -->
            <div class="col-12 col-sm-9 col-md-10 col-lg-8">
                <article id="mainSection">
    
                    <!-- 헤딩 -->
                    <div class="fs-5 my-2 fw-bold">
                        <span class="text-dark" id="activeMenu">회원 정보</span>
                    </div>

					<!-- 회원정보 -->
                    <div class="fw-bold my-3">
                        
                        <div class="row my-3">

                            <div class="col-12 col-sm-6 d-flex align-items-center px-4 px-sm-3 mb-3 mb-md-2">

                                <div class="col-5 col-sm-6 col-md-4 d-flex justify-content-sm-end pe-sm-2">
                                    <span class="infoTitle sameWidth p-1">회원 번호</span>
                                </div>

                                <div class="col-7 col-sm-6 col-md-8">
                                    <input type="text" class="form-control" value="${m.member_index}" disabled>
                                </div>

                            </div>

                            <div class="col-12 col-sm-6 d-flex align-items-center px-4 px-sm-1 mb-2">

                                <div class="col-5 col-sm-3 d-flex justify-content-sm-end pe-sm-2">
                                    <span class="infoTitle sameWidth p-1">아이디</span>
                                </div>

                                <div class="col-7 col-sm-9">
                                    <input type="text" class="form-control" value="${m.id}" disabled>
                                </div>

                            </div>
                            

                        </div>

                        <div class="row my-3">

                            <div class="col-12 col-sm-6 d-flex align-items-center px-4 px-sm-3 mb-3 mb-md-2">

                                <div class="col-5 col-sm-6 col-md-4 d-flex justify-content-sm-end pe-sm-2">
                                    <span class="infoTitle sameWidth p-1">닉네임</span>
                                </div>

                                <div class="col-7 col-sm-6 col-md-8">
                                    <input type="text" class="form-control" value="${m.nickname}" disabled>
                                </div>

                            </div>

                            <div class="col-12 col-sm-6 d-flex align-items-center px-4 px-sm-1 mb-2">

                                <div class="col-5 col-sm-3 d-flex justify-content-sm-end pe-sm-2">
                                    <span class="infoTitle sameWidth p-1">가입일</span>
                                </div>

                                <div class="col-7 col-sm-9">
                                    <input type="text" class="form-control" value="${fn:substring(m.join_date, 0,10)}" disabled>
                                </div>

                            </div>
                            

                        </div>

                        <div class="row my-3">

                            <div class="col-12 col-sm-6 d-flex align-items-center px-4 px-sm-3 mb-3 mb-md-2">

                                <div class="col-5 col-sm-6 col-md-4 d-flex justify-content-sm-end pe-sm-2">
                                    <span class="infoTitle sameWidth p-1">이름</span>
                                </div>

                                <div class="col-7 col-sm-6 col-md-8">
                                    <input type="text" class="form-control" value="${m.name}" disabled>
                                </div>

                            </div>

                            <div class="col-12 col-sm-6 d-flex align-items-center px-4 px-sm-1 mb-2">

                                <div class="col-5 col-sm-3 d-flex justify-content-sm-end pe-sm-2">
                                    <span class="infoTitle sameWidth p-1">연락처</span>
                                </div>

                                <div class="col-7 col-sm-9">
                                    <input type="text" class="form-control" value="${m.phone}" disabled>
                                </div>

                            </div>
                            

                        </div>

                        <div class="row my-3">
                        
                            <div class="col-12 d-flex align-items-center px-4 px-sm-1 ps-md-2 pe-md-1 mb-2">

                                <div class="col-5 col-sm-3 col-md-2 d-flex justify-content-sm-end px-0 pe-sm-2">
                                    <span class="infoTitle sameWidth p-1">이메일</span>
                                </div>

                                <div class="col-7 col-sm-9 col-md-10 px-0">
                                    <input type="text" class="form-control" value="${m.email}" disabled>
                                </div>

                            </div>

                        </div>

                        <div class="row my-3">
                        
                            <div class="col-12 d-flex align-items-center px-4 px-sm-1 ps-md-2 pe-md-1 mb-2">

                                <div class="col-5 col-sm-3 col-md-2 d-flex justify-content-sm-end px-0 pe-sm-2">
                                    <span class="infoTitle sameWidth p-1">기본 배송지</span>
                                </div>

                                <div class="col-7 col-sm-9 col-md-10 px-0">
                                    <textarea class="form-control" rows="4" disabled><c:if test="${not empty m.address}">${m.address}</c:if><c:if test="${empty m.address}">기본배송지가 없습니다.</c:if></textarea>
                                </div>

                            </div>

                        </div>

                    </div>
                    
                    <!-- 각종 버튼들 -->
                    <div class="ps-2">
                        <button type="button" class="btn btn-primary me-2" onclick="location.href='member_list.do?searchType=${searchType}&searchValue=${searchValue}&nowPage=${nowPage}'">뒤로</button>
                        <button type="button" class="btn btn-danger me-2" onclick="changeMemberDelyn(${m.member_index}, '${m.id}')">회원추방</button>
                        <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#messageModal"><i class="bi bi-envelope"></i> 쪽지</button>
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
                                
                                <form class="modal-body" name="messageForm">
                                
                                    <div class="row d-flex align-items-center mb-3">

                                        <div class="col-12 d-flex align-items-center mb-3">

                                            <div class="col-3 col-sm-2">
                                                <span class="infoTitle p-1">받는 회원</span>
                                            </div>
            
                                            <div class="col-9 col-sm-10">
                                                <input type="text" class="form-control" value="${m.id}" disabled>
                                                <input type="hidden" name="member_index" value="${m.member_index}">
                                            </div>

                                        </div>


                                    </div>

                                    <div class="row d-flex align-items-center mb-3">
                                        <div class="col-12 d-flex align-items-center">

                                            <div class="col-3 col-sm-2 d-flex justify-content-center">
                                                <span class="infoTitle p-1" id="titleSpan">제목</span>
                                            </div>
            
                                            <div class="col-9 col-sm-10">
                                                <input type="text" class="form-control" name="title" value="" placeholder="제목을 입력하세요">
                                            </div>

                                        </div>
                                    </div>

                                    <div class="row d-flex align-items-center">
                                        <div class="col-12 d-flex align-items-center">

                                            <div class="col-3 col-sm-2 d-flex justify-content-center">
                                                <span class="infoTitle p-1" id="contentsSpan">내용</span>
                                            </div>
            
                                            <div class="col-9 col-sm-10">
                                                <textarea class="form-control" id="exampleFormControlTextarea1" name="contents" rows="3" placeholder="내용을 작성하세요" maxlength="100"></textarea>
                                            </div>

                                        </div>
                                    </div>

                                </form>

                                <div class="modal-footer d-flex justify-content-start">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="messageCancelBtn">취소</button>
                                    <button type="button" class="btn btn-primary" onclick="sendMessage('${m.id}');">보내기</button>
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
    <script type="text/javascript">
    window.onpageshow = function(event) {
        if ( event.persisted || (window.performance && window.performance.navigation.type == 2)) {
        	history.forward();
        } 
    }
    </script>
</body>
</html>