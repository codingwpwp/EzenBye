<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<a class="btn btn-link d-flex justify-content-center" data-bs-toggle="offcanvas" href="#offcanvasExample" role="button" aria-controls="offcanvasExample">
  <i class="bi bi-three-dots-vertical mypage-nav-icon"></i>
</a>
<div class="offcanvas offcanvas-start nav-mobile" tabindex="-1" id="offcanvasExample" aria-labelledby="offcanvasExampleLabel">
  <div class="offcanvas-header">
    <h5 class="offcanvas-title offcanvas-title2" id="offcanvasExampleLabel">마이페이지</h5>
    <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
  </div>
  <div class="offcanvas-body">
    <div>
      <nav class="nav flex-column left-nav nav-light bg-light" id="leftAside1">
        <div id="asdieMenu1">
			<p class="fs-5 nav-title">쇼핑정보</p>
	  		<a class="nav-link active nav1 left-nav-text" aria-current="page" href="mypage_lookup.do">주문배송조회</a>
	  		<a class="nav-link nav3 left-nav-text" href="mypage_interItem.do">관심상품</a>
	  		<p class="fs-5 nav-title">혜택정보</p>
	  		<a class="nav-link active nav4 left-nav-text" aria-current="page" href="mypage_coupon.do">할인쿠폰</a>
	  		<p class="fs-5 nav-title">활동정보</p>
	  		<a class="nav-link active nav5 left-nav-text" aria-current="page" href="mypage_review.do">나의 리뷰</a>
	  		<a class="nav-link nav6 left-nav-text" href="mypage_recipe.do">나의 레시피</a>
	  		<a class="nav-link nav7 left-nav-text" href="mypage_inquiries.do">문의내역</a>
	  		<p class="fs-5 nav-title">개인정보</p>
	  		<a class="nav-link active nav8 left-nav-text" aria-current="page" href="mypage_changeInfor.do">개인정보 변경</a>
	  		<a class="nav-link nav9 left-nav-text" href="mypage_addressManage.do">배송지 관리</a>
	  		<a class="nav-link nav10 left-nav-text" href="mypage_noteManage.do?nowPage=1">쪽지 관리</a>
	  		<a class="nav-link nav11 left-nav-text" href="mypage_memberSecession.do">회원탈퇴</a>
  		</div>
	</nav>
    </div>
  </div>
</div>