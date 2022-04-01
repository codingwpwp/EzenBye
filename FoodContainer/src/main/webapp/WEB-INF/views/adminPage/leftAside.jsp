<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 관리자페이지 왼쪽 사이드메뉴 -->
<aside class="border border-dark rounded-2 fw-bold" id="leftAside">

    <div class="h2 ms-3 mt-2 fw-bold">
        관리자<br>페이지
    </div>

    <span class="h5 ps-2 fw-bold">회원 관리</span>
    <div class="list-group px-1 my-2">
        <a href="member_list.do" class="list-group-item list-group-item-action fs-6">회원 리스트</a>
        <a href="black_list.do" class="list-group-item list-group-item-action fs-6">블랙 리스트</a>
        <a href="dely_list.do" class="list-group-item list-group-item-action fs-6">탈퇴 리스트</a>
        <a href="report.do" class="list-group-item list-group-item-action fs-6">신고 리스트</a>
        <a href="#" class="list-group-item list-group-item-action fs-6">고객 센터</a>
    </div>
    
    <span class="h5 ps-2 fw-bold ">비회원 관리</span>
    <div class="list-group px-1 my-2">
        <a href="notMember_order_list.do" class="list-group-item list-group-item-action fs-6">비회원 주문</a>
    </div>

    <span class="h5 ps-2 fw-bold">상품 관리</span>
    <div class="list-group px-1 my-2">
        <a href="product_main.do" class="list-group-item list-group-item-action fs-6">등록 상품</a>
        <a href="#" class="list-group-item list-group-item-action fs-6">매진 상품</a>
        <a href="product_delete_list.do" class="list-group-item list-group-item-action fs-6">삭제된 상품</a>
        <a href="member_order_list.do" class="list-group-item list-group-item-action fs-6">회원 주문</a>
        <a href="cancel_list.do" class="list-group-item list-group-item-action fs-6">취소 관리</a>
    </div>

    <span class="h5 ps-2 fw-bold">이벤트 관리</span>
    <div class="list-group px-1 my-2">
        <a href="banner.do" class="list-group-item list-group-item-action fs-6">배너 등록</a>
        <a href="event.do" class="list-group-item list-group-item-action fs-6">이벤트 설정</a>
        <a href="bestRecipe.do" class="list-group-item list-group-item-action fs-6">베스트 레시피</a>
    </div>

    <span class="h5 fw-bold">결산 관리</span>
    <div class="list-group px-1 my-2">
        <a href="settlement.do" class="list-group-item list-group-item-action fs-6">결산 내역</a>
    </div>

</aside>