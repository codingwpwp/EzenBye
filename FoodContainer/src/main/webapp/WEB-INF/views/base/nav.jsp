<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 네비게이션 바 -->
<div class="col-5 col-sm-5 col-md-6 col-lg-8 col-xl-7" id="navCenterMenuDiv">

    <button class="navbar-toggler collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#navCenterMenu" aria-controls="navCenterMenu">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="navbar-collapse collapse" id="navCenterMenu">
        <ul class="navbar-nav me-auto mb-md-0">

            <li class="nav-item">
                <a class="nav-link text-dark px-lg-1 px-xl-2 menu" href="productList.do">전체식품</a>
            </li>

            <li class="nav-item dropdown" onmouseover="changeColorFn1(this)" onmouseout="changeColorFn2(this)">
                <a class="nav-link dropdown text-primary text-opacity-50 px-lg-1 px-xl-2 menu" href="#" data-bs-toggle="dropdown" aria-expanded="false">
                    <i class="bi bi-snow2"></i>냉동식품
                </a>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="#">볶음밥</a></li>
                    <li><a class="dropdown-item" href="#">치킨/만두</a></li>
                </ul>
            </li>

            <li class="nav-item dropdown" onmouseover="changeColorFn1(this)" onmouseout="changeColorFn2(this)">
                <a class="nav-link text-success text-opacity-50 px-lg-1 px-xl-2 menu" href="#" data-bs-toggle="dropdown" aria-expanded="false">
                    <i class="fa-solid fa-utensils"></i>즉석식품
                </a>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="#">국물</a></li>
                    <li><a class="dropdown-item" href="#">반찬</a></li>
                    <li><a class="dropdown-item" href="#">컵밥</a></li>
                </ul>
            </li>

            <li class="nav-item">
                <a class="nav-link px-lg-1 px-xl-2" href="#">이벤트</a>
            </li>

            <li class="nav-item">
                <a class="nav-link px-lg-1 px-xl-2" href="#">유저레시피</a>
            </li>

            <li class="nav-item">
                <a class="nav-link px-lg-1 px-xl-2" href="#">공지사항</a>
            </li>

            <li class="nav-item">
                <a class="nav-link px-lg-1 px-xl-2" href="#">고객센터</a>
            </li>

        </ul>
    </div>

</div>

<!-- 회원 -->
<div class="col-5 col-sm-3 col-lg-2 col-xl-3 d-flex align-items-lg-center justify-content-end justify-content-sm-center justify-content-lg-start pe-4 pe-sm-2 fs-6" id="userLogin">
    <a href="#" class="link-dark">로그인</a>&nbsp;|&nbsp;<a href="#" class="link-dark">회원가입</a>
</div>

<div class="col-sm-3 col-md-2 d-none d-sm-block d-lg-none"></div>