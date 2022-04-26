<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 모바일 -->
<div>
	<button class="rightAsideButtonM btn btn-dark" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasBottom" aria-controls="offcanvasBottom" onclick="rightAsideButtonM()">
			<i class="bi bi-chevron-up"></i> 최근 본 상품
	</button>
	
	<div class="offcanvas offcanvas-bottom rightAsideDivM" tabindex="-1" id="offcanvasBottom" aria-labelledby="offcanvasBottomLabel">
		<div class="offcanvas-body small d-flex justify-content-around">
			<div id="recentProductM">
				<a href="shopBasket_main.do"><i class="bi bi-cart3 mobileCart"></i></a>
	    		<c:forEach items="${viewCookie}" var="viewCookie">
			    	<div class="rightAsideImgM">
				        <a href="productView.do?product_index=${viewCookie.product_index}">
				        	<img src="<%=request.getContextPath()%>/resources/img/${viewCookie.brand}/${viewCookie.middleSort}/${viewCookie.thumbnail_image}" class="img-fluid border"></img>
				        </a>
			   		</div>
	    		</c:forEach>
	    	</div>
		</div>
	</div>
</div>