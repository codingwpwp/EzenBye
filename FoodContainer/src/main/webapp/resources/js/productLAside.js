/* lAside =======================================================================*/

	//펼칠 때 아이콘 변경
	function extendIce(obj){
		var expand = $(obj).attr("aria-expanded");
		
		if(expand == "true"){
			$(".ice").find("i").attr("class","bi bi-dash-circle-fill");
		}else{
			$(".ice").find("i").attr("class","bi bi-plus-circle-dotted");
		}
	}
	
	function extendProduct(obj){
		var expand = $(obj).attr("aria-expanded");
		
		if(expand == "true"){
			$(".product").find("i").attr("class","bi bi-dash-circle-fill");
		}else{
			$(".product").find("i").attr("class","bi bi-plus-circle-dotted");
		}
	}
	
	function extendBrand(obj){
		var expand = $(obj).attr("aria-expanded");
		
		if(expand == "true"){
			$(".brand").find("i").attr("class","bi bi-dash-circle-fill");
		}else{
			$(".brand").find("i").attr("class","bi bi-plus-circle-dotted");
		}
	}
	
	function extendPrice(obj){
		var expand = $(obj).attr("aria-expanded");
		
		if(expand == "true"){
			$(".price").find("i").attr("class","bi bi-dash-circle-fill");
		}else{
			$(".price").find("i").attr("class","bi bi-plus-circle-dotted");
		}
	}
	
	window.onload = function(){
	  //pc화면 - 처음 또는 새로고침 시 전체선택
	  	//전체식품
	  	var all = $("button[name='lAsideProductAll']");
		//냉동식품
		var iceAll = $("input[name='asideIceAll']");
		var ice = $("input[name='asideIce']");
		//즉석식품
		var productAll = $("input[name='asideProductAll']");
		var product = $("input[name='asideProduct']");
		//브랜드
		var brandAll = $("input[name='asideBrandAll']");
		var brand = $("input[name='asideBrand']");
		//가격
		var price = $("input[name='asidePrice']");
		
		var url = document.location.href;
		var param = decodeURI(decodeURIComponent(url)).split(".");
			
		if(param[1] == "do"){
			iceAll.prop("checked",true);
			ice.prop("checked",true);
			productAll.prop("checked",true);
			product.prop("checked",true);
			brandAll.prop("checked",true);
			brand.prop("checked",true);
			price.prop("checked",true);
			all.find("i").attr("class","bi bi-check-circle-fill");
		}
		
	  //모바일 화면 - 처음 또는 새로고침 시 전체선택
	 	//전체식품
	  	var allM = $("button[name='lAsideProductAllM']");
		//냉동식품
		var iceAllM = $("input[name='asideIceAllM']");
		var iceM = $("input[name='asideIceM']");
		//즉석식품
		var productAllM = $("input[name='asideProductAllM']");
		var productM = $("input[name='asideProductM']");
		//브랜드
		var brandAllM = $("input[name='asideBrandAllM']");
		var brandM = $("input[name='asideBrandM']");
		//가격
		var priceM = $("input[name='asidePriceM']");
		
		if(param[1] == "do"){
			iceAllM.prop("checked",true);
			iceM.prop("checked",true);
			productAllM.prop("checked",true);
			productM.prop("checked",true);
			brandAllM.prop("checked",true);
			brandM.prop("checked",true);
			priceM.prop("checked",true);
			allM.find("i").attr("class","bi bi-check-circle-fill");
		}
		
		var ice0 = $("input[name='asideIce']:eq(0)");
		var ice1 = $("input[name='asideIce']:eq(1)");
		var product0 = $("input[name='asideProduct']:eq(0)");
		var product1 = $("input[name='asideProduct']:eq(1)");
		var product2 = $("input[name='asideProduct']:eq(2)");
		var ice0M = $("input[name='asideIceM']:eq(0)");
		var ice1M = $("input[name='asideIceM']:eq(1)");
		var product0M = $("input[name='asideProductM']:eq(0)");
		var product1M = $("input[name='asideProductM']:eq(1)");
		var product2M = $("input[name='asideProductM']:eq(2)");
		
		url = document.location.href;
		param = decodeURI(decodeURIComponent(url)).split("?");
		
		if(param[1] == "볶음밥"){
			productAll.prop("checked",false);
			product.prop("checked",false);
			iceAll.prop("checked",false);
			ice0.prop("checked",true);
			ice1.prop("checked",false);
			brandAll.prop("checked",true);
			brand.prop("checked",true);
			price.prop("checked",true);
			
			productAllM.prop("checked",false);
			productM.prop("checked",false);
			iceAllM.prop("checked",false);
			ice0M.prop("checked",true);
			ice1M.prop("checked",false);
			brandAllM.prop("checked",true);
			brandM.prop("checked",true);
			priceM.prop("checked",true);
			
			productFilter();
		}else if(param[1] == "치킨,만두"){
			productAll.prop("checked",false);
			product.prop("checked",false);
			iceAll.prop("checked",false);
			ice0.prop("checked",false);
			ice1.prop("checked",true);
			brand.prop("checked",true);
			brandAll.prop("checked",true);
			price.prop("checked",true);
			
			productAllM.prop("checked",false);
			productM.prop("checked",false);
			iceAllM.prop("checked",false);
			ice0M.prop("checked",false);
			ice1M.prop("checked",true);
			brandM.prop("checked",true);
			brandAllM.prop("checked",true);
			priceM.prop("checked",true);
			
			productFilter();
		}else if(param[1] == "국"){
			iceAll.prop("checked",false);
			ice.prop("checked",false);
			productAll.prop("checked",false);
			product0.prop("checked",true);
			product1.prop("checked",false);
			product2.prop("checked",false);
			brand.prop("checked",true);
			brandAll.prop("checked",true);
			price.prop("checked",true);
			
			iceAllM.prop("checked",false);
			iceM.prop("checked",false);
			productAllM.prop("checked",false);
			product0M.prop("checked",true);
			product1M.prop("checked",false);
			product2M.prop("checked",false);
			brandM.prop("checked",true);
			brandAllM.prop("checked",true);
			priceM.prop("checked",true);
			
			productFilter();
		}else if(param[1] == "반찬"){
			iceAll.prop("checked",false);
			ice.prop("checked",false);
			productAll.prop("checked",false);
			product0.prop("checked",false);
			product1.prop("checked",true);
			product2.prop("checked",false);
			brand.prop("checked",true);
			brandAll.prop("checked",true);
			price.prop("checked",true);
			
			iceAllM.prop("checked",false);
			iceM.prop("checked",false);
			productAllM.prop("checked",false);
			product0M.prop("checked",false);
			product1M.prop("checked",true);
			product2M.prop("checked",false);
			brandM.prop("checked",true);
			brandAllM.prop("checked",true);
			priceM.prop("checked",true);
			
			productFilter();
		}else if(param[1] == "컵밥,햇반"){
			iceAll.prop("checked",false);
			ice.prop("checked",false);
			productAll.prop("checked",false);
			product0.prop("checked",false);
			product1.prop("checked",false);
			product2.prop("checked",true);
			brand.prop("checked",true);
			brandAll.prop("checked",true);
			price.prop("checked",true);
			
			iceAllM.prop("checked",false);
			iceM.prop("checked",false);
			productAllM.prop("checked",false);
			product0M.prop("checked",false);
			product1M.prop("checked",false);
			product2M.prop("checked",true);
			brandM.prop("checked",true);
			brandAllM.prop("checked",true);
			priceM.prop("checked",true);
			
			productFilter();
		}else if(param[1].substring(0,6) == "search"){
			var searchVal = param[1].substring(7,param[1].length);
			$("#searchValue").val(searchVal);
			
			$.ajax({
				url : "productSearch.do",
				data : "product_name="+searchVal,
				success : function(data){
					var inputVal = $(".inputText");
					price.prop("checked",true);
					
					for(var i=0; i<data.length; i++){
						for(var j=0; j<$(".inputText").length; j++){
							if(data[i].middleSort == inputVal[j].innerHTML){
								var val = inputVal[j].parentNode.childNodes[0].value;
								if(data[i].bigSort == "냉동식품"){
									$("input[name='asideIce']:eq("+val+")").prop("checked",true);
								}else{
									$("input[name='asideProduct']:eq("+val+")").prop("checked",true);
								}
							}
						}
					}
					
					for(var i=0; i<data.length; i++){
						for(var j=0; j<$(".inputText").length; j++){
							if(data[i].brand == inputVal[j].innerHTML){
								var val = inputVal[j].parentNode.childNodes[0].value;
								$("input[name='asideBrand']:eq("+val+")").prop("checked",true);
							}
						}
					}
					
					var searchHtml = "";
					if(data != ""){
						for(var i=0; i<data.length; i++){
							searchHtml = "<!-- pc버전 -->";
							searchHtml += "<article class='pList'>";
							if(ice.is(":checked")){
								searchHtml += "<div class='fs-5 my-2 fw-bold topText'>냉동식품</div>";
								searchHtml += "<hr>";
							}
							searchHtml += "<!-- 냉동식품 -->";
							searchHtml += "<div class='container'>";
							searchHtml += "<div class='row'>";
							for(var i=0; i<data.length; i++){
								if(data[i].bigSort == "냉동식품"){
									searchHtml += "<div class='col-12 col-sm-12 col-md-6 col-lg-4 col-xl-3 productAll d-flex justify-content-center'>";
									searchHtml += "<div class='card' style='width: 18rem;'>";
									searchHtml += "<a href='productView.do?product_index="+data[i].product_index+"' onclick='productCookie(this)'>";
									searchHtml += "<img src='/FoodContainer/resources/img/"+data[i].brand+"/"+data[i].middleSort+"/"+data[i].thumbnail_image+"' class='card-img-top cardImg' alt='"+data[i].product_name+"'>";
									if(data[i].inventory == 0){
										searchHtml += "<img src='/FoodContainer/resources/img/매진.png' class='card-img-top pListSold'>";
										searchHtml += "<div class='pListSoldout'></div>";
									}
									searchHtml += "<input type='hidden' class='inventory"+i+"' value='"+data[i].inventory+"'>";
									searchHtml += "<div class='card-body'>";
									searchHtml += "<p class='card-text'>";
									if(data[i].quantity >= 500){
										searchHtml += "<span style='color:red;'>[인기]</span>";
									}
									searchHtml += "<span>["+data[i].brand+"]</span>";
									searchHtml += "<br>";
									searchHtml += "<span class='productName'>"+data[i].product_name+"</span><br>";
									searchHtml += "<span class='fs-4'>";
									searchHtml += data[i].origin_price.toLocaleString();
									searchHtml += "</span>원<br>";
									if(data[i].sale_price != -1){
										searchHtml += "<span class='discount'>";
										searchHtml += data[i].sale_price.toLocaleString()+"원";
										var persent = ((data[i].origin_price - data[i].sale_price)/data[i].origin_price)*100;
										searchHtml += "("+persent.toFixed(2)+"%)<br>";
										searchHtml += "</span>";
									}
									searchHtml += "<span class='productListStar'>";
									var starHash = $("input[name='starHash']").val();
									console.log(starHash);
									//console.log(starHashProductIndex[0].substring(0,4));
									/*for(var k=0; k<starHashProductIndex.length; k++){
										if(data[i].product_index == starHashProductIndex[k].substring(0,4)){
											console.log("ddddddddddddddddddd");
										}
									}*/
									searchHtml += "<i class='bi bi-star-fill'></i>";
									searchHtml += "<i class='bi bi-star-fill'></i>";
									searchHtml += "<i class='bi bi-star-fill'></i>";
									searchHtml += "<i class='bi bi-star-fill'></i>";
									searchHtml += "<i class='bi bi-star'></i>";
									searchHtml += "</span>";
									searchHtml += "<br>";
									if(data[i].delivery_free_YN != "Y"){
										searchHtml += "배송비 3,000원"; 
									}else{
										searchHtml += "무료배송";
									}
									searchHtml += "</p>";
									searchHtml += "</div>";
									searchHtml += "</a>";
									searchHtml += "<input type='hidden' name='index' value='"+data[i].product_index+"'>";
									searchHtml += "<div class='pListSubImg'>";
									var loginCheck = $("input[name='LoginCheck']").val();
									if(loginCheck != null){
										var heartCheck = 0;
										var userDibsCheck = $("input[name='userDibsCheck']").val();
										var userDibslength = $("input[name='userDibslength']").val();
										var userDibsProduct = $("input[name='userDibsProduct']").val();
										userDibsProduct = userDibsProduct.replace("[","");
										userDibsProduct = userDibsProduct.replace("]","");
										var userDibsProductArr = [];
										userDibsProductArr = userDibsProduct.split(",");
										for(var j=0; j<userDibslength; j++){
											if(userDibsCheck == loginCheck && data[i].product_index == $.trim(userDibsProductArr[j])){
												searchHtml += "<img src='/FoodContainer/resources/img/찬하트.png' class='img-fluid hoverHeart' alt='찜' onclick='heart(this)'>";
												heartCheck = 1;
											}
										}
										if(heartCheck == 0){
											searchHtml += "<img src='/FoodContainer/resources/img/빈하트.png' class='img-fluid hoverHeart' alt='찜' onclick='heart(this)'>";
										}
									}else{
										searchHtml += "<img src='/FoodContainer/resources/img/빈하트.png' class='img-fluid hoverHeart' alt='찜' onclick='heart(this)'>";
									}
									searchHtml += "<img src='/FoodContainer/resources/img/카트2.png' class='img-fluid hoverCart' alt='장바구니' onclick='cart(this)'>";
									searchHtml += "<input type='hidden' value='"+i+"'>";  
									searchHtml += "</div>";
									searchHtml += "</div>";
									searchHtml += "</div>";
								}
							}
							
							if(product.is(":checked")){
								searchHtml += "<div class='fs-5 my-2 fw-bold topText'>즉석식품</div>";
								searchHtml += "<hr>";
							}
							searchHtml += "<!-- 즉석식품 -->";
							searchHtml += "<div class='container'>";
							searchHtml += "<div class='row'>";
							for(var i=0; i<data.length; i++){
								if(data[i].bigSort == "즉석식품"){
									
									searchHtml += "<div class='col-12 col-sm-12 col-md-6 col-lg-4 col-xl-3 productAll d-flex justify-content-center'>";
									searchHtml += "<div class='card' style='width: 18rem;'>";
									searchHtml += "<a href='productView.do?product_index="+data[i].product_index+"' onclick='productCookie(this)'>";
									searchHtml += "<img src='/FoodContainer/resources/img/"+data[i].brand+"/"+data[i].middleSort+"/"+data[i].thumbnail_image+"' class='card-img-top cardImg' alt='"+data[i].product_name+"'>";
									if(data[i].inventory == 0){
										searchHtml += "<img src='/FoodContainer/resources/img/매진.png' class='card-img-top pListSold'>";
										searchHtml += "<div class='pListSoldout'></div>";
									}
									searchHtml += "<input type='hidden' class='inventory"+i+"' value='"+data[i].inventory+"'>";
									searchHtml += "<div class='card-body'>";
									searchHtml += "<p class='card-text'>";
									if(data[i].quantity >= 500){
										searchHtml += "<span style='color:red;'>[인기]</span>";
									}
									searchHtml += "<span>["+data[i].brand+"]</span>";
									searchHtml += "<br>";
									searchHtml += "<span class='productName'>"+data[i].product_name+"</span><br>";
									searchHtml += "<span class='fs-4'>";
									searchHtml += data[i].origin_price.toLocaleString();
									searchHtml += "</span>원<br>";
									if(data[i].sale_price != -1){
										searchHtml += "<span class='discount'>";
										searchHtml += data[i].sale_price.toLocaleString()+"원";
										var persent = ((data[i].origin_price - data[i].sale_price)/data[i].origin_price)*100;
										searchHtml += "("+persent.toFixed(2)+"%)<br>";
										searchHtml += "</span>";
									}
									searchHtml += "<span class='productListStar'>";
									searchHtml += "<i class='bi bi-star-fill'></i>";
									searchHtml += "<i class='bi bi-star-fill'></i>";
									searchHtml += "<i class='bi bi-star-fill'></i>";
									searchHtml += "<i class='bi bi-star-fill'></i>";
									searchHtml += "<i class='bi bi-star'></i>";
									searchHtml += "</span>";
									searchHtml += "<br>";
									if(data[i].delivery_free_YN != "Y"){
										searchHtml += "배송비 3,000원"; 
									}else{
										searchHtml += "무료배송";
									}
									searchHtml += "</p>";
									searchHtml += "</div>";
									searchHtml += "</a>";
									searchHtml += "<input type='hidden' name='index' value='"+data[i].product_index+"'>";
									searchHtml += "<div class='pListSubImg'>";
									var loginCheck = $("input[name='LoginCheck']").val();
									if(loginCheck != null){
										var heartCheck = 0;
										var userDibsCheck = $("input[name='userDibsCheck']").val();
										var userDibslength = $("input[name='userDibslength']").val();
										var userDibsProduct = $("input[name='userDibsProduct']").val();
										userDibsProduct = userDibsProduct.replace("[","");
										userDibsProduct = userDibsProduct.replace("]","");
										var userDibsProductArr = [];
										userDibsProductArr = userDibsProduct.split(",");
										for(var j=0; j<userDibslength; j++){
											if(userDibsCheck == loginCheck && data[i].product_index == $.trim(userDibsProductArr[j])){
												searchHtml += "<img src='/FoodContainer/resources/img/찬하트.png' class='img-fluid hoverHeart' alt='찜' onclick='heart(this)'>";
												heartCheck = 1;
											}
										}
										if(heartCheck == 0){
											searchHtml += "<img src='/FoodContainer/resources/img/빈하트.png' class='img-fluid hoverHeart' alt='찜' onclick='heart(this)'>";
										}
									}else{
										searchHtml += "<img src='/FoodContainer/resources/img/빈하트.png' class='img-fluid hoverHeart' alt='찜' onclick='heart(this)'>";
									}
									searchHtml += "<img src='/FoodContainer/resources/img/카트2.png' class='img-fluid hoverCart' alt='장바구니' onclick='cart(this)'>";
									searchHtml += "<input type='hidden' value='"+i+"'>";  
									searchHtml += "</div>";
									searchHtml += "</div>";
									searchHtml += "</div>";
								}
							}
							
							if(loginCheck == null){
								searchHtml += "<input type='hidden' id='pListLoginCheck' value=''>";
							}else{
								searchHtml += "<input type='hidden' id='pListLoginCheck' value='"+loginCheck+"'>";
							}
							searchHtml += "</div>";
							searchHtml += "</div>";
							searchHtml += "</article>";
							searchHtml += "<!-- 모바일 버전 -->";
							searchHtml += "<article class='pListM'>";
							if(ice.is(":checked")){
								searchHtml += "<div class='fs-5 my-2 fw-bold topText'>냉동식품</div>";
								searchHtml += "<hr>";
							}
							searchHtml += "<div class='productListCardM'>";
							for(var i=0; i<data.length; i++){		
								if(data[i].bigSort == "냉동식품"){
									searchHtml += "<div class='productListMDiv'>";
									searchHtml += "<a href='productView.do?product_index="+data[i].product_index+"' onclick='productCookie(this)'>";
									searchHtml += "<div class='productListMImg'>";
									searchHtml += "<div style='width:100px; height:100px;'>";
									searchHtml += "<img src='/FoodContainer/resources/img/"+data[i].brand+"/"+data[i].middleSort+"/"+data[i].thumbnail_image+"' class='img-fluid' style='width:100px; height:100px;' alt='"+data[i].product_name+"'>";
										if(data[i].inventory == 0){
											searchHtml += "<img src='/FoodContainer/resources/img/매진.png' class='card-img-top pListSold'>";
											searchHtml += "<div class='pListSoldout'></div>";
										}	
										searchHtml += "<input type='hidden' class='inventoryM"+i+"' value='"+data[i].inventory+"'>";			
										searchHtml += "</div>";			
										searchHtml += "<div class='productListStarM'>";			
										searchHtml += "<i class='bi bi-star-fill'></i>";			
										searchHtml += "<i class='bi bi-star-fill'></i>";			
										searchHtml += "<i class='bi bi-star-fill'></i>";			
										searchHtml += "<i class='bi bi-star-fill'></i>";			
										searchHtml += "<i class='bi bi-star'></i>";			
										searchHtml += "</div>";			
										searchHtml += "</div>";			
										searchHtml += "<div class='productListContent'>";			
										if(data[i].quantity >= 500){
											searchHtml += "<span style='color:red;'>[인기]</span>";	
										}									
										searchHtml += "<span>["+data[i].brand+"]</span>";					
										searchHtml += "<div class='productNameM'>"+data[i].product_name+"</div>";					
										if(data[i].sale_price == -1){
											searchHtml += "<div>";			
											searchHtml += data[i].origin_price.toLocaleString()+"원";	
											searchHtml += "</div>";	
										}else{
											searchHtml += "<div class='discountM'>";
											searchHtml += "[할인가]"+data[i].sale_price.toLocaleString()+"원";
											var persent = ((data[i].origin_price - data[i].sale_price)/data[i].origin_price)*100;
											searchHtml += "("+persent.toFixed(2)+"%)<br>";
											searchHtml += "</div>";
										}
										if(data[i].delivery_free_YN == "Y"){
											searchHtml += "<div>무료배송</div>";
										}else{
											searchHtml += "<div>배송비 3,000원</div>";
										}
										searchHtml += "</div>";
										searchHtml += "</a>";
										searchHtml += "<input type='hidden' name='index' value='"+data[i].product_index+"'>";
										searchHtml += "<div class='pListSubImgM'>";
										var loginCheck = $("input[name='LoginCheck']").val();
										if(loginCheck != null){
											var heartCheck = 0;
											var userDibsCheck = $("input[name='userDibsCheck']").val();
											var userDibsProduct = $("input[name='userDibsProduct']").val();
											var userDibsProductArr = [];
											userDibsProductArr = userDibsProduct.split(",");
											for(var j=0; j<userDibsCheck.lenght; j++){
												if(userDibsCheck == loginCheck && data[i].product_index == userDibsProductArr[j]){
													searchHtml += "<img src='/FoodContainer/resources/img/찬하트.png' class='img-fluid hoverHeart' alt='찜' onclick='heart(this)'>";
													heartCheck = 1;
												}
											}
											if(heartCheck == 0){
												searchHtml += "<img src='/FoodContainer/resources/img/빈하트.png' class='img-fluid hoverHeart' alt='찜' onclick='heart(this)'>";
											}
										}else{
											searchHtml += "<img src='/FoodContainer/resources/img/빈하트.png' class='img-fluid hoverHeart' alt='찜' onclick='heart(this)'>";
										}
										searchHtml += "<img src='/FoodContainer/resources/img/카트2.png' class='img-fluid hoverCart' alt='장바구니' onclick='pListCart(this)'>";
										searchHtml += "<input type='hidden' value='"+i+"'>";
										searchHtml += "</div>";
										searchHtml += "</div>";
								}
							}
							
							if(product.is(":checked")){
								searchHtml += "<div class='fs-5 my-2 fw-bold topText'>즉석식품</div>";
								searchHtml += "<hr>";
							}
							searchHtml += "<div class='productListCardM'>";
							for(var i=0; i<data.length; i++){		
								if(data[i].bigSort == "즉석식품"){
									searchHtml += "<div class='productListMDiv'>";
									searchHtml += "<a href='productView.do?product_index="+data[i].product_index+"' onclick='productCookie(this)'>";
									searchHtml += "<div class='productListMImg'>";
									searchHtml += "<div style='width:100px; height:100px;'>";
									searchHtml += "<img src='/FoodContainer/resources/img/"+data[i].brand+"/"+data[i].middleSort+"/"+data[i].thumbnail_image+"' class='img-fluid' style='width:100px; height:100px;' alt='"+data[i].product_name+"'>";
										if(data[i].inventory == 0){
											searchHtml += "<img src='/FoodContainer/resources/img/매진.png' class='card-img-top pListSold'>";
											searchHtml += "<div class='pListSoldout'></div>";
										}	
										searchHtml += "<input type='hidden' class='inventoryM"+i+"' value='"+data[i].inventory+"'>";			
										searchHtml += "</div>";			
										searchHtml += "<div class='productListStarM'>";			
										searchHtml += "<i class='bi bi-star-fill'></i>";			
										searchHtml += "<i class='bi bi-star-fill'></i>";			
										searchHtml += "<i class='bi bi-star-fill'></i>";			
										searchHtml += "<i class='bi bi-star-fill'></i>";			
										searchHtml += "<i class='bi bi-star'></i>";			
										searchHtml += "</div>";			
										searchHtml += "</div>";			
										searchHtml += "<div class='productListContent'>";			
										if(data[i].quantity >= 500){
											searchHtml += "<span style='color:red;'>[인기]</span>";	
										}									
										searchHtml += "<span>["+data[i].brand+"]</span>";					
										searchHtml += "<div class='productNameM'>"+data[i].product_name+"</div>";					
										if(data[i].sale_price == -1){
											searchHtml += "<div>";			
											searchHtml += data[i].origin_price.toLocaleString()+"원";	
											searchHtml += "</div>";	
										}else{
											searchHtml += "<div class='discountM'>";
											searchHtml += "[할인가]"+data[i].sale_price.toLocaleString()+"원";
											var persent = ((data[i].origin_price - data[i].sale_price)/data[i].origin_price)*100;
											searchHtml += "("+persent.toFixed(2)+"%)<br>";
											searchHtml += "</div>";
										}
										if(data[i].delivery_free_YN == "Y"){
											searchHtml += "<div>무료배송</div>";
										}else{
											searchHtml += "<div>배송비 3,000원</div>";
										}
										searchHtml += "</div>";
										searchHtml += "</a>";
										searchHtml += "<input type='hidden' name='index' value='"+data[i].product_index+"'>";
										searchHtml += "<div class='pListSubImgM'>";
										var loginCheck = $("input[name='LoginCheck']").val();
										if(loginCheck != null){
											var heartCheck = 0;
											var userDibsCheck = $("input[name='userDibsCheck']").val();
											var userDibsProduct = $("input[name='userDibsProduct']").val();
											var userDibsProductArr = [];
											userDibsProductArr = userDibsProduct.split(",");
											for(var j=0; j<userDibsCheck.lenght; j++){
												if(userDibsCheck == loginCheck && data[i].product_index == userDibsProductArr[j]){
													searchHtml += "<img src='/FoodContainer/resources/img/찬하트.png' class='img-fluid hoverHeart' alt='찜' onclick='heart(this)'>";
													heartCheck = 1;
												}
											}
											if(heartCheck == 0){
												searchHtml += "<img src='/FoodContainer/resources/img/빈하트.png' class='img-fluid hoverHeart' alt='찜' onclick='heart(this)'>";
											}
										}else{
											searchHtml += "<img src='/FoodContainer/resources/img/빈하트.png' class='img-fluid hoverHeart' alt='찜' onclick='heart(this)'>";
										}
										searchHtml += "<img src='/FoodContainer/resources/img/카트2.png' class='img-fluid hoverCart' alt='장바구니' onclick='pListCart(this)'>";
										searchHtml += "<input type='hidden' value='"+i+"'>";
										searchHtml += "</div>";
										searchHtml += "</div>";
								}
							}
							
							searchHtml += "</div>";
							searchHtml += "</article>";
								}
							}else{
								searchHtml += "<div id='notCheck'>선택 된 상품이 없습니다.</div>"
							}
							
							$("#mainSection").html(searchHtml);
				}
			});
		}
	}
	
	//전체메뉴
	function allProduct(obj){
		var check = $(obj).find("i").attr("class").indexOf("fill");
		//냉동식품
		var ice = $("input[name='asideIceAll']");
		//즉석식품
		var product = $("input[name='asideProductAll']");
		//브랜드
		var brand = $("input[name='asideBrandAll']");
		
		if(check < 0){
			$(obj).find("i").attr("class","bi bi-check-circle-fill");
			
			if(!(ice.is(":checked"))){
				ice.click();
			}
			
			if(!(product.is(":checked"))){
				product.click();
			}
			
			if(!(brand.is(":checked"))){
				brand.click();
			}
		}
	}
	
	//pc화면 - 모든 전체메뉴 체크일 때, 전체상품 변화
	window.addEventListener("click",function(){
		//냉동식품
		var ice = $("input[name='asideIceAll']");
		//즉석식품
		var product = $("input[name='asideProductAll']");
		//브랜드
		var brand = $("input[name='asideBrandAll']");
		
		if(ice.is(":checked") && product.is(":checked") && brand.is(":checked")){
			$("button[name='lAsideProductAll']").find("i").attr("class","bi bi-check-circle-fill");
		}else{
			$("button[name='lAsideProductAll']").find("i").attr("class","bi bi-check-circle");
		}
	})
	
	//전체메뉴 모바일
	function allProductM(obj){
		var checkM = $(obj).find("i").attr("class").indexOf("fill");
		//냉동식품
		var iceM = $("input[name='asideIceAllM']");
		//즉석식품
		var productM = $("input[name='asideProductAllM']");
		//브랜드
		var brandM = $("input[name='asideBrandAllM']");
		
		if(checkM < 0){
			$(obj).find("i").attr("class","bi bi-check-circle-fill");
			
			if(!(iceM.is(":checked"))){
				iceM.click();
			}
			
			if(!(productM.is(":checked"))){
				productM.click();
			}
			
			if(!(brandM.is(":checked"))){
				brandM.click();
			}
		}
	}
	
	//모바일 화면 - 모든 전체메뉴 체크일 때, 전체상품 변화
	window.addEventListener("click",function(){
		//냉동식품
		var iceM = $("input[name='asideIceAllM']");
		//즉석식품
		var productM = $("input[name='asideProductAllM']");
		//브랜드
		var brandM = $("input[name='asideBrandAllM']");
		
		if(iceM.is(":checked") && productM.is(":checked") && brandM.is(":checked")){
			$("button[name='lAsideProductAllM']").find("i").attr("class","bi bi-check-circle-fill");
		}else{
			$("button[name='lAsideProductAllM']").find("i").attr("class","bi bi-check-circle");
		}
	})
	
	//냉동식품 체크박스
	function asideIceAll(obj){
		var ice = $("input[name='asideIce']");
		var check = $(obj).is(":checked");
		var iceAllM = $("input[name='asideIceAllM']");
		var iceM = $("input[name='asideIceM']");
		
		$.each(ice,function(){
			ice.prop("checked",check);
			iceM.prop("checked",check);
		})
		
		if(check){
			iceAllM.prop("checked",true);
		}else{
			iceAllM.prop("checked",false);
			$("button[name='lAsideProductAll']").find("i").attr("class","bi bi-check-circle");
		}
	}
	
	function asideIce(obj){
		var ice = $("input[name='asideIce']");
		var checkIce = $("input[name='asideIce']:checked");
		var iceAll = $("input[name='asideIceAll']");
		var iceAllM = $("input[name='asideIceAllM']");
		
		for(var i=0; i<2; i++){
			if($(obj).val() == i){
				if($(obj).is(":checked")){
					$("input[name='asideIceM']:eq("+i+")").prop("checked",true);
				}else{
					$("input[name='asideIceM']:eq("+i+")").prop("checked",false);
				}
			}
		}
		
		if(ice.length == checkIce.length){
			iceAll.prop("checked", true);
			iceAllM.prop("checked", true);
		}else{
			iceAll.prop("checked", false);
			$("button[name='lAsideProductAll']").find("i").attr("class","bi bi-check-circle");
			iceAllM.prop("checked", false);
			$("button[name='lAsideProductAllM']").find("i").attr("class","bi bi-check-circle");
		}
	}
	//냉동식품 체크박스 모바일
	function asideIceAllM(obj){
		var iceM = $("input[name='asideIceM']");
		var checkM = $(obj).is(":checked");
		var ice = $("input[name='asideIce']");
		var iceAll = $("input[name='asideIceAll']");
		
		$.each(iceM,function(){
			iceM.prop("checked",checkM);
			ice.prop("checked",checkM);
		})
		
		if(checkM){
			iceAll.prop("checked",true);
		}else{
			iceAll.prop("checked",false);
			$("button[name='lAsideProductAllM']").find("i").attr("class","bi bi-check-circle");
		}
	}
	
	function asideIceM(obj){
		var iceM = $("input[name='asideIceM']");
		var checkIceM = $("input[name='asideIceM']:checked");
		var iceAllM = $("input[name='asideIceAllM']");
		var iceAll = $("input[name='asideIceAll']");
		
		for(var i=0; i<2; i++){
			if($(obj).val() == i){
				if($(obj).is(":checked")){
					$("input[name='asideIce']:eq("+i+")").prop("checked",true);
				}else{
					$("input[name='asideIce']:eq("+i+")").prop("checked",false);
				}
			}
		}
		
		if(iceM.length == checkIceM.length){
			iceAllM.prop("checked", true);
			iceAll.prop("checked", true);
		}else{
			iceAllM.prop("checked", false);
			$("button[name='lAsideProductAllM']").find("i").attr("class","bi bi-check-circle");
			iceAll.prop("checked", false);
			$("button[name='lAsideProductAll']").find("i").attr("class","bi bi-check-circle");
		}
	}
	
	//즉석식품 체크박스
	function asideProductAll(obj){
		var product = $("input[name='asideProduct']");
		var check = $(obj).is(":checked");
		var productAllM = $("input[name='asideProductAllM']");
		var productM = $("input[name='asideProductM']");
		
		$.each(product,function(){
			product.prop("checked",check);
			productM.prop("checked",check);
		})
		
		if(check){
			productAllM.prop("checked",true);
		}else{
			productAllM.prop("checked",false);
			$("button[name='lAsideProductAll']").find("i").attr("class","bi bi-check-circle");
		}
	}
	
	function asideProduct(obj){
		var product = $("input[name='asideProduct']");
		var checkProduct = $("input[name='asideProduct']:checked");
		var productAll = $("input[name='asideProductAll']");
		var productAllM = $("input[name='asideProductAllM']");
		
		for(var i=0; i<3; i++){
			if($(obj).val() == i){
				if($(obj).is(":checked")){
					$("input[name='asideProductM']:eq("+i+")").prop("checked",true);
				}else{
					$("input[name='asideProductM']:eq("+i+")").prop("checked",false);
				}
			}
		}
		
		if(product.length == checkProduct.length){
			productAll.prop("checked", true);
			productAllM.prop("checked", true);
		}else{
			productAll.prop("checked", false);
			$("button[name='lAsideProductAll']").find("i").attr("class","bi bi-check-circle");
			productAllM.prop("checked", false);
			$("button[name='lAsideProductAllM']").find("i").attr("class","bi bi-check-circle");
		}
	}
	//즉석식품 체크박스 모바일
	function asideProductAllM(obj){
		var productM = $("input[name='asideProductM']");
		var checkM = $(obj).is(":checked");
		var product = $("input[name='asideProduct']");
		var productAll = $("input[name='asideProductAll']");
		
		$.each(productM,function(){
			productM.prop("checked",checkM);
			product.prop("checked",checkM);
		})
		
		if(checkM){
			productAll.prop("checked",true);
		}else{
			productAll.prop("checked",false);
			$("button[name='lAsideProductAllM']").find("i").attr("class","bi bi-check-circle");
		}
	}
	
	function asideProductM(obj){
		var productM = $("input[name='asideProductM']");
		var checkProductM = $("input[name='asideProductM']:checked");
		var productAllM = $("input[name='asideProductAllM']");
		var productAll = $("input[name='asideProductAll']");
		
		for(var i=0; i<3; i++){
			if($(obj).val() == i){
				if($(obj).is(":checked")){
					$("input[name='asideProduct']:eq("+i+")").prop("checked",true);
				}else{
					$("input[name='asideProduct']:eq("+i+")").prop("checked",false);
				}
			}
		}
		
		if(productM.length == checkProductM.length){
			productAllM.prop("checked", true);
			productAll.prop("checked", true);
		}else{
			productAllM.prop("checked", false);
			$("button[name='lAsideProductAllM']").find("i").attr("class","bi bi-check-circle");
			productAll.prop("checked", false);
			$("button[name='lAsideProductAll']").find("i").attr("class","bi bi-check-circle");
		}
	}
		
	
	//브랜드 체크박스
	function asideBrandAll(obj){
		var brand = $("input[name='asideBrand']");
		var check = $(obj).is(":checked");
		var brandAllM = $("input[name='asideBrandAllM']");
		var brandM = $("input[name='asideBrandM']");
		
		$.each(brand,function(){
			brand.prop("checked", check);
			brandM.prop("checked", check);
		})
		
		if(check){
			brandAllM.prop("checked",true);
		}else{
			brandAllM.prop("checked",false);
			$("button[name='lAsideProductAll']").find("i").attr("class","bi bi-check-circle");
		}
	}
	
	function asideBrand(obj){
		var brand = $("input[name='asideBrand']");
		var checkBrand = $("input[name='asideBrand']:checked");
		var brandAll = $("input[name='asideBrandAll']");
		var brandAllM = $("input[name='asideBrandAllM']");
		
		for(var i=0; i<6; i++){
			if($(obj).val() == i){
				if($(obj).is(":checked")){
					$("input[name='asideBrandM']:eq("+i+")").prop("checked",true);
				}else{
					$("input[name='asideBrandM']:eq("+i+")").prop("checked",false);
				}
			}
		}
		
		if(brand.length == checkBrand.length){
			brandAll.prop("checked",true);
			brandAllM.prop("checked",true);
		}else{
			brandAll.prop("checked",false);
			$("button[name='lAsideProductAll']").find("i").attr("class","bi bi-check-circle");
			brandAllM.prop("checked",false);
			$("button[name='lAsideProductAllM']").find("i").attr("class","bi bi-check-circle");
		}
	}
	//브랜드 체크박스 모바일
	function asideBrandAllM(obj){
		var brandM = $("input[name='asideBrandM']");
		var checkM = $(obj).is(":checked");
		var brand = $("input[name='asideBrand']");
		var brandAll = $("input[name='asideBrandAll']");
		
		
		$.each(brandM,function(){
			brandM.prop("checked", checkM);
			brand.prop("checked", checkM);
		})
		
		if(checkM){
			brandAll.prop("checked",true);
		}else{
			brandAll.prop("checked",false);
			$("button[name='lAsideProductAllM']").find("i").attr("class","bi bi-check-circle");
		}
	}
	
	function asideBrandM(obj){
		var brandM = $("input[name='asideBrandM']");
		var checkBrandM = $("input[name='asideBrandM']:checked");
		var brandAllM = $("input[name='asideBrandAllM']");
		var brandAll = $("input[name='asideBrandAll']");
		
		for(var i=0; i<6; i++){
			if($(obj).val() == i){
				if($(obj).is(":checked")){
					$("input[name='asideBrand']:eq("+i+")").prop("checked",true);
				}else{
					$("input[name='asideBrand']:eq("+i+")").prop("checked",false);
				}
			}
		}
		
		if(brandM.length == checkBrandM.length){
			brandAllM.prop("checked",true);
			brandAll.prop("checked",true);
		}else{
			brandAllM.prop("checked",false);
			$("button[name='lAsideProductAllM']").find("i").attr("class","bi bi-check-circle");
			brandAll.prop("checked",false);
			$("button[name='lAsideProductAll']").find("i").attr("class","bi bi-check-circle");
		}
	}

	//가격 체크박스
	
	function asidePrice(obj){
		var checkPrice = $("input[name='asidePrice']:checked");
		
		for(var i=0; i<2; i++){
			if($(obj).val() == i){
				if($(obj).is(":checked")){
					$("input[name='asidePriceM']:eq("+i+")").prop("checked",true);
				}else{
					$("input[name='asidePriceM']:eq("+i+")").prop("checked",false);
				}
			}
		}
		
		if(checkPrice.length == 0){
			for(var i=0; i<2; i++){
				if($(obj).val() == i){
					$(obj).prop("checked", true);
					$("input[name='asidePriceM']:eq("+i+")").prop("checked",true);
					alert("최소 한 개는 선택해야 합니다.");
				}
			}
		}
	}
	//가격 체크박스 모바일
	
	function asidePriceM(obj){
		var checkPriceM = $("input[name='asidePriceM']:checked");
		
		for(var i=0; i<2; i++){
			if($(obj).val() == i){
				if($(obj).is(":checked")){
					$("input[name='asidePrice']:eq("+i+")").prop("checked",true);
				}else{
					$("input[name='asidePrice']:eq("+i+")").prop("checked",false);
				}
			}
		}
		
		if(checkPriceM.length == 0){
			for(var i=0; i<2; i++){
				if($(obj).val() == i){
					$(obj).prop("checked",true);
					$("input[name='asidePrice']:eq("+i+")").prop("checked",true);
					$(".priceAlertM").css({"display" : "block",
										   "z-index" : "10000"
										});
					$(".priceAlertMessageM").html("<br><br>최소 한 개는 선택해야 합니다.");
					
					setTimeout(function(){
						$(".priceAlertM").css({"display" : "none",
										  	   "z-index" : "0"
										});
					},800);
				}
			}
		}
	}
	
	//무료배송
	function free(obj){
	var check = $(obj).find("i").attr("class").indexOf("fill");
		
		if(check > 0){
			$(".free").find("i").attr("class","bi bi-check-square");
		}else{
			$(".free").find("i").attr("class","bi bi-check-square-fill");
		}
	}
	
	$(document).ready(function(){
		var innerWidth = window.innerWidth;
			
			if(innerWidth < 991){
				$(".lAsideDiv").css("display","none");
				$(".mMenu").css("display","block");
				$(".mlAside").css("display","block");
			}else{
				$(".lAsideDiv").css("display","block");
				$(".mMenu").css("display","none");
				$(".mlAsideDiv").css("display","none");
				$(".mlAside").css("display","none");
			}
		//브라우저 크기에 따라 변화
		window.onresize = function(){
			var innerWidth = window.innerWidth;
			
			if(innerWidth < 991){
				$(".lAsideDiv").css("display","none");
				$(".mMenu").css("display","block");
				$(".mlAside").css("display","block");
			}else{
				$(".lAsideDiv").css("display","block");
				$(".mMenu").css("display","none");
				$(".mlAsideDiv").css("display","none");
				$(".mlAside").css("display","none");
			}
		}
	})
	
	//스크롤 하강 대응
	window.addEventListener("scroll", function(){
		var yScroll = window.scrollY;
		var navTop = $("#navBar").offset().top;
				
		if(yScroll >= navTop){
			/*상단 고정
			$(".filter").css({"position" : "fixed", 
							  "top" : "15px",
							  "left" : "0px",
							  "width" : "100%",
							  "background-color" : "#FFEFD5",
							  "z-index" : "10",
							  "width" : "54px",
							  "height" : "40px",
							  "border" : "1px soild #DCDCDC",
							  "border-radius" : "5px",
							  "text-align" : "center"
							});
			*/
			
			//하단 고정
			$(".filter").css({"position" : "fixed", 
							  "bottom" : "5.3%",
							  "width" : "100%",
							  "background-color" : "black",
							  "z-index" : "10",
							  "width" : "54px",
							  "height" : "40px",
							  "border-radius" : "5px",
							  "text-align" : "center",
							  "color" : "white",
							  "border" : "none"
							});
		}else if(yScroll < navTop){
			$(".filter").css({"position" : "static", 
							  "background-color" : "transparent",
							  "color" : "#696969",
							  "border" : "1px solid #DCDCDC"
							  
							});
		}
	})
	
	function productFilter(){
		var ice = $("input[name='asideIce']");
		var product = $("input[name='asideProduct']");
		var brandList = $("input[name='asideBrand']");
		var priceList = $("input[name='asidePrice']");
		
		var middleSort = "";
		var brand = "";
		var price = "";
		var freeCheck = $("#free").attr("class");
		var freeHtml = "bi bi-check-square";
		var free = "";
		if(freeCheck == freeHtml){
			free = "no";
		}else{
			free = "ok";
		}
		
		
		for(var i=0; i<ice.length; i++){
			if(ice.eq(i).is(":checked")){
				middleSort += ice.eq(i).next().html() + " ";
			}
		}
		
		for(var i=0; i<product.length; i++){
			if(product.eq(i).is(":checked")){
				middleSort += product.eq(i).next().html() + " ";
			}
		}
		
		for(var i=0; i<brandList.length; i++){
			if(brandList.eq(i).is(":checked")){
				brand += brandList.eq(i).next().html() + " ";
			}
		}
		
		for(var i=0; i<priceList.length; i++){
			if(priceList.eq(i).is(":checked")){
				price += priceList.eq(i).val();
			}
		}
		
		$.ajax({
			url : "productFilter.do",
			data : "middleSort="+middleSort+"&brand="+brand+"&price="+price+"&free="+free,
			success : function(data){
				var checkAll = $("button[name='lAsideProductAll']").find("i").attr("class");
				var checkAllHtml = "bi bi-check-circle-fill";
				if(checkAll == checkAllHtml){
					var mainSectionHtml = "<!-- pc버전 -->";
					mainSectionHtml += "<article class='pList'>";
					mainSectionHtml += "<div class='fs-5 my-2 fw-bold topText'>전체상품</div>";
					mainSectionHtml += "<hr>";
					mainSectionHtml += "<!-- 전체상품 -->";
					mainSectionHtml += "<div class='container'>";
					mainSectionHtml += "<div class='row'>";
					for(var i=0; i<data.length; i++){
						mainSectionHtml += "<div class='col-12 col-sm-12 col-md-6 col-lg-4 col-xl-3 productAll d-flex justify-content-center'>";
						mainSectionHtml += "<div class='card' style='width: 18rem;'>";
						mainSectionHtml += "<a href='productView.do?product_index="+data[i].product_index+"' onclick='productCookie(this)'>";
						mainSectionHtml += "<img src='/FoodContainer/resources/img/"+data[i].brand+"/"+data[i].middleSort+"/"+data[i].thumbnail_image+"' class='card-img-top cardImg' alt='"+data[i].product_name+"'>";
						if(data[i].inventory == 0){
							mainSectionHtml += "<img src='/FoodContainer/resources/img/매진.png' class='card-img-top pListSold'>";
							mainSectionHtml += "<div class='pListSoldout'></div>";
						}
						mainSectionHtml += "<input type='hidden' class='inventory"+i+"' value='"+data[i].inventory+"'>";
						mainSectionHtml += "<div class='card-body'>";
						mainSectionHtml += "<p class='card-text'>";
						if(data[i].quantity >= 500){
							mainSectionHtml += "<span style='color:red;'>[인기]</span>";
						}
						mainSectionHtml += "<span>["+data[i].brand+"]</span>";
						mainSectionHtml += "<br>";
						mainSectionHtml += "<span class='productName'>"+data[i].product_name+"</span><br>";
						mainSectionHtml += "<span class='fs-4'>";
						mainSectionHtml += data[i].origin_price.toLocaleString();
						mainSectionHtml += "</span>원<br>";
						if(data[i].sale_price != -1){
							mainSectionHtml += "<span class='discount'>";
							mainSectionHtml += data[i].sale_price.toLocaleString()+"원";
							var persent = ((data[i].origin_price - data[i].sale_price)/data[i].origin_price)*100;
							mainSectionHtml += "("+persent.toFixed(2)+"%)<br>";
							mainSectionHtml += "</span>";
						}
						mainSectionHtml += "<span class='productListStar'>";
						mainSectionHtml += "<i class='bi bi-star-fill'></i>";
						mainSectionHtml += "<i class='bi bi-star-fill'></i>";
						mainSectionHtml += "<i class='bi bi-star-fill'></i>";
						mainSectionHtml += "<i class='bi bi-star-fill'></i>";
						mainSectionHtml += "<i class='bi bi-star'></i>";
						mainSectionHtml += "</span>";
						mainSectionHtml += "<br>";
						if(data[i].delivery_free_YN != "Y"){
							mainSectionHtml += "배송비 3,000원"; 
						}else{
							mainSectionHtml += "무료배송";
						}
						mainSectionHtml += "</p>";
						mainSectionHtml += "</div>";
						mainSectionHtml += "</a>";
						mainSectionHtml += "<input type='hidden' name='index' value='"+data[i].product_index+"'>";
						mainSectionHtml += "<div class='pListSubImg'>";
						var loginCheck = $("input[name='LoginCheck']").val();
						if(loginCheck != null){
							var heartCheck = 0;
							var userDibsCheck = $("input[name='userDibsCheck']").val();
							var userDibslength = $("input[name='userDibslength']").val();
							var userDibsProduct = $("input[name='userDibsProduct']").val();
							userDibsProduct = userDibsProduct.replace("[","");
							userDibsProduct = userDibsProduct.replace("]","");
							var userDibsProductArr = [];
							userDibsProductArr = userDibsProduct.split(",");
							for(var j=0; j<userDibslength; j++){
								if(userDibsCheck == loginCheck && data[i].product_index == $.trim(userDibsProductArr[j])){
									mainSectionHtml += "<img src='/FoodContainer/resources/img/찬하트.png' class='img-fluid hoverHeart' alt='찜' onclick='heart(this)'>";
									heartCheck = 1;
								}
							}
							if(heartCheck == 0){
								mainSectionHtml += "<img src='/FoodContainer/resources/img/빈하트.png' class='img-fluid hoverHeart' alt='찜' onclick='heart(this)'>";
							}
						}else{
							mainSectionHtml += "<img src='/FoodContainer/resources/img/빈하트.png' class='img-fluid hoverHeart' alt='찜' onclick='heart(this)'>";
						}
						mainSectionHtml += "<img src='/FoodContainer/resources/img/카트2.png' class='img-fluid hoverCart' alt='장바구니' onclick='cart(this)'>";
						mainSectionHtml += "<input type='hidden' value='"+i+"'>";  
						mainSectionHtml += "</div>";
						mainSectionHtml += "</div>";
						mainSectionHtml += "</div>";
					}
					if(loginCheck == null){
						mainSectionHtml += "<input type='hidden' id='pListLoginCheck' value=''>";
					}else{
						mainSectionHtml += "<input type='hidden' id='pListLoginCheck' value='"+loginCheck+"'>";
					}
					mainSectionHtml += "</div>";
					mainSectionHtml += "</div>";
					mainSectionHtml += "</article>";
					mainSectionHtml += "<!-- 모바일 버전 -->";
					mainSectionHtml += "<article class='pListM'>";
					mainSectionHtml += "<div class='fs-5 my-2 fw-bold topText'>전체상품</div>";
					mainSectionHtml += "<hr>";
					mainSectionHtml += "<div class='productListCardM'>";
					for(var i=0; i<data.length; i++){			
					mainSectionHtml += "<div class='productListMDiv'>";
					mainSectionHtml += "<a href='productView.do?product_index="+data[i].product_index+"' onclick='productCookie(this)'>";
					mainSectionHtml += "<div class='productListMImg'>";
					mainSectionHtml += "<div style='width:100px; height:100px;'>";
					mainSectionHtml += "<img src='/FoodContainer/resources/img/"+data[i].brand+"/"+data[i].middleSort+"/"+data[i].thumbnail_image+"' class='img-fluid' style='width:100px; height:100px;' alt='"+data[i].product_name+"'>";
						if(data[i].inventory == 0){
							mainSectionHtml += "<img src='/FoodContainer/resources/img/매진.png' class='card-img-top pListSold'>";
							mainSectionHtml += "<div class='pListSoldout'></div>";
						}	
						mainSectionHtml += "<input type='hidden' class='inventoryM"+i+"' value='"+data[i].inventory+"'>";			
						mainSectionHtml += "</div>";			
						mainSectionHtml += "<div class='productListStarM'>";			
						mainSectionHtml += "<i class='bi bi-star-fill'></i>";			
						mainSectionHtml += "<i class='bi bi-star-fill'></i>";			
						mainSectionHtml += "<i class='bi bi-star-fill'></i>";			
						mainSectionHtml += "<i class='bi bi-star-fill'></i>";			
						mainSectionHtml += "<i class='bi bi-star'></i>";			
						mainSectionHtml += "</div>";			
						mainSectionHtml += "</div>";			
						mainSectionHtml += "<div class='productListContent'>";			
						if(data[i].quantity >= 500){
							mainSectionHtml += "<span style='color:red;'>[인기]</span>";	
						}									
						mainSectionHtml += "<span>["+data[i].brand+"]</span>";					
						mainSectionHtml += "<div class='productNameM'>"+data[i].product_name+"</div>";					
						if(data[i].sale_price == -1){
							mainSectionHtml += "<div>";			
							mainSectionHtml += data[i].origin_price.toLocaleString()+"원";	
							mainSectionHtml += "</div>";	
						}else{
							mainSectionHtml += "<div class='discountM'>";
							mainSectionHtml += "[할인가]"+data[i].sale_price.toLocaleString()+"원";
							var persent = ((data[i].origin_price - data[i].sale_price)/data[i].origin_price)*100;
							mainSectionHtml += "("+persent.toFixed(2)+"%)<br>";
							mainSectionHtml += "</div>";
						}
						if(data[i].delivery_free_YN == "Y"){
							mainSectionHtml += "<div>무료배송</div>";
						}else{
							mainSectionHtml += "<div>배송비 3,000원</div>";
						}
						mainSectionHtml += "</div>";
						mainSectionHtml += "</a>";
						mainSectionHtml += "<input type='hidden' name='index' value='"+data[i].product_index+"'>";
						mainSectionHtml += "<div class='pListSubImgM'>";
						var loginCheck = $("input[name='LoginCheck']").val();
						if(loginCheck != null){
							var heartCheck = 0;
							var userDibsCheck = $("input[name='userDibsCheck']").val();
							var userDibsProduct = $("input[name='userDibsProduct']").val();
							var userDibsProductArr = [];
							userDibsProductArr = userDibsProduct.split(",");
							for(var j=0; j<userDibsCheck.lenght; j++){
								if(userDibsCheck == loginCheck && data[i].product_index == userDibsProductArr[j]){
									mainSectionHtml += "<img src='/FoodContainer/resources/img/찬하트.png' class='img-fluid hoverHeart' alt='찜' onclick='heart(this)'>";
									heartCheck = 1;
								}
							}
							if(heartCheck == 0){
								mainSectionHtml += "<img src='/FoodContainer/resources/img/빈하트.png' class='img-fluid hoverHeart' alt='찜' onclick='heart(this)'>";
							}
						}else{
							mainSectionHtml += "<img src='/FoodContainer/resources/img/빈하트.png' class='img-fluid hoverHeart' alt='찜' onclick='heart(this)'>";
						}
						mainSectionHtml += "<img src='/FoodContainer/resources/img/카트2.png' class='img-fluid hoverCart' alt='장바구니' onclick='pListCart(this)'>";
						mainSectionHtml += "<input type='hidden' value='"+i+"'>";
						mainSectionHtml += "</div>";
						mainSectionHtml += "</div>";
						}
					mainSectionHtml += "</div>";
					mainSectionHtml += "</article>";
				
				}else if(checkAll != checkAllHtml){
					var mainSectionHtml = "<!-- pc버전 -->";
					mainSectionHtml += "<article class='pList'>";
					if(ice.is(":checked")){
						mainSectionHtml += "<div class='fs-5 my-2 fw-bold topText'>냉동식품</div>";
						mainSectionHtml += "<hr>";
					}
					mainSectionHtml += "<!-- 냉동식품 -->";
					mainSectionHtml += "<div class='container'>";
					mainSectionHtml += "<div class='row'>";
					for(var i=0; i<data.length; i++){
						if(data[i].bigSort == "냉동식품"){
							mainSectionHtml += "<div class='col-12 col-sm-12 col-md-6 col-lg-4 col-xl-3 productAll d-flex justify-content-center'>";
							mainSectionHtml += "<div class='card' style='width: 18rem;'>";
							mainSectionHtml += "<a href='productView.do?product_index="+data[i].product_index+"' onclick='productCookie(this)'>";
							mainSectionHtml += "<img src='/FoodContainer/resources/img/"+data[i].brand+"/"+data[i].middleSort+"/"+data[i].thumbnail_image+"' class='card-img-top cardImg' alt='"+data[i].product_name+"'>";
							if(data[i].inventory == 0){
								mainSectionHtml += "<img src='/FoodContainer/resources/img/매진.png' class='card-img-top pListSold'>";
								mainSectionHtml += "<div class='pListSoldout'></div>";
							}
							mainSectionHtml += "<input type='hidden' class='inventory"+i+"' value='"+data[i].inventory+"'>";
							mainSectionHtml += "<div class='card-body'>";
							mainSectionHtml += "<p class='card-text'>";
							if(data[i].quantity >= 500){
								mainSectionHtml += "<span style='color:red;'>[인기]</span>";
							}
							mainSectionHtml += "<span>["+data[i].brand+"]</span>";
							mainSectionHtml += "<br>";
							mainSectionHtml += "<span class='productName'>"+data[i].product_name+"</span><br>";
							mainSectionHtml += "<span class='fs-4'>";
							mainSectionHtml += data[i].origin_price.toLocaleString();
							mainSectionHtml += "</span>원<br>";
							if(data[i].sale_price != -1){
								mainSectionHtml += "<span class='discount'>";
								mainSectionHtml += data[i].sale_price.toLocaleString()+"원";
								var persent = ((data[i].origin_price - data[i].sale_price)/data[i].origin_price)*100;
								mainSectionHtml += "("+persent.toFixed(2)+"%)<br>";
								mainSectionHtml += "</span>";
							}
							mainSectionHtml += "<span class='productListStar'>";
							mainSectionHtml += "<i class='bi bi-star-fill'></i>";
							mainSectionHtml += "<i class='bi bi-star-fill'></i>";
							mainSectionHtml += "<i class='bi bi-star-fill'></i>";
							mainSectionHtml += "<i class='bi bi-star-fill'></i>";
							mainSectionHtml += "<i class='bi bi-star'></i>";
							mainSectionHtml += "</span>";
							mainSectionHtml += "<br>";
							if(data[i].delivery_free_YN != "Y"){
								mainSectionHtml += "배송비 3,000원"; 
							}else{
								mainSectionHtml += "무료배송";
							}
							mainSectionHtml += "</p>";
							mainSectionHtml += "</div>";
							mainSectionHtml += "</a>";
							mainSectionHtml += "<input type='hidden' name='index' value='"+data[i].product_index+"'>";
							mainSectionHtml += "<div class='pListSubImg'>";
							var loginCheck = $("input[name='LoginCheck']").val();
							if(loginCheck != null){
								var heartCheck = 0;
								var userDibsCheck = $("input[name='userDibsCheck']").val();
								var userDibslength = $("input[name='userDibslength']").val();
								var userDibsProduct = $("input[name='userDibsProduct']").val();
								userDibsProduct = userDibsProduct.replace("[","");
								userDibsProduct = userDibsProduct.replace("]","");
								var userDibsProductArr = [];
								userDibsProductArr = userDibsProduct.split(",");
								for(var j=0; j<userDibslength; j++){
									if(userDibsCheck == loginCheck && data[i].product_index == $.trim(userDibsProductArr[j])){
										mainSectionHtml += "<img src='/FoodContainer/resources/img/찬하트.png' class='img-fluid hoverHeart' alt='찜' onclick='heart(this)'>";
										heartCheck = 1;
									}
								}
								if(heartCheck == 0){
									mainSectionHtml += "<img src='/FoodContainer/resources/img/빈하트.png' class='img-fluid hoverHeart' alt='찜' onclick='heart(this)'>";
								}
							}else{
								mainSectionHtml += "<img src='/FoodContainer/resources/img/빈하트.png' class='img-fluid hoverHeart' alt='찜' onclick='heart(this)'>";
							}
							mainSectionHtml += "<img src='/FoodContainer/resources/img/카트2.png' class='img-fluid hoverCart' alt='장바구니' onclick='cart(this)'>";
							mainSectionHtml += "<input type='hidden' value='"+i+"'>";  
							mainSectionHtml += "</div>";
							mainSectionHtml += "</div>";
							mainSectionHtml += "</div>";
						}
					}
					
					if(product.is(":checked")){
						mainSectionHtml += "<div class='fs-5 my-2 fw-bold topText'>즉석식품</div>";
						mainSectionHtml += "<hr>";
					}
					mainSectionHtml += "<!-- 즉석식품 -->";
					mainSectionHtml += "<div class='container'>";
					mainSectionHtml += "<div class='row'>";
					for(var i=0; i<data.length; i++){
						if(data[i].bigSort == "즉석식품"){
							
							mainSectionHtml += "<div class='col-12 col-sm-12 col-md-6 col-lg-4 col-xl-3 productAll d-flex justify-content-center'>";
							mainSectionHtml += "<div class='card' style='width: 18rem;'>";
							mainSectionHtml += "<a href='productView.do?product_index="+data[i].product_index+"' onclick='productCookie(this)'>";
							mainSectionHtml += "<img src='/FoodContainer/resources/img/"+data[i].brand+"/"+data[i].middleSort+"/"+data[i].thumbnail_image+"' class='card-img-top cardImg' alt='"+data[i].product_name+"'>";
							if(data[i].inventory == 0){
								mainSectionHtml += "<img src='/FoodContainer/resources/img/매진.png' class='card-img-top pListSold'>";
								mainSectionHtml += "<div class='pListSoldout'></div>";
							}
							mainSectionHtml += "<input type='hidden' class='inventory"+i+"' value='"+data[i].inventory+"'>";
							mainSectionHtml += "<div class='card-body'>";
							mainSectionHtml += "<p class='card-text'>";
							if(data[i].quantity >= 500){
								mainSectionHtml += "<span style='color:red;'>[인기]</span>";
							}
							mainSectionHtml += "<span>["+data[i].brand+"]</span>";
							mainSectionHtml += "<br>";
							mainSectionHtml += "<span class='productName'>"+data[i].product_name+"</span><br>";
							mainSectionHtml += "<span class='fs-4'>";
							mainSectionHtml += data[i].origin_price.toLocaleString();
							mainSectionHtml += "</span>원<br>";
							if(data[i].sale_price != -1){
								mainSectionHtml += "<span class='discount'>";
								mainSectionHtml += data[i].sale_price.toLocaleString()+"원";
								var persent = ((data[i].origin_price - data[i].sale_price)/data[i].origin_price)*100;
								mainSectionHtml += "("+persent.toFixed(2)+"%)<br>";
								mainSectionHtml += "</span>";
							}
							mainSectionHtml += "<span class='productListStar'>";
							mainSectionHtml += "<i class='bi bi-star-fill'></i>";
							mainSectionHtml += "<i class='bi bi-star-fill'></i>";
							mainSectionHtml += "<i class='bi bi-star-fill'></i>";
							mainSectionHtml += "<i class='bi bi-star-fill'></i>";
							mainSectionHtml += "<i class='bi bi-star'></i>";
							mainSectionHtml += "</span>";
							mainSectionHtml += "<br>";
							if(data[i].delivery_free_YN != "Y"){
								mainSectionHtml += "배송비 3,000원"; 
							}else{
								mainSectionHtml += "무료배송";
							}
							mainSectionHtml += "</p>";
							mainSectionHtml += "</div>";
							mainSectionHtml += "</a>";
							mainSectionHtml += "<input type='hidden' name='index' value='"+data[i].product_index+"'>";
							mainSectionHtml += "<div class='pListSubImg'>";
							var loginCheck = $("input[name='LoginCheck']").val();
							if(loginCheck != null){
								var heartCheck = 0;
								var userDibsCheck = $("input[name='userDibsCheck']").val();
								var userDibslength = $("input[name='userDibslength']").val();
								var userDibsProduct = $("input[name='userDibsProduct']").val();
								userDibsProduct = userDibsProduct.replace("[","");
								userDibsProduct = userDibsProduct.replace("]","");
								var userDibsProductArr = [];
								userDibsProductArr = userDibsProduct.split(",");
								for(var j=0; j<userDibslength; j++){
									if(userDibsCheck == loginCheck && data[i].product_index == $.trim(userDibsProductArr[j])){
										mainSectionHtml += "<img src='/FoodContainer/resources/img/찬하트.png' class='img-fluid hoverHeart' alt='찜' onclick='heart(this)'>";
										heartCheck = 1;
									}
								}
								if(heartCheck == 0){
									mainSectionHtml += "<img src='/FoodContainer/resources/img/빈하트.png' class='img-fluid hoverHeart' alt='찜' onclick='heart(this)'>";
								}
							}else{
								mainSectionHtml += "<img src='/FoodContainer/resources/img/빈하트.png' class='img-fluid hoverHeart' alt='찜' onclick='heart(this)'>";
							}
							mainSectionHtml += "<img src='/FoodContainer/resources/img/카트2.png' class='img-fluid hoverCart' alt='장바구니' onclick='cart(this)'>";
							mainSectionHtml += "<input type='hidden' value='"+i+"'>";  
							mainSectionHtml += "</div>";
							mainSectionHtml += "</div>";
							mainSectionHtml += "</div>";
						}
					}
					
					if(loginCheck == null){
						mainSectionHtml += "<input type='hidden' id='pListLoginCheck' value=''>";
					}else{
						mainSectionHtml += "<input type='hidden' id='pListLoginCheck' value='"+loginCheck+"'>";
					}
					mainSectionHtml += "</div>";
					mainSectionHtml += "</div>";
					mainSectionHtml += "</article>";
					mainSectionHtml += "<!-- 모바일 버전 -->";
					mainSectionHtml += "<article class='pListM'>";
					if(ice.is(":checked")){
						mainSectionHtml += "<div class='fs-5 my-2 fw-bold topText'>냉동식품</div>";
						mainSectionHtml += "<hr>";
					}
					mainSectionHtml += "<div class='productListCardM'>";
					for(var i=0; i<data.length; i++){		
						if(data[i].bigSort == "냉동식품"){
							mainSectionHtml += "<div class='productListMDiv'>";
							mainSectionHtml += "<a href='productView.do?product_index="+data[i].product_index+"' onclick='productCookie(this)'>";
							mainSectionHtml += "<div class='productListMImg'>";
							mainSectionHtml += "<div style='width:100px; height:100px;'>";
							mainSectionHtml += "<img src='/FoodContainer/resources/img/"+data[i].brand+"/"+data[i].middleSort+"/"+data[i].thumbnail_image+"' class='img-fluid' style='width:100px; height:100px;' alt='"+data[i].product_name+"'>";
								if(data[i].inventory == 0){
									mainSectionHtml += "<img src='/FoodContainer/resources/img/매진.png' class='card-img-top pListSold'>";
									mainSectionHtml += "<div class='pListSoldout'></div>";
								}	
								mainSectionHtml += "<input type='hidden' class='inventoryM"+i+"' value='"+data[i].inventory+"'>";			
								mainSectionHtml += "</div>";			
								mainSectionHtml += "<div class='productListStarM'>";			
								mainSectionHtml += "<i class='bi bi-star-fill'></i>";			
								mainSectionHtml += "<i class='bi bi-star-fill'></i>";			
								mainSectionHtml += "<i class='bi bi-star-fill'></i>";			
								mainSectionHtml += "<i class='bi bi-star-fill'></i>";			
								mainSectionHtml += "<i class='bi bi-star'></i>";			
								mainSectionHtml += "</div>";			
								mainSectionHtml += "</div>";			
								mainSectionHtml += "<div class='productListContent'>";			
								if(data[i].quantity >= 500){
									mainSectionHtml += "<span style='color:red;'>[인기]</span>";	
								}									
								mainSectionHtml += "<span>["+data[i].brand+"]</span>";					
								mainSectionHtml += "<div class='productNameM'>"+data[i].product_name+"</div>";					
								if(data[i].sale_price == -1){
									mainSectionHtml += "<div>";			
									mainSectionHtml += data[i].origin_price.toLocaleString()+"원";	
									mainSectionHtml += "</div>";	
								}else{
									mainSectionHtml += "<div class='discountM'>";
									mainSectionHtml += "[할인가]"+data[i].sale_price.toLocaleString()+"원";
									var persent = ((data[i].origin_price - data[i].sale_price)/data[i].origin_price)*100;
									mainSectionHtml += "("+persent.toFixed(2)+"%)<br>";
									mainSectionHtml += "</div>";
								}
								if(data[i].delivery_free_YN == "Y"){
									mainSectionHtml += "<div>무료배송</div>";
								}else{
									mainSectionHtml += "<div>배송비 3,000원</div>";
								}
								mainSectionHtml += "</div>";
								mainSectionHtml += "</a>";
								mainSectionHtml += "<input type='hidden' name='index' value='"+data[i].product_index+"'>";
								mainSectionHtml += "<div class='pListSubImgM'>";
								var loginCheck = $("input[name='LoginCheck']").val();
								if(loginCheck != null){
									var heartCheck = 0;
									var userDibsCheck = $("input[name='userDibsCheck']").val();
									var userDibsProduct = $("input[name='userDibsProduct']").val();
									var userDibsProductArr = [];
									userDibsProductArr = userDibsProduct.split(",");
									for(var j=0; j<userDibsCheck.lenght; j++){
										if(userDibsCheck == loginCheck && data[i].product_index == userDibsProductArr[j]){
											mainSectionHtml += "<img src='/FoodContainer/resources/img/찬하트.png' class='img-fluid hoverHeart' alt='찜' onclick='heart(this)'>";
											heartCheck = 1;
										}
									}
									if(heartCheck == 0){
										mainSectionHtml += "<img src='/FoodContainer/resources/img/빈하트.png' class='img-fluid hoverHeart' alt='찜' onclick='heart(this)'>";
									}
								}else{
									mainSectionHtml += "<img src='/FoodContainer/resources/img/빈하트.png' class='img-fluid hoverHeart' alt='찜' onclick='heart(this)'>";
								}
								mainSectionHtml += "<img src='/FoodContainer/resources/img/카트2.png' class='img-fluid hoverCart' alt='장바구니' onclick='pListCart(this)'>";
								mainSectionHtml += "<input type='hidden' value='"+i+"'>";
								mainSectionHtml += "</div>";
								mainSectionHtml += "</div>";
						}
					}
					
					if(product.is(":checked")){
						mainSectionHtml += "<div class='fs-5 my-2 fw-bold topText'>즉석식품</div>";
						mainSectionHtml += "<hr>";
					}
					mainSectionHtml += "<div class='productListCardM'>";
					for(var i=0; i<data.length; i++){		
						if(data[i].bigSort == "즉석식품"){
							mainSectionHtml += "<div class='productListMDiv'>";
							mainSectionHtml += "<a href='productView.do?product_index="+data[i].product_index+"' onclick='productCookie(this)'>";
							mainSectionHtml += "<div class='productListMImg'>";
							mainSectionHtml += "<div style='width:100px; height:100px;'>";
							mainSectionHtml += "<img src='/FoodContainer/resources/img/"+data[i].brand+"/"+data[i].middleSort+"/"+data[i].thumbnail_image+"' class='img-fluid' style='width:100px; height:100px;' alt='"+data[i].product_name+"'>";
								if(data[i].inventory == 0){
									mainSectionHtml += "<img src='/FoodContainer/resources/img/매진.png' class='card-img-top pListSold'>";
									mainSectionHtml += "<div class='pListSoldout'></div>";
								}	
								mainSectionHtml += "<input type='hidden' class='inventoryM"+i+"' value='"+data[i].inventory+"'>";			
								mainSectionHtml += "</div>";			
								mainSectionHtml += "<div class='productListStarM'>";			
								mainSectionHtml += "<i class='bi bi-star-fill'></i>";			
								mainSectionHtml += "<i class='bi bi-star-fill'></i>";			
								mainSectionHtml += "<i class='bi bi-star-fill'></i>";			
								mainSectionHtml += "<i class='bi bi-star-fill'></i>";			
								mainSectionHtml += "<i class='bi bi-star'></i>";			
								mainSectionHtml += "</div>";			
								mainSectionHtml += "</div>";			
								mainSectionHtml += "<div class='productListContent'>";			
								if(data[i].quantity >= 500){
									mainSectionHtml += "<span style='color:red;'>[인기]</span>";	
								}									
								mainSectionHtml += "<span>["+data[i].brand+"]</span>";					
								mainSectionHtml += "<div class='productNameM'>"+data[i].product_name+"</div>";					
								if(data[i].sale_price == -1){
									mainSectionHtml += "<div>";			
									mainSectionHtml += data[i].origin_price.toLocaleString()+"원";	
									mainSectionHtml += "</div>";	
								}else{
									mainSectionHtml += "<div class='discountM'>";
									mainSectionHtml += "[할인가]"+data[i].sale_price.toLocaleString()+"원";
									var persent = ((data[i].origin_price - data[i].sale_price)/data[i].origin_price)*100;
									mainSectionHtml += "("+persent.toFixed(2)+"%)<br>";
									mainSectionHtml += "</div>";
								}
								if(data[i].delivery_free_YN == "Y"){
									mainSectionHtml += "<div>무료배송</div>";
								}else{
									mainSectionHtml += "<div>배송비 3,000원</div>";
								}
								mainSectionHtml += "</div>";
								mainSectionHtml += "</a>";
								mainSectionHtml += "<input type='hidden' name='index' value='"+data[i].product_index+"'>";
								mainSectionHtml += "<div class='pListSubImgM'>";
								var loginCheck = $("input[name='LoginCheck']").val();
								if(loginCheck != null){
									var heartCheck = 0;
									var userDibsCheck = $("input[name='userDibsCheck']").val();
									var userDibsProduct = $("input[name='userDibsProduct']").val();
									var userDibsProductArr = [];
									userDibsProductArr = userDibsProduct.split(",");
									for(var j=0; j<userDibsCheck.lenght; j++){
										if(userDibsCheck == loginCheck && data[i].product_index == userDibsProductArr[j]){
											mainSectionHtml += "<img src='/FoodContainer/resources/img/찬하트.png' class='img-fluid hoverHeart' alt='찜' onclick='heart(this)'>";
											heartCheck = 1;
										}
									}
									if(heartCheck == 0){
										mainSectionHtml += "<img src='/FoodContainer/resources/img/빈하트.png' class='img-fluid hoverHeart' alt='찜' onclick='heart(this)'>";
									}
								}else{
									mainSectionHtml += "<img src='/FoodContainer/resources/img/빈하트.png' class='img-fluid hoverHeart' alt='찜' onclick='heart(this)'>";
								}
								mainSectionHtml += "<img src='/FoodContainer/resources/img/카트2.png' class='img-fluid hoverCart' alt='장바구니' onclick='pListCart(this)'>";
								mainSectionHtml += "<input type='hidden' value='"+i+"'>";
								mainSectionHtml += "</div>";
								mainSectionHtml += "</div>";
						}
					}
					
					mainSectionHtml += "</div>";
					mainSectionHtml += "</article>";
				
				}
				
				if(!(ice.is(":checked")) && !(product.is(":checked"))){
					mainSectionHtml = "<div id='notCheck'>선택 된 상품이 없습니다.</div>"
				}
				
				$("#mainSection").html(mainSectionHtml);
				
				
			},
			error : function() {
				console.log('error');			
			}
		});
		
		
	}
	
	