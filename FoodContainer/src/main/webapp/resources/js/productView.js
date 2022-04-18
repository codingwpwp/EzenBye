/* productView =======================================================================*/
	
	if($(".viewDiscount").html() != -1){
		$(".viewDiscount").prev().prev().css({"text-decoration-line" : "line-through",
										  "text-decoration-color" : "red"
										});
		$(".viewDiscount").css("color","red");
	}else{
		$(".viewDiscount").prev().prev().css({"text-decoration-line" : "none",
										 
										});							
	}
	
	
	//상품 개수
	function plusFn(obj){
		var num = $(".pCnt").html();
		var price = $(".mdPrice").find("input[name='origin_price']").val();
		var salePrice = $(".mdPrice").find("input[name='sale_price']").val();
		if(num == 10){
			alert("최대 선택 개수는 10개 입니다.");
		}else{
			if(salePrice == -1){
				num++;
				var tPrice = num*price;
				var html = "<i class='bi bi-dash-square-fill' onclick='minusFn(this)'></i> <div class='pCnt'>"+num+"</div> <i class='bi bi-plus-square-fill' onclick='plusFn(this)'></i>";
				$(".totalPrice").html("합계 : <span class='fs-3'>"+tPrice.toLocaleString()+"원</span>");
				$(".productNum").html(html);
				$(".productNumM").html(html);
			}else{
				num++;
				var tPrice = num*salePrice;
				var html = "<i class='bi bi-dash-square-fill' onclick='minusFn(this)'></i> <div class='pCnt'>"+num+"</div> <i class='bi bi-plus-square-fill' onclick='plusFn(this)'></i>";
				$(".totalPrice").html("합계 : <span class='fs-3'>"+tPrice.toLocaleString()+"원</span>");
				$(".productNum").html(html);
				$(".productNumM").html(html);
			}
		}
	}
		
	function minusFn(obj){
		var num = $(".pCnt").html();
		var price = $(".mdPrice").find("input[name='origin_price']").val();
		var salePrice = $(".mdPrice").find("input[name='sale_price']").val();
			
		if(num == 1){
			alert("최소 1개는 선택해야 합니다.");
		}else{
			if(salePrice == -1){
				num--;
				var tPrice = num*price;
				var html = "<i class='bi bi-dash-square-fill' onclick='minusFn(this)'></i> <div class='pCnt'>"+num+"</div> <i class='bi bi-plus-square-fill' onclick='plusFn(this)'></i>";
				$(".totalPrice").html("합계 : <span class='fs-3'>"+tPrice.toLocaleString()+"원</span>");
				$(".productNum").html(html);
				$(".productNumM").html(html);
			}else{
				num--;
				var tPrice = num*salePrice;
				var html = "<i class='bi bi-dash-square-fill' onclick='minusFn(this)'></i> <div class='pCnt'>"+num+"</div> <i class='bi bi-plus-square-fill' onclick='plusFn(this)'></i>";
				$(".totalPrice").html("합계 : <span class='fs-3'>"+tPrice.toLocaleString()+"원</span>");
				$(".productNum").html(html);
				$(".productNumM").html(html);
			}
		}
	}
	
	//펼치기
	var unfoldCheck = 0;
	function unfold(){
		$(".plusView").css("display","none");
		$(".unfold").css("height", "100%");
		unfoldCheck = 1;
	}

	
	//펼쳤을 때만 클릭 시 이동
	function subRadio1(){
		if(unfoldCheck == 1){
			location.href = "#pView";
		}
	}
	
	function subRadio2(){
		if(unfoldCheck == 1){
			location.href = "#pDelivery";
		}
	}
	
	function subRadio3(){
		if(unfoldCheck == 1){
			location.href = "#pCancel";
		}
	}
	
	function subRadio4(){
		location.href = "#reviewTop";
	}
		
		
	//서브메뉴그룹
	window.addEventListener("scroll", function(){
		if(unfoldCheck == 1){
			var scrollLocation = window.scrollY;
			var pViewTop = $("#pView").offset().top;
				pViewTop = pViewTop - 40;
			var pDeliveryTop = $("#pDelivery").offset().top;
				pDeliveryTop = pDeliveryTop - 60;
			var pCancelTop = $("#pCancel").offset().top;
				pCancelTop = pCancelTop - 60;
			var reviewTop = $("#review").offset().top;
				reviewTop = reviewTop - 80;
				
			var check = $("input[name='subRadio']:checked");
			var notCheck = $("input[name='subRadio']:not(:checked)");
			
			var width = window.innerWidth;
				
			check.next().css({
								"background-color" : "#6c757d",
								"color" : "white"
							});
								
			notCheck.next().css({
								"background-color" : "white",
								"color" : "#6c757d"
							});				
				
			if(scrollLocation >= pViewTop && scrollLocation < pDeliveryTop){
					$(".subMenuGroup").css({"position" : "fixed", 
											"top" : "0px",
											"left" : "0px",
											"width" : "100%"
											});
					$("#subRadio1").prop("checked",true);
					
					if(width > 600){
						$("#pViewleft").css("display","inline-block");
					}else{
						$("#pViewleft").css("display","none");
						$(".bottomTooltip").css("display","none");
						$(".bottomTooltipSold").css("display","none");
					}
				}else if(scrollLocation < pViewTop){
					$(".subMenuGroup").css("position","static");
					$("#subRadio1").prop("checked",false);
					$("#pViewleft").css("display","none");
					$(".bottomTooltip").css("display","none");
					$(".bottomTooltipSold").css("display","none");
				}else if(scrollLocation >= (pDeliveryTop) && scrollLocation < pCancelTop){
					$("#subRadio2").prop("checked",true);
				}else if(scrollLocation >= pCancelTop && scrollLocation < reviewTop){
					$("#subRadio3").prop("checked",true);
				}else if(scrollLocation >= reviewTop){
					$("#subRadio4").prop("checked",true);
				}
		}
	})
	
	//새로고침 대응
	$(document).ready(function(){
		var width = window.innerWidth;
			
			if(width < 1100){
				$(".viewButton:eq(0)").html("장바구니");
			}else{
				$(".viewButton:eq(0)").html("장바구니 담기");
			}
			
			if(width < 600){
				$(".subMenuGroup").find("input:eq(0)").next("label").html("상세");
				$(".subMenuGroup").find("input:eq(1)").next("label").html("배송");
				$(".subMenuGroup").find("input:eq(2)").next("label").html("취소");
			}else{
				$(".subMenuGroup").find("input:eq(0)").next("label").html("상세 정보");
				$(".subMenuGroup").find("input:eq(1)").next("label").html("배송 정보");
				$(".subMenuGroup").find("input:eq(2)").next("label").html("취소 규정");
			}
	})

	//모바일 서브메뉴 그룹
	window.addEventListener("resize",function(){
		var width = window.innerWidth;
			
		if(width < 1100){
			$(".viewButton:eq(0)").html("장바구니");
		}else{
			$(".viewButton:eq(0)").html("장바구니 담기");
		}
			
		if(width < 600){
			$(".subMenuGroup").find("input:eq(0)").next("label").html("상세");
			$(".subMenuGroup").find("input:eq(1)").next("label").html("배송");
			$(".subMenuGroup").find("input:eq(2)").next("label").html("취소");
		}else{
			$(".subMenuGroup").find("input:eq(0)").next("label").html("상세 정보");
			$(".subMenuGroup").find("input:eq(1)").next("label").html("배송 정보");
			$(".subMenuGroup").find("input:eq(2)").next("label").html("취소 규정");
		}
	})
	
	//툴팁
	function viewCart(obj){
		var loginCheck = $("#viewLoginCheck").val();
		var pram = document.location.href;
		var pIndex = pram.substring(pram.length-5,pram.length);
		var productCnt = $(".pCnt").html();
		console.log(loginCheck);
		console.log(pIndex);
		
		var inventory = $(".inventory").val();
		
		if(inventory < 1){
			$(".topTooltipSold").css("display","inline-block");
			$(".outter").css("display","block");
		}else{
			$(".topTooltip").css("display","inline-block");
			$(".outter").css("display","block");
			
			if(loginCheck == ""){
				
				$.ajax({
					url : "noMemberCartCookie.do",
					type : "get",
					data : "product_index="+pIndex+"&productCnt="+productCnt,
					succese : function(){
								
					}
				});
			}else{
				
				$.ajax({
					url : "memberCartInsert.do",
					type : "post",
					data : "product_index="+pIndex+"&member_index="+loginCheck+"&cart_count="+productCnt,
					succese : function(){
								
					}
				});
			}
		}
	}
	
	function viewCartBottom(obj){
		var loginCheck = $("#viewLoginCheck").val();
		var pram = document.location.href;
		var pIndex = pram.substring(pram.length-5,pram.length);
		var productCnt = $(".pCnt").html();
		console.log(loginCheck);
		console.log(pIndex);
		
		var inventory = $(".inventory").val();
		
		if(inventory < 1){
			$(".bottomTooltipSold").css("display","inline-block");
			$(".outter").css("display","block");
		}else{
			$(".bottomTooltip").css("display","inline-block");
			$(".outter").css("display","block");
			
			if(loginCheck == ""){
				
				$.ajax({
					url : "noMemberCartCookie.do",
					type : "get",
					data : "product_index="+pIndex+"&productCnt="+productCnt,
					succese : function(){
								
					}
				});
			}else{
				
				$.ajax({
					url : "memberCartInsert.do",
					type : "post",
					data : "product_index="+pIndex+"&member_index="+loginCheck+"&cart_count="+productCnt,
					succese : function(){
								
					}
				});
			}
		}
	}
	
	function shopping(obj){
		$(".topTooltip").css("display","none");
		$(".bottomTooltip").css("display","none");
	}
	
	function moveCart(obj){
		location.href = "shopBasket_main.do";
	}
	
	function outter(){
		$(".topTooltip").css("display","none");
		$(".topTooltipSold").css("display","none");
		$(".bottomTooltip").css("display","none");
		$(".bottomTooltipSold").css("display","none");
		$(".outter").css("display","none");
	}
	
	function directBuy(obj){
		
		var inventory = $(".inventory").val();
		
		if(inventory != 0){
			
			location.href="purchase/certification.do";
			
			var pram = document.location.href;
			var product_index = pram.substring(pram.length-5,pram.length);
			var prodcut_count = $(".pCnt").html();
			
			var form = document.createElement('form');
	    
		    var tag;
		    tag = document.createElement('input');
		    tag.setAttribute('type', 'hidden');
		    tag.setAttribute('name', product_index);
		    tag.setAttribute('value', prodcut_count);
		    
		    form.appendChild(tag);
		    form.setAttribute('method', 'post');
		    form.setAttribute('action', 'purchase/certification.do');
		    document.body.appendChild(form);
		    form.submit();
		}


	}
	
