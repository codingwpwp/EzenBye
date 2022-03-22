<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<header class="border-bottom">
        <div class="container">
            <div class="row">

                <div class="col-9 offset-2">
                    <div class="row d-flex align-items-center">
                        <div class="col-2 p-0">
                            <a href="#"><img src="<%=request.getContextPath()%>/resources/img/로고.png" class="w-100 img-fluid"></a>
                        </div>
                        <div class="col-7 d-flex align-items-center">
                            <input class="form-control fs-6 fw-bold w-100 me-2" type="text" placeholder="상품을 입력하세요">
                            <i class="bi bi-search fs-2" id="search"></i>
                        </div>
                        <div class="col-3 m-0">
                            <div class="gx-1 p-0 d-flex justify-content-evenly headerMenu">
                                <i class="bi bi-truck fs-1"></i>
                                <i class="bi bi-cart3 fs-1"></i>
                                <i class="bi bi-person fs-1"></i>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-1"></div>

            </div>
        </div>
    </header>