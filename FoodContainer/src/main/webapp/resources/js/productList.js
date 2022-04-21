/* productList =======================================================================*/
	
	var pListPopular = $(".productListContent").find("span:eq(0)").html();
	
	if(pListPopular == ""){
		$(".indexSubImgM").css("top","-16px");
	}else{
		$(".indexSubImgM").css("top","-40px");
	}
	
	//장바구니
	function pListCart(obj){
		var loginCheck = $("#pListLoginCheck").val();
		var pIndex = $(obj).parent().prev().val();
		console.log(loginCheck);
		console.log(pIndex);
		
		var invenCnt = $(obj).next().val();
		var inventory = $(".inventoryM"+invenCnt).val();
		
		if(inventory < 1){
			$(".cartBack").css("display","block");
				var name = $(obj).parent().prev().prev().find(".productNameM").html();
				var html = "<br><br> 매진 된 상품입니다.";
					html += "<br><br><button type='button' class='btn btn-secondary' onclick='cartOk()'>확인</button>";
				$(".message").html(html);
		}else{
			if(loginCheck == ""){
				$(".cartBack").css("display","block");
				var name = $(obj).parent().prev().prev().find(".productNameM").html();
				var html = "<br>&quot;"+name+"&quot;<br> 상품이 장바구니에 담겼습니다.";
					html += "<br><br><button type='button' class='btn btn-secondary' onclick='cartOk()'>확인</button>";
				$(".message").html(html);
				
				$.ajax({
					url : "noMemberCartCookie.do",
					type : "get",
					data : "product_index="+pIndex,
					succese : function(){
								
					}
				});
			}else{
				$(".cartBack").css("display","block");
				var name = $(obj).parent().prev().prev().find(".productNameM").html();
				var html = "<br>&quot;"+name+"&quot;<br> 상품이 장바구니에 담겼습니다.";
					html += "<br><br><button type='button' class='btn btn-secondary' onclick='cartOk()'>확인</button>";
				$(".message").html(html);
				
				$.ajax({
					url : "memberCartInsert.do",
					type : "post",
					data : "product_index="+pIndex+"&member_index="+loginCheck,
					succese : function(){
								
					}
				});
			}
		}
	}
	//장바구니 확인 알림
	function cartOk(){
		$(".cartBack").css("display","none");
	}
	
	
	var all = $("button[name='lAsideProductAll']");
	var iceAll = $("input[name='asideIceAll']");
	var ice0 = $("input[name='asideIce']:eq(0)");
	var ice1 = $("input[name='asideIce']:eq(1)");
	var productAll = $("input[name='asideProductAll']");
	var product0 = $("input[name='asideProduct']:eq(0)");
	var product1 = $("input[name='asideProduct']:eq(1)");
	var product2 = $("input[name='asideProduct']:eq(2)");
	var brandAll = $("input[name='asideBrandAll']");
	var brand0 = $("input[name='asideBrand']:eq(0)");
	var brand1 = $("input[name='asideBrand']:eq(1)");
	var brand2 = $("input[name='asideBrand']:eq(2)");
	var brand3 = $("input[name='asideBrand']:eq(3)");
	var brand4 = $("input[name='asideBrand']:eq(4)");
	var price0 = $("input[name='asidePrice']:eq(0)");
	var price1 = $("input[name='asidePrice']:eq(1)");
			
	var allM = $("button[name='lAsideProductAllM']");
	var iceAllM = $("input[name='asideIceAllM']");
	var ice0M = $("input[name='asideIceM']:eq(0)");
	var ice1M = $("input[name='asideIceM']:eq(1)");
	var productAllM = $("input[name='asideProductAllM']");
	var product0M = $("input[name='asideProductM']:eq(0)");
	var product1M = $("input[name='asideProductM']:eq(1)");
	var product2M = $("input[name='asideProductM']:eq(2)");
	var brandAllM = $("input[name='asideBrandAllM']");
	var brand0M = $("input[name='asideBrandM']:eq(0)");
	var brand1M = $("input[name='asideBrandM']:eq(1)");
	var brand2M = $("input[name='asideBrandM']:eq(2)");
	var brand3M = $("input[name='asideBrandM']:eq(3)");
	var brand4M = $("input[name='asideBrandM']:eq(4)");
	var price0M = $("input[name='asidePriceM']:eq(0)");
	var price1M = $("input[name='asidePriceM']:eq(1)");
	
	
	function productFilterCheck(){
	/*	all
		iceAll
		ice0
		ice1
		productAll
		product0
		product1
		product2
		brandAll
		brand0
		brand1
		brand2
		brand3
		brand4
		price0
		price1
			
		allM
		iceAllM
		ice0M
		ice1M
		productAllM
		product0M
		product1M
		product2M
		brandAllM
		brand0M
		brand1M
		brand2M
		brand3M
		brand4M
		price0M
		price1M*/
	}
	
