function changeSort(sort){
	var cnt;
	
	$(".sortBtns").each(function(){
		if($(this).text() == sort){
			$(this).attr("disabled", true);
		}else{
			$(this).attr("disabled", false);
		}
	});
	
	$.ajax({
		url : "FAQAjax.do",
		type : "post",
		data : "sort2=" + sort,
		success : function(data){
			$(".FAQ").remove();
			for(var i = data.length - 1; i >= 0; i--){
				var html = "";
				
				html += "<tr class='fw-bold FAQ' data-bs-toggle='collapse' data-bs-target='#collapse" + data[i].serviceCenter_index +"' aria-expanded='false'>";
					html += "<th scope='row'>-</th>";
					html += "<td><span class='d-inline-block text-reuncate'>" + data[i].title + "</span></td>";
					html += "<td>관리자</td>";
					html += "<td>" + data[i].write_date.substr(0, 10) + "</td>";
				html +=	"</tr>";
				html += "<tr class='FAQ'>";
					html +=	"<td colspan='4' class='collapse collapse-horizontal p-5' id='collapse" + data[i].serviceCenter_index + "'>" + data[i].contents + "</td>";
				html +=	"</tr>";
				
				$("#serviceTableBody").prepend(html);
			}
		}
	});
	
	$.ajax({
		url : "pagingAjax.do",
		type : "post",
		data : "sort2=" + sort,
		success : function(data){
			cnt = data.total - ( (data.nowPage - 1) * data.perPage );
	
			$("#paging").find("ul").remove();
			var html = "";
			
			html += "<ul class='col-12 col-md-4 d-flex align-items-center justify-content-center pagination mt-2 my-md-0'>";
			
				html += "<li class='page-item' style='visibility: hidden'>";
					html += "<a class='page-link' href='#'> aria-label='Previous'";
						html += "<span aria-hidden='true'></span>";
					html += "</a>";
				html += "</li>";
			
			for(var i = data.startPage; i <= data.endPage; i++){
				if(i != data.nowPage){
					html += "<li class='page-item'>";
						html += "<a class='page-link' href='serviceCenter.do?sort2=" + sort + "&nowPage=" + i + "'>" + i + "</a>";
					html += "</li>";
				}else{
					html += "<li class='page-item active' aria-current='page'>";
						html += "<span class='page-link fw-bold'>" + i + "</span>";
					html += "</li>";
				}
			}
			
			if(data.endPage != data.lastPage){
				html += "<li class='page-item'>";
					html += "<a class='page-link' href='serviceCenter.do?sort2=" + sort + "&nowPage=" + (data.endPage + 1) + "'>";
						html += "<span aria-hidden='true'>&gt;</span>";
					html += "</a>";
				html += "</li>";
			}else{
				html += "<li class='page-item' style='visibility: hidden'>";
					html += "<a class='page-link' href='#'> aria-label='Next'";
						html += "<span aria-hidden='true'>&gt;</span>";
					html += "</a>";
				html += "</li>";
			}
			
			html += "</ul>";
			
			$("#paging").append(html);
		}
	});
	
	$.ajax({
		url : "sListAjax.do",
		type : "post",
		data : "sort2=" + sort,
		success : function(data){
			$(".OneByOne").remove();
			for(var i = 0; i < data.length; i++){
				var html = "";
				
				html += "<tr class='OneByOne'>";
					html += "<th scope='row'>" + cnt +"</th>";
					html += "<td class='fw-bold'>";
						html += "<a href='serviceCenter_view.do?sort2=" + sort + "&nowPage=1&serviceCenter_index=" + data[i].serviceCenter_index + "'>";
							html += "<span class='d-inline-block text-truncate'>" + data[i].title + "</span>";
						html += "</a>";
					html += "</td>";
					html += "<td>" + data[i].name + "</td>";
					html += "<td>" + data[i].write_date.substr(0, 10) + "</td>";
				html += "</tr>";
				cnt--;
				
				$("#serviceTableBody").append(html);
			}
		}
	});
}