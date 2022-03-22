<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>★base☆</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
    <link href="<%=request.getContextPath()%>/resources/css/base.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/resources/css/main.css" rel="stylesheet">
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<body>
	<%@include file="header.jsp"%>
	<%@include file="nav.jsp" %>

    <section class="container position-relative">

        <div class="row p-0">
            <div class="col-2 p-0">
                <aside id="leftAside">
                    <!--
                        실제로 왼쪽사이드가 먹는 부분은 하늘색의 메인 바로 직전입니다.
                        여기에 내용을 작성하면 됩니다.
                    -->
                </aside>
			</div>
          
			 <div class="col-9 p-0">

                <article id="mainSection" class="">

                    <article>
						<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
						  <div class="carousel-indicators">
						    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
						    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
						    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
						  </div>
						  <div class="carousel-inner">
						    <div class="carousel-item active">
						      <img src="<%=request.getContextPath()%>/resources/img/배너1.png" class="card-img-top" class="d-block w-100" alt="배너1">
						    </div>
						    <div class="carousel-item">
						      <img src="<%=request.getContextPath()%>/resources/img/배너2.png" class="d-block w-100" alt="하림 삼각밥">
						    </div>
						    <div class="carousel-item">
						      <img src="<%=request.getContextPath()%>/resources/img/배너3.png" class="d-block w-100" alt="오뚜기 고추참치">
						    </div>
						  </div>
						  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
						    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
						    <span class="visually-hidden">Previous</span>
						  </button>
						  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
						    <span class="carousel-control-next-icon" aria-hidden="true"></span>
						    <span class="visually-hidden">Next</span>
						  </button>
						</div>
					</article>
					<br>
					<article>
						<p class="fs-3">인기메뉴</p>
						<hr>
							<div class="row">
								<%for(int i=0; i<=3; i++){ %>
								<div class="col-md-auto popular">
									<div class="card" style="width: 18rem;">
									  <img src="<%=request.getContextPath()%>/resources/img/CJ/치킨,만두/1.png" class="card-img-top" alt="비비고만두">
									  <img src="<%=request.getContextPath()%>/resources/img/빈하트.png" class="img-fluid hoverHeart" alt="찜" onclick="heart(this)">
									  <img src="<%=request.getContextPath()%>/resources/img/카트2.png" class="img-fluid hoverCart" alt="장바구니" onclick="cart(this)">
									  
									  <div class="card-body">
									    <p class="card-text">
									    	<span style="color:red;">[인기]</span><br>
									    	<span class="productName">비비고왕교자</span><br>
									    	<span class="fs-4">10,000</span>원<br>
									    	별별별별별<br>
									    	배송비 3,000원
									    </p>
									  </div>
									</div>
								</div>
								<%} %>
							</div>
					</article>
					<br>
					<article>
						<p class="fs-3">베스트 레시피</p>
						<hr>
						<div class="container">
							<div class="row">
								<%for(int i=0; i<=2; i++){ %>
								<div class="col-auto">
									<div class="card" style="width: 18rem;">
									  <img src="<%=request.getContextPath()%>/resources/img/CJ/치킨,만두/1.png" class="card-img-top" alt="비비고만두">
									  <%if(i==0){ %>
									  <img src="<%=request.getContextPath()%>/resources/img/금메달.png" class="img-fluid medal" alt="1등">
									  <%}else if(i==1){ %>
									  <img src="<%=request.getContextPath()%>/resources/img/은메달.png" class="img-fluid medal" alt="2등">
									  <%}else if(i==2){ %>
									  <img src="<%=request.getContextPath()%>/resources/img/동메달.png" class="img-fluid medal" alt="3등">
									  <%} %>
									  <div class="card-body">
									    <p class="card-text">
									    	[유저 닉네임]<br>
									    	비비고왕교자<br>
									    	조회수 2,500<br>
									    	추천수 3,000
									    </p>
									  </div>
									</div>
								</div>
								<%} %>
							</div>
						</div>
					</article>
        
                </article>
                


            </div>


            <div class="col-1 p-0 d-none d-sm-block">

                <aside id="rightAside">
                	<div class="rAside">
                		<div class="rAsideCart">
		                    <i class="bi bi-cart3 fs-1"></i><br>
                		</div>
	                    최근 본 상품<br>
	                  	<div class="productDiv">
	                  		<img src="<%=request.getContextPath()%>/resources/img/CJ/치킨,만두/1.png" class="viewProduct" alt="비비고만두">
	                  	</div>
	                  	<div class="productDiv">
	                  		<img src="<%=request.getContextPath()%>/resources/img/CJ/치킨,만두/1.png" class="viewProduct" alt="비비고만두">
						</div>
	                  	<div class="productDiv">
	                  		<img src="<%=request.getContextPath()%>/resources/img/CJ/치킨,만두/1.png" class="viewProduct" alt="비비고만두">
	                  	</div>
	                  	<div class="top" onclick="moveTop()">Top</div>
	                  	<div>채팅</div>
                	</div>
                </aside>
            </div>

        </div>

    </section>
    
    <div class="back">
      <div class="message"></div>
    </div>
    
    <%@ include file ="footer.jsp" %>

	<script>
		function heart(obj){
			var hCheck = obj.getAttribute("src").indexOf("빈하트");
			
			if(hCheck > 0){
				obj.setAttribute("src","<%=request.getContextPath()%>/resources/img/찬하트.png");
			}else if(hCheck < 0){
				obj.setAttribute("src","<%=request.getContextPath()%>/resources/img/빈하트.png");
			}	
		}
		
		function cart(obj){
			$(".back").css("display","block");
			var name = $(obj).next().find(".productName").html();
			var html = "<br><br>"+name+" 상품이 장바구니에 담겼습니다.";
				html += "<br><br><button onclick='cartOk()''>확인</button>";
			$(".message").html(html);
		}
		
		function cartOk(){
			$(".back").css("display","none");
		}
		
		function moveTop(){
			window.scrollTo(0,0);
		}
	</script>
    <script src="https://kit.fontawesome.com/b30bc4e0a9.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript" src="base.js"></script>
</body>
</html>