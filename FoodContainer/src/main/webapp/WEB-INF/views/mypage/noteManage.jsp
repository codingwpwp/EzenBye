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
			        
			        <c:if test="${empty messageList}">
			        <div class="lookupBorder">
			        	<p class="fs-6 lookup-fs-6">받은 쪽지가 없습니다.</p>
		        	</div>
			        </c:if>
			        
			        <c:if test="${!empty messageList}">
			        <div class="row">
			        	<div class="col-sm-12 col-md-3 col-lg-3 col-xl-2">
			        		<div class="form-check form-check-inline">
							  <input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="selectall" name="note" onclick="selectAll(this)">
							  <label class="form-check-label" for="inlineCheckbox1">전체 선택</label>
							</div>
			        	</div>
			        	<div class="col-sm-12 col-md-4 col-lg-4 col-xl-4 noteManage-btn">
			        		<button type="button" class="btn btn-secondary btn-sm">선택삭제</button>
			        		<button type="button" class="btn btn-secondary btn-sm">선택읽음</button>
			        	</div>
			        	<div class="col-4 col-sm-4 col-md-6 col-lg-6 col-xl-2">
			        		<select class="form-select" aria-label="Default select example">
							  <option selected value="title">제목</option>
							  <option value="date">내용</option>
							</select>
			        	</div>
			        	<div class="col-8 col-sm-8 col-md-6 col-lg-6 col-xl-4">
			        		<div class="input-group mb-3">
							  <input type="text" class="form-control" placeholder="내용을 입력해주세요." aria-label="Recipient's username" aria-describedby="basic-addon2">
							  <button type="button" class="btn btn-secondary btn-sm">검색</button>
							</div>
			        	</div>
			        </div>
			        
			        <div class="main-table">
				        <table class="table table-hover main-table2">
						  <thead>
						    <tr>
						      <th scope="col">번호</th>
						      <th scope="col">제목</th>
						      <th scope="col">날짜</th>
						      <th scope="col">관리</th>
						    </tr>
						  </thead>
						  <tbody>
						  
						    <c:forEach items="${messageList}" var="list">
						    <tr>
						      <th scope="row">
						      	<div class="form-check form-check-inline">
								  <input class="form-check-input" type="checkbox" id="inlineCheckbox2" value="${list.message_index }" name="note">
								  <label class="form-check-label" for="inlineCheckbox2">${list.message_index }</label>
								</div>
						      </th>
						      <td>
						      	<a href="mypage_noteManageView.do"><span class="d-inline-block text-truncate" style="max-width: 150px;">
								  ${list.title}
								</span></a>
						      </td>
						      <td>${list.send_date}</td>
						      <td>
						      	<button type="button" class="btn btn-secondary btn-sm">읽음</button>
			        			<button type="button" class="btn btn-secondary btn-sm">삭제</button>
						      </td>
						    </tr>
						    </c:forEach>
						    
						  </tbody>
						</table>
					</div>
					
					<nav aria-label="Page navigation example">
					  <ul class="pagination review-paging">
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
					</nav>
			    	</c:if>
			    	
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