<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 메뉴 호출하는 버튼 -->
<button type="button" class="btn btn-outline-dark w-100 p-0" data-bs-toggle="offcanvas" data-bs-target="#navAdminMenu" aria-controls="navAdminMenu" id="navLeftMenuButon" onclick="navLeftMenuButonFn()" style="font-size: 29px;">
    <i class="fa-solid fa-user-gear" id="navLeftMenuIcon"></i>
</button>

<!-- 관리자 메뉴 -->
<div class="offcanvas offcanvas-start"  tabindex="-1" id="navAdminMenu" aria-labelledby="onavAdminMenuLabel">
    
    <div class="offcanvas-header">
        <span class="h1 offcanvas-title fw-bold" id="onavAdminMenuLabel">관리자<br>페이지</span>
        <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
    </div>

    <div class="offcanvas-body">

        <span class="fw-bold">회원 관리</span>
        <div class="list-group my-2">
            <a href="#" class="list-group-item list-group-item-action fs-6">회원 리스트</a>
            <a href="#" class="list-group-item list-group-item-action fs-6">블랙 리스트</a>
            <a href="#" class="list-group-item list-group-item-action fs-6">탈퇴 리스트</a>
            <a href="#" class="list-group-item list-group-item-action fs-6">신고 리스트</a>
            <a href="#" class="list-group-item list-group-item-action fs-6">고객 센터</a>
        </div>
        
        <span class="h5 fw-bold">비회원 관리</span>
        <div class="list-group my-2">
            <a href="#" class="list-group-item list-group-item-action fs-6">비회원 주문</a>
        </div>
    
        <span class="h5 fw-bold">상품 관리</span>
        <div class="list-group my-2">
            <a href="#" class="list-group-item list-group-item-action fs-6">등록 상품</a>
            <a href="#" class="list-group-item list-group-item-action fs-6">매진 상품</a>
            <a href="#" class="list-group-item list-group-item-action fs-6">삭제된 상품</a>
            <a href="#" class="list-group-item list-group-item-action fs-6">회원 주문</a>
            <a href="#" class="list-group-item list-group-item-action fs-6">취소 관리</a>
        </div>
    
        <span class="h5 fw-bold">이벤트 관리</span>
        <div class="list-group my-2">
            <a href="#" class="list-group-item list-group-item-action fs-6">배너 등록</a>
            <a href="#" class="list-group-item list-group-item-action fs-6">이벤트 설정</a>
            <a href="#" class="list-group-item list-group-item-action fs-6">베스트 레시피</a>
        </div>
    
        <span class="h5 fw-bold">결산 관리</span>
        <div class="list-group">
            <a href="#" class="list-group-item list-group-item-action fs-6">결산 내역</a>
        </div>

    </div>
    
</div>