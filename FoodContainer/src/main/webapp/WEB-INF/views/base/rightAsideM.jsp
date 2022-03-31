<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 모바일 -->
<div class="rightAsideM">
	<button class="rightAsideButtonM" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasBottom" aria-controls="offcanvasBottom">
		<i class="bi bi-chevron-up"></i>최근 본 상품
	</button>
	
	<div class="offcanvas offcanvas-bottom rightAsideDivM" tabindex="-1" id="offcanvasBottom" aria-labelledby="offcanvasBottomLabel">
		<div class="offcanvas-header">
			<button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
		</div>
		<div class="offcanvas-body small rightAsideContentsM ">
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