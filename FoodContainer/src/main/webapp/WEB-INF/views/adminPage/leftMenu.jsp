<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 관리자페이지 왼쪽 사이드메뉴 -->
<aside class="border border-dark rounded-2 fw-bold" id="leftAside">

    <div class="h2 ms-3 mt-2 fw-bold">
        <a class="link-secondary" href="admin.do" style="text-decoration: none">관리자<br>페이지</a>
    </div>

    <span class="h5 ps-2 fw-bold">회원 관리</span>
    <div class="list-group px-1 my-2">
        <a href="member_list.do?nowPage=1" class="list-group-item list-group-item-action fs-6">회원 리스트</a>
        <a href="dely_list.do?nowPage=1" class="list-group-item list-group-item-action fs-6">탈퇴 리스트</a>
        <a href="#" class="list-group-item list-group-item-action fs-6">고객 센터</a>
    </div>
    
    <span class="h5 ps-2 fw-bold ">주문 관리</span>
    <div class="list-group px-1 my-2">
        <a href="member_order_list.do?nowPage=1" class="list-group-item list-group-item-action fs-6">회원 주문</a>
        <a href="noMember_order_list.do?nowPage=1" class="list-group-item list-group-item-action fs-6">비회원 주문</a>
    </div>

    <span class="h5 ps-2 fw-bold">상품 관리</span>
    <div class="list-group px-1 my-2">
        <a href="product_main.do?nowPage=1" class="list-group-item list-group-item-action fs-6">등록 상품</a>
        <a href="product_delete_list.do?nowPage=1" class="list-group-item list-group-item-action fs-6">삭제된 상품</a>
    </div>

    <span class="h5 ps-2 fw-bold">기타 관리</span>
    <div class="list-group px-1 my-2">
        <a href="banner.do" class="list-group-item list-group-item-action fs-6">배너</a>
        <a href="bestRecipe.do" class="list-group-item list-group-item-action fs-6">베스트 레시피</a>
    </div>

</aside>