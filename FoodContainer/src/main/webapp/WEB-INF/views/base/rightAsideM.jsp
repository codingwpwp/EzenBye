<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 모바일 -->
<div>
	<button class="rightAsideButtonM btn btn-dark" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasBottom" aria-controls="offcanvasBottom" onclick="rightAsideButtonM()">
			<i class="bi bi-chevron-up"></i> 최근 본 상품
	</button>
	
	<div class="offcanvas offcanvas-bottom rightAsideDivM" tabindex="-1" id="offcanvasBottom" aria-labelledby="offcanvasBottomLabel">
		<div class="offcanvas-body small d-flex justify-content-around">
			<i class="bi bi-cart3 mobileCart"></i>
			<div class="rightAsideImgM">
       			<a href="#"><img src="<%=request.getContextPath()%>/resources/img/로고.png" class="img-fluid border"></img></a>
   			</div>
    		<div class="rightAsideImgM">
        		<a href="#"><img src="<%=request.getContextPath()%>/resources/img/로고.png" class="img-fluid border"></img></a>
    		</div>
    		<div class="rightAsideImgM">
        		<a href="#"><img src="<%=request.getContextPath()%>/resources/img/로고.png" class="img-fluid border"></img></a>
    		</div>
		</div>
	</div>
</div>