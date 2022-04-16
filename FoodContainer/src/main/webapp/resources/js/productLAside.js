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
		var ice = $("input[name='asideIceAll']");
		//즉석식품
		var product = $("input[name='asideProductAll']");
		//브랜드
		var brand = $("input[name='asideBrandAll']");
		//가격
		var price = $("input[name='asidePrice']");
		
		if(ice.is(":checked") && product.is(":checked") && brand.is(":checked") && price.is(":checked")){
			ice.click();
			product.click();
			brand.click();
			all.click();
		}
		
	  //모바일 화면 - 처음 또는 새로고침 시 전체선택
	 	//전체식품
	  	var allM = $("button[name='lAsideProductAllM']");
		//냉동식품
		var iceM = $("input[name='asideIceAllM']");
		//즉석식품
		var productM = $("input[name='asideProductAllM']");
		//브랜드
		var brandM = $("input[name='asideBrandAllM']");
		//가격
		var priceM = $("input[name='asidePriceM']");
		
		if(iceM.is(":checked") && productM.is(":checked") && brandM.is(":checked") && priceM.is(":checked")){
			iceM.click();
			productM.click();
			brandM.click();
			allM.click();
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
		
	}