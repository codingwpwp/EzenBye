<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자페이지</title>
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
<body onselectstart="return false;">
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
    <section class="mt-3">
        <div class="row">

            <!-- 왼쪽 사이드메뉴 -->
            <div class="col-lg-2 d-none d-lg-block">
               <%@include file="/WEB-INF/views/adminPage/leftMenu.jsp"%>
            </div>

            <!-- 메인 -->
            <div class="col-12 col-sm-9 col-md-10 col-lg-8">
                <article id="mainSection">
                    <!-- 메인컨텐츠 -->

                        <!-- 이달의 매출 -->
                        <div class="row mb-3">
                            <div class="col-12">

                                <div class="bg-primary bg-gradient bg-opacity-75 border rounded-top border-2 border-dark p-2">
                                    <span class="h4 fw-bold">이달의 매출</span>
                                </div>
                                
                                <div class="row border border-2 border-top-0 border-dark container px-0 m-0 py-4">
                                    <div class="col-12 col-md-6">
                                	<c:forEach items="${salesList}" var="list">
										<input type="hidden" name="${list.sort}" value="${list.quantity}">
                                	</c:forEach>
                                		<p class="fs-2 text-primary fw-bold" style="text-indent: 2em;">중분류별 수익</p>
                                        <canvas id="middleSort"></canvas>
                                    </div>
                                    
                                    <div class="col-6 d-none d-md-block">
                                    	<input type="hidden" name="상품 수익" value="${rList[0].quantity}">
                                    	<input type="hidden" name="배송비" value="${rList[1].quantity}">
                                    	<input type="hidden" name="쿠폰비" value="${rList[2].quantity}">
                                    	<input type="hidden" name="적립금" value="${rList[3].quantity}">
                                        <p class="fs-2 text-success fw-bold" style="text-align: center;">이번달 수익</p>
                                        <canvas id="revenue"></canvas>
                                        <div class="row mt-2 d-flex align-items-center">
                                            <div class="col-5 fs-3 fw-bold" style="color: rgba(255, 99, 132, 1); text-align: center;">
                                                <fmt:formatNumber value='${rList[0].quantity}' pattern="#,###"/>
                                            </div>
                                            <div class="col-1 px-0">
                                                <i class="fa-solid fa-minus fs-3"></i>
                                            </div>
                                            <div class="col-6 row d-flex align-items-center">
                                                <div class="col-1 p-0">
                                                    <span style="font-size: 115px;">[</span>
                                                </div>
                                                <div class="col-7 d-flex flex-column align-items-center ps-5 pe-1">
                                                    <span class="fs-4 fw-bold" style="color: rgba(255, 159, 64, 1);"><fmt:formatNumber value='${rList[1].quantity}' pattern="#,###"/></span>
                                                    <span class="">+</span>
                                                    <span class="fs-4 fw-bold" style="color: rgba(54, 162, 235, 1);"><fmt:formatNumber value='${rList[2].quantity}' pattern="#,###"/></span>
                                                    <span class="">+</span>
                                                    <span class="fs-4 fw-bold" style="color: rgba(153, 102, 255, 1);"><fmt:formatNumber value='${rList[3].quantity}' pattern="#,###"/></span>
                                                </div>
                                                <div class="col-1 ps-4">
                                                    <span class="" style="font-size: 115px;">]</span>
                                                </div>
                                            </div>
                                        </div>
                                        <span class="fs-5">총 수익 : <span class="fs-3 fw-bold text-danger"><fmt:formatNumber value='${rList[0].quantity - rList[1].quantity - rList[2].quantity - rList[3].quantity}' pattern="#,###"/></span>원</span>
                                    </div>
                                </div>

                            </div>
                        </div>

                        <!-- 30일 수익(모바일버전)&최고 매출TOP3&등록중인 배너 -->
                        <div class="row">

                            <!-- 30일 수익(모바일버전) -->
                            <div class="col-12 d-block d-md-none">
                                <div class="bg-danger bg-gradient bg-opacity-75 border rounded-top border-2 border-dark p-2">
                                    <span class="h4 fw-bold">이번달 수익</span>
                                </div>
                                <div class="mb-0 border border-top-0 border-2 border-dark mb-3">
		                            <canvas id="revenue2"></canvas>
		                            <div class="row mt-2 d-flex align-items-center">
		                                <div class="col-4 fs-3 fw-bold pe-0" style="color: rgba(255, 99, 132, 1); text-align: center;">
		                                    <fmt:formatNumber value='${rList[0].quantity}' pattern="#,###"/>
		                                </div>
		                                <div class="col-1 px-0">
		                                    <i class="fa-solid fa-minus fs-3"></i>
		                                </div>
		                                <div class="col-6 row d-flex align-items-center px-0">
		                                    <div class="col-1 d-flex justify-content-center">
		                                        <span style="font-size: 115px;">[</span>
		                                    </div>
		                                    <div class="col-7 d-flex flex-column align-items-center ps-4">
		                                        <span class="fs-4 fw-bold" style="color: rgba(255, 159, 64, 1);"><fmt:formatNumber value='${rList[1].quantity}' pattern="#,###"/></span>
		                                        <span class="">+</span>
		                                        <span class="fs-4 fw-bold" style="color: rgba(54, 162, 235, 1);"><fmt:formatNumber value='${rList[2].quantity}' pattern="#,###"/></span>
		                                        <span class="">+</span>
		                                        <span class="fs-4 fw-bold" style="color: rgba(153, 102, 255, 1);"><fmt:formatNumber value='${rList[3].quantity}' pattern="#,###"/></span>
		                                    </div>
		                                    <div class="col-1">
		                                        <span class="" style="font-size: 115px;">]</span>
		                                    </div>
		                                </div>
		                            </div>
		                            <span class="fs-5" style="text-align: center; display: block;">총 수익 : <span class="fs-3 fw-bold text-danger"><fmt:formatNumber value='${rList[0].quantity - rList[1].quantity - rList[2].quantity - rList[3].quantity}' pattern="#,###"/></span>원</span>
		                            <br>
	                            </div>
	                            
                            </div>
                            
                            <!-- 최고 매출 TOP3 -->
                            <div class="col-12 col-md-6">

                                <div class="bg-primary bg-gradient bg-opacity-50 border border-bottom-0 rounded-top border-2 border-dark p-2">
                                    <span class="h4 fw-bold">최고매출 TOP3</span>
                                    <span class="moreContent"><a href="product_main.do?nowPage=1" class="link-dark fw-bold float-end">[등록상품 보기]</a></span>
                                </div>

                                <table class="table table-hover align-middle border border-2 border-dark fw-bold">

                                    <colgroup>
                                        <col style="width: 22%;"/>
                                    </colgroup>
                                    <tbody>
                                    <c:if test="${not empty pList}">
	                                    <c:forEach items = "${pList}" var = "list">
                                    	<tr>
                                            <td scope="row">
	                                            <a href="productView.do?product_index=${list.product_index}" target="blank">
	                                            	<img src="<%=request.getContextPath()%>/resources/img/${list.brand}/${list.middleSort}/${list.thumbnail_image}" class="img-fluid" title="${list.product_name}" alt="${list.product_name}">
	                                            </a>
                                           	</td>
                                            <td>
                                            	<a href="productView.do?product_index=${list.product_index}" class="link-dark" target="blank">${list.product_name}</a>
                                            </td>
                                            <td>
                                            	<span class="text-danger">${list.quantity}</span>개 팔림
                                            </td>
                                        </tr>
	                                    </c:forEach>
                                    </c:if>
                                    <c:if test="${empty pList}">
	                                    <tr>
		                                    <td colspan="3" class="display-6 fw-bold p-3" style="text-align: center;">
												등록된 상품이 없습니다.
											</td>
	                                    </tr>
                                    </c:if>
                                    </tbody>
                                    
                                </table>

                            </div>
                            
                            <!-- 등록중인 배너 -->
                            <div class="col-12 col-md-6">

                                <div class="bg-success bg-gradient bg-opacity-50 border border-bottom-0 rounded-top border-2 border-dark p-2">
                                    <span class="h4 fw-bold">등록중인 배너</span><span class="moreContent"><a href="banner.do" class="link-dark fw-bold float-end">[더보기]</a></span>
                                </div>

                                <table class="table table-hover align-middle border border-2 border-dark fw-bold">

                                    <colgroup>
                                        <col style="width: 45%;"/>
                                    </colgroup>

                                    <tbody>
                                    <c:if test="${not empty bList}">
	                                    <c:forEach items = "${bList}" var = "list">
                                    	<tr>
                                            <td scope="row">
                                            	<c:if test="${list.link_YN == 'Y'}"><a href="${list.link}" target="blank"></c:if>
                                            	<img src="<%=request.getContextPath()%>/resources/img/배너/${list.image}" class="img-fluid" title="${list.name}" alt="${list.name}">
                                            	<c:if test="${list.link_YN == 'Y'}"></a></c:if>	
                                           	</td>
                                            <td>${list.name}</td>
                                        </tr>
	                                    </c:forEach>
                                    </c:if>
                                    <c:if test="${empty bList}">
	                                    <tr>
		                                    <td colspan="2" class="display-6 fw-bold p-3" style="text-align: center;">
												등록된 배너가 없습니다.
											</td>
	                                    </tr>
                                    </c:if>
                                    </tbody>

                                </table>

                            </div>
                            
                        </div>

						<!-- 최근 문의 내역 -->
						<div>
	                        <div class="bg-info bg-gradient bg-opacity-75 border rounded-top border-2 border-dark p-2">
	                            <span class="h4 fw-bold">최근 문의 내역</span><span class="moreContent"><a href="serviceCenter.do" class="link-dark fw-bold float-end">[더보기]</a></span>
	                        </div>
							<div class="table-responsive">
		                        <table class="table table-hover mb-0 border border-top-0 border-2 border-dark mb-3 centerTable" style="min-width: 650px;">
		
		                            <thead>
		                                <tr>
		                                    <th scope="col">번호</th>
		                                    <th scope="col">종류</th>
		                                    <th scope="col">제목</th>
		                                    <th scope="col">작성자</th>
		                                    <th scope="col">날짜</th>
		                                </tr>
		                            </thead>
		
		                            <tbody>
		                            <c:if test="${not empty sList}">
		                            <c:forEach items = "${sList}" var = "list">
		                                <tr>
		                                    <th scope="row">${list.serviceCenter_index}</th>
		                                    <td>${list.sort2}</td>
		                                    <td><a class="d-inline-block text-truncate" href="serviceCenter_view.do?serviceCenter_index=${list.serviceCenter_index}" class="link-primary">${list.title}</a></td>
		                                    <td>${list.name}</td>
		                                    <td>${fn:substring(list.write_date, 0,10)}</td>
		                                </tr>
		                            </c:forEach>
		                            </c:if>
		                            <c:if test="${empty sList}">
		                            	<tr>
		                            		<td colspan="5" class="display-5 fw-bold p-3" style="text-align: center;">
		                            			최근 문의내역이 없습니다.
		                            		</td>
		                            	</tr>
		                            </c:if>
		                            </tbody>
		
	                        	</table>
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
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.7.1/chart.min.js" integrity="sha512-QSkVNOCYLtj73J4hbmVoOV6KVZuMluZlioC+trLpewV8qMjsWqlIQvkn1KGX2StWvPMdWGBqim1xlC8krl1EKQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="<%=request.getContextPath()%>/resources/js/base.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/adminPage.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/adminPage_leftMenu.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/adminPage_chart.js"></script>
    <script type="text/javascript">
    window.onpageshow = function(event) {
        if ( event.persisted || (window.performance && window.performance.navigation.type == 2)) {
            location.reload();
        } 
    }
    </script>
</body>
</html>