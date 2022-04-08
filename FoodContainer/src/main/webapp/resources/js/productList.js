/* productList =======================================================================*/
	
	var discountM = $(".discountM").html();
	
	if(discountM != ""){
		$(".discountM").prev().css({"text-decoration-line" : "line-through",
									"text-decoration-color" : "red"
								});
		$(".discountM").html("<i class='bi bi-arrow-return-right'></i> " + discountM + "원");						
		$(".discountM").css("color","red");
	}else{
		$(".discountM").prev().css({"text-decoration-line" : "none"});
	}
	
	var pListPopular = $(".productListContent").find("span:eq(0)").html();
	
	if(pListPopular == ""){
		$(".indexSubImgM").css("top","-16px");
	}else{
		$(".indexSubImgM").css("top","-40px");
	}
	
	//찜
	function pListHeart(obj){
		var hCheck = obj.getAttribute("src").indexOf("빈하트");
		var logingCheck = $("input[name='pListLoginCheck']").val();
		
		if(logingCheck == null){
			alert("로그인 후 사용 가능합니다.");
		}else{
			if(hCheck > 0){
				obj.setAttribute("src","/controller/resources/img/찬하트.png");
			}else if(hCheck < 0){
				obj.setAttribute("src","/controller/resources/img/빈하트.png");
			}	
		}
			

	}
	//장바구니
	function pListCart(obj){
		$(".cartBack").css("display","block");
		var name = $(".productNameM").html();
		var html = "<br>&quot;"+name+"&quot;<br> 상품이 장바구니에 담겼습니다.";
			html += "<br><br><button onclick='cartOk()''>확인</button>";
		$(".message").html(html);
	}
	//장바구니 확인 알림
	function cartOk(){
		$(".cartBack").css("display","none");
	}