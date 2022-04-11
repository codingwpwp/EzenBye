<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<body>
	<!-- 헤더 -->
	<header class="border-bottom border-dark">
		<%@include file="/WEB-INF/views/base/header.jsp"%>
	</header>

    <!-- 네비게이션 바 -->
    <nav class="navbar-expand-lg navbar-light bg-warning bg-gradient bg-opacity-25 fw-bold fs-5">
        <div class="row">
            <div class="col-lg-2 d-none d-lg-block"></div>

            <div class="col-2 col-sm-1 pe-0 d-lg-none" id="navLeftMenu">
				<%@include file="/WEB-INF/views/adminPage/nav_leftMenu.jsp"%>
            </div>

			<%@include file="/WEB-INF/views/base/nav.jsp"%>

        </div>
    </nav>

    <!-- 섹션 -->
    <section class="mt-1">
        <div class="row">

            <!-- 왼쪽 사이드메뉴 -->
            <div class="col-lg-2 d-none d-lg-block">
               <%@include file="/WEB-INF/views/adminPage/leftMenu.jsp"%>
            </div>

            <!-- 메인 -->
            <div class="col-12 col-sm-9 col-md-10 col-lg-8">
                <article id="mainSection">
    
                    <!-- 헤딩 -->
                    <div class="fs-5 my-2 fw-bold">
                        배너 관리
                    </div>

                        <!-- 체크박스&상품등록 버튼 -->
                        <div class="form-check mt-2 mb-3">
                        <c:if test="${not empty bannerList}">
                            <input class="form-check-input border border-dark" type="checkbox" value="" id="bannerCheckbox" onchange="checkAllCheckbox(this, 'bannerTable')">
                            <label class="form-check-label me-3 text-dark fw-bold" for="bannerCheckbox">
                                전체
                            </label>
                            <button type="button" class="btn btn-dark btn-sm p-1" onclick="checkedDelete('bannerTable', 'banner')">선택 삭제</button>
                        </c:if>    
                            <button type="button" class="btn btn-primary fw-bold float-end" data-bs-toggle="modal" data-bs-target="#registerBannerModal">배너 등록</button>
                        </div>

                    <!-- 테이블 -->
                    <div class="table-responsive">
					<form name="checkedBannerIndexForm">
                        <table class="table table-hover centerTable verticalAlignTable" id="bannerTable" style="white-space: nowrap;">

                            <colgroup></colgroup>

                            <thead>
                                <tr>
                                    <th></th>
                                    <th>번호</th>
                                    <td colspan="2" width="50%">배너이름</td>
                                    <th>등록일</th>
                                    <th>관리</th>
                                </tr>
                            </thead>

                            <tbody>
                            <c:if test="${not empty bannerList}">
								<c:forEach items = "${bannerList}" var = "bList">
								<tr class="bannerTr">
									<!-- 체크박스 -->
                                    <td><input class="form-check-input border border-dark" type="checkbox" name="banner_index" id="${bList.banner_index}" value="${bList.banner_index}" onclick="changeCheckbox('bannerCheckbox', 'bannerTable')"></td>
									
									<!-- 배너 번호 -->
                                    <td>
                                    	<label for="${bList.banner_index}">${bList.banner_index}</label>
                                    </td>
                                    
                                    <!-- 배너 이미지 -->
                                    <td class="text-center"  width="25%">
                                        <img src="<%=request.getContextPath()%>/resources/img/배너/${bList.image}" class="img-fluid rounded d-none d-md-inline">
                                        <button type="button" class="btn btn-outline-info py-0 px-1 d-md-none" data-bs-toggle="modal" data-bs-target="#nowBannerModal" onclick="nowBanner(this)">배너보기</button>
                                    </td>

									<!-- 배너 이름 -->
                                    <td style="text-align: start;">${bList.name}</td>

									<!-- 배너 등록 날짜 -->
                                    <td>${fn:substring(bList.register_date, 0,10)}</td>
                                    
                                    <!-- 해당 배너의 수정&삭제버튼 -->
                                    <td>
                                        <button type="button" class="btn btn-outline-primary btn-sm py-0" data-bs-toggle="modal" data-bs-target="#modifyBannerModal" onclick="modifyStartBanner(this)">수정</button>
                                        <button type="button" class="btn btn-outline-dark btn-sm py-0" onclick="deleteThisCheckbox('bannerTable', 'banner', this)">삭제</button>
                                        <input type="hidden" id="link_YN" value="${bList.link_YN}">
                                        <input type="hidden" id="link" value="${bList.link}">
                                    </td>
                                </tr>
								</c:forEach>
							</c:if>
							<c:if test="${empty bannerList}">
								<td colspan="6" class="display-1 fw-bold p-3">
									등록된 배너가 없습니다.
								</td>
							</c:if>
                            </tbody>
                        </table>
                    </form>
                    </div>

                    <!-- 현재배너 모달 -->
                    <div class="modal fade" id="nowBannerModal" data-bs-keyboard="false" tabindex="-1" aria-labelledby="nowBannerModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">

                                <div class="modal-header">
                                    <span class="modal-title fs-4 fw-bold" id="nowBannerModalLabel"><i class="bi bi-badge-ad fs-1 fw-bold"></i> 배너이름 예시</span>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>

                                <div class="modal-body">
                                    <img src="" class="img-fluid rounded" id="nowBannerImg">
                                </div>
                                
                                <div class="modal-footer d-flex justify-content-start">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                                </div>

                            </div>
                        </div>
                    </div>

                    <!-- 배너등록 모달 -->
                    <div class="modal fade" id="registerBannerModal" data-bs-keyboard="false" tabindex="-1" aria-labelledby="registerBannerModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">

                                <div class="modal-header">
                                    <span class="modal-title fs-4 fw-bold" id="registerBannerModalLabel"><i class="bi bi-badge-ad fs-1 fw-bold"></i> 배너 등록</span>
                                    <span class="text-danger">*필수</span>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>

                                <div class="modal-body">
                                    <form name="bannerRegisterForm" method="post" action="bannerRegister.do" enctype="multipart/form-data">

                                        <!-- 배너이름 -->
                                        <div class="row mb-3 d-flex align-items-center">

                                            <div class="col-4 col-sm-3 d-flex justify-content-center justify-content-sm-end">
                                                <span class="infoTitle p-1"><span class="text-danger">*</span>배너이름</span>
                                            </div>

                                            <div class="col-8 col-sm-9">
                                                <input type="text" class="form-control" name="name" value="" placeholder="툴팁용(20자 이내)" autocomplete="off">
                                            </div>

                                        </div>

                                        <!-- 사진첨부 -->
                                        <div class="row mb-3 d-flex align-items-center">
                                            <div class="col-4 col-sm-3 d-flex justify-content-center justify-content-sm-end">
                                                <span class="infoTitle p-1"><span class="text-danger">*</span>사진첨부</span>
                                            </div>

                                            <div class="col-8 col-sm-9">
                                                <input class="form-control" type="file" name="bannerFile" accept="image/png, image/PNG" onchange="bannerPreviewImage(event, this, 'bannerRegisterForm');">
                                            </div>

                                        </div>

                                        <!-- 사진미리보기 -->
                                        <div class="imageContainer border border-dark mb-3" style="min-height: 100px;">
                                            <span class="fs-5">이미지가 없습니다.</span>
                                        </div>

                                        <!-- 링크 유무 -->
                                        <div class="row mb-3 d-flex align-items-center">

                                            <div class="col-4 col-sm-3 d-flex justify-content-center justify-content-sm-end">
                                                <span class="infoTitle p-1"><span class="text-danger">*</span>링크유무</span>
                                            </div>

                                            <div class="col-8 col-sm-9 row">

                                                <div class="col-6 d-flex justify-content-center">

                                                    <input class="form-check-input" type="radio" name="link_YN" value="Y" id="registerLinkYes" onchange="linkYNCheck('bannerRegisterForm')" checked>
                                                    <label class="form-check-label fw-bold" for="registerLinkYes">
                                                        &nbsp;있음
                                                    </label>

                                                </div>

                                                <div class="col-6 d-flex justify-content-center">

                                                    <input class="form-check-input" type="radio" name="link_YN" value="N" id="registerLinkNo" onchange="linkYNCheck('bannerRegisterForm')">
                                                    <label class="form-check-label fw-bold" for="registerLinkNo">
                                                        &nbsp;없음
                                                    </label>

                                                </div>

                                            </div>

                                        </div>

                                        <!-- 링크주소 -->
                                        <div class="row mb-3 d-flex align-items-center">
                                            <div class="col-4 col-sm-3 d-flex justify-content-center justify-content-sm-end">

                                                <span class="infoTitle p-1">링크주소</span>
                                            </div>

                                            <div class="col-8 col-sm-9">
                                                <input type="text" class="form-control" name="link" value="http://" placeholder="주소를 입력하세요" autocomplete="off">
                                            </div>

                                        </div>

                                    </form>
                                </div>
                                
                                <div class="modal-footer d-flex justify-content-start">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                                    <button type="button" class="btn btn-primary" onclick="bannerSumbit(this, 'bannerRegisterForm');">등록</button>
                                </div>

                            </div>
                        </div>
                    </div>

                    <!-- 배너수정 모달 -->
                    <div class="modal fade" id="modifyBannerModal" data-bs-keyboard="false" tabindex="-1" aria-labelledby="modifyBannerModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">

                                <div class="modal-header">
                                    <span class="modal-title fs-4 fw-bold" id="modifyBannerModalLabel"><i class="bi bi-badge-ad fs-1 fw-bold"></i> 배너 수정</span>
                                    <span class="text-danger">*필수</span>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>

                                <div class="modal-body">
                                    <form name="bannerModifyrForm" method="post" action="" enctype="multipart/form-data">

                                        <!-- 배너이름 -->
                                        <div class="row mb-3 d-flex align-items-center">

                                            <div class="col-4 col-sm-3 d-flex justify-content-center justify-content-sm-end">
                                                <span class="infoTitle p-1"><span class="text-danger">*</span>배너이름</span>
                                            </div>

                                            <div class="col-8 col-sm-9">
                                                <input type="text" class="form-control" name="bannerName" value="" placeholder="툴팁용(20자 이내)">
                                            </div>

                                        </div>

                                        <!-- 사진첨부 -->

                                        <div class="row mb-3 d-flex align-items-center">
                                            <div class="col-4 col-sm-3 d-flex justify-content-center justify-content-sm-end">
                                                <span class="infoTitle p-1"><span class="text-danger">*</span>사진첨부</span>
                                            </div>

                                            <div class="col-8 col-sm-9">
                                                <input class="form-control" type="file" name="bannerFile" accept="image/png" onchange="bannerPreviewImage(event, this, 'bannerModifyrForm');">
                                            </div>

                                        </div>

                                        <!-- 사진미리보기 -->
                                        <div class="imageContainer border border-dark mb-3 position-relative" style="min-height: 100px;">
                                            <span class="position-absolute fw-bold">현재 배너</span>
                                            <img src="<%=request.getContextPath()%>/resources/img/배너1.png" class="w-100">
                                        </div>

                                        <!-- 링크 유무 -->
                                        <div class="row mb-3 d-flex align-items-center">

                                            <div class="col-4 col-sm-3 d-flex justify-content-center justify-content-sm-end">
                                                <span class="infoTitle p-1"><span class="text-danger">*</span>링크유무</span>
                                            </div>

                                            <div class="col-8 col-sm-9 row">
                                                
                                                <div class="col-12 d-flex justify-content-center linkMessage text-danger fw-bold" style="white-space: nowrap;"></div>

                                                <div class="col-6 d-flex justify-content-center">

                                                    <input class="form-check-input" type="radio" name="linkYN" id="modifyLinkYes">
                                                    <label class="form-check-label fw-bold" for="modifyLinkYes">
                                                        &nbsp;있음
                                                    </label>

                                                </div>

                                                <div class="col-6 d-flex justify-content-center">

                                                    <input class="form-check-input" type="radio" name="linkYN" id="modifyLinkNo">
                                                    <label class="form-check-label fw-bold" for="modifyLinkNo">
                                                        &nbsp;없음
                                                    </label>

                                                </div>

                                            </div>

                                        </div>

                                        <!-- 링크주소 -->
                                        <div class="row mb-3 d-flex align-items-center">
                                            <div class="col-4 col-sm-3 d-flex justify-content-center justify-content-sm-end">

                                                <span class="infoTitle p-1">링크주소</span>
                                            </div>

                                            <div class="col-8 col-sm-9">
                                                <input type="text" class="form-control" name="bannerURL" value="http://" placeholder="주소를 입력하세요" onkeyup="linkYNCheck(this, 'bannerModifyrForm')" autocomplete="off">
                                            </div>

                                        </div>

                                    </form>
                                </div>
                                
                                <div class="modal-footer d-flex justify-content-start">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                                    <button type="button" class="btn btn-primary">저장</button>
                                </div>

                            </div>
                        </div>
                    </div>

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