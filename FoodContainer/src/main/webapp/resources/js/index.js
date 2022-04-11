/* index =======================================================================*/

	//찜
	function heart(obj){
		var hCheck = obj.getAttribute("src").indexOf("빈하트");
		var loginCheck = $("#pListLoginCheck").val();
		var pIndex = $(obj).parent().prev().val();
		
		if(loginCheck == ""){
			alert("로그인 후 사용 가능합니다.");
		}else{
			if(hCheck > 0){
				obj.setAttribute("src","/controller/resources/img/찬하트.png");
				
				$.ajax({
					url : "dibsInsert.do",
					type : "get",
					data : "member_index="+loginCheck+"&product_index="+pIndex,
					succese : function(){
						
					}
				});
				
			}else if(hCheck < 0){
				obj.setAttribute("src","/controller/resources/img/빈하트.png");
				
				$.ajax({
					url : "dibsDelete.do",
					type : "get",
					data : "member_index="+logingCheck+"&product_index="+pIndex,
					succese : function(){
						
					}
				});
			}	
		}
	}
	//장바구니
	function cart(obj){
		
		var loginCheck = $("#pListLoginCheck").val();
		var pIndex = $(obj).parent().prev().val();
		console.log(loginCheck);
		console.log(pIndex);
		if(loginCheck == ""){
			$(".cartBack").css("display","block");
			var name = $(obj).parent().prev().prev().find(".productName").html();
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
		}
		
	}
	
	//장바구니 모바일
	function indexCart(obj){
		$(".cartBack").css("display","block");
		var name = $(".productNameM").html();
		var html = "<br>&quot;"+name+"&quot;<br> 상품이 장바구니에 담겼습니다.";
			html += "<br><br><button type='button' class='btn btn-secondary' onclick='cartOk()'>확인</button>";
		$(".message").html(html);
	}
	
	//장바구니 확인 알림
	function cartOk(){
		$(".cartBack").css("display","none");
	}
	
	//새로고침 대응 top
	$(document).ready(function(){
		var width = window.innerWidth;
		
		if(width < 575){
			$(".topM").css("display","block");
		}else{
			$(".topM").css("display","none");
		}
		
		//브라우저 사이즈 반응 top
		window.addEventListener("resize",function(){
			var width = window.innerWidth;
		
			if(width < 575){
				$(".topM").css("display","block");
			}else{
				$(".topM").css("display","none");
			}
		})
	})
	
	//할인 적용
	if($(".discount").html() != -1){
		$(".discount").prev().prev().css({"text-decoration-line" : "line-through",
										  "text-decoration-color" : "red"
										});
	}else{
		$(".discount").prev().prev().css({"text-decoration-line" : "none",
										 
										});							
	}
	
	//쿠키데이터
	function productCookie(obj){
		var name=$(obj).next("input[name='index']").val();
		console.log(name);
		
		$.ajax({
			url : "viewProductCookie.do",
			type : "get",
			data : "name="+name,
			success : function(data){
				
			}
		});
	}
	
	window.onpageshow = function(e){ 
		if(event.persisted || (window.performance && window.performance.navigation.type == 2)){ //뒤로가기 눌렀을때 로직실행 
			
		} 
	}

	
	