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
function selectAll(obj)  {
	  const checkboxes 
	       = document.getElementsByName('shopbasket');
	  
	  checkboxes.forEach((checkbox) => {
	    checkbox.checked = obj.checked;
	  })
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