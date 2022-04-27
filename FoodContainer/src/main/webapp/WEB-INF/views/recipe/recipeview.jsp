<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<link
	href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/base.css">
	<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/recipeview.css">
	<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
	rel="stylesheet">
	
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

            <!--
                id="navLeftMenu"인 현재 주석 바로 아래의 태그는 페이지의 종류에 따른 왼쪽메뉴.
                네비게이션 바가 펼쳐질 때 알아서 태그가 안보이도록 설정.
                필요시에만 div태그 사이에 코드를 작성.
                작성시 border border-dark는 구분용으로만 작성했기 때문에 알아서 지우고 작업.
                작성하지 않는 경우는 절대 건들지 않음.
                base.js에 id="navLeftMenu"와 관련된 코드가 작성되어있음.
            -->
            <div class="col-2 col-sm-1 pe-0 d-lg-none border border-dark" id="navLeftMenu"><!-- 여기에 작성 --></div>

			<%@include file="/WEB-INF/views/base/nav.jsp"%>

        </div>
    </nav>

	<!-- 섹션 -->
	<section class="mt-1">
		<div class="row">

			<!-- 왼쪽 사이드메뉴 -->
			<div class="col-lg-2 d-none d-lg-block">
				<aside></aside>
			</div>

			<!-- 메인 -->
			<div class="col-12 col-sm-9 col-md-10 col-lg-8">
				<article id="mainSection">

					<!--
                        헤딩.
                        필요하지 않는 사람은 <div>태그를 삭제.
                        필요한 사람은 <div>태그에 작성.
                    -->
					<div class="fs-5 my-2 fw-bold"></div>

					<div class="container">
					
						<div class="row hd">
						
							<div class="col-sm-7 col-xs-3 col-12">
								<h3>
								<c:if test="${read.best_rank==1 }">
								<img src="<%=request.getContextPath()%>/resources/img/금메달.png" id="bestimg">
								</c:if>
								<c:if test="${read.best_rank==2 }">
								<img src="<%=request.getContextPath()%>/resources/img/은메달.png" id="bestimg">
								</c:if>
								<c:if test="${read.best_rank==3 }">
								<img src="<%=request.getContextPath()%>/resources/img/동메달.png" id="bestimg">
								</c:if>
								${read.title}
								</h3>
							</div>


							<div class="col-sm-5 col-12 hddiv">작성자: ${read.name}&nbsp;|&nbsp;추천수: (${read.thumb}) | 조회수 : (${read.hit}) | 댓글(${read.reply_index})</div>
						</div>

						<div class="row body">

							<div class="col-xl-8 col-lg-6 col-12">
								<table>
							
									<tr>
										<th class="tdimg"><img src="<%=request.getContextPath()%>/resources/img/${read.product_img1}" width="150"
											height="150"></th>
										
										<td class="tdtx">${read.product_name1}</td>
									</tr>
									
									<c:if test="${not empty read.product_index2}">
									<tr>
										<th class="plus"><strong>+</strong></th>
									</tr>
									<tr>
										<th class="tdimg"><img src="<%=request.getContextPath()%>/resources/img/${read.product_img2}" width="150"
											height="150"></th>
										<td class="tdtx">${read.product_name2}</td>
									</tr>
									</c:if>
									<c:if test="${not empty read.product_index3}">
									<tr>
										<th class="plus"><strong>+</strong></th>
									</tr>
									<tr>
										<th class="tdimg"><img src="<%=request.getContextPath()%>/resources/img/${read.product_img3}" width="150"
											height="150"></th>
										<td class="tdtx">${read.product_name3}</td>

									</tr>
									</c:if>

								</table>

							</div>
							<div class="col-sm-2  col-12">
								<div class="thumnail" name="thumnailimg">
									<img alt="" src="<%=request.getContextPath()%>/resources/img/recipe/${read.thumbnail_image}">
								</div>
							</div>
							<div class="col-sm-12 col-12" id="">
								<textarea readonly id="summernote">${read.contents}</textarea>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-12 col-12 good">
							<input type="hidden" name="recipe_index" value="${read.recipe_index}" />
							<input type="hidden" name="member_index" value="${member.member_index}" />
								<i class = "fa-regular fa-thumbs-up fs-1"></i>
								<div class="fw-bold thumbCount">${read.thumb}</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-12 col-12">
								<div class="d-flex button">
								<input type="button" value="목록" class="btn btn-primary" onclick="location.href='recipemain.do'">
								<c:if test="${member.member_index==read.member_index}">
								<input type="button" value="수정" class="btn btn-secondary" onclick="location.href='recipemodify.do?recipe_index=${vo.recipe_index}'">
								
								<form action="recipedelete" method="post">
								<input type="submit" value="삭제" class="btn btn-danger">
								<input type="hidden" value="${read.recipe_index}" name="recipe_index">
								</form>			
								</c:if>
									<c:if test="${member.member_index==0}">
								<input type="button" value="수정" class="btn btn-secondary" onclick="location.href='recipemodify.do?recipe_index=${vo.recipe_index}'">
								<form action="recipedelete" method="post">
								<input type="submit" value="삭제" class="btn btn-danger">
								<input type="hidden" value="${read.recipe_index}" name="recipe_index">
								</form>
								</c:if>
								</div> 
							</div>
							<div class="col-sm-12 col-12">
							<form name="frm" action="updateRank" method="post">
							
							<input type="hidden" value="${read.best_rank}" name="best_rank" id="best_rank">
							<input type="hidden" value="${read.recipe_index}" name="recipe_index" >
							
							<c:if test="${member.member_index==0}">
								<button onclick="best();" class="btn btn-success">베스트
									레시피 선정</button>
							</c:if>		
							
							</form>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-12 col-12">
								<h4>댓글${read.reply_index}</h4>
							</div>
						</div>
						
						<form method="post" action="wirteReply" id="writeReply"name="writeReply">
						<input type="hidden" value="${read.recipe_index}" name="recipe_index" id="recipe_index">
						<div class="row rp">
							
							<div class="col-sm-8 col-9 reply-write">
								<input type="text" name="contents" id="contents" placeholder="로그인 후 댓글 작성이 가능합니다.">
							</div>
							<div class="col-sm-2 col-3">
						 	<c:if test="${member==null}">
								<button class="btn btn-secondary tt" type="button" onclick="alert('로그인 후 이용해주세요!!')">등록</button>
							</c:if>	
							 	<c:if test="${member!=null}">
								<button class="btn btn-secondary tt" type="submit" id="submit">등록</button>
							</c:if>	
							</div>
							
						</div>
						</form>
						
						
						<div class="row rpt" id="replydiv">
						
 						<c:forEach items="${replyList}" var="re"> 
 							
							<div class="col-3 col-sm-2 col-md-2 col-lg-2 replyview" name="replyname"id="replyname">
								<p>${re.name}</p>
							</div>
							<div class="col-lg-2 col-md-2 col-sm-2 col-5 wday" name="replydate" id="replydate">${re.reply_date}
							</div>
							<div class="col-md-4 col-sm-2 col-4 p-0 report"  name="replybtn" id="replybtn">
								<!-- 회원 -->
								<c:if test="${member.member_index==re.member_index}">
								<span>
								
									<input type="button" value="수정" onclick="modifyReply(this,${re.reply_index},${re.recipe_index});" id="modifybtn" class="btn btn-secondary replymod">
									<input type="button" value="삭제" onclick="deleteReply(this,${re.reply_index},${re.recipe_index});" id="deletebtn" class="btn btn-danger replydel">
								</span>
								<span>
								</span>
								</c:if>
								<!-- 관리자 -->
								<c:if test="${member.member_index==0}">
								<span>
								
									<input type="button" value="수정" onclick="modifyReply(this,${re.reply_index},${re.recipe_index});" id="modifybtn" class="btn btn-secondary replymod">
									<input type="button" value="삭제" onclick="deleteReply(this,${re.reply_index},${re.recipe_index});" id="deletebtn" class="btn btn-danger replydel">
								</span>
								<span>
								</span>
								</c:if>
							</div>
							<div name="replycontent" id="replycontent" class="col-12 replycontent" id="">┗ &nbsp;<span>${re.contents}</span>
							<input type="hidden" value="${re.reply_index}" id="reply_index" name="reply_index">
							<input type="hidden" value="${re.recipe_index}" id="recipe_index" name="recipe_index">
						 <%-- 	<input type="hidden" value="${re.recip_index}" id="recip_index"> --%>
							
							</div>
								
							 </c:forEach>	 
							 
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
    <script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js">
	</script>
	<script src="<%=request.getContextPath()%>/resources/js/recipe2.js"></script>
</body>
</html>