<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="lAside">
     <!-- pc -->
	<div class="flex-shrink-0 p-3 lAsideDiv" style="width: 150px;">
		<ul class="list-unstyled ps-0">
			<!-- 전체상품 -->
			<button class="btn btn-toggle align-items-center rounded collapsed" name="lAsideProductAll" onclick="allProduct(this)">
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
					    <li><a href="#" class="link-dark rounded"><label><input type="checkbox" name="asideIce" onclick="asideIce(this)"> 치킨,만두</label></a></li>
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
					    <li><a href="#" class="link-dark rounded"><label><input type="checkbox" name="asideProduct" onclick="asideProduct(this)"> 국</label></a></li>
					    <li><a href="#" class="link-dark rounded"><label><input type="checkbox" name="asideProduct" onclick="asideProduct(this)"> 반찬</label></a></li>
					    <li><a href="#" class="link-dark rounded"><label><input type="checkbox" name="asideProduct" onclick="asideProduct(this)"> 컵밥,햇반</label></a></li>
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
					    <li><a href="#" class="link-dark rounded"><label><input type="checkbox" name="asideBrand" onclick="asideBrand(this)"> CJ</label></a></li>
					    <li><a href="#" class="link-dark rounded"><label><input type="checkbox" name="asideBrand" onclick="asideBrand(this)"> 오뚜기</label></a></li>
					    <li><a href="#" class="link-dark rounded"><label><input type="checkbox" name="asideBrand" onclick="asideBrand(this)"> 청정원</label></a></li>
					    <li><a href="#" class="link-dark rounded"><label><input type="checkbox" name="asideBrand" onclick="asideBrand(this)"> 하림</label></a></li>
					    <li><a href="#" class="link-dark rounded"><label><input type="checkbox" name="asideBrand" onclick="asideBrand(this)"> 기타</label></a></li>
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


