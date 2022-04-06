<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Food Container</title>
    <!-- css링크 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/base.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/adminPage.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/adminPage_leftMenu.css">
</head>
<body onload="registerFormColorSetting()">
	<!-- 헤더 -->
	<header class="border-bottom border-dark">
		<%@include file="/WEB-INF/views/base/header.jsp"%>
	</header>

    <!-- 네비게이션 바 -->
    <nav class="navbar-expand-lg navbar-light bg-warning bg-gradient bg-opacity-25 fw-bold fs-5">
        <div class="row">
            <div class="col-lg-2 d-none d-lg-block"></div>

            <div class="col-2 col-sm-1 pe-0 d-lg-none" id="navLeftMenu">
				<%@include file="/WEB-INF/views/adminPage/adminPage_nav_leftMenu.jsp"%>
            </div>

			<%@include file="/WEB-INF/views/base/nav.jsp"%>

        </div>
    </nav>

    <!-- 섹션 -->
    <section class="mt-1">
        <div class="row">

            <!-- 왼쪽 사이드메뉴 -->
            <div class="col-lg-2 d-none d-lg-block">
               <%@include file="/WEB-INF/views/adminPage/leftAside.jsp"%>
            </div>

            <!-- 메인 -->
            <div class="col-12 col-sm-9 col-md-10 col-lg-8">
                <article id="mainSection">
    
                    <!-- 헤딩 -->
                    <div class="fs-5 my-2 fw-bold">
                        상품 등록
                    </div>

                    <!-- 상품등록하는 폼 -->
                    <form name="productRegisterForm" action="product_register.do" method="post" id="productManagerForm" enctype="multipart/form-data" onsubmit="return checkProduct()">
                        
                        <!-- 상품 분류 -->
                        <div class="h3 my-4 fw-bold ps-3">
                            [상품 분류]
                            <span class="text-primary bg-opacity-50 fw-bold">냉동</span><span class="fw-bold">&</span><span class="text-success bg-opacity-50 fw-bold">즉석</span>
                        </div>

                        <!-- 대분류&중분류 -->
                        <div class="row my-3 d-flex align-items-center">

                            <!-- 대분류 -->
                            <div class="col-4 col-md-2 d-flex justify-content-end mb-3 mb-md-0">
                                <span class="infoTitle p-1" style="width: 79px;"><span class="text-danger">*</span>대분류</span>
                            </div>

                            <div class="col-5 col-md-4 col-lg-3 mb-3 mb-md-0">
                                <select class="bg-opacity-75 form-select fw-bold" id="bigSort" name="bigSort" onchange="changeBigSort(this)">
                                    <option class="bg-primary bg-opacity-75 fw-bold" value="냉동식품" selected>
                                        냉동식품
                                    </option>
                                    <option class="bg-success fw-bold" value="즉석식품">
                                        즉석식품
                                    </option>
                                </select>
                            </div>

                            <!-- 중분류 -->
                            <div class="col-4 col-md-2 d-flex justify-content-end">
                                <span class="infoTitle p-1" style="width: 79px;"><span class="text-danger">*</span>중분류</span>
                            </div>

                            <div class="col-5 col-md-4 col-lg-3">
                                <select class="bg-opacity-25 form-select fw-bold" id="middleSort" name="middleSort">
                                    <option class="bg-primary bg-opacity-25 fw-bold frozen" value="볶음밥" selected>볶음밥</option>
                                    <option class="bg-primary bg-opacity-25 fw-bold frozen" value="치킨,만두">치킨/만두</option>
                                    <option class="bg-success bg-opacity-25 fw-bold instant" value="국물">국물</option>
                                    <option class="bg-success bg-opacity-25 fw-bold instant" value="반찬">반찬</option>
                                    <option class="bg-success bg-opacity-25 fw-bold instant" value="컵밥,햇반">컵밥</option>
                                </select>
                            </div>

                        </div>
                        
                        <hr>

                        <!-- 상품 정보 -->
                        <div class="h3 my-4 fw-bold ps-3">
                            [상품 정보]
                        </div>

                        <!-- 브랜드 -->
                        <div class="row my-3">

                            <div class="col-4 col-md-2 d-flex justify-content-end">
                                <span class="infoTitle p-1" style="width: 79px;"><span class="text-danger">*</span>브랜드</span>
                            </div>

                            <div class="col-5 col-md-4 col-lg-3">
                                <select class="bg-opacity-25 form-select" name="brand" id="brand">
                                    <option class="bg-opacity-100" value="CJ">CJ</option>
                                    <option class="bg-opacity-75" value="오뚜기">오뚜기</option>
                                    <option class="bg-opacity-50" value="청정원">청정원</option>
                                    <option class="bg-opacity-25" value="하림">하림</option>
                                    <option class="bg-light" value="기타">기타</option>
                                </select>
                            </div>

                        </div>

                        <!-- 상품 이름 -->
                        <div class="row my-3">

                            <div class="col-4 col-md-2 d-flex justify-content-end">
                                <span class="infoTitle p-1"><span class="text-danger">*</span>상품 이름</span>
                            </div>

                            <div class="col-8 col-md-10 col-lg-8">
                                <input type="text" class="form-control check" name="product_name" placeholder="ex)왕교자" maxlength="30" autocomplete="off">
                            </div>

                        </div>

                        <!-- 판매&할인 가격 -->
                        <div class="row my-3 d-flex align-items-center">

                            <!-- 판매 가격 -->
                            <div class="col-4 col-md-2 d-flex justify-content-end mb-3 mb-md-0">
                                <span class="infoTitle p-1"><span class="text-danger">*</span>판매 가격</span>
                            </div>

                            <div class="col-5 col-md-4 col-lg-3 mb-3 mb-md-0">
                                <div class="row">

                                    <div class="col-11 pe-0">
                                        <input type="text" class="form-control" name="origin_price" style="text-align: right;" value="" maxlength="7" onKeyup="priceReg(this)">
                                    </div>

                                    <div class="col-1 d-flex align-items-center fw-bold px-0">원</div>

                                </div>
                            </div>

                            <!-- 할인 가격 -->
                            <div class="col-4 col-md-2 d-flex justify-content-end mb-3 mb-md-0">
                                <span class="infoTitle p-1">할인 가격</span>
                            </div>

                            <div class="col-5 col-md-4 col-lg-3 mb-3 mb-md-0">
                                <div class="row">

                                    <div class="col-11 pe-0">
                                        <input type="text" class="form-control" name="sale_price" style="text-align: right;" value="" maxlength="7" onKeyup="priceReg(this)" onblur="priceReg2(this)">
                                    </div>

                                    <div class="col-1 d-flex align-items-center fw-bold px-0">원</div>

                                </div>
                            </div>

                        </div>

                        <!-- 재고&배송비 -->
                        <div class="row my-3 d-flex align-items-center">

                            <!-- 재고 -->
                            <div class="col-4 col-md-2 d-flex justify-content-end mb-3 mb-md-0">
                                <span class="infoTitle p-1" style="width: 79px;"><span class="text-danger">*</span>재고</span>
                            </div>

                            <div class="col-5 col-md-4 col-lg-3 mb-3 mb-md-0">
                                <div class="row">

                                    <div class="col-11 pe-0">
                                        <input type="text" class="form-control" name="inventory" style="text-align: right;" value="" maxlength="12" onKeyup="priceReg(this)">
                                    </div>

                                    <div class="col-1 d-flex align-items-center fw-bold px-0">개</div>

                                </div>
                            </div>

                            <!-- 배송비 -->
                            <div class="col-4 col-md-2 d-flex justify-content-end mb-3 mb-md-0">
                                <span class="infoTitle p-1" style="width: 79px;"><span class="text-danger">*</span>배송비</span>
                            </div>

                            <div class="col-5 col-md-4 col-lg-3 mb-3 mb-md-0">
                                <select class="form-select" name="delivery_free_YN" style="text-align: right;">
                                    <option value="N" selected>3,000원</option>
                                    <option value="Y">무료배송</option>
                                </select>
                            </div>

                        </div>

                        <hr>

                        <!-- 이미지 등록&확장자 주의사항 -->
                        <div class="h3 my-4 fw-bold  ps-3">
                            [이미지 등록]
                            <span class="fs-6 text-danger">*png확장자만 가능합니다.</span>
                        </div>

                        <!-- 대표이미지 -->
                        <div class="row my-3 imageRow d-flex justify-content-center">

                            <!-- 대표이미지 문구 -->
                            <div class="col-5 col-md-3 col-lg-2 d-flex justify-content-center">
                                <span class="infoTitle p-1"><span class="text-danger">*</span>대표이미지</span>
                            </div>

                            <div class="col-7 col-md-3 col-lg-2 d-flex justify-content-end imagePreview">
                            <!-- 이미지 미리보기 -->
                                <button type="button" class="btn btn-secondary previewButton" data-bs-toggle="modal" data-bs-target="#tumnailImageModal">미리보기</button>
                            </div>

                            <div class="col-11 col-md-6 col-lg-8 d-flex mt-2 inputImageFile">
                            <!-- 파일 등록 -->
                                <input class="form-control check" name="tumnailImage" type="file" accept="image/png" onchange="previewImage(event, this);">
                            </div>

                        </div>

                        <!-- 상세이미지 -->
                        <div class="row my-3 imageRow d-flex justify-content-center">

                            <!-- 상세이미지 문구 -->
                            <div class="col-5 col-md-3 col-lg-2 d-flex justify-content-center">
                                <span class="infoTitle p-1"><span class="text-danger">*</span>상세이미지</span>
                            </div>

                            <div class="col-7 col-md-3 col-lg-2 d-flex justify-content-end imagePreview">
                            <!-- 이미지 미리보기 -->
                                <button type="button" class="btn btn-secondary previewButton" data-bs-toggle="modal" data-bs-target="#detailImageModal">미리보기</button>
                            </div>

                            <div class="col-11 col-md-6 col-lg-8 d-flex mt-2 inputImageFile">
                                <!-- 파일 등록 -->
                                <input class="form-control check" name="detailImage" type="file" accept="image/png" onchange="previewImage(event, this);">
                            </div>

                        </div>

                        <!-- 리셋&등록 -->
                        <div class="row rows mt-4">

                            <div class="col-12 d-flex justify-content-center">
                                <button type="reset" class="btn btn-secondary mx-3 fw-bold" onclick="formReset()">초기화</button>
                                <button type="button" class="btn btn-primary mx-3 fw-bold" data-bs-toggle="modal" data-bs-target="#submitModal" onclick="registerButton()">등록하기</button>
                            </div>

                            <!-- 등록 모달 -->
                            <div class="modal fade" id="submitModal" tabindex="-1" aria-labelledby="submitModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h3 class="modal-title fw-bold" id="submitModalLabel">상품 등록</h3>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body h5 fw-bold" id="productMessage">
                                        상품을 등록하시겠습니까?
                                    </div>
                                    <div class="modal-footer d-flex justify-content-center">
                                        <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">아니오</button>
                                        <button type="submit" class="btn btn-outline-success">예</button>
                                        <button type="button" class="btn btn-primary" data-bs-dismiss="modal" id="submitNo">확인</button>
                                    </div>
                                </div>
                                </div>
                            </div>

                        </div>

                        <!-- 대표이미지 미리보기 모달 -->
                        <div class="modal fade" id="tumnailImageModal" tabindex="-1" aria-labelledby="tumnailImageModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="tumnailImageModalLabel">대표이미지</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="imageContainer">
                                            <span class="fs-5">이미지가 없습니다.</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- 상세이미지 미리보기 모달 -->
                        <div class="modal fade" id="detailImageModal" tabindex="-1" aria-labelledby="detailImageModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="detailImageModalLabel">상세이미지</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="imageContainer">
                                            <span class="fs-5">이미지가 없습니다.</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </form>

                </article>
            </div>

            <!-- 오른쪽 사이드메뉴 -->
            <div class="col-sm-3 col-md-2 col-lg-2 d-none d-sm-block">
            </div>
            
        </div>
    </section>
    
    <!-- 푸터 -->
    <footer class="py-3 my-4">
        <%@include file="/WEB-INF/views/base/footer.jsp"%>
    </footer>

    <!-- 자바스크립트 -->
    <script src="https://kit.fontawesome.com/b30bc4e0a9.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/base.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/adminPage.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/adminPage_leftMenu.js"></script>
</body>
</html>