<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<nav class="navbar-expand-lg navbar-light bg-light fw-bold">
        <div class="container">

            <div class="row">

                <!-- 실질적으로 사용하는 네비게이션 바 -->
                <div class="col-9 offset-2">

                    <div class="row">

                        <div class="col-9 col-sm-9 col-xs-1 p-0" id="navDiv">

                            <button class="navbar-toggler collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExample04" aria-controls="navbarsExample04">
                                <span class="navbar-toggler-icon"></span>
                            </button>

                            <div class="navbar-collapse collapse" id="navbarsExample04">   

                                <ul class="navbar-nav me-auto mb-md-0">

                                    <li class="nav-item dropdown">
                                        <a class="nav-link" href="#">전체</a>
                                    </li>

                                    <li class="nav-item dropdown">
                                        <a class="nav-link dropdown" href="#" data-bs-toggle="dropdown" aria-expanded="false"><i class="bi bi-snow2"></i>냉동식품</a>
                                        <ul class="dropdown-menu">
                                            <li><a class="dropdown-item" href="#">볶음밥</a></li>
                                            <li><a class="dropdown-item" href="#">치킨/만두</a></li>
                                        </ul>
                                    </li>

                                    <li class="nav-item dropdown">
                                        <a class="nav-link" href="#"><i class="fa-solid fa-utensils"></i>즉석식품</a>
                                        <ul class="dropdown-menu">
                                            <li><a class="dropdown-item" href="#">국물</a></li>
                                            <li><a class="dropdown-item" href="#">반찬</a></li>
                                            <li><a class="dropdown-item" href="#">컵밥</a></li>
                                        </ul>
                                    </li>

                                    <li class="nav-item">
                                        <a class="nav-link" href="#">이벤트</a>
                                    </li>

                                    <li class="nav-item">
                                        <a class="nav-link" href="#">유저레시피</a>
                                    </li>

                                    <li class="nav-item">
                                        <a class="nav-link" href="#">공지사항</a>
                                    </li>

                                    <li class="nav-item">
                                        <a class="nav-link" href="#">고객센터</a>
                                    </li>

                                </ul>

                            </div>

                        </div>

                        <div class="col-3 col-sm-3 col-xs-11 p-0 d-flex align-items-center d-flex justify-content-end">
                            <div id="userLogin" class="fs-6">
                                <a href="#">로그인</a> <a>|</a> <a href="#">회원가입</a>
                            </div>
                        </div>
                    </div>

                </div>

                <div class="col-1"></div>

            </div>

        </div>
    </nav>