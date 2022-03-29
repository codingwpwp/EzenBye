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