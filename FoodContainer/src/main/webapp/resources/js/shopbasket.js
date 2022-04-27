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
		var cart_index = document.getElementsByClassName("cart_indexCheck");
		var rowCnt = cart_index.length;
		
		$("input[name='shopbasketAll']").click(function(){
			var cart_indexArray = $(".cart_indexCheck");
			for(var i=0; i<cart_indexArray.length; i++){
				cart_indexArray[i].checked = this.checked;
			}
			var sum = 0;
			
			$(".shopbasket-card").each(function(){
			if($(this).find(".cart_indexCheck").is(":checked") == true){
				sum += parseInt($(this).find(".productPrice3").html().replace(/,/g,""));
				
			}
			
		    });
		    
			$('.shopbasket-sum2').html(sum.toLocaleString());
		});
		
		
		$(".cart_indexCheck").click(function(){
			if($(".cart_indexCheck:checked").length == rowCnt){
				$("input[name='shopbasketAll']")[0].checked = true;
			}else{
				$("input[name='shopbasketAll']")[0].checked = false;
			}
			
		});
	});
	
function itemSum(obj){
	var sum = 0;
	$(".shopbasket-card").each(function(){
		if($(this).find(".cart_indexCheck").is(":checked") == true){
			sum += parseInt($(this).find(".productPrice3").html().replace(/,/g,""));
			
		}
		
	});
	$('.shopbasket-sum2').html(sum.toLocaleString());
	
}
	
	function chooseDelete(obj){
		var valueArr = new Array();
		var list = $("input[name='cart_index']");
		
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
		var cart_index = $(obj).parent().parent().parent().parent().find("input[name='cart_index']").val();
		var cart_index2 = $(obj).parent().parent().parent().parent().find("input[name='cart_index']");
		
		var confirmProductName = $(obj).parent().parent().find(".confirmProductName").text();
		
		if(cart_index2.is(':checked')){
			var YN = confirm(""+confirmProductName+" 정말 삭제하시겠습니까?");
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
		}else {
			alert('상품을 선택한 후 눌러주세요.');
		}
			
	}
	
	function minusCount(obj){
		var cnt = $(obj).next("div").html();
		var cart_index = $(obj).next().next("input[type='hidden']").val();
		var origin_price = $(obj).parent().parent().find("input[name='origin_price']").val();
		var sale_price = $(obj).parent().parent().find("input[name='sale_price']").val();
		var htmlTag = "<span class='productPrice3'>";
		var htmlTag2 = "</span>";
		
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
				$(obj).parent().parent().find(".productPrice").html(htmlTag+(cnt * origin_price).toLocaleString()+htmlTag2+"원");
				$(obj).parent().parent().find(".productPrice2").html(htmlTag+(cnt * sale_price).toLocaleString()+htmlTag2+"원");
				
				var sum = 0;
				
				$(".shopbasket-card").each(function(){
				if($(this).find("input[name='cart_index']").is(":checked") == true){
					
					sum += parseInt($(this).find(".productPrice3").html().replace(/,/g,""));
					
				}
				
			    });
			    
				$('.shopbasket-sum2').html(sum.toLocaleString());  
			}
		});
	}
	
	function plusCount(obj){
		var cnt = $(obj).prev().prev("div").html();
		var cart_index = $(obj).prev("input[type='hidden']").val();
		var origin_price = $(obj).parent().parent().find("input[name='origin_price']").val();
		var sale_price = $(obj).parent().parent().find("input[name='sale_price']").val();
		var inventory = $(obj).next("input[type='hidden']").val();
		var htmlTag = "<span class='productPrice3'>";
		var htmlTag2 = "</span>";
		
		if(parseInt(inventory) < 10){
			if(parseInt(cnt) >= parseInt(inventory)){
			alert("남은 재고는 "+inventory+"개 입니다.");
			}else {
				cnt++;
			}
		}else if(cnt == 10){
			alert("최대 개수는 10개 입니다.");
		}else {
			cnt++;
		}
		
		

		var html = cnt;
		
		$(obj).prev().prev("div").html(html);
		
		$.ajax({
			url : "cartCount.do",
			type : "post",
			data : "cart_index="+cart_index+"&cnt="+cnt,
			success : function(){
				$(obj).parent().parent().find(".productPrice").html(htmlTag+(cnt * origin_price).toLocaleString()+htmlTag2+"원");
				$(obj).parent().parent().find(".productPrice2").html(htmlTag+(cnt * sale_price).toLocaleString()+htmlTag2+"원");
				
				var sum = 0;
			
				$(".shopbasket-card").each(function(){
				if($(this).find("input[name='cart_index']").is(":checked") == true){
					sum += parseInt($(this).find(".productPrice3").html().replace(/,/g,""));
					
				}
				
			    });
			    
				$('.shopbasket-sum2').html(sum.toLocaleString());
				
			}
		});
	}
	
	function buyProduct(obj){
		
		var form = $('form[name=frm]');
		
		var cart_index = $(obj).parent().parent().parent().parent().find("input[name='cart_index']");
		var totalPrice = $('.shopbasket-sum2').html();
		
		if(cart_index.is(':checked')){
			var YN = confirm("총 금액 "+totalPrice.toLocaleString()+"원 구매 하시겠습니까?"); 
			if(YN){
				form.submit();
			}
		}else {
			alert('선택한 상품이 없습니다.');
		}
		
	}
	
	function OneBuyProduct(obj){
		
		var form = $('form[name=frm]');
		
		var cart_index = $(obj).parent().parent().parent().parent().find("input[name='cart_index']");
		
		var confirmProductName = $(obj).parent().parent().find(".confirmProductName").text();
		
		if(cart_index.is(':checked')){
			var YN = confirm(""+confirmProductName+" 바로 구매 하시겠습니까?");
	
			if(YN){
				$("input[name='cart_index']").prop('checked',false);
				cart_index.prop('checked',true);
				form.submit();
			}
			
		}else {
			alert('상품을 선택한 후 눌러주세요.');
		}
		
	}
	
	
	// 비회원
	function minusFn(obj){
		var cnt = $(obj).next("div").html();
		var product_index = $(obj).next().next("input[type='hidden']").val();
		var origin_price = $(obj).parent().parent().find("input[name='origin_price']").val();
		var sale_price = $(obj).parent().parent().find("input[name='sale_price']").val();
		var htmlTag = "<span class='productPrice3'>";
		var htmlTag2 = "</span>";
		
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
				$(obj).parent().parent().find("input[type='checkbox']").val(cnt);
				$(obj).parent().parent().find(".productPrice").html(htmlTag+(cnt * origin_price).toLocaleString()+htmlTag2+"원");
				$(obj).parent().parent().find(".productPrice2").html(htmlTag+(cnt * sale_price).toLocaleString()+htmlTag2+"원");
				
				var sum = 0;
				
				$(".shopbasket-card").each(function(){
				if($(this).find("input[type='checkbox']").is(":checked") == true){
					
					sum += parseInt($(this).find(".productPrice3").html().replace(/,/g,""));
					
				}
				
			    });
			    
				$('.shopbasket-sum2').html(sum.toLocaleString());
			}
		});
	}
	
	function plusFn(obj){
		var cnt = $(obj).prev().prev("div").html();
		var product_index = $(obj).prev("input[type='hidden']").val();
		var origin_price = $(obj).parent().parent().find("input[name='origin_price']").val();
		var sale_price = $(obj).parent().parent().find("input[name='sale_price']").val();
		var inventory = $(obj).next("input[type='hidden']").val();
		var htmlTag = "<span class='productPrice3'>";
		var htmlTag2 = "</span>";
		
		if(parseInt(inventory) < 10){
			if(parseInt(cnt) >= parseInt(inventory)){
			alert("남은 재고는 "+inventory+"개 입니다.");
			}else {
				cnt++;
			}
		}else if(cnt == 10){
			alert("최대 개수는 10개 입니다.");
		}else {
			cnt++;
		}

		var html = cnt;
		
		$(obj).prev().prev("div").html(html);
		
		$.ajax({
			url : "shopBasket_main.do",
			type : "get",
			data : "product_index="+product_index+"&cnt="+cnt,
			success : function(){
				$(obj).parent().parent().find("input[type='checkbox']").val(cnt);
				$(obj).parent().parent().find(".productPrice").html(htmlTag+(cnt * origin_price).toLocaleString()+htmlTag2+"원");
				$(obj).parent().parent().find(".productPrice2").html(htmlTag+(cnt * sale_price).toLocaleString()+htmlTag2+"원");
				
				var sum = 0;
			
				$(".shopbasket-card").each(function(){
				if($(this).find("input[type='checkbox']").is(":checked") == true){
					sum += parseInt($(this).find(".productPrice3").html().replace(/,/g,""));
					
				}
				
			    });
			    
				$('.shopbasket-sum2').html(sum.toLocaleString());
			}
		});
	}
	
	function buyProductNon(obj){
		
		var form = $('form[name=frms]');
		
		var cart_index = $(obj).parent().parent().parent().parent().find("input[type='checkbox']");
		var totalPrice = $('.shopbasket-sum2').html();
		
		if(cart_index.is(':checked')){
			var YN = confirm("총 금액 "+totalPrice.toLocaleString()+"원 구매 하시겠습니까?"); 
			if(YN){
				form.submit();
			}
		}else {
			alert('선택한 상품이 없습니다.');
		}
		
	}
	
	function OneBuyProductNon(obj){
		
		var form = $('form[name=frms]');
		
		var cart_index = $(obj).parent().parent().parent().parent().find("input[type='checkbox']");
		
		var confirmProductName = $(obj).parent().parent().find(".confirmProductName").text();
		
		if(cart_index.is(':checked')){
			var YN = confirm(""+confirmProductName+" 바로 구매 하시겠습니까?");
			if(YN){
				$("input[type='checkbox']").prop('checked',false);
				cart_index.prop('checked',true);
				form.submit();
			}	
		}else {
			alert('상품을 선택한 후 눌러주세요.');
		}
	}
	
	function chooseDeleteNon(obj){
		var product_index = new Array();
		var list = $(".cart_indexCheck");
		
		for(var i = 0; i<list.length; i++){
			if(list[i].checked){
				product_index.push(list[i].name);
			}
		}
		if(product_index.length == 0){
			alert('선택된 상품이 없습니다.');
		}else{
			var YN = confirm('정말 삭제하시겠습니까?');
			if(YN){
				$.ajax({
					type : 'POST',
					url : 'chooseShopbasketDeleteNon.do',
					traditional : true,
					data : {
						product_index : product_index
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
	
	function shopbasketDeleteNon(obj){
		var product_index = new Array();
		var list = $(".cart_indexCheck");
		var cart_index = $(obj).parent().parent().parent().parent().find(".cart_indexCheck");
		var confirmProductName = $(obj).parent().parent().find(".confirmProductName").text();
		
		if(cart_index.is(':checked')){
			
			$(".cart_indexCheck").prop('checked',false);
			cart_index.prop('checked',true);
			for(var i = 0; i<list.length; i++){
				if(list[i].checked){
					product_index.push(list[i].name);
				}
			}
			
			var YN = confirm(""+confirmProductName+" 정말 삭제하시겠습니까?");
			if(YN){
				$.ajax({
					type : 'POST',
					url : 'chooseShopbasketDeleteNon.do',
					traditional : true,
					data : {
						product_index : product_index
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
		}else {
			alert('상품을 선택한 후 눌러주세요.');
		}	
	}
	
	
	
	
	
	
	
	
	