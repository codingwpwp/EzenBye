<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="row">
    <div class="col-lg-2 d-none d-lg-block"></div>

    <!-- 실질적으로 사용하는 헤더 -->
    <div class="col-12 col-sm-9 col-md-10 col-lg-9">
        <div class="row d-flex align-items-center">

            <!-- 로고 -->
            <div class="col-2 d-flex justify-content-start">
                <a href="/controller/index.do"><img src="<%=request.getContextPath()%>/resources/img/로고.png" class="w-100 img-fluid" id="logo"></a>
            </div>

            <!-- 검색 -->
            <div class="col-6 d-flex align-items-center">
            	<label class="d-flex" style="border:0; width:100%;" id="search">
	                <input class="form-control fs-6 fw-bold w-100 me-2" type="text" placeholder="상품을 입력하세요" style="display:inline-block;" id="searchValue">
	                <button style="border:0; background:white;" onclick="search(this)" id="searchButton"><i class="bi bi-search fs-2" id="search"></i></button>
            	</label>
            </div>

            <!-- 3개의 아이콘 -->
            <div class="col-4 col-lg-3">
                <div class="d-flex justify-content-evenly">
                    <i class="bi bi-truck fs-1"></i>
                    <i class="bi bi-cart3 fs-1" onclick="location.href='/controller/shopBasket_main.do'"></i>
                    
                    <c:if test="${not empty member }">
                    <i class="bi bi-person fs-1 position-relative" onclick="location.href='/controller/mypage_main.do'">
                    <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger header-badge">
					  
					</span>
                    </i>
                    <input type="hidden" value="${member.member_index}" name="messageNonReadCount" />
                    
                    </c:if>
                    <c:if test="${empty member }">
                    <i class="bi bi-person fs-1" onclick="alert('로그인이 필요합니다!!');"></i>
                    </c:if>
                 	
                </div>
            </div>
        </div>
    </div>

    <div class="col-sm-3 col-md-2 col-lg-1 d-none d-sm-block"></div>
</div>