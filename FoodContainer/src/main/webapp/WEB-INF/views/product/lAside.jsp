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
				<button class="btn btn-toggle align-items-center rounded collapsed ice" data-bs-toggle="collapse" data-bs-target="#product-collapse" aria-expanded="false" onclick="extendIce(this)">
					<i class="bi bi-plus-circle-dotted"></i> 냉동식품
				</button>
				<div class="collapse" id="product-collapse">
					<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
						<li><a href="#" class="link-dark rounded"><label><input type="checkbox" name="asideIceAll" onclick="asideIceAll(this); productFilter();"> 전체</label></a></li>
					    <li><a href="#" class="link-dark rounded"><label><input type="checkbox" name="asideIce" value="0" onclick="asideIce(this); productFilter();"> <div class="inputText">볶음밥</div></label></a></li>
					    <li><a href="#" class="link-dark rounded"><label><input type="checkbox" name="asideIce" value="1" onclick="asideIce(this); productFilter();"> <div class="inputText">치킨,만두</div></label></a></li>
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
						<li><a href="#" class="link-dark rounded"><label><input type="checkbox" name="asideProductAll" onclick="asideProductAll(this); productFilter();"> 전체</label></a></li>
					    <li><a href="#" class="link-dark rounded"><label><input type="checkbox" name="asideProduct" value="0" onclick="asideProduct(this); productFilter();"> <div class="inputText">국</div></label></a></li>
					    <li><a href="#" class="link-dark rounded"><label><input type="checkbox" name="asideProduct" value="1" onclick="asideProduct(this); productFilter();"> <div class="inputText">반찬</div></label></a></li>
					    <li><a href="#" class="link-dark rounded"><label><input type="checkbox" name="asideProduct" value="2" onclick="asideProduct(this); productFilter();"> <div class="inputText">컵밥,햇반</div></label></a></li>
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
						<li><a href="#" class="link-dark rounded"><label><input type="checkbox" name="asideBrandAll" onclick="asideBrandAll(this); productFilter();"> 전체</label></a></li>
					    <li><a href="#" class="link-dark rounded"><label><input type="checkbox" name="asideBrand" value="0" onclick="asideBrand(this); productFilter();"> <div class="inputText">CJ</div></label></a></li>
					    <li><a href="#" class="link-dark rounded"><label><input type="checkbox" name="asideBrand" value="1" onclick="asideBrand(this); productFilter();"> <div class="inputText">오뚜기</div></label></a></li>
					    <li><a href="#" class="link-dark rounded"><label><input type="checkbox" name="asideBrand" value="2" onclick="asideBrand(this); productFilter();"> <div class="inputText">청정원</div></label></a></li>
					    <li><a href="#" class="link-dark rounded"><label><input type="checkbox" name="asideBrand" value="3" onclick="asideBrand(this); productFilter();"> <div class="inputText">하림</div></label></a></li>
					    <li><a href="#" class="link-dark rounded"><label><input type="checkbox" name="asideBrand" value="4" onclick="asideBrand(this); productFilter();"> <div class="inputText">기타</div></label></a></li>
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
					    <li><a href="#" class="link-dark rounded"><label><input type="checkbox" name="asidePrice" value="0" onclick="asidePrice(this); productFilter();"> 낮은 가격 순</label></a></li>
					    <li><a href="#" class="link-dark rounded"><label><input type="checkbox" name="asidePrice" value="1" onclick="asidePrice(this); productFilter();"> 높은 가격 순</label></a></li>
					</ul>
				</div>
			</li>
			<!-- 무료배송 체크박스 -->
			<button class="btn btn-toggle align-items-center rounded collapsed free" onclick="free(this); productFilter();">
				<i class="bi bi-check-square" id="free"></i> 무료배송
			</button>
			
		</ul>
	</div>
</div>


