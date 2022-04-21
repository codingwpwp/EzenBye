<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="mlAside">

	<!-- 모바일 -->
	<div class="offcanvas offcanvas-start canvasM" tabindex="-1" id="offcanvasExample" aria-labelledby="offcanvasExampleLabel">
		<div class="offcanvas-header">
			<h5 class="offcanvas-title" id="offcanvasExampleLabel">메뉴</h5>
		    <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
		</div>
		<div class="offcanvas-body">
			<ul class="list-unstyled ps-0">
				<!-- 전체상품 -->
				<button class="btn btn-toggle align-items-center rounded collapsed" name="lAsideProductAllM" onclick="allProductM(this); productFilter(); productFilterCheck();">
					<i class="bi bi-check-circle-fill"></i> 전체상품
				</button>
				<!-- 냉동식품 체크박스 목록 -->
				<li class="mb-1">
					<button class="btn btn-toggle align-items-center rounded collapsed ice" data-bs-toggle="collapse" data-bs-target="#product-collapse" aria-expanded="false" onclick="extendIce(this)">
						<i class="bi bi-plus-circle-dotted"></i> 냉동식품
					</button>
					<div class="collapse" id="product-collapse">
						<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
							<li><a href="#" class="link-dark rounded"><label><input type="checkbox" name="asideIceAllM" onclick="asideIceAllM(this); productFilter(); productFilterCheck();"> 전체</label></a></li>
						    <li><a href="#" class="link-dark rounded"><label><input type="checkbox" name="asideIceM" value="0" onclick="asideIceM(this); productFilter(); productFilterCheck();"> 볶음밥</label></a></li>
						    <li><a href="#" class="link-dark rounded"><label><input type="checkbox" name="asideIceM" value="1" onclick="asideIceM(this); productFilter(); productFilterCheck();"> 치킨,만두</label></a></li>
						</ul>
					</div>
				</li>
				<!-- 즉석식품 체크박스 목록 -->
				<li class="mb-1">
					<button class="btn btn-toggle align-items-center rounded collapsed product" data-bs-toggle="collapse" data-bs-target="#home-collapse" aria-expanded="false" onclick="extendProduct(this)">
						<i class="bi bi-plus-circle-dotted"></i> 즉석식품
					</button>
					<div class="collapse" id="home-collapse">
						<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
							<li><a href="#" class="link-dark rounded"><label><input type="checkbox" name="asideProductAllM" onclick="asideProductAllM(this); productFilter(); productFilterCheck();"> 전체</label></a></li>
						    <li><a href="#" class="link-dark rounded"><label><input type="checkbox" name="asideProductM" value="0" onclick="asideProductM(this); productFilter(); productFilterCheck();"> 국</label></a></li>
						    <li><a href="#" class="link-dark rounded"><label><input type="checkbox" name="asideProductM" value="1" onclick="asideProductM(this); productFilter(); productFilterCheck();"> 반찬</label></a></li>
						    <li><a href="#" class="link-dark rounded"><label><input type="checkbox" name="asideProductM" value="2" onclick="asideProductM(this); productFilter(); productFilterCheck();"> 컵밥,햇반</label></a></li>
						</ul>
					</div>
				</li>
				<!-- 브랜드 체크박스 목록 -->
				<li class="mb-1">
					<button class="btn btn-toggle align-items-center rounded collapsed brand" data-bs-toggle="collapse" data-bs-target="#dashboard-collapse" aria-expanded="false" onclick="extendBrand(this)">
						<i class="bi bi-plus-circle-dotted"></i> 브랜드
					</button>
					<div class="collapse" id="dashboard-collapse" style="">
						<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
							<li><a href="#" class="link-dark rounded"><label><input type="checkbox" name="asideBrandAllM" onclick="asideBrandAllM(this); productFilter(); productFilterCheck();"> 전체</label></a></li>
						    <li><a href="#" class="link-dark rounded"><label><input type="checkbox" name="asideBrandM" value="0" onclick="asideBrandM(this); productFilter(); productFilterCheck();"> CJ</label></a></li>
						    <li><a href="#" class="link-dark rounded"><label><input type="checkbox" name="asideBrandM" value="1" onclick="asideBrandM(this); productFilter(); productFilterCheck();"> 오뚜기</label></a></li>
						    <li><a href="#" class="link-dark rounded"><label><input type="checkbox" name="asideBrandM" value="2" onclick="asideBrandM(this); productFilter(); productFilterCheck();"> 청정원</label></a></li>
						    <li><a href="#" class="link-dark rounded"><label><input type="checkbox" name="asideBrandM" value="3" onclick="asideBrandM(this); productFilter(); productFilterCheck();"> 하림</label></a></li>
						    <li><a href="#" class="link-dark rounded"><label><input type="checkbox" name="asideBrandM" value="4" onclick="asideBrandM(this); productFilter(); productFilterCheck();"> 기타</label></a></li>
						</ul>
					</div>
				</li>
				<!-- 가격 체크박스 목록 -->
				<li class="mb-1">
					<button class="btn btn-toggle align-items-center rounded collapsed price" data-bs-toggle="collapse" data-bs-target="#orders-collapse" aria-expanded="false" onclick="extendPrice(this)">
						<i class="bi bi-plus-circle-dotted"></i> 가격
					</button>
					<div class="collapse" id="orders-collapse">
						<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
						    <li><a href="#" class="link-dark rounded"><label><input type="checkbox" name="asidePriceM" value="0" onclick="asidePriceM(this); productFilter(); productFilterCheck();"> 낮은 가격 순</label></a></li>
						    <li><a href="#" class="link-dark rounded"><label><input type="checkbox" name="asidePriceM" value="1" onclick="asidePriceM(this); productFilter(); productFilterCheck();"> 높은 가격 순</label></a></li>
						</ul>
					</div>
				</li>
				<!-- 무료배송 체크박스 -->
				<button class="btn btn-toggle align-items-center rounded collapsed free" onclick="free(this); productFilter(); productFilterCheck();">
					<i class="bi bi-check-square"></i> 무료배송
				</button>
			</ul>
		</div>
	</div>
</div>

