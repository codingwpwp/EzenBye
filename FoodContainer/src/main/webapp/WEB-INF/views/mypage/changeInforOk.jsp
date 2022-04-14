<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>개인정보 변경</title>
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
	.nav8 {
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
				 
			        <p class="fs-6 lookup-fs-6">개인정보 변경</p>
			        <hr />
			        
			        <form action="mypageMemberModify.do" method="post" name="memberModify">
			        	<div>
				         	<div class="input-group mb-3 changeInforOk-inputId">
							  <span class="input-group-text fw-bold" id="inputGroup-sizing-default">아이디</span>
							  <input type="text" class="form-control" value="${memberInfor.id }" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" disabled>
							</div>
							<div class="changeInforOk-btn">
								<button type="button" class="btn btn-secondary fw-bold" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
								  비밀번호변경
								</button>
							</div>
							<div class="input-group mb-3 changeInforOk-inputName">
							  <span class="input-group-text fw-bold" id="inputGroup-sizing-default">이름</span>
							  <input type="text" name="name" class="form-control" value="${memberInfor.name }" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
							   <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger nameCheck">
							    필수
							   </span>
							   <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger nameCheck2">
							    형식오류
							   </span>
							</div>
							<div class="input-group changeInforOk-inputPhone">
							  <span class="input-group-text fw-bold">휴대전화</span>
							  <select class="form-select" name="phone1" aria-label="Default select example">
							  	  	  <option value="${fn:split(memberInfor.phone, '-')[0]}" selected>${fn:split(memberInfor.phone, '-')[0]}</option>
									  <option value="010">010</option>
									  <option value="011">011</option>
									  <option value="016">016</option>
									  <option value="017">017</option>
							  </select>
							  <span class="input-group-text">-</span>
							  <input type="number" value="${fn:split(memberInfor.phone, '-')[1]}" name="phone2" aria-label="Last name" class="form-control">
							  <span class="input-group-text">-</span>
							  <input type="number" value="${fn:split(memberInfor.phone, '-')[2]}" name="phone3" aria-label="Last name" class="form-control">
								<span class="position-absolute top-0 start-50 translate-middle badge rounded-pill bg-danger phoneCheck">
							    필수
							   </span>
							   <span class="position-absolute top-0 start-50 translate-middle badge rounded-pill bg-danger phoneCheck2">
							    형식오류
							   </span>
							   <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger phoneCheck3">
							    필수
							   </span>
							   <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger phoneCheck4">
							    형식오류
							   </span>
							</div>
							<input type="hidden" name="phone" value="">
							<input type="hidden" name="member_index" value="${memberInfor.member_index}">
							<div class="input-group mb-3 changeInforOk-inputNicName">
							  <span class="input-group-text fw-bold" id="inputGroup-sizing-default">닉네임</span>
							  <input type="text" name="nickname" value="${memberInfor.nickname}" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
							  <button type="button" class="btn btn-secondary btn-sm fw-bold position-relative" value="N" onclick="fn_nickChk(this);" id="nickChk">중복확인
							  <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger nicknameCheck">
							    필수
							   </span>
							   <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger nicknameCheck2">
							    중복체크 필수
							   </span>
							   </button>
							</div>
							<div class="input-group changeInforOk-inputEmail">
							  <span class="input-group-text fw-bold">이메일</span>
							  <input type="text" value="${fn:split(memberInfor.email, '@')[0]}" aria-label="Last name" class="form-control" disabled>
							  <span class="input-group-text fw-bold">@</span>
							  <input type="text" value="${fn:split(memberInfor.email, '@')[1]}" aria-label="Last name" class="form-control" disabled>
							</div>
							<div class="d-grid gap-3 d-md-flex justify-content-md-center">
							  <button class="btn btn-secondary col-lg-3 col-md-3 me-md-2" type="button" onclick="location.href='mypage_changeInfor.do'">취소</button>
							  <button class="btn btn-dark col-lg-3 col-md-3" type="button" onclick="mypageMemberModify(this);">수정</button>
							</div>
						</div>
					</form> 
			        
		        	<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
					  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title fw-bold" id="staticBackdropLabel">비밀번호 변경</h5>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					      </div>
					      <div class="modal-body">
					        <div class="mb-3 row">
							    <label for="inputPassword" class="col-sm-3 col-form-label fw-bold">현재비밀번호</label>
							    <div class="col-sm-7 position-relative">
							      <input name="pw1" type="password" class="form-control" id="inputPassword">
							      <span class="position-absolute top-0 start-50 translate-middle badge rounded-pill bg-danger pwChe1">
								   필수
								  </span>
								  <span class="position-absolute top-0 start-50 translate-middle badge rounded-pill bg-danger pwChe2">
								   알맞지 않음
								  </span>
							    </div>
							 </div>
							 <div class="mb-3 row">
							    <label for="inputPassword" class="col-sm-3 col-form-label fw-bold">변경비밀번호</label>
							    <div class="col-sm-7 position-relative">
							      <input name="pw" type="password" class="form-control" id="inputPassword" placeholder="8~20 영문+숫자+특수문자">
							      <span class="position-absolute top-0 start-50 translate-middle badge rounded-pill bg-danger pwChe3">
								   필수
								  </span>
								  <span class="position-absolute top-0 start-50 translate-middle badge rounded-pill bg-danger pwChe4">
								   형식오류
								  </span>
							    </div>
							 </div>
							 <div class="mb-3 row">
							    <label for="inputPassword" class="col-sm-3 col-form-label fw-bold">비밀번호확인</label>
							    <div class="col-sm-7 position-relative">
							      <input name="pw2" type="password" class="form-control" id="inputPassword" placeholder="8~20 영문+숫자+특수문자">
							      <span class="position-absolute top-0 start-50 translate-middle badge rounded-pill bg-danger pwChe5">
								   필수
								  </span>
								  <span class="position-absolute top-0 start-50 translate-middle badge rounded-pill bg-danger pwChe6">
								   알맞지 않음
								  </span>
							    </div>
							 </div>
					      </div>
					      <div class="modal-footer">
					      	<input type="hidden" value="${memberInfor.member_index}" name="member_index" />
					        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
					        <button type="button" class="btn btn-dark" onclick="mypageMemberpwModify(this)">변경</button>
					      </div>
					    </div>
					  </div>
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