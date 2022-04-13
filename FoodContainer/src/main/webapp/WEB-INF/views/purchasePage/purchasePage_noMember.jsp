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
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/purchasePage.css">
</head>
<body>
	<!-- 헤더 -->
	<header class="border-bottom border-dark">
		<%@include file="/WEB-INF/views/base/header.jsp"%>
	</header>

    <!-- 네비게이션 바 -->
    <nav class="navbar-expand-lg navbar-light bg-warning bg-gradient bg-opacity-25 fw-bold fs-5">
        <div class="row">
            <div class="col-lg-2 d-none d-lg-block"></div>

            <div class="col-2 col-sm-1 pe-0 d-lg-none border border-dark" id="navLeftMenu"></div>

			<%@include file="/WEB-INF/views/base/nav.jsp"%>

        </div>
    </nav>

    <!-- 섹션 -->
    <section class="row mt-1">

            <!-- 왼쪽 사이드메뉴 -->
            <div class="col-lg-2 d-none d-lg-block"></div>

            <!-- 메인 -->
            <div class="row col-12 col-lg-10 ps-lg-3 pe-1">

                <!-- 헤딩 -->
                <div class="display-5 my-4 ps-3 fw-bold">
                    비회원 상품 구매
                </div>

                <!-- 비회원 구매정보입력 + 모바일 버전 최종 구매버튼 -->
                <form class="col-12 col-sm-8 ps-4 ps-lg-2 mt-2" id="puchaseForm" name="puchaseForm" method="post" action="noMemberPurchaseOk.do">

                    <!-- 전체약관 동의 -->
                    <div class="form-check fs-6 table-responsive" style="white-space: nowrap;">
                        <input class="form-check-input border border-dark" type="checkbox" id="agreeAllCheckbox" onchange="checkedAll(this)">
                        <label class="form-check-label text-dark fw-bold" for="agreeAllCheckbox">
                            주문 및 결제대행 서비스 이용약관 동의
                        </label>
                    </div>
                    <hr>

                    <!-- 세부약관1 -->
                    <div class="container my-3 checkboxs">
                        <div class="form-check fs-6">
                            <input class="form-check-input border border-dark" type="checkbox" id="agreeOneCheckbox" onchange="checkedOne(this)">
                            <label class="form-check-label text-dark fw-bold" for="agreeOneCheckbox">
                                주문 상품 정보에 대한 동의<span class="text-danger">(필수)</span>
                            </label>
                            <ul class="container pe-0">
                                <li class="fontSmall" style="list-style-type: square;">
                                    주문할 상품과 가격, 할인 및 배송정보 등을 최종 확인하였으며, <br class="d-md-none">구매에 동의합니다.<br>
                                    (전자상거래법 제 8조 2항)
                                </li>
                            </ul>
                        </div>
                    </div>

                    <!-- 세부약관2 -->
                    <div class="container my-3 checkboxs">
                        <div class="form-check fs-6">

                            <input class="form-check-input border border-dark" type="checkbox" id="agreeTwoCheckbox" onchange="checkedTwo(this)">
                            <label class="form-check-label text-dark fw-bold" for="agreeTwoCheckbox">
                                결제대행 서비스 이용약관 동의<span class="text-danger">(필수)</span>
                            </label>

                            <div class="container agreeTwo">
                                <input class="form-check-input border border-dark" type="checkbox" id="agreeTwo_OneCheckbox" onchange="checkedTwoSub()">
                                <label class="form-check-label text-dark fontSmall" for="agreeTwo_OneCheckbox">
                                    전자금융거래 기본약관
                                </label>
                                <a class="link-info" href="#">약관보기</a>
                            </div>

                            <div class="container agreeTwo">
                                <input class="form-check-input border border-dark" type="checkbox" id="agreeTwo_TwoCheckbox" onchange="checkedTwoSub()">
                                <label class="form-check-label text-dark fontSmall" for="agreeTwo_TwoCheckbox">
                                    개인정보 수집 및 이용동의
                                </label>
                                <a class="link-info" href="#">약관보기</a>
                            </div>

                            <div class="container agreeTwo">
                                <input class="form-check-input border border-dark" type="checkbox" id="agreeTwo_ThreeCheckbox" onchange="checkedTwoSub()">
                                <label class="form-check-label text-dark fontSmall" for="agreeTwo_ThreeCheckbox">
                                    개인정보 제공 동의 (Food Container)
                                </label>
                                <br class="d-md-none">
                                <a class="link-info" href="#">약관보기</a>
                            </div>

                        </div>
                    </div>

                    <!-- 세부약관3 -->
                    <div class="container mb-5 checkboxs">
                        <div class="form-check fs-6">
                            <input class="form-check-input border border-dark" type="checkbox" value="." id="agreeThreeCheckbox" onchange="checkedThree(this)">
                            <label class="form-check-label text-dark fw-bold" for="agreeThreeCheckbox">
                                비회원 개인정보 수집 및 이용 동의<span class="text-danger">(필수)</span>
                            </label>
                            <a class="link-info" href="#">약관보기</a>
                        </div>
                    </div>

                    <!-- 주문자 정보 -->
                    <div class="fs-3 fw-bold">
                        주문자 정보 <span class="text-danger fs-6">*필수</span>
                    </div>
                    <hr>

                    <!-- 주문자명 -->
                    <div class="row my-4">
                        <div class="col-4 col-md-3 col-xxl-2 fs-5 fw-bold d-flex align-items-center justify-content-start justify-content-lg-center">
                            <span id="orderNameSpan" class="checkResultSpan">주문자명</span>
                        </div>

                        <div class="col-8 col-md-6 col-lg-5 col-xxl-4">
                            <input type="text" class="form-control fw-bold" id="name" name="name" value="${name}" readonly>
                        </div>
                    </div>

                    <!-- 주문자 연락처 -->
                    <div class="row my-4">

                        <div class="col-3 col-xxl-2 fs-5 d-flex justify-content-lg-center fw-bold">
                            <span class="text-danger">*</span><span id="orderPhoneSpan" class="checkResultSpan">연락처</span>
                        </div>

                        <div class="col-9 input-group w-75 phone">
                            <select class="form-select" name="orderPhone1">
                                <option selected value="010">010</option>
                                <option value="011">011</option>
                                <option value="016">016</option>
                                <option value="017">017</option>
                            </select>
                            <span class="input-group-text">-</span>
                            <input type="number" class="form-control" name="orderPhone2" min="100" max="9999" maxlength="4" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" oninput="phoneMaxLength(this)" onblur="orderPhoneCheck(this, 3)">
                            <span class="input-group-text">-</span>
                           <input type="number" class="form-control" name="orderPhone3" min="1000" max="9999" maxlength="4" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" oninput="phoneMaxLength(this)" onblur="orderPhoneCheck(this, 4)">
                        </div>

                    </div>

                    <!-- 이메일 -->
                    <div class="row my-4">
                        <div class="col-3 col-xxl-2 fs-5 d-flex justify-content-lg-center fw-bold">
                            이메일
                        </div>

                        <div class="col-9 col-lg-8">
                            <input class="form-control pe-1" type="email" name="email" id="email" value="${email}" maxlength="30" readonly>
                        </div>
                    </div>

                    <!-- 비밀번호 -->
                    <div class="row my-4">

                        <!-- 주문 비밀번호 -->
                        <div class="row col-12 col-xl-6 mb-3 mb-xl-0">
                            <div class="col-5 col-md-4 col-xl-6 col-xxl-5 fs-5 d-flex justify-content-lg-center fw-bold pe-0">
                                <span class="text-danger">*</span><span id="passwordOneSpan" class="checkResultSpan">주문 비밀번호</span>
                            </div>

                            <div class="col-7 col-md-8 col-xl-6">
                                <input class="form-control pe-1" type="password" id="password" name="pw" value="" placeholder="비밀번호를 입력" maxlength="15" onclick="passwordAlert()" onblur="passwordCheck(this, 'passwordOne')">
                            </div>
                        </div>

                        <!-- 비밀번호 확인 -->
                        <div class="row col-12 col-xl-6">
                            <div class="col-5 col-md-4 col-xl-6 col-xxl-5 fs-5 d-flex justify-content-lg-center fw-bold pe-0">
                                <span class="text-danger">*</span><span id="passwordTwoSpan" class="checkResultSpan">비밀번호 확인</span>
                            </div>

                            <div class="col-7 col-md-8 col-xl-6">
                                <input class="form-control pe-1" type="password" id="passwordOk" name="passwordOk" value="" placeholder="한번더 입력하세요" maxlength="15" onblur="passwordCheck(this, 'passwordTwo')">
                            </div>
                        </div>

                    </div>

                    <!-- 배송지 설정 -->
                    <div class="fs-3 fw-bold mt-2">
                        배송지 설정 <span class="text-danger fs-6">*필수</span>
                    </div>
                    <hr>

                    <!-- 받는분 -->
                    <div class="row d-flex align-items-center mb-4">

                        <div class="col-3 col-xxl-2 fs-5 fw-bold d-flex align-items-center justify-content-start justify-content-lg-center">
                            <span class="text-danger">*</span><span id="receiverSpan" class="checkResultSpan">받는분</span>
                        </div>

                        <div class="col-9 col-md-6 col-lg-5 col-xxl-4">
                            <input type="text" class="form-control fw-bold p-1 p-sm-2" id="receiver" name="receiver" value="" placeholder="이름을 입력하세요" maxlength="5" onblur="checkName(this)">
                        </div>
                        
                        <div class="col-4 col-md-3 col-xl-3">
                            <input class="form-check-input border border-dark" type="checkbox" value="" id="sameNameCheckbox" onchange="sameName(this)">
                            <label class="form-check-label text-dark fontSmall" for="sameNameCheckbox">
                                주문자와 동일
                            </label>
                        </div>

                    </div>

                    <!-- 배송지 -->
                    <div class="row d-flex align-items-start mb-4">

                        <div class="col-3 col-xxl-2 fs-5 fw-bold d-flex justify-content-start justify-content-lg-center mt-3">
                            <span class="text-danger">*</span><span id="deliverySpan" class="checkResultSpan">배송지</span>
                        </div>

                        <div class="col-9 col-lg-8">

                            <div class="input-group my-2">
                                <span class="input-group-text">우편번호</span>
                                <input type="text" id="postcode" name="postcode" class="form-control" readonly>
                                <button type="button" onclick="deliveryAddress()" value="우편번호 찾기" class="btn btn-secondary">주소검색</button>
                            </div>
                            <div class="input-group my-2">
                                <span class="input-group-text">주소</span>
                                <input type="text" id="address" name="address" class="form-control" readonly>
                            </div>
                            <div class="input-group my-2">
                                <span class="input-group-text">상세주소</span>
                                <input type="text" id="detailAddress" name="detailAddress" class="form-control" readonly onblur="checkAddress(this)">
                            </div>

                        </div>
                    </div>

                    <!-- 받는 사람 연락처 -->
                    <div class="row mb-4">

                        <div class="col-3 col-xxl-2 fs-5 d-flex justify-content-lg-center fw-bold">
                            <span class="text-danger">*</span><span id="receiverPhoneSpan" class="checkResultSpan">연락처</span>
                        </div>

                        <div class="col-9 col-lg-8 input-group w-75 phone">
                            <select class="form-select" name="receiverPhone1">
                                <option selected value="010">010</option>
                                <option value="011">011</option>
                                <option value="016">016</option>
                                <option value="018">018</option>
                            </select>
                            <span class="input-group-text">-</span>
                            <input type="number" class="form-control" name="receiverPhone2" min="100" max="9999" maxlength="4" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" oninput="phoneMaxLength(this)" onblur="receiverPhoneCheck(this, 3)">
                            <span class="input-group-text">-</span>
                           <input type="number" class="form-control" name="receiverPhone3" min="1000" max="9999" maxlength="4" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" oninput="phoneMaxLength(this)" onblur="receiverPhoneCheck(this, 4)">
                        </div>
                    </div>

                    <!-- 요청사항 -->
                    <div class="row mb-5">
                        <div class="col-3 col-xxl-2 fs-5 d-flex justify-content-lg-center fw-bold pe-0">
                            요청사항
                        </div>

                        <div class="col-9 col-lg-8">
                            <input class="form-control pe-1" name="request" list="requestOptions" placeholder="ex)부재시 경비실에 맡겨 주세요." maxlength="30">
                            <datalist id="requestOptions">
                                <option value="배송 전에 미리 연락 바랍니다.">
                                <option value="부재시 경비실에 맡겨 주세요.">
                                <option value="부재시 전화 주시거나 문자 남겨 주세요.">
                            </datalist>
                        </div>
                    </div>

                    <!-- 결제 상품 문구 -->
                    <div class="fs-3 fw-bold mt-2">
                        결제 상품<br>
                        <span class="fs-6">배송비가 있어도 <span class="text-danger">40,000원</span> 이상은 <span class="text-danger">무료배송!!</span></span>
                    </div>
                    <hr>

                    <!-- 결제 상품들 -->
                    <div class="mt-4 mb-5" id="productItems">
                    <c:forEach items="${CartList}" var="cart">
                        <div class="row bg-light border rounded-3 py-2 m-2 productItem">
                            <div class="col-6 col-sm-3">
                                <img src="<%=request.getContextPath()%>/resources/img/${cart.brand}/${cart.middleSort}/${cart.thumbnail_image}" class="img-thumbnail" alt="${cart.product_name}">
                            </div>

                            <div class="col-6 col-sm-8 d-flex flex-column">
                                <div class="mb-auto fw-bold pt-2">${cart.product_name}</div>
                                <div class="fw-bold pb-2"><span class="productPrice">${cart.origin_price}</span>원 | <span class="productCount">${cart.cart_count}</span>개</div>
                            </div>
                        </div>                    
                    </c:forEach>
                    </div>

                    <!-- 모바일버전 최종 결제 정보 -->
                    <div class="d-sm-none mt-4 notMemberFinalPurchase">
                        <!-- 최종 결제 정보 문구 -->
                        <div class="fs-4 fw-bold mb-3">최종 결제 정보</div>

                        <!-- 총 금액 -->
                        <div class="row my-2 d-flex align-items-center">
                            <div class="col-6 fs-6">총 금액</div>
                            <div class="col-6 text-danger fs-5 d-flex justify-content-end fw-bold price">
                                <span class="productSumPrice" id="productSumPrice">0</span>
                                원
                                <input type="hidden" name="productSumPrice" value="">
                            </div>
                        </div>

                        <!-- 배송비 -->
                        <div class="row my-2 d-flex align-items-center">
                            <div class="col-6 fs-6">배송비</div>
                            <div class="col-6 text-danger fs-5 d-flex justify-content-end fw-bold price">
                                <span class="deliveryPrice" id="deliveryPrice">0</span>
                                원
                                <input type="hidden" name="deliveryPrice" value="">
                            </div>
                        </div>

                        <hr>

                        <!-- 최종 결제 문구-->
                        <div class="fs-5 fw-bold mb-2">최종 결제 가격</div>

                        <!-- 최종 결제 가격 -->
                        <div class="text-danger mb-3 d-flex justify-content-end align-items-center fw-bold">
                            <span class="fs-1 totalPrice" id="finalPrice">0</span>
                            <span class="fs-4">&nbsp;원</span>
                        </div>

                        <!-- 결제버튼 -->
                        <div class="row mt-2 mb-1">
                            <button type="button" class="btn btn-primary btn-lg fw-bold fs-4" onclick="requestPay()">결제하기</button>
                        </div>
                    </div>
                    
					<input type="hidden" name="no_member_order_index" value="">
				    <input type="hidden" name="phone" value="">
					<input type="hidden" name="address" value="">
                    <input type="hidden" name="delivery_free_YN" value="">
                    <input type="hidden" name="pay_price" value="">

                </form>

                <!-- pc버전 최종 결제 정보 -->
                <div class="col-4 d-none d-sm-block position-sticky p-3 ms-md-3 notMemberFinalPurchase" id="purchaseNotMemberDiv">

                    <!-- 최종 결제 정보 문구 -->
                    <div class="fs-4 fw-bold mb-3">최종 결제 정보</div>

                    <!-- 총 금액 -->
                    <div class="row my-2 d-flex align-items-center">
                        <div class="col-6 fs-6">총 금액</div>
                        <div class="col-6 text-danger fs-5 d-flex justify-content-end fw-bold price">
                            <span class="productSumPrice">0</span>
                            원
                        </div>
                    </div>

                    <!-- 배송비 -->
                    <div class="row my-2 d-flex align-items-center">
                        <div class="col-6 fs-6">배송비</div>
                        <div class="col-6 text-danger fs-5 d-flex justify-content-end fw-bold price">
                            <span class="deliveryPrice">0</span>
                            원
                        </div>
                    </div>


                    <hr>

                    <!-- 최종 결제 문구-->
                    <div class="fs-5 fw-bold mb-2">최종 결제 가격</div>

                    <!-- 최종 결제 가격 -->
                    <div class="text-danger mb-3 d-flex justify-content-end align-items-center fw-bold">
                        <span class="fs-1 totalPrice">0</span>
                        <span class="fs-4">&nbsp;원</span>
                    </div>

                    <!-- 결제버튼 -->
                    <div class="row mt-2 mb-1">
                        <button type="button" class="btn btn-primary btn-lg fw-bold fs-4" onclick="requestPay()">결제하기</button>
                    </div>

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
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/base.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/purchasePage.js"></script>
</body>
</html>