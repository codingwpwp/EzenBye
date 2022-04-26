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
		var inventory = $(".productInventory").html();
		if(num == 10){
			alert("최대 선택 개수는 10개 입니다.");
		}else{
			if(salePrice == -1){
				num++;
				if(num > inventory){
					alert("재고 수량을 초과하였습니다.");
				}else{
					var tPrice = num*price;
					var html = "<i class='bi bi-dash-square-fill' onclick='minusFn(this)'></i> <div class='pCnt'>"+num+"</div> <i class='bi bi-plus-square-fill' onclick='plusFn(this)'></i>";
					$(".totalPrice").html("합계 : <span class='fs-3'>"+tPrice.toLocaleString()+"원</span>");
					$(".productNum").html(html);
					$(".productNumM").html(html);
				}
			}else{
				num++;
				if(num > inventory){
					alert("재고 수량을 초과하였습니다.");
				}else{
					var tPrice = num*salePrice;
					var html = "<i class='bi bi-dash-square-fill' onclick='minusFn(this)'></i> <div class='pCnt'>"+num+"</div> <i class='bi bi-plus-square-fill' onclick='plusFn(this)'></i>";
					$(".totalPrice").html("합계 : <span class='fs-3'>"+tPrice.toLocaleString()+"원</span>");
					$(".productNum").html(html);
					$(".productNumM").html(html);
				}
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
					success : function(){
								
					}
				});
			}else{
				
				$.ajax({
					url : "memberCartInsert.do",
					type : "post",
					data : "product_index="+pIndex+"&member_index="+loginCheck+"&cart_count="+productCnt,
					success : function(){
								
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
	
	//paging
	
	function pagePrev(obj){
		var startPage = $("input[name='startPage']").val();
		
		var pram = document.location.href;
		var product_index = pram.substring(pram.length-5,pram.length);
		
		if(startPage > 1){
			$.ajax({
				url : "productView.do",
				type : "post",
				data : "nowPage="+(startPage-1)+"&product_index="+product_index,
				success : function(data){
					var reviewHTML = "<thead>";
						reviewHTML += "<tr>";
						reviewHTML += "<th scope='col'>별점</th>";
						reviewHTML += "<th scope='col'>리뷰</th>";
						reviewHTML += "<th scope='col'>닉네임</th>";
						reviewHTML += "<th scope='col'>작성일</th>";
						reviewHTML += "</tr>";
						reviewHTML += "</thead>";
						reviewHTML += "<tbody>";
							for(var i=0; i<data.length; i++){
								reviewHTML += "<tr>";
								reviewHTML += "<td>";
								reviewHTML += "<span class='productViewReviewStar'>";
								for(var j=1; j<6; j++){
									if(j <= data[i].star_count){
										reviewHTML += "<i class='bi bi-star-fill'></i>";
									}else{
										reviewHTML += "<i class='bi bi-star'></i>";
									}
								}
								reviewHTML += "<br>";
								reviewHTML += "</span>";
								switch(data[i].star_count){
									case 1 : reviewHTML += "<div style='color:red;'>매우 나빠요</div>";
											 break;
									case 2 : reviewHTML += "<div style='color:tomato;'>나빠요</div>";
											 break;
									case 3 : reviewHTML += "<div>보통</div>";
											 break;
									case 4 : reviewHTML += "<div style='color:green;'>좋아요</div>";
											 break;
									case 5 : reviewHTML += "<div style='color:blue;'>매우 좋아요</div>";
											 break;
								}
								reviewHTML += "</td>";
								reviewHTML += "<td class='reviewContent'>";
								reviewHTML += "<div class='row'>";
								reviewHTML += "<div class='reViewImg col-3 align-self-center'>";
								reviewHTML += "<img src='/FoodContainer/resources/img/mypage/good.jpg' class='img-fluid' alt='good'>";
								reviewHTML += "</div>";
								reviewHTML += "<div class='reviewTitle align-self-center col' data-bs-toggle='collapse' href='#reviewExtend"+i+"' role='button' aria-expanded='false' aria-controls='collapseExample'>";
								reviewHTML += data[i].contents;
								reviewHTML += "</div>";
								reviewHTML += "<div class='col-1 align-self-center'>";
								reviewHTML += "<i class='bi bi-caret-down reviewDown' data-bs-toggle='collapse' href='#reviewExtend"+i+"' role='button' aria-expanded='false' aria-controls='collapseExample'></i>";
								reviewHTML += "</div>";
								reviewHTML += "</div>";
								reviewHTML += "<div class='collapse reviewCard' id='reviewExtend"+i+"'>";
								reviewHTML += "<img src='/FoodContainer/resources/img/mypage/good.jpg' class='img-fluid reviewCardImg' alt='good'>";
								reviewHTML += "<div>"+data[i].contents+"</div>";
								reviewHTML += "</div>";
								reviewHTML += "</td>";
								reviewHTML += "<td>";
								
								var memberHash = $("input[name='memberHash']").val()
								memberHash = memberHash.replace("{","");
								memberHash = memberHash.replace("}","");
								
								for(var m=0; m<memberHash.length; m++){
									memberHash = memberHash.replace(" ","");
								}
								
								var memberHashArr = memberHash.split(",");
								var tempMember = memberHashArr.toString();
								tempMember = tempMember.split("=");
								var memberArr = tempMember.toString();
								memberArr=memberArr.split(",");
								
								for(var k=0; k<memberArr.length; k++){
									if(data[i].member_index == memberArr[k]){
										reviewHTML += memberArr[k+1];
									}
								}
								reviewHTML += "</td>";
								reviewHTML += "<td>"+data[i].review_date+"</td>";
								reviewHTML += "</tr>";
							}
								reviewHTML += "</tbody>";
					
					$("#reviewTable").html(reviewHTML);
					
					var reviewHTMLM = "<thead>";
						reviewHTMLM += "<tr>";
						reviewHTMLM += "<th>리뷰</th>";
						reviewHTMLM += "</tr>";
						reviewHTMLM += "</thead>";
						reviewHTMLM += "<tbody>";
						for(var i=0; i<data.length; i++){
							reviewHTMLM += "<tr>";
							reviewHTMLM += "<td>";
							reviewHTMLM += "<div>";
							reviewHTMLM += "<img src='/FoodContainer/resources/img/mypage/good.jpg' class='img-fluid' alt='good'>";
							reviewHTMLM += "</div>";
							reviewHTMLM += "<div>";
							reviewHTMLM += "<span>";
							
						var memberHash = $("input[name='memberHash']").val()
							memberHash = memberHash.replace("{","");
							memberHash = memberHash.replace("}","");
								
							for(var m=0; m<memberHash.length; m++){
								memberHash = memberHash.replace(" ","");
							}
								
							var memberHashArr = memberHash.split(",");
							var tempMember = memberHashArr.toString();
							tempMember = tempMember.split("=");
							var memberArr = tempMember.toString();
							memberArr=memberArr.split(",");
								
							for(var k=0; k<memberArr.length; k++){
								if(data[i].member_index == memberArr[k]){
									reviewHTMLM += memberArr[k+1];
								}
							}
							
							reviewHTMLM += " | ";
							reviewHTMLM += data[i].review_date;
							reviewHTMLM += "</span>";
							reviewHTMLM += "<div class='productViewReviewStarM'>";
								for(var j=1; j<6; j++){
									if(j <= data[i].star_count){
										reviewHTMLM += "<i class='bi bi-star-fill'></i>";
									}else{
										reviewHTMLM += "<i class='bi bi-star'></i>";
									}
								}
							reviewHTMLM += "</div>";
							reviewHTMLM += "<div>";
							reviewHTMLM += data[i].contents;
							reviewHTMLM += "</div>";
							reviewHTMLM += "</div>";
							reviewHTMLM += "</td>";
							reviewHTMLM += "</tr>";
						}
							reviewHTMLM += "</tbody>";
							
					$("#reviewTableM").html(reviewHTMLM);
					
				},
				error : function(){
					console.log("error");
				}
			});
			
		}
		if(startPage > 1){
			startPage--;
			$("input[name='startPage']").val(startPage);
		}
	}
	
	function pageNext(obj){
		var endPage = $("input[name='endPage']").val();
		var lastPage = $("input[name='lastPage']").val();
		var pram = document.location.href;
		var product_index = pram.substring(pram.length-5,pram.length);
		
		var startPageNum = $("input[name='startPage']").val();
		if(startPageNum < lastPage){
			startPageNum++;
			$("input[name='startPage']").val(startPageNum);
		}
		
		if(endPage != lastPage){
			$.ajax({
				url : "productView.do",
				type : "post",
				data : "nowPage="+(endPage+1)+"&product_index="+product_index,
				success : function(data){
					var reviewHTML = "<thead>";
						reviewHTML += "<tr>";
						reviewHTML += "<th scope='col'>별점</th>";
						reviewHTML += "<th scope='col'>리뷰</th>";
						reviewHTML += "<th scope='col'>닉네임</th>";
						reviewHTML += "<th scope='col'>작성일</th>";
						reviewHTML += "</tr>";
						reviewHTML += "</thead>";
						reviewHTML += "<tbody>";
							for(var i=0; i<data.length; i++){
								reviewHTML += "<tr>";
								reviewHTML += "<td>";
								reviewHTML += "<span class='productViewReviewStar'>";
								for(var j=1; j<6; j++){
									if(j <= data[i].star_count){
										reviewHTML += "<i class='bi bi-star-fill'></i>";
									}else{
										reviewHTML += "<i class='bi bi-star'></i>";
									}
								}
								reviewHTML += "<br>";
								reviewHTML += "</span>";
								switch(data[i].star_count){
									case 1 : reviewHTML += "<div style='color:red;'>매우 나빠요</div>";
											 break;
									case 2 : reviewHTML += "<div style='color:tomato;'>나빠요</div>";
											 break;
									case 3 : reviewHTML += "<div>보통</div>";
											 break;
									case 4 : reviewHTML += "<div style='color:green;'>좋아요</div>";
											 break;
									case 5 : reviewHTML += "<div style='color:blue;'>매우 좋아요</div>";
											 break;
								}
								reviewHTML += "</td>";
								reviewHTML += "<td class='reviewContent'>";
								reviewHTML += "<div class='row'>";
								reviewHTML += "<div class='reViewImg col-3 align-self-center'>";
								reviewHTML += "<img src='/FoodContainer/resources/img/mypage/good.jpg' class='img-fluid' alt='good'>";
								reviewHTML += "</div>";
								reviewHTML += "<div class='reviewTitle align-self-center col' data-bs-toggle='collapse' href='#reviewExtend"+i+"' role='button' aria-expanded='false' aria-controls='collapseExample'>";
								reviewHTML += data[i].contents;
								reviewHTML += "</div>";
								reviewHTML += "<div class='col-1 align-self-center'>";
								reviewHTML += "<i class='bi bi-caret-down reviewDown' data-bs-toggle='collapse' href='#reviewExtend"+i+"' role='button' aria-expanded='false' aria-controls='collapseExample'></i>";
								reviewHTML += "</div>";
								reviewHTML += "</div>";
								reviewHTML += "<div class='collapse reviewCard' id='reviewExtend"+i+"'>";
								reviewHTML += "<img src='/FoodContainer/resources/img/mypage/good.jpg' class='img-fluid reviewCardImg' alt='good'>";
								reviewHTML += "<div>"+data[i].contents+"</div>";
								reviewHTML += "</div>";
								reviewHTML += "</td>";
								reviewHTML += "<td>";
								
								var memberHash = $("input[name='memberHash']").val()
								memberHash = memberHash.replace("{","");
								memberHash = memberHash.replace("}","");
								
								for(var m=0; m<memberHash.length; m++){
									memberHash = memberHash.replace(" ","");
								}
								
								var memberHashArr = memberHash.split(",");
								var tempMember = memberHashArr.toString();
								tempMember = tempMember.split("=");
								var memberArr = tempMember.toString();
								memberArr=memberArr.split(",");
								
								for(var k=0; k<memberArr.length; k++){
									if(data[i].member_index == memberArr[k]){
										reviewHTML += memberArr[k+1];
									}
								}
								reviewHTML += "</td>";
								reviewHTML += "<td>"+data[i].review_date+"</td>";
								reviewHTML += "</tr>";
							}
								reviewHTML += "</tbody>";
					
					$("#reviewTable").html(reviewHTML);
					
					var reviewHTMLM = "<thead>";
						reviewHTMLM += "<tr>";
						reviewHTMLM += "<th>리뷰</th>";
						reviewHTMLM += "</tr>";
						reviewHTMLM += "</thead>";
						reviewHTMLM += "<tbody>";
						for(var i=0; i<data.length; i++){
							reviewHTMLM += "<tr>";
							reviewHTMLM += "<td>";
							reviewHTMLM += "<div>";
							reviewHTMLM += "<img src='/FoodContainer/resources/img/mypage/good.jpg' class='img-fluid' alt='good'>";
							reviewHTMLM += "</div>";
							reviewHTMLM += "<div>";
							reviewHTMLM += "<span>";
							
						var memberHash = $("input[name='memberHash']").val()
							memberHash = memberHash.replace("{","");
							memberHash = memberHash.replace("}","");
								
							for(var m=0; m<memberHash.length; m++){
								memberHash = memberHash.replace(" ","");
							}
								
							var memberHashArr = memberHash.split(",");
							var tempMember = memberHashArr.toString();
							tempMember = tempMember.split("=");
							var memberArr = tempMember.toString();
							memberArr=memberArr.split(",");
								
							for(var k=0; k<memberArr.length; k++){
								if(data[i].member_index == memberArr[k]){
									reviewHTMLM += memberArr[k+1];
								}
							}
							
							reviewHTMLM += " | ";
							reviewHTMLM += data[i].review_date;
							reviewHTMLM += "</span>";
							reviewHTMLM += "<div class='productViewReviewStarM'>";
								for(var j=1; j<6; j++){
									if(j <= data[i].star_count){
										reviewHTMLM += "<i class='bi bi-star-fill'></i>";
									}else{
										reviewHTMLM += "<i class='bi bi-star'></i>";
									}
								}
							reviewHTMLM += "</div>";
							reviewHTMLM += "<div>";
							reviewHTMLM += data[i].contents;
							reviewHTMLM += "</div>";
							reviewHTMLM += "</div>";
							reviewHTMLM += "</td>";
							reviewHTMLM += "</tr>";
						}
							reviewHTMLM += "</tbody>";
							
					$("#reviewTableM").html(reviewHTMLM);
				}
			});
		}else{
			$.ajax({
				url : "productView.do",
				type : "post",
				data : "nowPage="+endPage+"&product_index="+product_index,
				success : function(data){
					var reviewHTML = "<thead>";
						reviewHTML += "<tr>";
						reviewHTML += "<th scope='col'>별점</th>";
						reviewHTML += "<th scope='col'>리뷰</th>";
						reviewHTML += "<th scope='col'>닉네임</th>";
						reviewHTML += "<th scope='col'>작성일</th>";
						reviewHTML += "</tr>";
						reviewHTML += "</thead>";
						reviewHTML += "<tbody>";
							for(var i=0; i<data.length; i++){
								reviewHTML += "<tr>";
								reviewHTML += "<td>";
								reviewHTML += "<span class='productViewReviewStar'>";
								for(var j=1; j<6; j++){
									if(j <= data[i].star_count){
										reviewHTML += "<i class='bi bi-star-fill'></i>";
									}else{
										reviewHTML += "<i class='bi bi-star'></i>";
									}
								}
								reviewHTML += "<br>";
								reviewHTML += "</span>";
								switch(data[i].star_count){
									case 1 : reviewHTML += "<div style='color:red;'>매우 나빠요</div>";
											 break;
									case 2 : reviewHTML += "<div style='color:tomato;'>나빠요</div>";
											 break;
									case 3 : reviewHTML += "<div>보통</div>";
											 break;
									case 4 : reviewHTML += "<div style='color:green;'>좋아요</div>";
											 break;
									case 5 : reviewHTML += "<div style='color:blue;'>매우 좋아요</div>";
											 break;
								}
								reviewHTML += "</td>";
								reviewHTML += "<td class='reviewContent'>";
								reviewHTML += "<div class='row'>";
								reviewHTML += "<div class='reViewImg col-3 align-self-center'>";
								reviewHTML += "<img src='/FoodContainer/resources/img/mypage/good.jpg' class='img-fluid' alt='good'>";
								reviewHTML += "</div>";
								reviewHTML += "<div class='reviewTitle align-self-center col' data-bs-toggle='collapse' href='#reviewExtend"+i+"' role='button' aria-expanded='false' aria-controls='collapseExample'>";
								reviewHTML += data[i].contents;
								reviewHTML += "</div>";
								reviewHTML += "<div class='col-1 align-self-center'>";
								reviewHTML += "<i class='bi bi-caret-down reviewDown' data-bs-toggle='collapse' href='#reviewExtend"+i+"' role='button' aria-expanded='false' aria-controls='collapseExample'></i>";
								reviewHTML += "</div>";
								reviewHTML += "</div>";
								reviewHTML += "<div class='collapse reviewCard' id='reviewExtend"+i+"'>";
								reviewHTML += "<img src='/FoodContainer/resources/img/mypage/good.jpg' class='img-fluid reviewCardImg' alt='good'>";
								reviewHTML += "<div>"+data[i].contents+"</div>";
								reviewHTML += "</div>";
								reviewHTML += "</td>";
								reviewHTML += "<td>";
								
								var memberHash = $("input[name='memberHash']").val()
								memberHash = memberHash.replace("{","");
								memberHash = memberHash.replace("}","");
								
								for(var m=0; m<memberHash.length; m++){
									memberHash = memberHash.replace(" ","");
								}
								
								var memberHashArr = memberHash.split(",");
								var tempMember = memberHashArr.toString();
								tempMember = tempMember.split("=");
								var memberArr = tempMember.toString();
								memberArr=memberArr.split(",");
								
								for(var k=0; k<memberArr.length; k++){
									if(data[i].member_index == memberArr[k]){
										reviewHTML += memberArr[k+1];
									}
								}
								reviewHTML += "</td>";
								reviewHTML += "<td>"+data[i].review_date+"</td>";
								reviewHTML += "</tr>";
							}
								reviewHTML += "</tbody>";
					
					$("#reviewTable").html(reviewHTML);
					
					var reviewHTMLM = "<thead>";
						reviewHTMLM += "<tr>";
						reviewHTMLM += "<th>리뷰</th>";
						reviewHTMLM += "</tr>";
						reviewHTMLM += "</thead>";
						reviewHTMLM += "<tbody>";
						for(var i=0; i<data.length; i++){
							reviewHTMLM += "<tr>";
							reviewHTMLM += "<td>";
							reviewHTMLM += "<div>";
							reviewHTMLM += "<img src='/FoodContainer/resources/img/mypage/good.jpg' class='img-fluid' alt='good'>";
							reviewHTMLM += "</div>";
							reviewHTMLM += "<div>";
							reviewHTMLM += "<span>";
							
						var memberHash = $("input[name='memberHash']").val()
							memberHash = memberHash.replace("{","");
							memberHash = memberHash.replace("}","");
								
							for(var m=0; m<memberHash.length; m++){
								memberHash = memberHash.replace(" ","");
							}
								
							var memberHashArr = memberHash.split(",");
							var tempMember = memberHashArr.toString();
							tempMember = tempMember.split("=");
							var memberArr = tempMember.toString();
							memberArr=memberArr.split(",");
								
							for(var k=0; k<memberArr.length; k++){
								if(data[i].member_index == memberArr[k]){
									reviewHTMLM += memberArr[k+1];
								}
							}
							
							reviewHTMLM += " | ";
							reviewHTMLM += data[i].review_date;
							reviewHTMLM += "</span>";
							reviewHTMLM += "<div class='productViewReviewStarM'>";
								for(var j=1; j<6; j++){
									if(j <= data[i].star_count){
										reviewHTMLM += "<i class='bi bi-star-fill'></i>";
									}else{
										reviewHTMLM += "<i class='bi bi-star'></i>";
									}
								}
							reviewHTMLM += "</div>";
							reviewHTMLM += "<div>";
							reviewHTMLM += data[i].contents;
							reviewHTMLM += "</div>";
							reviewHTMLM += "</div>";
							reviewHTMLM += "</td>";
							reviewHTMLM += "</tr>";
						}
							reviewHTMLM += "</tbody>";
							
					$("#reviewTableM").html(reviewHTMLM);
				}
			});
		}
	}
	
	function pageMove(obj){
		var nowPage = $(obj).next().val();
		var pram = document.location.href;
		var product_index = pram.substring(pram.length-5,pram.length);
		
		$("input[name='startPage']").val(nowPage);
		
		
		$.ajax({
				url : "productView.do",
				type : "post",
				data : "nowPage="+nowPage+"&product_index="+product_index,
				success : function(data){
					var reviewHTML = "<thead>";
						reviewHTML += "<tr>";
						reviewHTML += "<th scope='col'>별점</th>";
						reviewHTML += "<th scope='col'>리뷰</th>";
						reviewHTML += "<th scope='col'>닉네임</th>";
						reviewHTML += "<th scope='col'>작성일</th>";
						reviewHTML += "</tr>";
						reviewHTML += "</thead>";
						reviewHTML += "<tbody>";
							for(var i=0; i<data.length; i++){
								reviewHTML += "<tr>";
								reviewHTML += "<td>";
								reviewHTML += "<span class='productViewReviewStar'>";
								for(var j=1; j<6; j++){
									if(j <= data[i].star_count){
										reviewHTML += "<i class='bi bi-star-fill'></i>";
									}else{
										reviewHTML += "<i class='bi bi-star'></i>";
									}
								}
								reviewHTML += "<br>";
								reviewHTML += "</span>";
								switch(data[i].star_count){
									case 1 : reviewHTML += "<div style='color:red;'>매우 나빠요</div>";
											 break;
									case 2 : reviewHTML += "<div style='color:tomato;'>나빠요</div>";
											 break;
									case 3 : reviewHTML += "<div>보통</div>";
											 break;
									case 4 : reviewHTML += "<div style='color:green;'>좋아요</div>";
											 break;
									case 5 : reviewHTML += "<div style='color:blue;'>매우 좋아요</div>";
											 break;
								}
								reviewHTML += "</td>";
								reviewHTML += "<td class='reviewContent'>";
								reviewHTML += "<div class='row'>";
								reviewHTML += "<div class='reViewImg col-3 align-self-center'>";
								reviewHTML += "<img src='/FoodContainer/resources/img/mypage/good.jpg' class='img-fluid' alt='good'>";
								reviewHTML += "</div>";
								reviewHTML += "<div class='reviewTitle align-self-center col' data-bs-toggle='collapse' href='#reviewExtend"+i+"' role='button' aria-expanded='false' aria-controls='collapseExample'>";
								reviewHTML += data[i].contents;
								reviewHTML += "</div>";
								reviewHTML += "<div class='col-1 align-self-center'>";
								reviewHTML += "<i class='bi bi-caret-down reviewDown' data-bs-toggle='collapse' href='#reviewExtend"+i+"' role='button' aria-expanded='false' aria-controls='collapseExample'></i>";
								reviewHTML += "</div>";
								reviewHTML += "</div>";
								reviewHTML += "<div class='collapse reviewCard' id='reviewExtend"+i+"'>";
								reviewHTML += "<img src='/FoodContainer/resources/img/mypage/good.jpg' class='img-fluid reviewCardImg' alt='good'>";
								reviewHTML += "<div>"+data[i].contents+"</div>";
								reviewHTML += "</div>";
								reviewHTML += "</td>";
								reviewHTML += "<td>";
								
								var memberHash = $("input[name='memberHash']").val()
								memberHash = memberHash.replace("{","");
								memberHash = memberHash.replace("}","");
								
								for(var m=0; m<memberHash.length; m++){
									memberHash = memberHash.replace(" ","");
								}
								
								var memberHashArr = memberHash.split(",");
								var tempMember = memberHashArr.toString();
								tempMember = tempMember.split("=");
								var memberArr = tempMember.toString();
								memberArr=memberArr.split(",");
								
								for(var k=0; k<memberArr.length; k++){
									if(data[i].member_index == memberArr[k]){
										reviewHTML += memberArr[k+1];
									}
								}
								reviewHTML += "</td>";
								reviewHTML += "<td>"+data[i].review_date+"</td>";
								reviewHTML += "</tr>";
							}
								reviewHTML += "</tbody>";
					
					$("#reviewTable").html(reviewHTML);
					
					
					var reviewHTMLM = "<thead>";
						reviewHTMLM += "<tr>";
						reviewHTMLM += "<th>리뷰</th>";
						reviewHTMLM += "</tr>";
						reviewHTMLM += "</thead>";
						reviewHTMLM += "<tbody>";
						for(var i=0; i<data.length; i++){
							reviewHTMLM += "<tr>";
							reviewHTMLM += "<td>";
							reviewHTMLM += "<div>";
							reviewHTMLM += "<img src='/FoodContainer/resources/img/mypage/good.jpg' class='img-fluid' alt='good'>";
							reviewHTMLM += "</div>";
							reviewHTMLM += "<div>";
							reviewHTMLM += "<span>";
							
						var memberHash = $("input[name='memberHash']").val()
							memberHash = memberHash.replace("{","");
							memberHash = memberHash.replace("}","");
								
							for(var m=0; m<memberHash.length; m++){
								memberHash = memberHash.replace(" ","");
							}
								
							var memberHashArr = memberHash.split(",");
							var tempMember = memberHashArr.toString();
							tempMember = tempMember.split("=");
							var memberArr = tempMember.toString();
							memberArr=memberArr.split(",");
								
							for(var k=0; k<memberArr.length; k++){
								if(data[i].member_index == memberArr[k]){
									reviewHTMLM += memberArr[k+1];
								}
							}
							
							reviewHTMLM += " | ";
							reviewHTMLM += data[i].review_date;
							reviewHTMLM += "</span>";
							reviewHTMLM += "<div class='productViewReviewStarM'>";
								for(var j=1; j<6; j++){
									if(j <= data[i].star_count){
										reviewHTMLM += "<i class='bi bi-star-fill'></i>";
									}else{
										reviewHTMLM += "<i class='bi bi-star'></i>";
									}
								}
							reviewHTMLM += "</div>";
							reviewHTMLM += "<div>";
							reviewHTMLM += data[i].contents;
							reviewHTMLM += "</div>";
							reviewHTMLM += "</div>";
							reviewHTMLM += "</td>";
							reviewHTMLM += "</tr>";
						}
							reviewHTMLM += "</tbody>";
							
					$("#reviewTableM").html(reviewHTMLM);
				}
		});
	}
	
	
