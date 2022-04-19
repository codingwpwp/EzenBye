/* lAside =======================================================================*/

	//펼칠 때 아이콘 변경
	function extendIce(obj){
		var expand = $(obj).attr("aria-expanded");
		
		if(expand == "true"){
			$(".ice").find("i").attr("class","bi bi-dash-circle-fill");
		}else{
			$(".ice").find("i").attr("class","bi bi-plus-circle-dotted");
		}
	}
	
	function extendProduct(obj){
		var expand = $(obj).attr("aria-expanded");
		
		if(expand == "true"){
			$(".product").find("i").attr("class","bi bi-dash-circle-fill");
		}else{
			$(".product").find("i").attr("class","bi bi-plus-circle-dotted");
		}
	}
	
	function extendBrand(obj){
		var expand = $(obj).attr("aria-expanded");
		
		if(expand == "true"){
			$(".brand").find("i").attr("class","bi bi-dash-circle-fill");
		}else{
			$(".brand").find("i").attr("class","bi bi-plus-circle-dotted");
		}
	}
	
	function extendPrice(obj){
		var expand = $(obj).attr("aria-expanded");
		
		if(expand == "true"){
			$(".price").find("i").attr("class","bi bi-dash-circle-fill");
		}else{
			$(".price").find("i").attr("class","bi bi-plus-circle-dotted");
		}
	}
	
	window.onload = function(){
	  //pc화면 - 처음 또는 새로고침 시 전체선택
	  	//전체식품
	  	var all = $("button[name='lAsideProductAll']");
		//냉동식품
		var iceAll = $("input[name='asideIceAll']");
		var ice = $("input[name='asideIce']");
		//즉석식품
		var productAll = $("input[name='asideProductAll']");
		var product = $("input[name='asideProduct']");
		//브랜드
		var brandAll = $("input[name='asideBrandAll']");
		var brand = $("input[name='asideBrand']");
		//가격
		var price = $("input[name='asidePrice']");
		
		if(!(iceAll.is(":checked")) && !(productAll.is(":checked")) && !(brandAll.is(":checked")) && !(price.is(":checked"))){
			iceAll.prop("checked",true);
			ice.prop("checked",true);
			productAll.prop("checked",true);
			product.prop("checked",true);
			brandAll.prop("checked",true);
			brand.prop("checked",true);
			price.prop("checked",true);
		}
		
	  //모바일 화면 - 처음 또는 새로고침 시 전체선택
	 	//전체식품
	  	var allM = $("button[name='lAsideProductAllM']");
		//냉동식품
		var iceAllM = $("input[name='asideIceAllM']");
		var iceM = $("input[name='asideIceM']");
		//즉석식품
		var productAllM = $("input[name='asideProductAllM']");
		var productM = $("input[name='asideProductM']");
		//브랜드
		var brandAllM = $("input[name='asideBrandAllM']");
		var brandM = $("input[name='asideBrandM']");
		//가격
		var priceM = $("input[name='asidePriceM']");
		
		if(!(iceAllM.is(":checked")) && !(productAllM.is(":checked")) && !(brandAllM.is(":checked")) && !(priceM.is(":checked"))){
			iceAllM.prop("checked",true);
			iceM.prop("checked",true);
			productAllM.prop("checked",true);
			productM.prop("checked",true);
			brandAllM.prop("checked",true);
			brandM.prop("checked",true);
			priceM.prop("checked",true);
		}
	}
	
	//전체메뉴
	function allProduct(obj){
		var check = $(obj).find("i").attr("class").indexOf("fill");
		//냉동식품
		var ice = $("input[name='asideIceAll']");
		//즉석식품
		var product = $("input[name='asideProductAll']");
		//브랜드
		var brand = $("input[name='asideBrandAll']");
		
		if(check < 0){
			$(obj).find("i").attr("class","bi bi-check-circle-fill");
			
			if(!(ice.is(":checked"))){
				ice.click();
			}
			
			if(!(product.is(":checked"))){
				product.click();
			}
			
			if(!(brand.is(":checked"))){
				brand.click();
			}
		}
	}
	
	//pc화면 - 모든 전체메뉴 체크일 때, 전체상품 변화
	window.addEventListener("click",function(){
		//냉동식품
		var ice = $("input[name='asideIceAll']");
		//즉석식품
		var product = $("input[name='asideProductAll']");
		//브랜드
		var brand = $("input[name='asideBrandAll']");
		
		if(ice.is(":checked") && product.is(":checked") && brand.is(":checked")){
			$("button[name='lAsideProductAll']").find("i").attr("class","bi bi-check-circle-fill");
		}else{
			$("button[name='lAsideProductAll']").find("i").attr("class","bi bi-check-circle");
		}
	})
	
	//전체메뉴 모바일
	function allProductM(obj){
		var checkM = $(obj).find("i").attr("class").indexOf("fill");
		//냉동식품
		var iceM = $("input[name='asideIceAllM']");
		//즉석식품
		var productM = $("input[name='asideProductAllM']");
		//브랜드
		var brandM = $("input[name='asideBrandAllM']");
		
		if(checkM < 0){
			$(obj).find("i").attr("class","bi bi-check-circle-fill");
			
			if(!(iceM.is(":checked"))){
				iceM.click();
			}
			
			if(!(productM.is(":checked"))){
				productM.click();
			}
			
			if(!(brandM.is(":checked"))){
				brandM.click();
			}
		}
	}
	
	//모바일 화면 - 모든 전체메뉴 체크일 때, 전체상품 변화
	window.addEventListener("click",function(){
		//냉동식품
		var iceM = $("input[name='asideIceAllM']");
		//즉석식품
		var productM = $("input[name='asideProductAllM']");
		//브랜드
		var brandM = $("input[name='asideBrandAllM']");
		
		if(iceM.is(":checked") && productM.is(":checked") && brandM.is(":checked")){
			$("button[name='lAsideProductAllM']").find("i").attr("class","bi bi-check-circle-fill");
		}else{
			$("button[name='lAsideProductAllM']").find("i").attr("class","bi bi-check-circle");
		}
	})
	
	//냉동식품 체크박스
	function asideIceAll(obj){
		var ice = $("input[name='asideIce']");
		var check = $(obj).is(":checked");
		var iceAllM = $("input[name='asideIceAllM']");
		var iceM = $("input[name='asideIceM']");
		
		$.each(ice,function(){
			ice.prop("checked",check);
			iceM.prop("checked",check);
		})
		
		if(check){
			iceAllM.prop("checked",true);
		}else{
			iceAllM.prop("checked",false);
			$("button[name='lAsideProductAll']").find("i").attr("class","bi bi-check-circle");
		}
	}
	
	function asideIce(obj){
		var ice = $("input[name='asideIce']");
		var checkIce = $("input[name='asideIce']:checked");
		var iceAll = $("input[name='asideIceAll']");
		var iceAllM = $("input[name='asideIceAllM']");
		
		for(var i=0; i<2; i++){
			if($(obj).val() == i){
				if($(obj).is(":checked")){
					$("input[name='asideIceM']:eq("+i+")").prop("checked",true);
				}else{
					$("input[name='asideIceM']:eq("+i+")").prop("checked",false);
				}
			}
		}
		
		if(ice.length == checkIce.length){
			iceAll.prop("checked", true);
			iceAllM.prop("checked", true);
		}else{
			iceAll.prop("checked", false);
			$("button[name='lAsideProductAll']").find("i").attr("class","bi bi-check-circle");
			iceAllM.prop("checked", false);
			$("button[name='lAsideProductAllM']").find("i").attr("class","bi bi-check-circle");
		}
	}
	//냉동식품 체크박스 모바일
	function asideIceAllM(obj){
		var iceM = $("input[name='asideIceM']");
		var checkM = $(obj).is(":checked");
		var ice = $("input[name='asideIce']");
		var iceAll = $("input[name='asideIceAll']");
		
		$.each(iceM,function(){
			iceM.prop("checked",checkM);
			ice.prop("checked",checkM);
		})
		
		if(checkM){
			iceAll.prop("checked",true);
		}else{
			iceAll.prop("checked",false);
			$("button[name='lAsideProductAllM']").find("i").attr("class","bi bi-check-circle");
		}
	}
	
	function asideIceM(obj){
		var iceM = $("input[name='asideIceM']");
		var checkIceM = $("input[name='asideIceM']:checked");
		var iceAllM = $("input[name='asideIceAllM']");
		var iceAll = $("input[name='asideIceAll']");
		
		for(var i=0; i<2; i++){
			if($(obj).val() == i){
				if($(obj).is(":checked")){
					$("input[name='asideIce']:eq("+i+")").prop("checked",true);
				}else{
					$("input[name='asideIce']:eq("+i+")").prop("checked",false);
				}
			}
		}
		
		if(iceM.length == checkIceM.length){
			iceAllM.prop("checked", true);
			iceAll.prop("checked", true);
		}else{
			iceAllM.prop("checked", false);
			$("button[name='lAsideProductAllM']").find("i").attr("class","bi bi-check-circle");
			iceAll.prop("checked", false);
			$("button[name='lAsideProductAll']").find("i").attr("class","bi bi-check-circle");
		}
	}
	
	//즉석식품 체크박스
	function asideProductAll(obj){
		var product = $("input[name='asideProduct']");
		var check = $(obj).is(":checked");
		var productAllM = $("input[name='asideProductAllM']");
		var productM = $("input[name='asideProductM']");
		
		$.each(product,function(){
			product.prop("checked",check);
			productM.prop("checked",check);
		})
		
		if(check){
			productAllM.prop("checked",true);
		}else{
			productAllM.prop("checked",false);
			$("button[name='lAsideProductAll']").find("i").attr("class","bi bi-check-circle");
		}
	}
	
	function asideProduct(obj){
		var product = $("input[name='asideProduct']");
		var checkProduct = $("input[name='asideProduct']:checked");
		var productAll = $("input[name='asideProductAll']");
		var productAllM = $("input[name='asideProductAllM']");
		
		for(var i=0; i<3; i++){
			if($(obj).val() == i){
				if($(obj).is(":checked")){
					$("input[name='asideProductM']:eq("+i+")").prop("checked",true);
				}else{
					$("input[name='asideProductM']:eq("+i+")").prop("checked",false);
				}
			}
		}
		
		if(product.length == checkProduct.length){
			productAll.prop("checked", true);
			productAllM.prop("checked", true);
		}else{
			productAll.prop("checked", false);
			$("button[name='lAsideProductAll']").find("i").attr("class","bi bi-check-circle");
			productAllM.prop("checked", false);
			$("button[name='lAsideProductAllM']").find("i").attr("class","bi bi-check-circle");
		}
	}
	//즉석식품 체크박스 모바일
	function asideProductAllM(obj){
		var productM = $("input[name='asideProductM']");
		var checkM = $(obj).is(":checked");
		var product = $("input[name='asideProduct']");
		var productAll = $("input[name='asideProductAll']");
		
		$.each(productM,function(){
			productM.prop("checked",checkM);
			product.prop("checked",checkM);
		})
		
		if(checkM){
			productAll.prop("checked",true);
		}else{
			productAll.prop("checked",false);
			$("button[name='lAsideProductAllM']").find("i").attr("class","bi bi-check-circle");
		}
	}
	
	function asideProductM(obj){
		var productM = $("input[name='asideProductM']");
		var checkProductM = $("input[name='asideProductM']:checked");
		var productAllM = $("input[name='asideProductAllM']");
		var productAll = $("input[name='asideProductAll']");
		
		for(var i=0; i<3; i++){
			if($(obj).val() == i){
				if($(obj).is(":checked")){
					$("input[name='asideProduct']:eq("+i+")").prop("checked",true);
				}else{
					$("input[name='asideProduct']:eq("+i+")").prop("checked",false);
				}
			}
		}
		
		if(productM.length == checkProductM.length){
			productAllM.prop("checked", true);
			productAll.prop("checked", true);
		}else{
			productAllM.prop("checked", false);
			$("button[name='lAsideProductAllM']").find("i").attr("class","bi bi-check-circle");
			productAll.prop("checked", false);
			$("button[name='lAsideProductAll']").find("i").attr("class","bi bi-check-circle");
		}
	}
		
	
	//브랜드 체크박스
	function asideBrandAll(obj){
		var brand = $("input[name='asideBrand']");
		var check = $(obj).is(":checked");
		var brandAllM = $("input[name='asideBrandAllM']");
		var brandM = $("input[name='asideBrandM']");
		
		$.each(brand,function(){
			brand.prop("checked", check);
			brandM.prop("checked", check);
		})
		
		if(check){
			brandAllM.prop("checked",true);
		}else{
			brandAllM.prop("checked",false);
			$("button[name='lAsideProductAll']").find("i").attr("class","bi bi-check-circle");
		}
	}
	
	function asideBrand(obj){
		var brand = $("input[name='asideBrand']");
		var checkBrand = $("input[name='asideBrand']:checked");
		var brandAll = $("input[name='asideBrandAll']");
		var brandAllM = $("input[name='asideBrandAllM']");
		
		for(var i=0; i<6; i++){
			if($(obj).val() == i){
				if($(obj).is(":checked")){
					$("input[name='asideBrandM']:eq("+i+")").prop("checked",true);
				}else{
					$("input[name='asideBrandM']:eq("+i+")").prop("checked",false);
				}
			}
		}
		
		if(brand.length == checkBrand.length){
			brandAll.prop("checked",true);
			brandAllM.prop("checked",true);
		}else{
			brandAll.prop("checked",false);
			$("button[name='lAsideProductAll']").find("i").attr("class","bi bi-check-circle");
			brandAllM.prop("checked",false);
			$("button[name='lAsideProductAllM']").find("i").attr("class","bi bi-check-circle");
		}
	}
	//브랜드 체크박스 모바일
	function asideBrandAllM(obj){
		var brandM = $("input[name='asideBrandM']");
		var checkM = $(obj).is(":checked");
		var brand = $("input[name='asideBrand']");
		var brandAll = $("input[name='asideBrandAll']");
		
		
		$.each(brandM,function(){
			brandM.prop("checked", checkM);
			brand.prop("checked", checkM);
		})
		
		if(checkM){
			brandAll.prop("checked",true);
		}else{
			brandAll.prop("checked",false);
			$("button[name='lAsideProductAllM']").find("i").attr("class","bi bi-check-circle");
		}
	}
	
	function asideBrandM(obj){
		var brandM = $("input[name='asideBrandM']");
		var checkBrandM = $("input[name='asideBrandM']:checked");
		var brandAllM = $("input[name='asideBrandAllM']");
		var brandAll = $("input[name='asideBrandAll']");
		
		for(var i=0; i<6; i++){
			if($(obj).val() == i){
				if($(obj).is(":checked")){
					$("input[name='asideBrand']:eq("+i+")").prop("checked",true);
				}else{
					$("input[name='asideBrand']:eq("+i+")").prop("checked",false);
				}
			}
		}
		
		if(brandM.length == checkBrandM.length){
			brandAllM.prop("checked",true);
			brandAll.prop("checked",true);
		}else{
			brandAllM.prop("checked",false);
			$("button[name='lAsideProductAllM']").find("i").attr("class","bi bi-check-circle");
			brandAll.prop("checked",false);
			$("button[name='lAsideProductAll']").find("i").attr("class","bi bi-check-circle");
		}
	}

	//가격 체크박스
	
	function asidePrice(obj){
		var checkPrice = $("input[name='asidePrice']:checked");
		
		for(var i=0; i<2; i++){
			if($(obj).val() == i){
				if($(obj).is(":checked")){
					$("input[name='asidePriceM']:eq("+i+")").prop("checked",true);
				}else{
					$("input[name='asidePriceM']:eq("+i+")").prop("checked",false);
				}
			}
		}
		
		if(checkPrice.length == 0){
			for(var i=0; i<2; i++){
				if($(obj).val() == i){
					$(obj).prop("checked", true);
					$("input[name='asidePriceM']:eq("+i+")").prop("checked",true);
					alert("최소 한 개는 선택해야 합니다.");
				}
			}
		}
	}
	//가격 체크박스 모바일
	
	function asidePriceM(obj){
		var checkPriceM = $("input[name='asidePriceM']:checked");
		
		for(var i=0; i<2; i++){
			if($(obj).val() == i){
				if($(obj).is(":checked")){
					$("input[name='asidePrice']:eq("+i+")").prop("checked",true);
				}else{
					$("input[name='asidePrice']:eq("+i+")").prop("checked",false);
				}
			}
		}
		
		if(checkPriceM.length == 0){
			for(var i=0; i<2; i++){
				if($(obj).val() == i){
					$(obj).prop("checked",true);
					$("input[name='asidePrice']:eq("+i+")").prop("checked",true);
					$(".priceAlertM").css({"display" : "block",
										   "z-index" : "10000"
										});
					$(".priceAlertMessageM").html("<br><br>최소 한 개는 선택해야 합니다.");
					
					setTimeout(function(){
						$(".priceAlertM").css({"display" : "none",
										  	   "z-index" : "0"
										});
					},800);
				}
			}
		}
	}
	
	//무료배송
	function free(obj){
	var check = $(obj).find("i").attr("class").indexOf("fill");
		
		if(check > 0){
			$(".free").find("i").attr("class","bi bi-check-square");
		}else{
			$(".free").find("i").attr("class","bi bi-check-square-fill");
		}
	}
	
	$(document).ready(function(){
		var innerWidth = window.innerWidth;
			
			if(innerWidth < 991){
				$(".lAsideDiv").css("display","none");
				$(".mMenu").css("display","block");
				$(".mlAside").css("display","block");
			}else{
				$(".lAsideDiv").css("display","block");
				$(".mMenu").css("display","none");
				$(".mlAsideDiv").css("display","none");
				$(".mlAside").css("display","none");
			}
		//브라우저 크기에 따라 변화
		window.onresize = function(){
			var innerWidth = window.innerWidth;
			
			if(innerWidth < 991){
				$(".lAsideDiv").css("display","none");
				$(".mMenu").css("display","block");
				$(".mlAside").css("display","block");
			}else{
				$(".lAsideDiv").css("display","block");
				$(".mMenu").css("display","none");
				$(".mlAsideDiv").css("display","none");
				$(".mlAside").css("display","none");
			}
		}
	})
	
	//스크롤 하강 대응
	window.addEventListener("scroll", function(){
		var yScroll = window.scrollY;
		var navTop = $("#navBar").offset().top;
				
		if(yScroll >= navTop){
			/*상단 고정
			$(".filter").css({"position" : "fixed", 
							  "top" : "15px",
							  "left" : "0px",
							  "width" : "100%",
							  "background-color" : "#FFEFD5",
							  "z-index" : "10",
							  "width" : "54px",
							  "height" : "40px",
							  "border" : "1px soild #DCDCDC",
							  "border-radius" : "5px",
							  "text-align" : "center"
							});
			*/
			
			//하단 고정
			$(".filter").css({"position" : "fixed", 
							  "bottom" : "5.3%",
							  "width" : "100%",
							  "background-color" : "black",
							  "z-index" : "10",
							  "width" : "54px",
							  "height" : "40px",
							  "border-radius" : "5px",
							  "text-align" : "center",
							  "color" : "white",
							  "border" : "none"
							});
		}else if(yScroll < navTop){
			$(".filter").css({"position" : "static", 
							  "background-color" : "transparent",
							  "color" : "#696969",
							  "border" : "1px solid #DCDCDC"
							  
							});
		}
	})
	
	function productFilter(){
		var ice = $("input[name='asideIce']");
		var product = $("input[name='asideProduct']");
		var brandList = $("input[name='asideBrand']");
		var priceList = $("input[name='asidePrice']");
		
		var middleSort = "";
		var brand = "";
		var price = "";
		
		for(var i=0; i<ice.length; i++){
			if(ice.eq(i).is(":checked")){
				middleSort += ice.eq(i).next().html() + " ";
			}
		}
		
		for(var i=0; i<product.length; i++){
			if(product.eq(i).is(":checked")){
				middleSort += product.eq(i).next().html() + " ";
			}
		}
		
		for(var i=0; i<brandList.length; i++){
			if(brandList.eq(i).is(":checked")){
				brand += brandList.eq(i).next().html() + " ";
			}
		}
		
		for(var i=0; i<priceList.length; i++){
			if(priceList.eq(i).is(":checked")){
				price += priceList.eq(i).val();
			}
		}
		
		var mainSectionHtml = "<!-- pc버전 -->";
			mainSectionHtml += "<article class='pList'>";
			mainSectionHtml += "<div class='fs-5 my-2 fw-bold topText'>전체상품</div>";
			mainSectionHtml += "<hr>";
			mainSectionHtml += "<!-- 전체상품 -->";
			mainSectionHtml += "<div class='container'>";
			mainSectionHtml += "<div class='row'>";
			mainSectionHtml += "<c:forEach items='${productListAll}' var='ProductVO' varStatus='status'>";
			mainSectionHtml += "<div class='col-12 col-sm-12 col-md-6 col-lg-4 col-xl-3 productAll d-flex justify-content-center'>";
			mainSectionHtml += "<div class='card' style='width: 18rem;'>";
			mainSectionHtml += "<a href='productView.do?product_index=${ProductVO.product_index}' onclick='productCookie(this)'>";
			mainSectionHtml += "<img src='/controller/resources/img/${ProductVO.brand}/${ProductVO.middleSort}/${ProductVO.thumbnail_image}' class='card-img-top cardImg' alt='${ProductVO.product_name }'>";
			mainSectionHtml += "<c:if test='${ProductVO.inventory == 0 }'>";
			mainSectionHtml += "<img src='/controller/resources/img/매진.png' class='card-img-top pListSold'>";
			mainSectionHtml += "<div class='pListSoldout'></div>";
			mainSectionHtml += "</c:if>";
			mainSectionHtml += "<input type='hidden' class='inventory${status.index}' value='${ProductVO.inventory}'>";
			mainSectionHtml += "<div class='card-body'>";
			mainSectionHtml += "<p class='card-text'>";
			mainSectionHtml += "<c:if test='${ProductVO.quantity >= 500}'>";
			mainSectionHtml += "<span style='color:red;'>[인기]</span>";
			mainSectionHtml += "</c:if>";
			mainSectionHtml += "<span>[${ProductVO.brand}]</span>";
			mainSectionHtml += "<br>";
			mainSectionHtml += "<span class='productNam'>${ProductVO.product_name}</span><br>";
			mainSectionHtml += "<span class='fs-4'>";
			mainSectionHtml += "<fmt:formatNumber value='${ProductVO.origin_price}' pattern='#,###'/>";
			mainSectionHtml += "</span>원<br>";
			mainSectionHtml += "<c:if test='${ProductVO.sale_price != -1}'>";
			mainSectionHtml += "<span class='discount'>";
			mainSectionHtml += "<fmt:formatNumber value='${ProductVO.sale_price}' pattern='#,###'/>원";
			mainSectionHtml += "<c:set var='sale' value='${((ProductVO.origin_price - ProductVO.sale_price)/ProductVO.origin_price)*100}' />";
			mainSectionHtml += "(<fmt:formatNumber value='${sale}' pattern='##.#'/>%)<br>";
			mainSectionHtml += "</span>";
			mainSectionHtml += "</c:if>";
			mainSectionHtml += "<span class='productListStar'>";
			mainSectionHtml += "<i class='bi bi-star-fill'></i>";
			mainSectionHtml += "<i class='bi bi-star-fill'></i>";
			mainSectionHtml += "<i class='bi bi-star-fill'></i>";
			mainSectionHtml += "<i class='bi bi-star-fill'></i>";
			mainSectionHtml += "<i class='bi bi-star'></i>";
			mainSectionHtml += "</span>";
			mainSectionHtml += "<br>";
			mainSectionHtml += "<c:set var='delivery' value='${ProductVO.delivery_free_YN}' />";
			mainSectionHtml += "<c:choose>";
			mainSectionHtml += "<c:when test='${delivery == 'Y'}'>";
			mainSectionHtml += "배송비 3,000원";
			mainSectionHtml += "</c:when>";
			mainSectionHtml += "<c:when test='${delivery == 'Y'}'>";
			mainSectionHtml += "무료배송";
			mainSectionHtml += "</c:when>";
			mainSectionHtml += "</c:choose>";
			mainSectionHtml += "</p>";
			mainSectionHtml += "</div>";
			mainSectionHtml += "</a>";
			mainSectionHtml += "<input type='hidden' name='index' value='${ProductVO.product_index}'>";
			mainSectionHtml += "<div class='pListSubImg'>";
			mainSectionHtml += "<c:if test='${member.id != null }'>";
			mainSectionHtml += "<c:set var='heartCheck' value='0' />";
			mainSectionHtml += "<c:forEach items='${userDibsList}' var='userDibsList'>";
			mainSectionHtml += "<c:if test='${userDibsList.member_index == member.member_index && ProductVO.product_index == userDibsList.product_index}'>";
			mainSectionHtml += "<img src='/controller/resources/img/찬하트.png' class='img-fluid hoverHeart' alt='찜' onclick='heart(this)'>";
			mainSectionHtml += "<c:set var='heartCheck' value='1' />";
			mainSectionHtml += "</c:if>";
			mainSectionHtml += "</c:forEach>";
			mainSectionHtml += "<c:if test='${heartCheck == '0'}'>";
			mainSectionHtml += "<img src='/controller/resources/img/빈하트.png' class='img-fluid hoverHeart' alt='찜' onclick='heart(this)'>";
			mainSectionHtml += "</c:if>";
			mainSectionHtml += "</c:if>";
			mainSectionHtml += "<c:if test='${member.id == null}'>";
			mainSectionHtml += "<img src='/controller/resources/img/빈하트.png' class='img-fluid hoverHeart' alt='찜' onclick='heart(this)'>";
			mainSectionHtml += "</c:if>";
			mainSectionHtml += "<img src='/controller/resources/img/카트2.png' class='img-fluid hoverCart' alt='장바구니' onclick='cart(this)'>";
			mainSectionHtml += "<input type='hidden' value='${status.index}'>";
			mainSectionHtml += "</div>";
			mainSectionHtml += "</div>";
			mainSectionHtml += "</div>";
			mainSectionHtml += "</c:forEach>";
			mainSectionHtml += "<input type='hidden' id='pListLoginCheck' value='${member.member_index}'>";
			mainSectionHtml += "</div>";
			mainSectionHtml += "</article>";
									  	
									
			/*	
				<!-- 모바일 버전 -->	
				<article class="pListM">
					<div class="fs-5 my-2 fw-bold topText">전체상품</div>
					<hr>
					<div class="productListCardM">
						<c:forEach items="${productListAll}" var="ProductVO" varStatus="status">
						<div class="productListMDiv">
						<a href="productView.do?product_index=${ProductVO.product_index}" onclick="productCookie(this)">
							<div class="productListMImg">
								<div style="width:100px; height:100px;">
									<img src="/controller/resources/img/${ProductVO.brand}/${ProductVO.middleSort}/${ProductVO.thumbnail_image}" class="img-fluid" style="width:100px; height:100px;" alt="${ProductVO.product_name}">
									<c:if test="${ProductVO.inventory == 0 }">
									  	<img src="/controller/resources/img/매진.png" class="card-img-top pListSold">
									  	<div class="pListSoldout"></div>
									</c:if>
								<input type="hidden" class="inventoryM${status.index}" value="${ProductVO.inventory}">
								</div>
								<div class="productListStarM">
									<i class="bi bi-star-fill"></i>
							        <i class="bi bi-star-fill"></i>
							        <i class="bi bi-star-fill"></i>
							      	<i class="bi bi-star-fill"></i>
							       	<i class="bi bi-star"></i>
								</div>
							</div>
							<div class="productListContent">
								<c:if test="${ProductVO.quantity >= 500}">
									<span style="color:red;">[인기]</span>
								</c:if>
								<span>[${ProductVO.brand}]</span>
								<div class="productNameM">${ProductVO.product_name}</div>
								<c:if test="${ProductVO.sale_price == -1}">
								<div>
									<fmt:formatNumber value="${ProductVO.origin_price}" pattern="#,###"/>원
								</div>
								</c:if>
								<c:if test="${ProductVO.sale_price != -1}">
								<div class="discountM">
									[할인가]<fmt:formatNumber value="${ProductVO.sale_price}" pattern="#,###"/>원
									<c:set var="sale" value="${((ProductVO.origin_price - ProductVO.sale_price)/ProductVO.origin_price)*100}" />
				          			(<fmt:formatNumber value="${sale}" pattern="##.#"/>%)
								</div>
								</c:if>
								<c:set var="delivery" value="${ProductVO.delivery_free_YN}" />
								    	<c:choose>
								    		<c:when test="${ProductVO.delivery_free_YN == 'N'}">
								    			<div>배송비 3,000원</div>
								    		</c:when>
								    		
								    		<c:when test="${ProductVO.delivery_free_YN == 'Y'}">
								    			<div>무료배송</div>
								    		</c:when>
								    	</c:choose>
							</div>
							</a>
							<input type="hidden" name="index" value="${ProductVO.product_index}">
							<div class="pListSubImgM">
								<c:if test="${member.id != null }">
								  	<c:set var="heartCheck" value="0" />
								 	<c:forEach items="${userDibsList}" var="userDibsList">
								  		<c:if test="${userDibsList.member_index == member.member_index && ProductVO.product_index == userDibsList.product_index}">
								  			<img src="/controller/resources/img/찬하트.png" class="img-fluid hoverHeart" alt="찜" onclick="heart(this)">
								  			<c:set var="heartCheck" value="1" />
								  		</c:if>
								  	</c:forEach>
								  	<c:if test="${heartCheck == '0'}">
								  		<img src="/controller/resources/img/빈하트.png" class="img-fluid hoverHeart" alt="찜" onclick="heart(this)">
								  	</c:if>
									  	
							  	</c:if>
							  	<c:if test="${member.id == null}">
								  	<img src="/controller/resources/img/빈하트.png" class="img-fluid hoverHeart" alt="찜" onclick="heart(this)">
							  	</c:if>
								<img src="/controller/resources/img/카트2.png" class="img-fluid hoverCart" alt="장바구니" onclick="pListCart(this)">
								<input type="hidden" value="${status.index}">
							</div>
						</div>
						</c:forEach>
					</div>
				</article>
		*/
		
		$.ajax({
			url : "productFilter.do",
			data : "middleSort="+middleSort+"&brand="+brand+"&price="+price,
			success : function(data){
				console.log(data);
			},
			error : function() {
				console.log('error');			
			}
		});
		
	}