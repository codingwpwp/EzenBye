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
	
			$("#pagingDiv").find("ul").remove();
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
			
			$("#pagingDiv").append(html);
		}
	});
	
	$.ajax({
		url : "sListAjax.do",
		type : "post",
		data : "sort2=" + sort,
		success : function(data){
			var midx = $("#midx").val();
			console.log(midx);
			$(".OneByOne").remove();
			for(var i = 0; i < data.length; i++){
				var html = "";
				
				html += "<tr class='OneByOne'>";
					html += "<th scope='row'>" + cnt +"</th>";
					html += "<td class='fw-bold'>";
					if(midx != "" && (midx == data[i].member_index || midx == 0)){
						html += "<a href='serviceCenter_view.do?sort2=" + sort + "&nowPage=1&serviceCenter_index=" + data[i].serviceCenter_index + "'>";
							html += "<span class='d-inline-block text-truncate'>" + data[i].title + "</span>";
						html += "</a>";
					}else{
						html += "<span class='d-inline-block text-truncate'><i class='fa-solid fa-lock'></i>" + data[i].title + "</span>";
					}
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

function changeColorFn(obj){
	var sort2 = $(obj).val();
	if(sort2 == '상품'){
		$(obj).css("background","#86b6fe");
	}else if(sort2 == '배송'){
		$(obj).css("background","#8cc3a9");
	}else if(sort2 == '취소'){
		$(obj).css("background","#ffe083");
	}else if(sort2 == '회원'){
		$(obj).css("background","#86e4f7");
	}
}

function submitFn(){
	var form = $("#serviceCenterForm");
	var flag = true;
	
	if(form.find("input[name='name']").val() == ""){
		flag = false;
	}else if(form.find("textarea[id='summernote']").val() == ""){
		flag = false;
	}else if(form.find("select option:selected").val() == "no"){
		flag = false;
	}
	if(flag){
		
		if(confirm("한번 등록하면 임의로 수정&삭제가 불가능합니다. 등록하시겠습니까?")){
			alert("등록이 완료되었습니다");
			form.submit();
		}
		
	}else{
		alert("입력란이 부족합니다");
	}
}

function replySubmit(){
	var flag = true;
	if($("textarea#contents").val() == ""){
		flag = false;
	}
	
	if(flag){
		if(!confirm("등록한 이후에는 재등록할수 없습니다")){
			flag = false;
		}
	}else{
		alert("내용을 입력하고 등록하세요");
	}
	
	return flag;
}