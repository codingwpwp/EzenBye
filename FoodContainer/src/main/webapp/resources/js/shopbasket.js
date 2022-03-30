$(document).ready(function(){
	
	if(window.innerWidth <= 576){
		$(".shopbasket-btn").attr("class","d-grid gap-2 d-md-flex justify-content-md-center mt-2 shopbasket-btn");
		$(".shopbasket-number").attr("class","col-lg-2 col-md-2 d-flex justify-content-center mt-2 shopbasket-number");
	}else{
		$(".shopbasket-btn").attr("class","d-grid gap-4 d-md-flex justify-content-md-center mt-2 shopbasket-btn");
		$(".shopbasket-number").attr("class","col-lg-2 col-md-2 d-flex justify-content-end shopbasket-number");
	}
	
	$(window).resize(function() {
			
		if(window.innerWidth <= 576){
			$(".shopbasket-btn").attr("class","d-grid gap-2 d-md-flex justify-content-md-center mt-2 shopbasket-btn");
			$(".shopbasket-number").attr("class","col-lg-2 col-md-2 d-flex justify-content-center mt-2 shopbasket-number");
		}else{
			$(".shopbasket-btn").attr("class","d-grid gap-4 d-md-flex justify-content-md-center mt-2 shopbasket-btn");
			$(".shopbasket-number").attr("class","col-lg-2 col-md-2 d-flex justify-content-end shopbasket-number");
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