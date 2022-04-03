$(document).ready(function(){

    // 상품관리페이지 - 페이지가 로드되었을때 브라우저 크기를 기준으로 상품 이름을 조절
    var prouductArray = new Array();
    if($("#productTable").html() != undefined){

        $("#productTable").find(".col5").each(function () {
            prouductArray.push($(this).find("a").text());
        });

        if(window.innerWidth <= 768){
            $("#productTable").find(".col5").each(function (index, item) {

                if((prouductArray[index].length > 13)){
                $(item).find("a").text(prouductArray[index].substring(0,12) + "...");
                }else{
                $(item).find("a").text(prouductArray[index]);
                }
                
            });
        }else if(window.innerWidth <= 992){
            $("#productTable").find(".col5").each(function (index, item) {

                if((prouductArray[index].length > 12)){
                $(item).find("a").text(prouductArray[index].substring(0,11) + "...");
                }else{
                $(item).find("a").text(prouductArray[index]);
                }
                
            });
        }else if(window.innerWidth <= 1200){
            $("#productTable").find(".col5").each(function (index, item) {

                if((prouductArray[index].length > 19)){
                $(item).find("a").text(prouductArray[index].substring(0,18) + "...");
                }else{
                $(item).find("a").text(prouductArray[index]);
                }
                
            });
        }else if(window.innerWidth <= 1400){
            $("#productTable").find(".col5").each(function (index, item) {

                if((prouductArray[index].length > 29)){
                $(item).find("a").text(prouductArray[index].substring(0,28) + "...");
                }else{
                $(item).find("a").text(prouductArray[index]);
                }
                
            });
        }else{
            $("#productTable").find(".col5").each(function (index, item) {
                $(item).find("a").text(prouductArray[index]);
            });
        }

    }

    // 상품관리페이지 - 사이즈가 변경될 때 상품 이름을 조절
    $(window).resize(function(){

        if($("#productTable").html() != undefined){

            if(window.innerWidth <= 768){
                $("#productTable").find(".col5").each(function (index, item) {

                    if((prouductArray[index].length > 13)){
                    $(item).find("a").text(prouductArray[index].substring(0,12) + "...");
                    }else{
                    $(item).find("a").text(prouductArray[index]);
                    }
                    
                });
            }else if(window.innerWidth <= 992){
                $("#productTable").find(".col5").each(function (index, item) {

                    if((prouductArray[index].length > 12)){
                    $(item).find("a").text(prouductArray[index].substring(0,11) + "...");
                    }else{
                    $(item).find("a").text(prouductArray[index]);
                    }
                    
                });
            }else if(window.innerWidth <= 1200){
                $("#productTable").find(".col5").each(function (index, item) {

                    if((prouductArray[index].length > 19)){
                    $(item).find("a").text(prouductArray[index].substring(0,18) + "...");
                    }else{
                    $(item).find("a").text(prouductArray[index]);
                    }
                    
                });
            }else if(window.innerWidth <= 1400){
                $("#productTable").find(".col5").each(function (index, item) {

                    if((prouductArray[index].length > 29)){
                    $(item).find("a").text(prouductArray[index].substring(0,28) + "...");
                    }else{
                    $(item).find("a").text(prouductArray[index]);
                    }
                    
                });
            }else{
                $("#productTable").find(".col5").each(function (index, item) {
                    $(item).find("a").text(prouductArray[index]);
                });
            }

        }

    });

    // 상품등록&수정페이지 - 페이지가 로드되었을때 브라우저 크기를 기준으로 이미지파일태그의 위치를 조절
    var modifyhtml;
    if($("#imageDivs").html() != undefined){
        modifyhtml = $("#imageDivs").html();
    }
    if($(".imageRow").length != 0){

        if($("form:eq(0)").attr("name") == "productRegisterForm"){// 상품등록페이지의 경우

            if(window.innerWidth >= 768){

                $(".imageRow").each(function(){

                    $(this).find(".inputImageFile").removeClass("mt-2");

                    var imagePreview = $(this).find(".imagePreview");
                    var inputImageFile = $(this).find(".inputImageFile");
                    
                    $(this).find(".imagePreview").remove();
                    $(this).find(".inputImageFile").remove();

                    $(this).append(inputImageFile);
                    $(this).append(imagePreview);

                });
            }

        }else{// 상품수정페이지의 경우

            if(window.innerWidth >= 576){

                $(".imageSort").hide();
                $(".nowPreviewButton").removeClass("col-12");
                $(".nowPreview").removeClass("mt-2");
                $(".nowPreview").addClass("ms-1");

                $(".imageRow").each(function(){

                    var nowPreview = $(this).find(".nowPreview");
                    $(this).find(".nowPreview").remove();
                    $(this).find(".imagePreview").append(nowPreview);

                })

                if(window.innerWidth >= 992){

                    $(".inputImageFile").removeClass("mt-2");

                    $(".imageRow").each(function(){
                    
                        var imagePreview = $(this).find(".imagePreview");
                        var inputImageFile = $(this).find(".inputImageFile");

                        $(this).find(".imagePreview").remove();
                        $(this).find(".inputImageFile").remove();

                        $(this).append(inputImageFile);
                        $(this).append(imagePreview);

                    })
                }

            }

        }

    }

    // 상품등록&수정페이지 - 사이즈가 변경될 때 이미지파일태그의 위치를 조절
    $(window).resize(function(){

        if($(".imageRow").length != 0){

            if($("form:eq(0)").attr("name") == "productRegisterForm"){

                if(window.innerWidth >= 768){

                    $(".imageRow").each(function(){

                        $(this).find(".inputImageFile").removeClass("mt-2");

                        var imagePreview = $(this).find(".imagePreview");
                        var inputImageFile = $(this).find(".inputImageFile");
                        
                        $(this).find(".imagePreview").remove();
                        $(this).find(".inputImageFile").remove();

                        $(this).append(inputImageFile);
                        $(this).append(imagePreview);

                    });

                }else{

                    $(".imageRow").each(function(){

                        $(this).find(".inputImageFile").addClass("mt-2");

                        var imagePreview = $(this).find(".imagePreview");
                        var inputImageFile = $(this).find(".inputImageFile");
                        
                        $(this).find(".imagePreview").remove();
                        $(this).find(".inputImageFile").remove();

                        $(this).append(imagePreview);
                        $(this).append(inputImageFile);

                    });

                }

            }else{

                if(window.innerWidth >= 576){

                    $(".imageSort").hide();
                    $(".nowPreviewButton").removeClass("col-12");
                    $(".nowPreview").removeClass("mt-2");
                    $(".nowPreview").addClass("ms-1");

                    $(".imageRow").each(function(){

                        var nowPreview = $(this).find(".nowPreview");
                        $(this).find(".nowPreview").remove();
                        $(this).find(".imagePreview").append(nowPreview);

                    })

                    if(window.innerWidth >= 992){

                        $(".inputImageFile").removeClass("mt-2");

                        $(".imageRow").each(function(){
                        
                            var imagePreview = $(this).find(".imagePreview");
                            var inputImageFile = $(this).find(".inputImageFile");

                            $(this).find(".imagePreview").remove();
                            $(this).find(".inputImageFile").remove();

                            $(this).append(inputImageFile);
                            $(this).append(imagePreview);

                        });

                    }else{

                        $(".inputImageFile").addClass("mt-2");

                        $(".imageRow").each(function(){
                        
                            var imagePreview = $(this).find(".imagePreview");
                            var inputImageFile = $(this).find(".inputImageFile");

                            $(this).find(".imagePreview").remove();
                            $(this).find(".inputImageFile").remove();

                            $(this).append(imagePreview);
                            $(this).append(inputImageFile);

                        });

                    }

                }else{

                    $("#imageDivs").html("");
                    $("#imageDivs").html(modifyhtml);

                    // $(".imageSort").show();
                    // $(".nowPreviewButton").addClass("col-12");
                    // $(".nowPreview").addClass("mt-2");
                    // $(".nowPreview").removeClass("ms-1");

                    // $(".imageRow").each(function(){

                    //     var nowPreview = $(this).find(".nowPreview");
                    //     $(this).find(".nowPreview").remove();
                    //     $(this).append(nowPreview);

                    // })

                }

            }

        }

        if(window.innerWidth <= 576){
			$(".findT").css("text-align","left");
			$(".number-good").css("text-align","left");
        }else{
			$(".findT").css("text-align","right");
			$(".number-good").css("text-align","right");
        }

    });

});

// 상품등록페이지의 중분류 초기설정&select박스 색상
function registerFormColorSetting(){

    $(".instant").hide();
    $("#bigSort").addClass("bg-primary");
    $("#middleSort").addClass("bg-primary");
    $("select[name='brand']").find("option").not("option[value='기타']").addClass("bg-primary");

}

// 상품수정페이지의 중분류 초기설정&select박스 색상
function modifyFormColorSetting(){

    if($("#bigSort").val() == "냉동식품"){

        $(".instant").hide();
        $("#bigSort").addClass("bg-primary");
        $("#middleSort").addClass("bg-primary");
        $("select[name='brand']").find("option").not("option[value='기타']").addClass("bg-primary");

    }else{

        $(".frozen").hide();
        $("#bigSort").addClass("bg-success");
        $("#middleSort").addClass("bg-success");
        $("select[name='brand']").find("option").not("option[value='기타']").addClass("bg-success");

    }

}

// 상품등록&수정페이지의 select박스 색상
function changeBigSort(obj){

    if($(obj).val() == "냉동식품"){

        $("#middleSort").val("볶음밥");

        $("#bigSort").removeClass("bg-success");
        $("#bigSort").addClass("bg-primary");
        
        $("#middleSort").removeClass("bg-success");
        $("#middleSort").addClass("bg-primary");

        $(".instant").hide();
        $(".frozen").show();

        $("select[name='brand']").find("option").not("option[value='기타']").removeClass("bg-success");
        $("select[name='brand']").find("option").not("option[value='기타']").addClass("bg-primary");


        
    }else{
        
        $("#middleSort").val("국물");

        $("#bigSort").removeClass("bg-primary");
        $("#bigSort").addClass("bg-success");

        $("#middleSort").removeClass("bg-primary");
        $("#middleSort").addClass("bg-success");

        $(".frozen").hide();
        $(".instant").show();

        $("select[name='brand']").find("option").not("option[value='기타']").removeClass("bg-primary");
        $("select[name='brand']").find("option").not("option[value='기타']").addClass("bg-success");

    }

}

// 상품등록&수정페이지의 이미지 미리보기
function previewImage(event, obj){

    // 확장자를 추출하는 과정
    var valueArray = obj.value.split(".");
    var extension = valueArray[valueArray.length-1];

    var id = $(obj).attr("name") + "Modal";

    if(extension == "png"){ // 확장자가 png일 경우

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
// 처음부터 이미지 미리보기 함수만 작성하고 나머지는 따로 만들었으면 좋았을텐데 아쉽다. 내가 이 부분까지는 생각하지 않고 만들었다.

// 상품등록페이지의 초기화 버튼
function formReset(){

    $("#bigSort").removeClass("bg-success");
    $("#bigSort").addClass("bg-primary");

    $("#middleSort").removeClass("bg-success");
    $("#middleSort").addClass("bg-primary");

    $("#middleSort").find(".instant").hide();
    $("#middleSort").find(".frozen").show();

    $("select[name='brand']").find("option").not("option[value='기타']").removeClass("bg-success");
    $("select[name='brand']").find("option").not("option[value='기타']").addClass("bg-primary");

    $(".previewButton").removeClass("btn-primary");
    $(".previewButton").addClass("btn-secondary");

}

// 상품등록&수정페이지의 submit 버튼
function registerButton(){
    $("#submitNo").hide();
    $("#submitModal").find("button").not("#submitNo").show();
    if($("form:eq(0)").attr("name") == "productRegisterForm"){
        $("#productMessage").text("상품을 등록하시겠습니까?");
    }else{
        $("#productMessage").text("상품을 수정하시겠습니까?");
    }
}

// 상품등록&수정페이지의 유효성검사
function checkProduct(){

    var value;
    var checkreg;
    var flag = true;
    var focusFormArray = [];

    $(".check").each(function(index,item){
        value = $(item).val();

        if($(item).attr("name") == "productPrice" || $(item).attr("name") == "inventory"){

            checkreg = /^[^0]\d*/g;
            if(value == ""){
                flag = false;
                focusFormArray[index] = $(item);
            }else if(!checkreg.test(value)){
                console.log($(item).attr("name"));
                flag = false;
                focusFormArray[index] = $(item);
            }

        }else{
            if(value == ""){
                flag = false;
                focusFormArray[index] = $(item);
            }
        }

    });
    
    if($("input[name='salePrice']").val() != ""){
        checkreg = /^[^0]\d*/g;
        if(!checkreg.test($("input[name='salePrice']").val())){
            flag = false;
            focusFormArray[focusFormArray.length] = $("input[name='salePrice']");
        }
    }

    if(flag == false){

        $("#submitModal").find("button").not("#submitNo").hide();
        $("#submitNo").show();
        if($("form:eq(0)").attr("name") == "productRegisterForm"){
            $("#productMessage").text("등록 실패");
        }else{
            $("#productMessage").text("수정 실패");
        }
        setTimeout(function(){
            document.getElementById("submitNo").click();
            for(i = 0; i < focusFormArray.length; i++){
                if(focusFormArray[i] != null){
                focusFormArray[i].focus();
                break;
                }
            }
        },800);

    }
    
    return flag;

}

// 배너페이지의 이미지 미리보기
function bannerPreviewImage(event, obj, formName){

    // 확장자를 추출하는 과정
    var valueArray = obj.value.split(".");
    var extension = valueArray[valueArray.length-1];

    // 해당폼을 추출하는 과정
    var form = $("form[name='" + formName + "']");

    if(extension == "png"){ // 확장자가 png일 경우

        // 원래 있던 이미지는 삭제
        $(form).find(".imageContainer").find("img").remove();

        // 이미지가 없다는 문구를 삭제
        $(form).find(".imageContainer").find("span").remove();

        // 리더기 생성
        var reader = new FileReader();

        // 리더기 작동
        reader.onload = function(event) {
            var img = document.createElement("img");
            $(img).attr("src", event.target.result);
            $(img).addClass("w-100");
            $(form).find(".imageContainer").append(img);
        };

        // 이미지를 인코딩
        reader.readAsDataURL(event.target.files[0]);

    }else{ // 확장자가 png가 아닐 경우

        alert("확장자는 png만 가능합니다.");

        // 이미지가 없다는 문구의 중복 방지를 위해 삭제
        $(form).find(".imageContainer").find("span").remove();

        // 파일input의 value값 초기화
        $(obj).val("");

        // 이미지가 있다면 삭제
        $(form).find(".imageContainer").find("img").remove();

        // 이미지가 없다는 문구를 생성하고 뿌리기
        var span = document.createElement("span");
        $(span).addClass("fs-5");
        $(span).text("이미지가 없습니다.");
        $(form).find(".imageContainer").append(span);

    }

}

// 배너페이지의 링크를 입력했을때 링크유무를 조사
function linkYNCheck(obj, formName){

    // 해당폼을 추출하는 과정
    var form = $("form[name='" + formName + "']");

    // 링크유무를 확인하는 과정
    var linkYN = $(form).find("input[name='linkYN']:checked").attr("id");
    if(linkYN != "yes"){
        var URLvalue = obj.value.substring(0, obj.value.length - 1);
        obj.value = URLvalue;
        $(form).find(".linkMessage").text("'있음'으로 체크하고 입력하세요");
    }else{
        $(form).find(".linkMessage").text("");
    }

}