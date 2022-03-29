<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="lAside">
     <!-- pc -->
	<div class="flex-shrink-0 p-3 lAsideDiv" style="width: 150px;">
		<ul class="list-unstyled ps-0">
			<!-- 전체상품 -->
			<button class="btn btn-toggle align-items-center rounded collapsed" onclick="allProduct(this)">
				<i class="bi bi-check-circle-fill"></i> 전체상품
			</button>
			<!-- 냉동식품 체크박스 목록 -->
			<li class="mb-1">
				<button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#product-collapse" aria-expanded="false" onclick="extend(this)">
					<i class="bi bi-plus-circle-dotted"></i> 냉동식품
				</button>
				<div class="collapse" id="product-collapse">
					<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
						<li><a href="#" class="link-dark rounded"><label><input type="checkbox" name="asideIceAll" onclick="asideIceAll(this)"> 전체</label></a></li>
					    <li><a href="#" class="link-dark rounded"><label><input type="checkbox" name="asideIce" onclick="asideIce(this)"> 볶음밥</label></a></li>
					    <li><a href="#" class="link-dark rounded"><label><input type="checkbox" name="asideIce" onclick="asideIce(this)"> 치킨 / 만두</label></a></li>
					</ul>
				</div>
			</li>
			<!-- 즉석식품 체크박스 목록 -->
			<li class="mb-1">
				<button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#home-collapse" aria-expanded="false" onclick="extend(this)">
					<i class="bi bi-plus-circle-dotted"></i> 즉석식품
				</button>
				<div class="collapse" id="home-collapse">
					<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
						<li><a href="#" class="link-dark rounded"><label><input type="checkbox" name="asideProductAll" onclick="asideProductAll(this)"> 전체</label></a></li>
					    <li><a href="#" class="link-dark rounded"><label><input type="checkbox" name="asideProduct" onclick="asideProduct(this)"> 국 / 찌개</label></a></li>
					    <li><a href="#" class="link-dark rounded"><label><input type="checkbox" name="asideProduct" onclick="asideProduct(this)"> 반찬</label></a></li>
					    <li><a href="#" class="link-dark rounded"><label><input type="checkbox" name="asideProduct" onclick="asideProduct(this)"> 컵밥</label></a></li>
					</ul>
				</div>
			</li>
			<!-- 브랜드 체크박스 목록 -->
			<li class="mb-1">
				<button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#dashboard-collapse" aria-expanded="false" onclick="extend(this)">
					<i class="bi bi-plus-circle-dotted"></i> 브랜드
				</button>
				<div class="collapse" id="dashboard-collapse" style="">
					<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
						<li><a href="#" class="link-dark rounded"><label><input type="checkbox" name="asideBrandAll" onclick="asideBrandAll(this)"> 전체</label></a></li>
					    <li><a href="#" class="link-dark rounded"><label><input type="checkbox" name="asideBrand" onclick="asideBrand(this)"> 브랜드 1</label></a></li>
					    <li><a href="#" class="link-dark rounded"><label><input type="checkbox" name="asideBrand" onclick="asideBrand(this)"> 브랜드 2</label></a></li>
					    <li><a href="#" class="link-dark rounded"><label><input type="checkbox" name="asideBrand" onclick="asideBrand(this)"> 브랜드 3</label></a></li>
					</ul>
				</div>
			</li>
			<!-- 가격 체크박스 목록 -->
			<li class="mb-1">
				<button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#orders-collapse" aria-expanded="false" onclick="extend(this)">
					<i class="bi bi-plus-circle-dotted"></i> 가격
				</button>
				<div class="collapse" id="orders-collapse">
					<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
						<li><a href="#" class="link-dark rounded"><label><input type="checkbox" name="asidePriceAll" onclick="asidePriceAll(this)"> 전체</label></a></li>
					    <li><a href="#" class="link-dark rounded"><label><input type="checkbox" name="asidePrice" onclick="asidePrice(this)"> 낮은 가격 순</label></a></li>
					    <li><a href="#" class="link-dark rounded"><label><input type="checkbox" name="asidePrice" onclick="asidePrice(this)"> 높은 가격 순</label></a></li>
					</ul>
				</div>
			</li>
			<!-- 무료배송 체크박스 -->
			<button class="btn btn-toggle align-items-center rounded collapsed" onclick="free(this)">
				<i class="bi bi-check-square"></i> 무료배송
			</button>
			
		</ul>
	</div>
</div>

<div class="mlAside">

	<!-- 모바일 -->
	<div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasExample" aria-labelledby="offcanvasExampleLabel">
		<div class="offcanvas-header">
			<h5 class="offcanvas-title" id="offcanvasExampleLabel">메뉴</h5>
		    <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
		</div>
		<div class="offcanvas-body">
			<ul class="list-unstyled ps-0">
				<!-- 전체상품 -->
				<button class="btn btn-toggle align-items-center rounded collapsed" onclick="allProductM(this)">
					<i class="bi bi-check-circle-fill"></i> 전체상품
				</button>
				<!-- 냉동식품 체크박스 목록 -->
				<li class="mb-1">
					<button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#product-collapse" aria-expanded="false" onclick="extend(this)">
						<i class="bi bi-plus-circle-dotted"></i> 냉동식품
					</button>
					<div class="collapse" id="product-collapse">
						<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
							<li><a href="#" class="link-dark rounded"><label><input type="checkbox" name="asideIceAllM" onclick="asideIceAllM(this)"> 전체</label></a></li>
						    <li><a href="#" class="link-dark rounded"><label><input type="checkbox" name="asideIceM" onclick="asideIceM(this)"> 볶음밥</label></a></li>
						    <li><a href="#" class="link-dark rounded"><label><input type="checkbox" name="asideIceM" onclick="asideIceM(this)"> 치킨 / 만두</label></a></li>
						</ul>
					</div>
				</li>
				<!-- 즉석식품 체크박스 목록 -->
				<li class="mb-1">
					<button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#home-collapse" aria-expanded="false" onclick="extend(this)">
						<i class="bi bi-plus-circle-dotted"></i> 즉석식품
					</button>
					<div class="collapse" id="home-collapse">
						<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
							<li><a href="#" class="link-dark rounded"><label><input type="checkbox" name="asideProductAllM" onclick="asideProductAllM(this)"> 전체</label></a></li>
						    <li><a href="#" class="link-dark rounded"><label><input type="checkbox" name="asideProductM" onclick="asideProductM(this)"> 국 / 찌개</label></a></li>
						    <li><a href="#" class="link-dark rounded"><label><input type="checkbox" name="asideProductM" onclick="asideProductM(this)"> 반찬</label></a></li>
						    <li><a href="#" class="link-dark rounded"><label><input type="checkbox" name="asideProductM" onclick="asideProductM(this)"> 컵밥</label></a></li>
						</ul>
					</div>
				</li>
				<!-- 브랜드 체크박스 목록 -->
				<li class="mb-1">
					<button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#dashboard-collapse" aria-expanded="false" onclick="extend(this)">
						<i class="bi bi-plus-circle-dotted"></i> 브랜드
					</button>
					<div class="collapse" id="dashboard-collapse" style="">
						<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
							<li><a href="#" class="link-dark rounded"><label><input type="checkbox" name="asideBrandAllM" onclick="asideBrandAllM(this)"> 전체</label></a></li>
						    <li><a href="#" class="link-dark rounded"><label><input type="checkbox" name="asideBrandM" onclick="asideBrandM(this)"> 브랜드 1</label></a></li>
						    <li><a href="#" class="link-dark rounded"><label><input type="checkbox" name="asideBrandM" onclick="asideBrandM(this)"> 브랜드 2</label></a></li>
						    <li><a href="#" class="link-dark rounded"><label><input type="checkbox" name="asideBrandM" onclick="asideBrandM(this)"> 브랜드 3</label></a></li>
						</ul>
					</div>
				</li>
				<!-- 가격 체크박스 목록 -->
				<li class="mb-1">
					<button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#orders-collapse" aria-expanded="false" onclick="extend(this)">
						<i class="bi bi-plus-circle-dotted"></i> 가격
					</button>
					<div class="collapse" id="orders-collapse">
						<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
							<li><a href="#" class="link-dark rounded"><label><input type="checkbox" name="asidePriceAllM" onclick="asidePriceAllM(this)"> 전체</label></a></li>
						    <li><a href="#" class="link-dark rounded"><label><input type="checkbox" name="asidePriceM" onclick="asidePriceM(this)"> 낮은 가격 순</label></a></li>
						    <li><a href="#" class="link-dark rounded"><label><input type="checkbox" name="asidePriceM" onclick="asidePriceM(this)"> 높은 가격 순</label></a></li>
						</ul>
					</div>
				</li>
				<!-- 무료배송 체크박스 -->
				<button class="btn btn-toggle align-items-center rounded collapsed" onclick="free(this)">
					<i class="bi bi-check-square"></i> 무료배송
				</button>
			</ul>
		</div>
	</div>
</div>

