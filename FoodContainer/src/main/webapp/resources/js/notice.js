  $('#summernote').summernote({
            tabsize: 2,
            height: 500,
            maxHeight: 500,
           
            toolbar: [
                ['style', ['style']],
                ['font', ['bold', 'underline', 'clear']],
                ['color', ['color']],
                ['para', ['ul', 'ol', 'paragraph']],
                ['table', ['table']],
                ['insert', ['link', 'picture', 'video']],
                ['view', ['fullscreen', 'codeview', 'help']]
            ]
        });
        function popup(){
           window.open("popup.do","a","width=400, height=300, left=800, top=500");
        	
        }
        function best(){
            var text = prompt("금:1 | 은:2 | 동:3");
        }
        
function noticeInsert(obj){
	var title = $("input[name='title']").val();
	var contents = $("textarea[name='contents']").val();
	var form = $("form[name='frm']");
	var flag = true;
	if(title == ""){
		alert('제목은 필수입니다.');
		flag = false;
	}
	if(contents == ""){
		alert('내용은 필수입니다.');
		flag = false;
	}
	if(flag == true){
	var YN = confirm('정말 등록하시겠습니까?');
	if(YN){
		alert('등록 완료!!');
		form.submit();
		}
	}
}

function noticeModify(){
	var title = $("input[name='title']").val();
	var contents = $("textarea[name='contents']").val();
	var form = $("form[name='frm']");
	var flag = true;
	
	if(title == ""){
		alert('제목은 필수입니다.');
		flag = false;
	}
	if(contents == ""){
		alert('내용은 필수입니다.');
		flag = false;
	}
	if(flag == true){
	var YN = confirm('정말 수정하시겠습니까?');
	if(YN){
		alert('수정 완료!!');
		form.submit();
		}
	}
}

function noticeDelete(obj){
	var notice_index = $(obj).parent().find("input[name='notice_index']").val();
	
	var YN = confirm('정말 삭제하시겠습니까?');
	if(YN){
		
		$.ajax({
		url:"noticeDelete.do",
		type:"post",
		data:"notice_index="+notice_index,
	
		success:function(data){
			alert('삭제가 완료되었습니다.');
			window.location.href='notice_main.do?nowPage=1';
		}	
		
		});
	}
}






