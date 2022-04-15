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