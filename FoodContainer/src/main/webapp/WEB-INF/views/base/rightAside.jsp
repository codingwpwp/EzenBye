<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 조만간 회의를 통해 디자인을 전면 수정할 계획 -->
<aside class="d-flex flex-column align-items-center border border-3 border-primary rounded-3 bg-primary bg-gradient bg-opacity-75 me-2" id="rightAside">
    <i class="bi bi-cart3 fs-1"></i>
    <span class="fw-bold fs-6">최근 상품</span>
    <div class="productImg">
        <a href="#"><img src="<%=request.getContextPath()%>/resources/img/로고.png" class="w-75 img-fluid mt-2 mb-3 border border-dark"></img></a>
    </div>
    <div class="productImg">
        <a href="#"><img src="<%=request.getContextPath()%>/resources/img/로고.png" class="w-75 img-fluid mb-3 border border-dark"></img></a>
    </div>
    <div class="productImg">
        <a href="#"><img src="<%=request.getContextPath()%>/resources/img/로고.png" class="w-75 img-fluid mb-3 border border-dark"></img></a>
    </div>
    <div id="top" onclick="moveTop();">
        ↑Top
    </div><br>
    <div id="chatting" class="fw-bold">
        <i class="fa-brands fa-weixin"></i><br>
        카카오톡
    </div>
</aside>