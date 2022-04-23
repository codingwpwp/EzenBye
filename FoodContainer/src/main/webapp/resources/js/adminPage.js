$(document).ready(function(){

    // 등록상품조회페이지 - 페이지가 로드되었을때 브라우저 크기를 기준으로 상품 이름을 조절
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

    // 상품수정페이지 - 사전작업
    var modifyhtml;
    if($("#imageDivs").html() != undefined){
        modifyhtml = $("#imageDivs").html();
    }
    
    // 상품등록&수정페이지 - 페이지가 로드되었을때 브라우저 크기를 기준으로 이미지파일태그의 위치를 조절
    if($(".imageRow").length != 0){

        if($("section").find("form").attr("name") == "productRegisterForm"){// 상품등록페이지의 경우

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

            if($("section").find("form").attr("name") == "productRegisterForm"){// 상품등록페이지의 경우

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

// 탈퇴 아닌 회원 상세조회페이지에서 추방기능
function changeMemberDelyn(member_index, id){
	if(confirm('정말로 ' + id + '님을 추방시키겠습니까?')){
		$.ajax({
			url : "memberDely.do",
			type : "post",
			data : "member_index=" + member_index,
			success : function(data){
				var result = data.trim();
				if(result == "Success") {
					alert("" + id + "님을 추방했습니다. 탈퇴 리스트에서 확인할 수 있습니다.");
					location.href = "member_list.do?&nowPage=1";
				} else {
					alert("추방 실패");
				}
			}
		});
	}else{
		
	}
}

// 회원 쪽지 보내기
function sendMessage(id){
	var form = $("form[name='messageForm']");
	var title = form.find("input[name='title']").val();
	var contents = form.find("textarea[name='contents']").val();
	if(title == ""){
		$("#titleSpan").css("color", "red");
		setTimeout(function(){
            $("#titleSpan").css("color", "black");
        },500);
	}else if(contents == ""){
		$("#contentsSpan").css("color", "red");
		setTimeout(function(){
            $("#contentsSpan").css("color", "black");
        },500);		
	}else{
		if(confirm(id + "님께 쪽지를 보내시겠습니까?")){
			$.ajax({
				url : "sendMessage.do",
				type : "post",
				data : form.serialize(),
				success : function(data){
					var result = data.trim();
					if(result == "Success") {
						alert("전송 완료");
						
					} else {
						alert("전송 실패(혹시 해킹?????)");
					}
					$("#messageCancelBtn").trigger("click");
				}
			});
		}else{
			
		}
	}
}


// 등록상품조회페이지에서 전체 선택
function selectAllProducts(obj){
	if($(obj).is(":checked")){
		$("table").find(".productCheckboxs").prop("checked", true);
	}else{
		$("table").find(".productCheckboxs").prop("checked", false);
	}
}

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
        
        $("#middleSort").val("국");

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

}	// 처음부터 이미지 미리보기 함수만 작성하고 나머지는 따로 만들었으면 좋았을텐데 아쉽다. 내가 이 부분까지는 생각하지 않고 만들었다.

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

// 상품수정페이지의 뒤로가기 버튼
function backWherePage(obj){
	if(obj.value == 1){
		location.href='product_main.do?searchValue=' + $("input[name='searchValue']").val() + "&nowPage=" + $("input[name='nowPage']").val();
	}else{
		location.href='product_detail.do?product_index=' + $("input[name='product_index']").val();
	}
}

// 상품등록&수정페이지의 최하단의 파란버튼(등록하기&수정하기) 눌렀을때 텍스트
function productSubmitButton(formName){
    $("#submitNo").hide();
    $("#submitModal").find("button").not("#submitNo").show();
    if(formName == "productRegisterForm"){
        $("#productMessage").text("상품을 등록하시겠습니까?");
    }else{
        $("#productMessage").text("상품을 수정하시겠습니까?");
    }
}

// 상품등록&수정페이지의 할인 가격 onfocus의 경우
function beforeOriginPriceCheck(obj){
	if($(obj).attr("name") == "sale_price"){
		if($("input[name='origin_price']").val() == ""){
			alert("먼저 판매 가격을 입력하세요");
			$("input[name='origin_price']").focus();
		}
	}
}

// 상품등록&수정페이지의 가격&재고 입력하는 중에 유효성 검사
function priceReg(obj){
	var priceReg = /^$|^[0-9]$|^[1-9][0-9]*$/g;
	if(!priceReg.test(obj.value)){
		obj.value = "";
	}
}

// 상품등록&수정페이지의 할인가격 onblur 판매 가격과 비교하는 함수
function comparePrice(obj){
	if(obj.value != ""){
		var salePrice = parseInt(obj.value);
		var originPrice = parseInt($("input[name='origin_price']").val());
		if(salePrice >= originPrice){
			alert('판매가격 이상은 넘길 수 없습니다.');
			obj.value = "";
		}
	}
}

// 상품등록&수정페이지의 유효성검사
function checkProduct(obj){

    var value;
    var checkreg;
    var flag = true;
    var focusFormArray = [];

    $(".check").each(function(index,item){
        value = $(item).val();

        if($(item).attr("name") == "origin_price" || $(item).attr("name") == "inventory"){
            checkreg = /^$|^[0-9]$|^[1-9][0-9]*$/g;
            if(value == ""){
                flag = false;
                focusFormArray[index] = $(item);
            }else if(!checkreg.test(value)){
                // console.log($(item).attr("name"));
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
    
    if($("input[name='sale_price']").val() != ""){
        checkreg = /^$|^[0-9]$|^[1-9][0-9]*$/g;
        if(!checkreg.test($("input[name='sale_price']").val())){
            flag = false;
            focusFormArray[focusFormArray.length] = $("input[name='sale_price']");
        }
    }
    
    if(flag == false){

        $("#submitModal").find("button").not("#submitNo").hide();
        $("#submitNo").show();
        if($(obj).attr("name") == "productRegisterForm"){
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
        

    }else{
		if($("input[name='sale_price']").val() == ""){
			$("input[name='sale_price']").val("-1");
		}
		if($(obj).attr("name") == "productRegisterForm"){
			alert('등록이 완료되었습니다.');
        }else{
			alert('수정이 완료되었습니다.');
        }
	}
    
    return flag;

}

// 상품 복구하는 비동기
function productDelN(index){
	if(confirm("복구하시겠습니까??")){
		$.ajax({
			url : "changeDelYNinN.do",
			type : "post",
			data : "product_index=" + index,
			success : function(data){
				var result = data.trim();
				if(result == "Success") {
					alert("복구되었습니다");
					location.href="product_delete_list.do?nowPage=1";
				} else {
					alert("복구 실패");
				}
			}
		});
	}
}

// 배너페이지의 이미지 미리보기
function bannerPreviewImage(event, obj, formName){

    // 확장자를 추출하는 과정
    var valueArray = obj.value.split(".");
    var extension = valueArray[valueArray.length-1];

    // 해당폼을 추출하는 과정
    var form = $("form[name='" + formName + "']");

    if(extension == "png" || extension == "PNG"){ // 확장자가 png일 경우

        // 원래 있던 이미지는 초기화
        $(form).find(".imageContainer").find("img").attr("src", "");

        // 이미지가 없다는 문구를 숨기기
        $(form).find(".bannerMessage").hide();

        // 리더기 생성
        var reader = new FileReader();

        // 리더기 작동
        reader.onload = function(event) {
            $(form).find(".imageContainer").find("img").attr("src", event.target.result);
        };

        // 이미지를 인코딩
        reader.readAsDataURL(event.target.files[0]);

    }else{ // 확장자가 png가 아닐 경우

        alert("확장자는 png만 가능합니다.");

        // 파일input의 value값 초기화
        $(obj).val("");

        // 원래 있던 이미지는 초기화
        $(form).find(".imageContainer").find("img").attr("src", "");

        // 이미지가 없다는 문구를 보이기
       	$(form).find(".bannerMessage").show();
        if(formName != "bannerRegisterForm"){
			$(form).find(".bannerMessage").text("이미지가 없습니다.");
		}
		
    }

}
var bannerModifyrFormLink = "";
// 배너페이지의 링크를 입력했을때 링크유무를 조사
function linkYNCheck(formName){

    // 해당폼을 추출하는 과정
    var form = $("form[name='" + formName + "']");
    
    // 링크유무를 확인하는 과정
    var linkYN = $(form).find("input[name='link_YN']:checked").val();
    var link = $(form).find("input[name='link']");
    if(linkYN == "N"){
		link.val("");
		link.attr('placeholder', "");
		link.attr('disabled', true);
    }else{
		if(formName != "bannerModifyrForm"){
			link.val("http://");	
		}else{
			link.val(bannerModifyrFormLink);	
		}
		link.attr('placeholder', "주소를 입력하세요");
		link.attr('disabled', false);
    }

}

// 배너페이지의 배너 등록&수정 submit
function bannerSumbit(obj, formName){
	var flag = true;
	var form = $("form[name='" + formName + "']")
	var urlReg = /(http(s)?:\/\/)([a-z0-9\w]+\.*)+[a-z0-9]{2,4}/gi;
	
	if($(form).find("input[name='name']").val() == ""){
		flag = false;
	}else if($(form).find("input[name='bannerFile']").val() == ""){
		flag = false;
	}else if($(form).find("input[name='link_YN']:checked").val() == "Y"){
		if($(form).find("input[name='link']").val() == ""){
			flag = false;
		}else if(!urlReg.test($(form).find("input[name='link']").val())){
			flag = false;
		}
	}
	
	if(flag == false){
		alert('형식 오류입니다');
	}else{
		if(formName == "bannerRegisterForm"){
			alert('배너 등록이 완료되었습니다');
		}else{
			alert('배너 수정이 완료되었습니다');
		}
		$(obj).parent().prev().find("form").submit();
	}
	
}

// 배너페이지의 배너보기
function nowBanner(obj){
	var img = $(obj).prev().attr("src");
	$("#nowBannerImg").attr("src", img);
}

// 배녀페이지의 수정버튼 클릭했을 때 현재배너 나타내기
function modifyStartBanner(obj){
	var link_YN = $(obj).next().next().val();
	var tr = $(obj).closest("tr.bannerTr");
	var form = $("form[name='bannerModifyrForm']");
	form.find("input[name='banner_index']").val(tr.find("td:eq(0)").find("input[name='banner_index']").val());
	form.find("input[name='name']").val(tr.find("td:eq(3)").html());
	form.find(".bannerMessage").text("현재 배너");
	form.find(".bannerMessage").show();
	form.find("img.w-100").attr("src", tr.find("td:eq(2)").find("img").attr("src"));
	bannerModifyrFormLink  = form.find("input[name='link']").val();
	if(link_YN == "Y"){
		form.find("input:radio[name='link_YN']:radio[value='Y']").prop('checked', true);
		form.find("input:radio[name='link_YN']:radio[value='N']").prop('checked', false);
		form.find("input[name='link']").val($(obj).next().next().next().val());
	}else if(link_YN == "N"){
		form.find("input:radio[name='link_YN']:radio[value='Y']").prop('checked', false);
		form.find("input:radio[name='link_YN']:radio[value='N']").prop('checked', true);
		form.find("input[name='link']").val("");
		form.find("input[name='link']").attr('disabled', true);
	}
	
	
}

// 테이블 안의 체크박스들 전체 선택(등록상품조회페이지&배너페이지)
function checkAllCheckbox(obj, tableName){
	if($(obj).is(":checked")){
		$("table#" + tableName).find("input[type='checkbox']").prop("checked", true);
	}else{
		$("table#" + tableName).find("input[type='checkbox']").prop("checked", false);
	}
}

// 테이블 안에 체크박스를 체크 했을때 전체 체크박스 관련 함수(등록상품조회페이지&배너페이지)
function changeCheckbox(checkbox, tableName){
	var trTotalCnt = $("table#" + tableName).find("tbody").find("tr").length;
	var trCnt = 0;
	$("table#" + tableName).find("input[type='checkbox']").each(function(){
		if(!$(this).is(":checked")){
			$("#" + checkbox).prop("checked", false);
			return false;
		}else{
			trCnt++;
		}
	});
	if(trCnt == trTotalCnt){
		$("#" + checkbox).prop("checked", true);
	}
}

// 체크된 것들 선택 삭제(등록상품조회페이지&배너페이지)
function checkedDelete(tableName, sort){
	if($("table#" + tableName).find("input[type='checkbox']").is(':checked')){
		deleteSort(sort);
	}else{
		alert("체크된 것이 없습니다");
	}
}

// 하나만 체크된 것 삭제(등록상품조회페이지&배너페이지)
function deleteThisCheckbox(tableName, sort, obj){
	$("#" + sort + "Checkbox").prop("checked", false);
	$("table#" + tableName).find("input[type='checkbox']").prop("checked", false);
	$(obj).parent().parent().find("input[type='checkbox']").prop("checked", true);
	deleteSort(sort);
}

// 삭제할 때 종류 나누기
function deleteSort(sort){
	if(sort == 'banner'){
		deleteBannerAjax();
	}else if(sort == 'product'){
		deleteProductAjax();
	}
}

// 등록상품조회&상세조회페이지에서 삭제관련 ajax
function deleteProductAjax(){
	$.ajax({
		url : "productDelete.do",
		type : "post",
		data : $("form[name='checkedProductIndexForm']").serialize(),
		success : function(data){
			var result = data.trim();
			if(result == "deleteSuccess") {
				alert("선택된 상품이 삭제되었습니다");
				location.href = "product_main.do?&nowPage=1";
			} else {
				alert("삭제 실패");
			}
		}
	});
}

// 배너페이지에서 삭제관련 ajax
function deleteBannerAjax(){
	$.ajax({
		url : "bannerDelete.do",
		type : "post",
		data : $("form[name='checkedBannerIndexForm']").serialize(),
		success : function(data){
			var result = data.trim();
			if(result == "deleteSuccess") {
				alert("선택된 배너가 삭제되었습니다");
				location.href = "banner.do";
			} else {
				alert("삭제 실패");
			}
		}
	});
}

function selectAllRecipeCheckbox(obj){
	if($(obj).is(":checked")){
		$("#recipeTable").find("input[type='checkbox']").prop("checked", true);
	}else{
		$("#recipeTable").find("input[type='checkbox']").prop("checked", false);
	}
}

function recipeCheckbox(){
	var trTotalCnt = $("#recipeTable").find("tbody").find("tr").length;
	var trCnt = 0;
	$("#recipeTable").find("input[type='checkbox']").each(function(){
		if(!$(this).is(":checked")){
			$("#totalCheckbox").prop("checked", false);
			return false;
		}else{
			trCnt++;
		}
	});
	if(trCnt == trTotalCnt){
		$("#totalCheckbox").prop("checked", true);
	}
}

function cancelSelectedRecipe(){
	var trCnt = 0;
	$("#recipeTable").find("input[type='checkbox']").each(function(){
		if($(this).is(":checked")){
			trCnt++;
		}
	});
	
	if(trCnt == 0){
		alert("최소 한개는 선택해야 합니다");
	}else{
		if(confirm("선택한 베스트레시피를 해제하시겠습니까?")){
			alert("순위는 자동으로 조절 됩니다");
			document.frm.submit();
		}
	}
}

function cancelRecipe(obj){
	if(confirm("해당 베스트레시피를 해제하시겠습니까?")){
		alert("순위는 자동으로 조절 됩니다");
		$("#recipeTable").find("input[type='checkbox']").each(function(){
			$(this).prop("checked", false);
		});
		$(obj).parent().parent().find("input[type='checkbox']").prop("checked", true);
		document.frm.submit();
	}
}