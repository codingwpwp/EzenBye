<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import = "team.project.vo.*" %> 
<%@ page import = "java.util.*" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	List<MemberVO> memberList = (List) request.getAttribute("MemberList");
	HashMap<Integer,String> result = new HashMap<>();
	
	for(int i=0; i<memberList.size(); i++){
		result.put(memberList.get(i).getMember_index(),memberList.get(i).getNickname());
	}
	
	String memberHash = result.toString();
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Food Container-상품상세보기</title>
    <!-- css링크 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/base.css">
    <link href="<%=request.getContextPath()%>/resources/css/index.css" rel="stylesheet">
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
            <div class="col-2 col-sm-1 pe-0 d-lg-none" id="navLeftMenu"></div>
			<%@include file="/WEB-INF/views/base/nav.jsp"%>
        </div>
    </nav>
          
	<!-- 섹션 -->
    <section class="mt-1">
        <div class="row">

            <!-- 왼쪽 사이드메뉴 -->
            <div class="col-lg-2 d-none d-lg-block" id="leftDiv">
                <aside id="leftAside">
                   
                </aside>
            </div>

            <!-- 메인 -->
            <div class="col-12 col-sm-9 col-md-10 col-lg-8">
                <article id="mainSection">
                	<!-- view 상단 -->
                	<div class="pViewCard">
				      <div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
				        <div class="col-auto d-lg-block viewStarM">
				        	<div>
					        	<img src="<%=request.getContextPath()%>/resources/img/${view.brand}/${view.middleSort}/${view.thumbnail_image}" alt="${view.product_name}" class="img-fluid viewImg">
					        	<c:if test="${view.inventory == 0 }">
									<img src="<%=request.getContextPath()%>/resources/img/매진.png" class="card-img-top viewSold">
									<div class="viewSoldout"></div>
									<input type="hidden" class="inventory" value="${view.inventory}">
								</c:if>
				        	</div>
				        	
				        	<div class="viewStar">
				        		<span>평점 : 
				        		<span class="fs-4 productViewStar">
				        			<c:set var="sum" value="0" />
				        			
				        			<c:forEach items="${viewReview}" var="viewReview">
				        				<c:set var="sum" value="${sum+viewReview.star_count}" />
				        			</c:forEach>
				        			
				        			<c:set var="reviewCnt" value="${viewReview}" />
				        			<c:set var="length" value="${fn:length(reviewCnt)}" />
				        			<c:set var="avrg" value="${sum/length}" />
				        			<c:if test="${length == 0}">
				        				<c:set var="avrg" value="0" />
				        			</c:if>
				        			<c:forEach begin="1" end="5" varStatus="reStatus">
										<c:if test="${reStatus.index <= avrg}">
									    	<i class="bi bi-star-fill"></i>
										</c:if>
										<c:if test="${reStatus.index > avrg}">
											<i class="bi bi-star"></i>
										</c:if>
									</c:forEach>
				        		</span>
				        		</span>
				        	</div>
				        </div>
				        <div class="col p-4 d-flex flex-column position-static">
				          <div class="mb-0">
				          	<c:if test="${view.quantity >= 500}">
	                	  		<strong class="d-inline-block mb-2 text-danger">[인기]</strong>
	                	 	</c:if>
				          	[${view.brand}]<br> 
				          	<div class="productName">${view.product_name}</div>
				          </div>
				          <hr>
				          <h3 class="viewPrice">
					          <span>
						          <fmt:formatNumber value="${view.origin_price}" pattern="#,###"/>
					        	  <small>원</small>
					          </span>
					          <br>
					          <c:if test="${view.sale_price != -1}">
					          	<span class="viewDiscount">
				          			<fmt:formatNumber value="${view.sale_price}" pattern="#,###"/>원
				          			<c:set var="sale" value="${((view.origin_price - view.sale_price)/view.origin_price)*100}" />
				          			(<fmt:formatNumber value="${sale}" pattern="##.#"/>%)
				          			<input type="hidden" name="sale_price" value="${view.sale_price}">
					          	</span>
				          		</c:if>
				          </h3>
				          <div class="text-muted">포인트 적립 1%</div>
				          <hr>
				          <p class="card-text mdName"><span style="font-size:1rem;">[${view.brand}]<br> ${view.product_name}</span>
				          	<span class="mdPrice" style="font-size:0.9rem;">
				          		<c:if test="${view.sale_price == -1}">
				          			<fmt:formatNumber value="${view.origin_price}" pattern="#,###"/>원
				          		</c:if>
				          		<c:if test="${view.sale_price != -1}">
				          			<fmt:formatNumber value="${view.sale_price}" pattern="#,###"/>원
				          		</c:if>
				          			<input type="hidden" name="origin_price" value="${view.origin_price}">
				          			<input type="hidden" name="sale_price" value="${view.sale_price}">
				          	</span>
				          </p>
				          <span>[재고 : <span class="productInventory">${view.inventory}</span>]</span>
				          <div class="card-text mb-auto productNum fs-4"><i class="bi bi-dash-square-fill" onclick="minusFn(this)"></i> <div class="pCnt">1</div> <i class="bi bi-plus-square-fill" onclick="plusFn(this)"></i></div>
				          <div><span class="fs-5 totalPrice">
				          		<c:if test="${view.sale_price == -1}">
				          			합계 : <span class="fs-3"><fmt:formatNumber value="${view.origin_price}" pattern="#,###"/>원</span>
				         		</c:if>
				         		<c:if test="${view.sale_price != -1}">
				          			합계 : <span class="fs-3"><fmt:formatNumber value="${view.sale_price}" pattern="#,###"/>원</span>
				         		</c:if>
				          </span></div>
				          <div class="d-flex justify-content-evenly">
						  	<button type="button" class="viewButton btn btn-outline-success me-2" onclick="viewCart(this)">장바구니 담기</button>
						  	<button class="viewButton btn btn-success me-2" onclick="directBuy(this)">바로구매</button>
				          
				          	<div class="topTooltip">
								<p>상품을 장바구니에 담았습니다.</p>
								<button type='button' class='btn btn-light' onclick="shopping(this)">상품 더보기</button>
								<button type='button' class='btn btn-light' onclick="moveCart(this)">장바구니로 이동</button>
							</div>
									
							<div class="topTooltipSold">
								<br>
								<p style="color:white; font-size:1.2rem;">매진 된 상품입니다.</p>
							</div>
				          </div>
				        </div>
				      </div>
				    </div>
				    <!-- subMenu -->
				    <div class="subMenuGroup">
					  <input type="radio" class="subMenuCheck" name="subRadio" id="subRadio1" onclick="subRadio1()">
					  <label class="subMenuButton" for="subRadio1">상세 정보</label>
					
					  <input type="radio" class="subMenuCheck" name="subRadio" id="subRadio2" onclick="subRadio2()">
					  <label class="subMenuButton" for="subRadio2">배송 정보</label>
					
					  <input type="radio" class="btn-check" name="subRadio" id="subRadio3" onclick="subRadio3()">
					  <label class="subMenuButton" for="subRadio3">취소 규정</label>
					  
					  <input type="radio" class="subMenuCheck" name="subRadio" id="subRadio4" onclick="subRadio4()">
					  <label class="subMenuButton" for="subRadio4">리뷰</label>
					</div>
					
					<!-- 펼치기 -->
					<div class="unfold">
						<!-- 상세페이지 -->
						<div class="d-flex justify-content-center" id="pView">
							<img src="<%=request.getContextPath()%>/resources/img/${view.brand}/${view.middleSort}/${view.detail_image}" alt="${view.product_name} 상세페이지" class="img-fluid">
							<div id="pViewleft">
	                			<div class="card-text mdName">
	                				<c:if test="${view.quantity >= 500}">
	                					<span style="color:red;">[인기]</span>
	                				</c:if>
	                				[${view.brand}]
	                				<br>
	                				<div class="productName">${view.product_name}</div>
	                				<div class="card-text mb-auto productNumM fs-4"><i class="bi bi-dash-square-fill" onclick="minusFn(this)"></i> <div class="pCnt">1</div> <i class="bi bi-plus-square-fill" onclick="plusFn(this)"></i></div>
					    	    	<div class="leftViewTotal">
					      	  			<span class="fs-5 totalPrice">
					      	  				<c:if test="${view.sale_price == -1}">
							          			합계 : <span class="fs-3"><fmt:formatNumber value="${view.origin_price}" pattern="#,###"/>원</span>
							         		</c:if>
							         		<c:if test="${view.sale_price != -1}">
							          			합계 : <span class="fs-3"><fmt:formatNumber value="${view.sale_price}" pattern="#,###"/>원</span>
							         		</c:if>
					      	  			</span>
					      	  		</div>
	                			</div>
				      	  		<div class="leftViewButtonDiv">
				      	  			<input type="hidden" id="viewLoginCheck" value="${member.member_index}">
							   		<button class="leftViewButton btn btn-outline-success me-2" onclick="viewCartBottom(this)">장바구니</button>
							  		<button class="leftViewButton btn btn-success me-2" onclick="directBuy(this)">바로구매</button>
				      	  		</div>
                			</div>
						</div>
						
						<!-- 배송정보 -->
						<div class="d-flex justify-content-center" id="pDelivery">
							<img src="<%=request.getContextPath()%>/resources/img/배송.png" alt="배송안내" class="img-fluid">
						</div>
					
						<!-- 취소 규정 -->
						<div class="d-flex justify-content-center" id="pCancel">
							<img src="<%=request.getContextPath()%>/resources/img/취소.png" alt="취소규정" class="img-fluid">
						</div>
					   
					</div>
					    <!-- 상품 더보기 버튼 -->
					    <div class="plusView" onclick="unfold()">
					    	+ 자세히보기
					    </div>
					
					<input type="hidden" name="memberHash" value="<%=memberHash%>">
					<input type="hidden" name="product_index" value="${view.product_index}">
					
					<!-- 리뷰 -->
					<div id="review">
						<div class="fs-2" id="reviewTop">리뷰</div>
						<table id="reviewTable" class="table table-sm">
							<thead>
								<tr>
									<th scope="col">별점</th>
									<th scope="col">리뷰</th>
									<th scope="col">닉네임</th>
									<th scope="col">작성일</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach items="${reviewPaging}" var="reviewPaging" varStatus="status">
								<tr>
									<td>
										<span class="productViewReviewStar">
									    		<c:forEach begin="1" end="5" varStatus="reStatus">
													<c:if test="${reStatus.index <= reviewPaging.star_count}">
									    				<i class="bi bi-star-fill"></i>
													</c:if>
													<c:if test="${reStatus.index > reviewPaging.star_count}">
										    			<i class="bi bi-star"></i>
													</c:if>
									    		</c:forEach>
							        		<br>
									    </span>
									    <c:if test="${reviewPaging.star_count eq '1'}">
							        		<div style="color:red;">매우 나빠요</div>
							        	</c:if>
									    <c:if test="${reviewPaging.star_count eq '2'}">
							        		<div style="color:tomato;">나빠요</div>
							        	</c:if>
									    <c:if test="${reviewPaging.star_count eq '3'}">
							        		<div>보통</div>
							        	</c:if>
									    <c:if test="${reviewPaging.star_count eq '4'}">
							        		<div style="color:green;">좋아요</div>
							        	</c:if>
									    <c:if test="${reviewPaging.star_count eq '5'}">
							        		<div style="color:blue;">매우 좋아요</div>
							        	</c:if>
									</td>
									<td class="reviewContent">
										<div class="row">
											<div class="reViewImg col-3 align-self-center">
												<img src="<%=request.getContextPath()%>/resources/img/review/${reviewPaging.image}" class="img-fluid" alt="${reviewPaging.image}">
											</div>
											<div class="reviewTitle align-self-center col" data-bs-toggle="collapse" href="#reviewExtend${status.index }" role="button" aria-expanded="false" aria-controls="collapseExample">
												${reviewPaging.contents}
											</div>
											<div class="col-1 align-self-center">
												<i class="bi bi-caret-down reviewDown" data-bs-toggle="collapse" href="#reviewExtend${status.index }" role="button" aria-expanded="false" aria-controls="collapseExample"></i>
											</div>
										</div>
										<div class="collapse reviewCard" id="reviewExtend${status.index }">
											<img src="<%=request.getContextPath()%>/resources/img/review/${reviewPaging.image}" class="img-fluid reviewCardImg" alt="${reviewPaging.image}">
											<div>${reviewPaging.contents}</div>
										</div>
									</td>
									<td>
										<c:forEach items="${MemberList}" var="MemberList">
											<c:if test="${MemberList.member_index == reviewPaging.member_index}">
												${MemberList.nickname}
											</c:if>
										</c:forEach>
									</td>
									<td>${reviewPaging.review_date}</td>
								</tr>
							</c:forEach>
							</tbody>
						</table>
						
						<input type="hidden" name="startPage" value="1">
						<input type="hidden" name="endPage" value="${viewPaging.endPage}">
						<input type="hidden" name="lastPage" value="${viewPaging.lastPage}">
						<br>
						<div id="paging">
							<button style="width:30px;" onclick="pagePrev(this)">&lt;</button>
							
							<c:forEach begin="${viewPaging.startPage}" end="${viewPaging.endPage}" varStatus="status">
								<c:if test="${status.index == viewPaging.nowPage}">
									<button style="width:30px;" onclick="pageMove(this)">${status.index}</button>
									<input type="hidden" value="${status.index}">
								</c:if>
								<c:if test="${status.index != viewPaging.nowPage}">
									<button style="width:30px;" onclick="pageMove(this)">${status.index}</button>
									<input type="hidden" value="${status.index}">
								</c:if>
							</c:forEach>
						 
							<button style="width:30px;" onclick="pageNext(this)">&gt;</button>
						</div>
						
						
						
						<!-- 리뷰 모바일 -->
						<table id="reviewTableM" class="table table-sm border-dark">
							<thead>
								<tr>
									<th>리뷰</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${reviewPaging}" var="reviewPaging" varStatus="status">
								<tr>
									<td>
										<div>
											<img src="<%=request.getContextPath()%>/resources/img/review/${reviewPaging.image}" class="img-fluid" alt="${reviewPaging.image}">
										</div>
										<div>
											<span>
												<c:forEach items="${MemberList}" var="MemberList">
													<c:if test="${MemberList.member_index == reviewPaging.member_index}">
														${MemberList.nickname}
													</c:if>
												</c:forEach>
											| ${reviewPaging.review_date}
											
											</span>
											<div class="productViewReviewStarM">
												<c:forEach begin="1" end="5" varStatus="reStatus">
													<c:if test="${reStatus.index <= reviewPaging.star_count}">
									    				<i class="bi bi-star-fill"></i>
													</c:if>
													<c:if test="${reStatus.index > reviewPaging.star_count}">
										    			<i class="bi bi-star"></i>
													</c:if>
									    		</c:forEach>
											</div>
											<div>
												${reviewPaging.contents}
											</div>
										</div>
									</td>
								</tr>
								</c:forEach>
							</tbody>
						</table>
						
						<br>
						
						<div id="pagingM">
							<button style="width:30px;" onclick="pagePrev(this)">&lt;</button>
							
							<c:forEach begin="${viewPaging.startPage}" end="${viewPaging.endPage}" varStatus="status">
								<c:if test="${status.index == viewPaging.nowPage}">
									<button style="width:30px;" onclick="pageMove(this)">${status.index}</button>
									<input type="hidden" value="${status.index}">
								</c:if>
								<c:if test="${status.index != viewPaging.nowPage}">
									<button style="width:30px;" onclick="pageMove(this)">${status.index}</button>
									<input type="hidden" value="${status.index}">
								</c:if>
							</c:forEach>
						 
							<button style="width:30px;" onclick="pageNext(this)">&gt;</button>
						</div>
					</div>
					
                </article>
                


            </div>


             <!-- 오른쪽 사이드메뉴 -->
            <div class="col-sm-3 col-md-2 col-lg-2 d-none d-sm-block" id="rightSide">
                <!-- 실질적인 오른쪽 사이드메뉴 내용 -->
                <%@include file="/WEB-INF/views/base/rightAside.jsp"%>
            </div>

        </div>

    </section>
    
    <!-- 장바구니 클릭 -->
    <div class="cartBack">
	    <div class="message"></div>
    </div>
    
    <!-- 모바일 top -->
    <div class="topM" onclick="moveTop();">
        ↑Top
    </div>
    
    <!-- 툴팁 -->
	<div class="bottomTooltip">
    	<p>상품을 장바구니에 담았습니다.</p>
    	<button type='button' class='btn btn-light' onclick="shopping(this)">상품 더보기</button>
    	<button type='button' class='btn btn-light' onclick="moveCart(this)">장바구니로 이동</button>
	</div>
	
	<div class="bottomTooltipSold">
		<br>
    	<p style="color:white; font-size:1.2rem;">매진 된 상품입니다.</p>
	</div>
    
    <!-- 푸터 -->
    <footer class="py-3 my-4">
        <%@include file="/WEB-INF/views/base/footer.jsp"%>
    </footer>
    
    <!-- 외부클릭 -->
	<div class="outter" onclick="outter()"></div>

    <!-- 자바스크립트 -->
    <script src="https://kit.fontawesome.com/b30bc4e0a9.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/base.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/index.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/productView.js"></script>
</body>
</html>