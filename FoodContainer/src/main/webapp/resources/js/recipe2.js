  //썸머노트
  $('#summernote').summernote({
            placeholder: 'Hello stand alone ui',
            tabsize: 2,
            height: 400,
            maxHeight: 400,
            toolbar: [
               
             
            ]
        });
        $('#summernote').summernote('disable');
//베스트 레시피
function best(){
            var text = Number(prompt("금:1 | 은:2 | 동:3"));
            if(text == 1 || text ==2 || text == 3){
				if(text==1){
					alert("베스트 레시피 금 선정!!");
					
				}else if(text==2){
					alert("베스트 레시피 은 선정!!");
					
				}else if(text==3){
					alert("베스트 레시피 동 선정!!");
				
				}
				
				
			}else{
				alert("잘못 입력하셨습니다.");
			}
            document.frm.best_rank.value=text;
        }
        



var thumb = document.getElementsByName("thumb");
function insertThumb(){
	
	$.ajax({
		type:POST,
		url:recipeThumb,
		data:"thumb="+thumb
		
		
	});
}

//댓글 수정
function modifyReply(obj,reply_index){
			var contents = $(obj).parent().parent().next().find("span").text(); 
			var span = $(obj).parent();
			
			$("#replycontent").find("span").html("<input type='text' value='"+contents+"' name='contents'>");
			$(obj).remove();
			span.html('<input type="button" value="저장" onclick="updateReply(this,'+reply_index+')" id="updatebtn" class="btn btn-secondary">');
			
		
};
//댓글 수정
function updateReply(obj,reply_index,recipe_index){
	var contents= $(obj).parent().parent().next().find("input[type=text]").val(); 
	var span = $(obj).parent();
	$.ajax({
		type:"post",
		url:"updateReply.do",
		data:"reply_index="+reply_index+"&contents="+contents,
		success:function(data){
			alert("수정이 완료 되었습니다.");
			$(obj).parent().parent().next().find("input[type=text]").remove();
			$(obj).parent().parent().next().html("┗ &nbsp;<span>"+data.contents+"</span>");
			$(obj).remove();
			span.html('<input type="button" value="수정" onclick="modifyReply(this,'+reply_index+')" id="modifybtn" class="btn btn-secondary">'+
				'<input type="button" value="삭제" onclick="deleteReply(this,'+reply_index+','+recipe_index+');" id="deletebtn" class="btn btn-danger replydel">')
			
		}
	});
}
//댓글 삭제
function deleteReply(obj,reply_index,recipe_index){
	var span = $(obj).parent();
	$.ajax({
		type:"post",
		url:"deleteReply.do",
		data:"reply_index="+reply_index+"&recip_index="+recipe_index,
		success:function(data){
			alert("삭제가 완료되었습니다");
			$("#replyname").remove();
			$("#replydate").remove();
			$("#replybtn").remove();
			$("#replybtn").parent().append();
			
			span.remove();
			$("#replycontent").remove();
		
			location.reload();
		}
	});
}







