<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!-- 네비게이션 바 -->
<div class="col-4 col-sm-4 col-md-5 col-lg-8 col-xl-7" id="navCenterMenuDiv">

    <button class="navbar-toggler collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#navCenterMenu" aria-controls="navCenterMenu">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="navbar-collapse collapse" id="navCenterMenu">
        <ul class="navbar-nav me-auto mb-md-0">

            <li class="nav-item">
                <a class="nav-link text-dark px-lg-1 px-xl-2 menu" href="<%=request.getContextPath()%>/productList.do">전체식품</a>
            </li>

            <li class="nav-item dropdown" onmouseover="changeColorFn1(this)" onmouseout="changeColorFn2(this)">
                <a class="nav-link dropdown text-primary text-opacity-50 px-lg-1 px-xl-2 menu" data-bs-toggle="dropdown" aria-expanded="false">
                    <i class="bi bi-snow2"></i>냉동식품
                </a>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="<%=request.getContextPath()%>/productList.do?볶음밥" onclick="linkIce0(); productFilter();">볶음밥</a></li>
                    <li><a class="dropdown-item" href="<%=request.getContextPath()%>/productList.do?치킨,만두" onclick="linkIce1(); productFilter();">치킨,만두</a></li>
                </ul>
            </li>

            <li class="nav-item dropdown" onmouseover="changeColorFn1(this)" onmouseout="changeColorFn2(this)">
                <a class="nav-link text-success text-opacity-50 px-lg-1 px-xl-2 menu" data-bs-toggle="dropdown" aria-expanded="false" onclick="linkProduct()">
                    <i class="fa-solid fa-utensils"></i>즉석식품
                </a>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="<%=request.getContextPath()%>/productList.do?국" onclick="linkProduct0(); productFilter();">국</a></li>
                    <li><a class="dropdown-item" href="<%=request.getContextPath()%>/productList.do?반찬" onclick="linkProduct1(); productFilter();">반찬</a></li>
                    <li><a class="dropdown-item" href="<%=request.getContextPath()%>/productList.do?컵밥,햇반" onclick="linkProduct2(); productFilter();">컵밥,햇반</a></li>
                </ul>
            </li>

            <li class="nav-item">
                <a class="nav-link px-lg-1 px-xl-2" href="<%=request.getContextPath()%>/event.do">이벤트</a>
            </li>

            <li class="nav-item">
                <a class="nav-link px-lg-1 px-xl-2" href="<%=request.getContextPath()%>/recipemain.do">유저레시피</a>
            </li>

            <li class="nav-item">
                <a class="nav-link px-lg-1 px-xl-2" href="<%=request.getContextPath()%>/notice_main.do?nowPage=1">공지사항</a>
            </li>

            <li class="nav-item">
                <a class="nav-link px-lg-1 px-xl-2" href="<%=request.getContextPath()%>/serviceCenter.do">고객센터</a>
            </li>

        </ul>
    </div>

</div>

<!-- 회원 -->
<c:if test="${member==null}">
<div class="col-6 col-sm-4 col-lg-2 col-xl-3 d-flex align-items-lg-center justify-content-end justify-content-sm-center justify-content-lg-start pe-4 pe-sm-2 fs-6" id="userLogin">
    <a href="<%=request.getContextPath()%>/loginmain.do" class="link-dark">로그인</a>&nbsp;|&nbsp;<a href="<%=request.getContextPath()%>/member_sign.do" class="link-dark">회원가입</a>
</div>
</c:if>
<c:if test="${member!=null}">
<div class="col-6 col-sm-4 col-lg-2 col-xl-3 d-flex align-items-lg-center justify-content-end justify-content-sm-center justify-content-lg-start pe-4 pe-sm-2 fs-6" id="userLogin">
    <a <c:if test="${member.position == '관리자'}">href="admin.do" class="link-secondary"</c:if>>${member.name}님</a>&nbsp;|&nbsp;<a href="<%=request.getContextPath()%>/logout.do" class="link-dark">로그아웃</a>
</div>
</c:if>

<div class="col-sm-3 col-md-2 d-none d-sm-block d-lg-none"></div>