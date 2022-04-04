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