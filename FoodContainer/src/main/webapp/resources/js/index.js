/* index =======================================================================*/

	//찜
	function heart(obj){
		var hCheck = obj.getAttribute("src").indexOf("빈하트");
		var loginCheck = $("#pListLoginCheck").val();
		var pIndex = $(obj).parent().prev().val();
		console.log(loginCheck);
		console.log(pIndex);
		if(loginCheck == ""){
			alert("로그인 후 사용 가능합니다.");
		}else{
			if(hCheck > 0){
				obj.setAttribute("src","/FoodContainer/resources/img/찬하트.png");
				
				$.ajax({
					url : "dibsInsert.do",
					type : "get",
					data : "member_index="+loginCheck+"&product_index="+pIndex,
					succese : function(){
						
					}
				});
				
			}else if(hCheck < 0){
				obj.setAttribute("src","/FoodContainer/resources/img/빈하트.png");
				
				$.ajax({
					url : "dibsDelete.do",
					type : "get",
					data : "member_index="+loginCheck+"&product_index="+pIndex,
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
		var invenCnt = $(obj).next().val();
		console.log(invenCnt);
		var inventory = $(".inventory"+invenCnt).val();
		console.log(inventory);
		
		if(inventory < 1){
			$(".cartBack").css("display","block");
				var name = $(obj).parent().prev().prev().find(".productName").html();
				var html = "<br><br> 매진 된 상품입니다.";
					html += "<br><br><button type='button' class='btn btn-secondary' onclick='cartOk()'>확인</button>";
				$(".message").html(html);
		}else{
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
			}else{
				$(".cartBack").css("display","block");
				var name = $(obj).parent().prev().prev().find(".productName").html();
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
	
	//장바구니 모바일
	function indexCart(obj){
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
		/*	var recentHTML = "";
				for(var i=0; i<data.length; i++){
					recentHTML += "<div class='productImg'>";
					recentHTML += "<a href='productView.do?product_index="+data[i].product_index+"'>";
					recentHTML += "<img src='/FoodContainer/resources/img/"+data[i].brand+"/"+data[i].middleSort+"/"+data[i].thumbnail_image+"' class='w-75 img-fluid mt-2 mb-3 border' alt='"+data[i].product_name+"'></img>";
					recentHTML += "</a>";
					recentHTML += "</div>";
				}
				
				$("#recentProduct").html(recentHTML);*/
			},
			error : function(){
				console.log("error");
			}
		});
	}
	
	//배너 클릭
	function bannerFn(obj){
		var linkName=$(obj).next().next("input[name='link']").val();
		var name = linkName.substring(linkName.length-5,linkName.length);
		
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
		if(e.persisted || (window.performance && window.performance.navigation.type == 2)){ //뒤로가기 눌렀을때 로직실행 
			$("#searchValue").val("");
		} 
	}
	