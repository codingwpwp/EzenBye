/* index =======================================================================*/

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
		var name = $(obj).parent().prev().prev().find(".productName").html();
		var html = "<br>&quot;"+name+"&quot;<br> 상품이 장바구니에 담겼습니다.";
			html += "<br><br><button type='button' class='btn btn-secondary' onclick='cartOk()'>확인</button>";
		$(".message").html(html);
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
	var discount = $(".discount").html();
	
	if(discount != ""){
		$(".discount").html("<i class='bi bi-arrow-return-right'></i> " + discount + "원<br>");
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
	
	