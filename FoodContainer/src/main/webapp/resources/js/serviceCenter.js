function changeSort(sort){
	
	$(".sortBtns").each(function(){
		if($(this).text() == sort){
			$(this).attr("disabled", true);
		}else{
			$(this).attr("disabled", false);
		}
	});
	
	/*$.ajax({
		url : "FAQAjax.do",
		type : "post",
		data : "sort2=" + sort,
		success : function(data){
			
		}
	});*/
}