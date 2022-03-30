$(document).ready(function(){
	
	if(window.innerWidth <= 576){
		$(".findT, .number-good").css("text-align","left");
	}else{
		$(".findT, .number-good").css("text-align","right");
	}
	
	$(window).resize(function() {
			
		if(window.innerWidth <= 576){
			$(".findT, .number-good").css("text-align","left");
		}else{
			$(".findT, .number-good").css("text-align","right");
		}
		
	});
	
});