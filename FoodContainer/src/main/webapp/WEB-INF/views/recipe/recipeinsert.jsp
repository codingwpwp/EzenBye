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
     <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/recipewrite.css">
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
            <div class="col-1 pe-0 d-lg-none border border-dark" id="navLeftMenu">d<!-- 여기에 작성 --></div>

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
                     
                </aside>
            </div>

            <!-- 메인 -->
            <div class="col-12 col-sm-9 col-md-10 col-lg-8">
                <article id="mainSection">
                    <!-- 실질적인 메인 내용 -->
                     <div class="fs-5 my-2 fw-bold">레시피 수정</div>
                     <form>
                      
                        <div class="container">
                          
                            <div class="row title">
                                <div class="col-md-1 col-sm-3 col-3 ti">
                                 <strong>제목</strong>
                                </div>
                                <div class="col-md-5 col-sm-9 col-5">
                                    <input type="text">
                                </div>
                               
                            </div>
                             <div class="row content">
                               <div class="col-md-1 col-sm-3 col-3"><strong>내용</strong></div>
                                <div class="col-md-9 col-sm-9 col-5"><div id="summernote"></div></div>
    
                                
                            </div>
                            <div class="row">
                                
                                <div class="col-md-5 col-sm-6 col-xs-6 col-6 sumnail"><a href="#" 
                                    onclick="popup();"><svg xmlns="http://www.w3.org/2000/svg" width="200"
                                    height="200" fill="currentColor" class="bi bi-images" viewBox="0 0 16 16">
                                    <path d="M4.502 9a1.5 1.5 0 1 0 0-3 1.5 1.5 0 0 0 0 3z" />
                                    <path
                                        d="M14.002 13a2 2 0 0 1-2 2h-10a2 2 0 0 1-2-2V5A2 2 0 0 1 2 3a2 2 0 0 1 2-2h10a2 2 0 0 1 2 2v8a2 2 0 0 1-1.998 2zM14 2H4a1 1 0 0 0-1 1h9.002a2 2 0 0 1 2 2v7A1 1 0 0 0 15 11V3a1 1 0 0 0-1-1zM2.002 4a1 1 0 0 0-1 1v8l2.646-2.354a.5.5 0 0 1 .63-.062l2.66 1.773 3.71-3.71a.5.5 0 0 1 .577-.094l1.777 1.947V5a1 1 0 0 0-1-1h-10z" />
                                    </svg></a>
                                    <div><strong>사진을 등록해주세요</strong>
                                    </div>
                                </div>
                            </div>
    
                            <div class="col-sm-10 col-12 selhap"><strong>조합 상품</strong></div>
                            <div class="row hap">
                               
                            
                                 <div class="col-md-3 col-4 sel1"> 
                                     <select name="" id="" class="select1">
                                    <option value="">상품1</option>
                                    <option value="">상품1</option>
                                    <option value="">상품1</option>
                                </select>
                            </div>
                                <div class="col-md-3 col-4 sel2">
                                    <select name="" id="" class="select1">
                                        <option value="">상품2</option>
                                        <option value="">상품2</option>
                                        <option value="">상품2</option>
                                    </select>
                                </div>
                                <div class="col-md-3 col-4 sel3">
                                    <select name="" id="" class="select1">
                                        <option value="">상품3</option>
                                        <option value="">상품3</option>
                                        <option value="">상품3</option>
                                    </select>
                                </div> 
                            
                            </div>
                            <div class="row">
                                <div class="col-md-12 col-12 bt">
                                    <input type="button" value="등록" class="btn btn-primary">
                                    <input type="button" value="취소" class="btn btn-primary" onclick="location.href='recipemain.do'">
                                </div>
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
    <script src="<%=request.getContextPath()%>/resources/js/base.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/recipe.js"></script>
</body>
</html>