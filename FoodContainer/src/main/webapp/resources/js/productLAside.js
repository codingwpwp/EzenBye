/* lAside =======================================================================*/

	//펼칠 때 아이콘 변경
	function extend(obj){
		var expand = $(obj).attr("aria-expanded");
		
		if(expand == "true"){
			$(obj).find("i").attr("class","bi bi-dash-circle-fill");
		}else{
			$(obj).find("i").attr("class","bi bi-plus-circle-dotted");
		}
	}
	
	window.onload = function(){
	//pc화면 - 처음 또는 새로고침 시 전체선택
		//전체선택
		var check = $("button[name='lAsideProductAll']").find("i").attr("class").indexOf("fill");
		//냉동식품
		var ice = $("input[name='asideIceAll']");
		//즉석식품
		var product = $("input[name='asideProductAll']");
		//브랜드
		var brand = $("input[name='asideBrandAll']");
		//가격
		var price = $("input[name='asidePriceAll']");
		
		if(check > 0){
			ice.click();
			product.click();
			brand.click();
			price.parent().parent().parent().next().find("input").click();
			price.parent().parent().parent().next().next().find("input").click();
			
		}
		
	//모바일 화면 - 처음 또는 새로고침 시 전체선택
		//전체선택
		var checkM = $("button[name='lAsideProductAllM']").find("i").attr("class").indexOf("fill");
		//냉동식품
		var iceM = $("input[name='asideIceAllM']");
		//즉석식품
		var productM = $("input[name='asideProductAllM']");
		//브랜드
		var brandM = $("input[name='asideBrandAllM']");
		//가격
		var priceM = $("input[name='asidePriceAllM']");
		
		if(checkM > 0){
			iceM.click();
			productM.click();
			brandM.click();
			priceM.parent().parent().parent().next().find("input").click();
			priceM.parent().parent().parent().next().next().find("input").click();
			
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
		}
	})
	
	//전체메뉴 모바일
	function allProductM(obj){
		var check = $(obj).find("i").attr("class").indexOf("fill");
		//냉동식품
		var ice = $("input[name='asideIceAllM']");
		//즉석식품
		var product = $("input[name='asideProductAllM']");
		//브랜드
		var brand = $("input[name='asideBrandAllM']");
		
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
	
	//모바일 화면 - 모든 전체메뉴 체크일 때, 전체상품 변화
	window.addEventListener("click",function(){
		//냉동식품
		var ice = $("input[name='asideIceAllM']");
		//즉석식품
		var product = $("input[name='asideProductAllM']");
		//브랜드
		var brand = $("input[name='asideBrandAllM']");
		
		if(ice.is(":checked") && product.is(":checked") && brand.is(":checked")){
			$("button[name='lAsideProductAllM']").find("i").attr("class","bi bi-check-circle-fill");
		}
	})
	
	//냉동식품 체크박스
	function asideIceAll(obj){
		var ice = $("input[name='asideIce']");
		var check = $(obj).is(":checked");
		
		$.each(ice,function(){
			ice.prop("checked",check);
		})
		
		if(!(check)){
			$("button[name='lAsideProductAll']").find("i").attr("class","bi bi-check-circle");
		}
	}
	
	function asideIce(obj){
		var ice = $("input[name='asideIce']");
		var checkIce = $("input[name='asideIce']:checked");
		var iceAll = $("input[name='asideIceAll']");
		
		if(ice.length == checkIce.length){
			iceAll.prop("checked", true);
		}else{
			iceAll.prop("checked", false);
			$("button[name='lAsideProductAll']").find("i").attr("class","bi bi-check-circle");
		}
	}
	//냉동식품 체크박스 모바일
	function asideIceAllM(obj){
		var ice = $("input[name='asideIceM']");
		var check = $(obj).is(":checked");
		
		$.each(ice,function(){
			ice.prop("checked",check);
		})
		
		if(!(check)){
			$("button[name='lAsideProductAllM']").find("i").attr("class","bi bi-check-circle");
		}
	}
	
	function asideIceM(obj){
		var ice = $("input[name='asideIceM']");
		var checkIce = $("input[name='asideIceM']:checked");
		var iceAll = $("input[name='asideIceAllM']");
		
		if(ice.length == checkIce.length){
			iceAll.prop("checked", true);
		}else{
			iceAll.prop("checked", false);
			$("button[name='lAsideProductAllM']").find("i").attr("class","bi bi-check-circle");
		}
	}
	
	//즉석식품 체크박스
	function asideProductAll(obj){
		var product = $("input[name='asideProduct']");
		var check = $(obj).is(":checked");
		
		$.each(product,function(){
			product.prop("checked",check);
		})
		
		if(!(check)){
			$("button[name='lAsideProductAll']").find("i").attr("class","bi bi-check-circle");
		}
	}
	
	function asideProduct(obj){
		var product = $("input[name='asideProduct']");
		var checkProduct = $("input[name='asideProduct']:checked");
		var productAll = $("input[name='asideProductAll']");
		
		if(product.length == checkProduct.length){
			productAll.prop("checked", true);
		}else{
			productAll.prop("checked", false);
			$("button[name='lAsideProductAll']").find("i").attr("class","bi bi-check-circle");
		}
	}
	//즉석식품 체크박스 모바일
	function asideProductAllM(obj){
		var product = $("input[name='asideProductM']");
		var check = $(obj).is(":checked");
		
		$.each(product,function(){
			product.prop("checked",check);
		})
		
		if(!(check)){
			$("button[name='lAsideProductAllM']").find("i").attr("class","bi bi-check-circle");
		}
	}
	
	function asideProductM(obj){
		var product = $("input[name='asideProductM']");
		var checkProduct = $("input[name='asideProductM']:checked");
		var productAll = $("input[name='asideProductAllM']");
		
		if(product.length == checkProduct.length){
			productAll.prop("checked", true);
		}else{
			productAll.prop("checked", false);
			$("button[name='lAsideProductAllM']").find("i").attr("class","bi bi-check-circle");
		}
	}
		
	
	//브랜드 체크박스
	function asideBrandAll(obj){
		var brand = $("input[name='asideBrand']");
		var check = $(obj).is(":checked");
		
		$.each(brand,function(){
			brand.prop("checked", check);
		})
		
		if(!(check)){
			$("button[name='lAsideProductAll']").find("i").attr("class","bi bi-check-circle");
		}
	}
	
	function asideBrand(obj){
		var brand = $("input[name='asideBrand']");
		var checkBrand = $("input[name='asideBrand']:checked");
		var brandAll = $("input[name='asideBrandAll']");
		
		if(brand.length == checkBrand.length){
			brandAll.prop("checked",true);
		}else{
			brandAll.prop("checked",false);
			$("button[name='lAsideProductAll']").find("i").attr("class","bi bi-check-circle");
		}
	}
	//브랜드 체크박스 모바일
	function asideBrandAllM(obj){
		var brand = $("input[name='asideBrandM']");
		var check = $(obj).is(":checked");
		
		$.each(brand,function(){
			brand.prop("checked", check);
		})
		
		if(!(check)){
			$("button[name='lAsideProductAllM']").find("i").attr("class","bi bi-check-circle");
		}
	}
	
	function asideBrandM(obj){
		var brand = $("input[name='asideBrandM']");
		var checkBrand = $("input[name='asideBrandM']:checked");
		var brandAll = $("input[name='asideBrandAllM']");
		
		if(brand.length == checkBrand.length){
			brandAll.prop("checked",true);
		}else{
			brandAll.prop("checked",false);
			$("button[name='lAsideProductAllM']").find("i").attr("class","bi bi-check-circle");
		}
	}

	//가격 체크박스
	function asidePriceAll(obj){
		$(obj).prop("checked",true);
		
		var price = $("input[name='asidePrice']");
		
		$.each(price,function(){
			price.prop("checked",true);
		})
		
	}
	
	function asidePrice(obj){
		var price = $("input[name='asidePrice']");
		var checkPrice = $("input[name='asidePrice']:checked");
		var priceAll = $("input[name='asidePriceAll']");
		
		if(price.length == checkPrice.length){
			priceAll.prop("checked",true);
		}else if(checkPrice.length == 0){
			$(obj).prop("checked", true);
			alert("최소 한 개는 선택해야 합니다.");
		}else{
			priceAll.prop("checked",false);
		}
	}
	//가격 체크박스 모바일
	function asidePriceAllM(obj){
		$(obj).prop("checked",true);
		
		var price = $("input[name='asidePriceM']");
		
		$.each(price,function(){
			price.prop("checked",true);
		})
	}
	
	function asidePriceM(obj){
		var price = $("input[name='asidePriceM']");
		var checkPrice = $("input[name='asidePriceM']:checked");
		var priceAll = $("input[name='asidePriceAllM']");
		if(price.length == checkPrice.length){
			priceAll.prop("checked",true);
		}else if(checkPrice.length == 0){
			$(obj).prop("checked",true);
			$(".priceAlertM").css({"display" : "block",
								   "z-index" : "10000"
								});
			$(".priceAlertMessageM").html("<br><br>최소 한 개는 선택해야 합니다.");
			
			setTimeout(function(){
				$(".priceAlertM").css({"display" : "none",
								  	   "z-index" : "0"
								});
			},800);
		}else{
			priceAll.prop("checked",false);
		}
	}
	
	//무료배송
	function free(obj){
	var check = $(obj).find("i").attr("class").indexOf("fill");
		
		if(check > 0){
			$(obj).find("i").attr("class","bi bi-check-square");
		}else{
			$(obj).find("i").attr("class","bi bi-check-square-fill");
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
