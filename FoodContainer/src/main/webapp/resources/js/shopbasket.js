$(document).ready(function(){
	
	if(window.innerWidth <= 576){
		$(".shopbasket-btn").attr("class","d-grid gap-2 d-md-flex justify-content-md-center mt-2 shopbasket-btn");
		$(".shopbasket-checkbox").addClass("mb-2");
		$(".shopbasket-number").addClass("mt-2");
	}else{
		$(".shopbasket-btn").attr("class","d-grid gap-4 d-md-flex justify-content-md-center mt-2 shopbasket-btn");
		$(".shopbasket-checkbox").removeClass("mb-2");
		$(".shopbasket-number").removeClass("mt-2");
	}
	
	$(window).resize(function() {
			
		if(window.innerWidth <= 576){
			$(".shopbasket-btn").attr("class","d-grid gap-2 d-md-flex justify-content-md-center mt-2 shopbasket-btn");
			$(".shopbasket-checkbox").addClass("mb-2");
			$(".shopbasket-number").addClass("mt-2");
		}else{
			$(".shopbasket-btn").attr("class","d-grid gap-4 d-md-flex justify-content-md-center mt-2 shopbasket-btn");
			$(".shopbasket-checkbox").removeClass("mb-2");
			$(".shopbasket-number").removeClass("mt-2");
		}
		
	});

});

// 장바구니 전체선택
$(function(){
		var shopbasket = document.getElementsByName("shopbasket");
		var rowCnt = shopbasket.length;
		
		$("input[name='shopbasketAll']").click(function(){
			var shopbasketArray = $("input[name=shopbasket]");
			for(var i=0; i<shopbasketArray.length; i++){
				shopbasketArray[i].checked = this.checked;
			}
		});
		
		$("input[name='shopbasket']").click(function(){
			if($("input[name='shopbasket']:checked").length == rowCnt){
				$("input[name='shopbasketAll']")[0].checked = true;
			}else{
				$("input[name='shopbasketAll']")[0].checked = false;
			}
		});
	});
	
	function chooseDelete(obj){
		var valueArr = new Array();
		var list = $("input[name='shopbasket']");
		
		for(var i = 0; i<list.length; i++){
			if(list[i].checked){
				valueArr.push(list[i].value);
			}
		}
		if(valueArr.length == 0){
			alert('선택된 상품이 없습니다.');
		}else{
			var YN = confirm('정말 삭제하시겠습니까?');
			if(YN){
				$.ajax({
					type : 'POST',
					url : 'chooseShopbasketDelete.do',
					traditional : true,
					data : {
						valueArr : valueArr
					},
					success : function(jdata){
						if(jdata = 1){
							alert('삭제되었습니다.');
							window.location.reload();
						}else{
							alert('삭제실패');
						}
					}
				});
			}
		}
	}
	
	function shopbasketDelete(obj){
		var cart_index = $(obj).parent().find("input[name='cart_index']").val();
		var YN = confirm('정말 삭제하시겠습니까?');
			if(YN){
				$.ajax({
					type : 'POST',
					url : 'shopbasketDelete.do',
					data : "cart_index="+cart_index,
					success : function(data){
						if(data = 1){
							alert('삭제되었습니다.');
							window.location.reload();
						}else{
							alert('삭제실패');
						}
					}
				});
			}
	}

	function minusFn(obj){
		var cnt = $(obj).next("div").html();
		var product_index = $(obj).next().next("input[type='hidden']").val();
		
		if(cnt == 1){
			alert("최소 한 개는 선택해야 합니다.");
		}else{
			cnt--;
		}
		var html = cnt;
		
		$(obj).next("div").html(html);
		
		$.ajax({
			url : "shopBasket_main.do",
			type : "get",
			data : "product_index="+product_index+"&cnt="+cnt,
			success : function(){
				
			}
		});
	}
	
	function plusFn(obj){
		var cnt = $(obj).prev().prev("div").html();
		var product_index = $(obj).prev("input[type='hidden']").val();
		
		if(cnt == 10){
			alert("최대 개수는 10개 입니다.");
		}else{
			cnt++;
		}

		var html = cnt;
		
		$(obj).prev().prev("div").html(html);
		
		$.ajax({
			url : "shopBasket_main.do",
			type : "get",
			data : "product_index="+product_index+"&cnt="+cnt,
			success : function(){
				
			}
		});
	}
	
	function minusCount(obj){
		var cnt = $(obj).next("div").html();
		var cart_index = $(obj).next().next("input[type='hidden']").val();
		var origin_price = $(obj).parent().parent().find("input[name='origin_price']").val();
		var sale_price = $(obj).parent().parent().find("input[name='sale_price']").val();
		
		if(cnt == 1){
			alert("최소 한 개는 선택해야 합니다.");
		}else{
			cnt--;
		}
		var html = cnt;
		
		$(obj).next("div").html(html);
		
		$.ajax({
			url : "cartCount.do",
			type : "post",
			data : "cart_index="+cart_index+"&cnt="+cnt,
			success : function(){
				$(obj).parent().parent().find(".productPrice").html((cnt * origin_price).toLocaleString()+"원");
				$(obj).parent().parent().find(".productPrice2").html((cnt * sale_price).toLocaleString()+"원");  
			}
		});
	}
	
	function plusCount(obj){
		var cnt = $(obj).prev().prev("div").html();
		var cart_index = $(obj).prev("input[type='hidden']").val();
		var origin_price = $(obj).parent().parent().find("input[name='origin_price']").val();
		var sale_price = $(obj).parent().parent().find("input[name='sale_price']").val();
		
		if(cnt == 10){
			alert("최대 개수는 10개 입니다.");
		}else{
			cnt++;
		}

		var html = cnt;
		
		$(obj).prev().prev("div").html(html);
		
		$.ajax({
			url : "cartCount.do",
			type : "post",
			data : "cart_index="+cart_index+"&cnt="+cnt,
			success : function(){
				$(obj).parent().parent().find(".productPrice").html((cnt * origin_price).toLocaleString()+"원");
				$(obj).parent().parent().find(".productPrice2").html((cnt * sale_price).toLocaleString()+"원");
			}
		});
	}