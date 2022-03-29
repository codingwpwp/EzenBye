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
	
	//전체메뉴
	function allProduct(obj){
		var check = $(obj).find("i").attr("class").indexOf("fill");
		
		if(check > 0){
			$(obj).find("i").attr("class","bi bi-check-circle");
		}else{
			$(obj).find("i").attr("class","bi bi-check-circle-fill");
		}
	}
	//전체메뉴 모바일
	function allProductM(obj){
		var check = $(obj).find("i").attr("class").indexOf("fill");
		
		if(check > 0){
			$(obj).find("i").attr("class","bi bi-check-circle");
		}else{
			$(obj).find("i").attr("class","bi bi-check-circle-fill");
		}
	}
	
	//냉동식품 체크박스
	function asideIceAll(obj){
		var ice = $("input[name='asideIce']");
		var check = $(obj).is(":checked");
		
		$.each(ice,function(){
			ice.prop("checked",check);
		})
	}
	
	function asideIce(obj){
		var ice = $("input[name='asideIce']");
		var checkIce = $("input[name='asideIce']:checked");
		var iceAll = $("input[name='asideIceAll']");
		
		if(ice.length == checkIce.length){
			iceAll.prop("checked", true);
		}else{
			iceAll.prop("checked", false);
		}
	}
	//냉동식품 체크박스 모바일
	function asideIceAllM(obj){
		var ice = $("input[name='asideIceM']");
		var check = $(obj).is(":checked");
		
		$.each(ice,function(){
			ice.prop("checked",check);
		})
	}
	
	function asideIceM(obj){
		var ice = $("input[name='asideIceM']");
		var checkIce = $("input[name='asideIceM']:checked");
		var iceAll = $("input[name='asideIceAllM']");
		
		if(ice.length == checkIce.length){
			iceAll.prop("checked", true);
		}else{
			iceAll.prop("checked", false);
		}
	}
	
	//즉석식품 체크박스
	function asideProductAll(obj){
		var product = $("input[name='asideProduct']");
		var check = $(obj).is(":checked");
		
		$.each(product,function(){
			product.prop("checked",check);
		})
		
	}
	
	function asideProduct(obj){
		var product = $("input[name='asideProduct']");
		var checkProduct = $("input[name='asideProduct']:checked");
		var productAll = $("input[name='asideProductAll']");
		
		if(product.length == checkProduct.length){
			productAll.prop("checked", true);
		}else{
			productAll.prop("checked", false);
		}
	}
	//즉석식품 체크박스 모바일
	function asideProductAllM(obj){
		var product = $("input[name='asideProductM']");
		var check = $(obj).is(":checked");
		
		$.each(product,function(){
			product.prop("checked",check);
		})
		
	}
	
	function asideProductM(obj){
		var product = $("input[name='asideProductM']");
		var checkProduct = $("input[name='asideProductM']:checked");
		var productAll = $("input[name='asideProductAllM']");
		
		if(product.length == checkProduct.length){
			productAll.prop("checked", true);
		}else{
			productAll.prop("checked", false);
		}
	}
		
	
	//브랜드 체크박스
	function asideBrandAll(obj){
		var brand = $("input[name='asideBrand']");
		var check = $(obj).is(":checked");
		
		$.each(brand,function(){
			brand.prop("checked", check);
		})
	}
	
	function asideBrand(obj){
		var brand = $("input[name='asideBrand']");
		var checkBrand = $("input[name='asideBrand']:checked");
		var brandAll = $("input[name='asideBrandAll']");
		
		if(brand.length == checkBrand.length){
			brandAll.prop("checked",true);
		}else{
			brandAll.prop("checked",false);
		}
	}
	//브랜드 체크박스 모바일
	function asideBrandAllM(obj){
		var brand = $("input[name='asideBrandM']");
		var check = $(obj).is(":checked");
		
		$.each(brand,function(){
			brand.prop("checked", check);
		})
	}
	
	function asideBrandM(obj){
		var brand = $("input[name='asideBrandM']");
		var checkBrand = $("input[name='asideBrandM']:checked");
		var brandAll = $("input[name='asideBrandAllM']");
		
		if(brand.length == checkBrand.length){
			brandAll.prop("checked",true);
		}else{
			brandAll.prop("checked",false);
		}
	}

	//가격 체크박스
	function asidePriceAll(obj){
		var price = $("input[name='asidePrice']");
		var check = $(obj).is(":checked");
		
		$.each(price,function(){
			price.prop("checked",check);
		})
	}
	
	function asidePrice(obj){
		var price = $("input[name='asidePrice']");
		var checkPrice = $("input[name='asidePrice']:checked");
		var priceAll = $("input[name='asidePriceAll']");
		
		if(price.length == checkPrice.length){
			priceAll.prop("checked",true);
		}else{
			priceAll.prop("checked",false);
		}
	}
	//가격 체크박스 모바일
	function asidePriceAllM(obj){
		var price = $("input[name='asidePriceM']");
		var check = $(obj).is(":checked");
		
		$.each(price,function(){
			price.prop("checked",check);
		})
	}
	
	function asidePriceM(obj){
		var price = $("input[name='asidePriceM']");
		var checkPrice = $("input[name='asidePriceM']:checked");
		var priceAll = $("input[name='asidePriceAllM']");
		
		if(price.length == checkPrice.length){
			priceAll.prop("checked",true);
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
			$(".filter").css({"position" : "fixed", 
							  "top" : "15px",
							  "left" : "0px",
							  "width" : "100%",
							  "background-color" : "#FFEFD5",
							  "z-index" : "10",
							  "width" : "30px",
							  "height" : "40px",
							  "border-radius" : "10px",
							  "text-align" : "center;"
							});
		}else if(yScroll < navTop){
			$(".filter").css({"position" : "static", 
							  "background-color" : "transparent"
							  
							});
		}
	})
