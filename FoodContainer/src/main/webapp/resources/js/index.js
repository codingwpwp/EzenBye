/* main =======================================================================*/

	//찜
	function heart(obj){
		var hCheck = obj.getAttribute("src").indexOf("빈하트");
			
		if(hCheck > 0){
			obj.setAttribute("src","/controller/resources/img/찬하트.png");
		}else if(hCheck < 0){
			obj.setAttribute("src","/controller/resources/img/빈하트.png");
		}	
	}
	//장바구니
	function cart(obj){
		$(".cartBack").css("display","block");
		var name = $(obj).next().find(".productName").html();
		var html = "<br><br>"+name+" 상품이 장바구니에 담겼습니다.";
			html += "<br><br><button onclick='cartOk()''>확인</button>";
		$(".message").html(html);
	}
	//장바구니 확인 알림
	function cartOk(){
		$(".cartBack").css("display","none");
	}
	
/* lAside =======================================================================*/

	//펼칠 때 아이콘 변경
	function extend(obj){
		var attr = $(obj).find("i").attr("class").indexOf("fill");
		
		if(attr > 0){
			attr = $(obj).find("i").attr("class","bi bi-plus-circle-dotted");
		}else {
			attr = $(obj).find("i").attr("class","bi bi-dash-circle-fill");
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
	
	//브라우저 크기
	window.onresize = function(){
		var innerWidth = window.innerWidth;
		
		if(innerWidth < 850){
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
	
	function mLAside(obj){
		$(".mlAsideDiv").toggle();
		var text = $(obj).html().indexOf("▶");
		if($(obj).html().indexOf("▶") > 0){
			$(obj).html("메<br>뉴<br>◀");
		}else{
			$(obj).html("메<br>뉴<br>▶");
		}
	}
	
/* productView =======================================================================*/
	
	//상품 개수
	var num = 1;
	function plusFn(obj){
		var cnt = $(".productNum").html();
			
		if(num == 10){
			alert("최대 선택 개수는 10개 입니다.");
		}else{
			num++;
			var html = "<i class='bi bi-dash-square-fill' onclick='minusFn(this)'></i> "+num+" <i class='bi bi-plus-square-fill' onclick='plusFn(this)'></i>";
			$(".totalPrice").html("합계 : <span class='fs-3'>"+(num*10000)+"원</span>");
			$(".productNum").html(html);
		}
	}
		
	function minusFn(obj){
		var cnt = $(".productNum").html();
			
		if(num == 1){
			alert("최소 1개는 선택해야 합니다.");
		}else{
			num--;
			var html = "<i class='bi bi-dash-square-fill' onclick='minusFn(this)'></i> "+num+" <i class='bi bi-plus-square-fill' onclick='plusFn(this)'></i>";
			$(".totalPrice").html("합계 : <span class='fs-3'>"+(num*10000)+"원</span>");
			$(".productNum").html(html);
		}
	}
	
	//서브메뉴
	window.addEventListener("scroll", function(){
		var scrollLocation = document.documentElement.scrollTop;
		var browserHeight = window.innerHeight;
		var bodyHeight = document.body.scrollHeight;
		
		console.log("1:"+scrollLocation);
		console.log("2:"+browserHeight);
		console.log("3:"+bodyHeight);
		console.log("4:"+bodyHeight*0.85);
		
		if(window.innerWidth < 991){
			if(scrollLocation > (browserHeight*1.2) && scrollLocation < (bodyHeight*0.8)){
				$(".subMenuGroup").css({"position" : "fixed", 
										"top" : "0px",
										"left" : "0px",
										"width" : "100%"
										});
				$("#btnradio1").prop("checked",true);
			}else if(scrollLocation < (browserHeight*1.2)){
				$(".subMenuGroup").css("position","static");
				$("#btnradio1").prop("checked",false);
			}else if(scrollLocation > (bodyHeight*0.8) && scrollLocation < (bodyHeight*0.84)){
				$("#btnradio2").prop("checked",true);
			}else if(scrollLocation > (bodyHeight*0.84) && scrollLocation < (bodyHeight*0.88)){
				$("#btnradio3").prop("checked",true);
			}else if(scrollLocation > (bodyHeight*0.88)){
				$("#btnradio4").prop("checked",true);
			}
		}else{
			if(scrollLocation > (browserHeight*0.7) && scrollLocation < (bodyHeight*0.81)){
				$(".subMenuGroup").css({"position" : "fixed", 
										"top" : "0px",
										"left" : "0px",
										"width" : "100%"
										});
				$("#btnradio1").prop("checked",true);
			}else if(scrollLocation < (browserHeight*0.7)){
				$(".subMenuGroup").css("position","static");
				$("#btnradio1").prop("checked",false);
			}else if(scrollLocation > (bodyHeight*0.81) && scrollLocation < (bodyHeight*0.86)){
				$("#btnradio2").prop("checked",true);
			}else if(scrollLocation > (bodyHeight*0.86) && scrollLocation < (bodyHeight*0.9)){
				$("#btnradio3").prop("checked",true);
			}else if(scrollLocation > (bodyHeight*0.9)){
				$("#btnradio4").prop("checked",true);
			}
		}
	})

