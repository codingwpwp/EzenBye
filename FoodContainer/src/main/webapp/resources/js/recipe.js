  $('#summernote').summernote({
            placeholder: 'Hello stand alone ui',
            tabsize: 2,
            height: 400,
            maxHeight: 400,
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
        function best(){
            var text = prompt("금:1 | 은:2 | 동:3");
        }
        
// 상품등록&수정페이지의 이미지 미리보기
function previewImage(event,obj){

    // 확장자를 추출하는 과정
    var valueArray = obj.value.split(".");
    var extension = valueArray[valueArray.length-1];

    var id = $(obj).attr("name") + "Modal";
  
    console.log(id);

    if(extension == "png" || extension == "PNG"){ // 확장자가 png일 경우

        // 원래 있던 이미지는 삭제
        $("div#" + id).find(".imageContainer").find("img").remove();

        // 이미지가 없다는 문구를 삭제
        $("div#" + id).find(".imageContainer").find("span").remove();
	
		
		
        // 리더기 생성
        var reader = new FileReader();

        // 리더기 작동
        reader.onload = function(event) {
            var img = document.createElement("img");
            $(img).attr("src", event.target.result);
            $(img).addClass("img-fluid");           
           	$("div#" + id).find(".imageContainer").append(img);
           
        };
		
        // 이미지를 인코딩
        reader.readAsDataURL(event.target.files[0]);

        // 버튼 변경
        $(obj).parent().parent().find(".previewButton").removeClass("btn-secondary");
        $(obj).parent().parent().find(".previewButton").addClass("btn-primary");

    }else{ // 확장자가 png가 아닐 경우

        alert("확장자는 png만 가능합니다.");

        // 이미지가 없다는 문구의 중복 방지를 위해 삭제
        $("div#" + id).find(".imageContainer").find("span").remove();

        // 파일input의 value값 초기화
        $(obj).val("");

        // 이미지가 있다면 삭제
        $("div#" + id).find(".imageContainer").find("img").remove();

        // 이미지가 없다는 문구를 생성하고 뿌리기
        var span = document.createElement("span");
        $(span).addClass("fs-5");
        $(span).text("이미지가 없습니다.");
        $("div#" + id).find(".imageContainer").append(span);

        // 버튼 변경
        $(obj).parent().parent().find(".previewButton").removeClass("btn-primary");
        $(obj).parent().parent().find(".previewButton").addClass("btn-secondary");

    }

}
function previewImage2(event,obj){

    // 확장자를 추출하는 과정
    var valueArray = obj.value.split(".");
    var extension = valueArray[valueArray.length-1];

    
    var thumnail = document.getElementById("thumnail");
    

    if(extension == "png" || extension == "PNG"){ // 확장자가 png일 경우

        // 원래 있던 이미지는 삭제
        
		$(thumnail).find("img").remove();
        // 이미지가 없다는 문구를 삭제
        $(thumnail).find("strong").remove();
	
		
		
        // 리더기 생성
        var reader = new FileReader();

        // 리더기 작동
        reader.onload = function(event) {
            var img = document.createElement("img");
            $(img).attr("src", event.target.result);
            $(img).addClass("img-fluid");           
            $(thumnail).append(img);
           
        };
		
        // 이미지를 인코딩
        reader.readAsDataURL(event.target.files[0]);

        // 버튼 변경
        $(obj).parent().parent().find(".previewButton").removeClass("btn-secondary");
        $(obj).parent().parent().find(".previewButton").addClass("btn-primary");

    }

}

function producut1(){
	var name =$(".product_index1").val();
	//console.log(id);
	$.ajax({
		url:"selectbox1",
		type:"post",
		data:"name="+name,
	
		success:function(data){
		console.log(data);
		
		}	
		
	})

}


function insertThumb(){
	
}









