$(document).ready(function(){

  var activeMenu = $("#asdieMenu").find(".active").text();
  if(activeMenu.length != 0){
    $("#activeMenu").text(activeMenu);
    $("#gt").show();	
  }
  
  // 페이지가 로드되었을때 브라우저 크기를 기준으로 상품관리페이지의 상품 이름을 조절
  var prouductArray = new Array();
  if($("#productTable").html() != undefined){

    $("#productTable").find(".col5").each(function () {
      prouductArray.push($(this).find("a").text());
    });
    // console.log(prouductArray);

    if(window.innerWidth <= 576){

      $("#productTable").find(".col5").each(function (index) {

        if((prouductArray[index].length > 6)){
          $(this).find("a").text(prouductArray[index].substring(0,5) + "...");
        }else{
          $(this).find("a").text(prouductArray[index]);
        }
        
      });

    }else if(window.innerWidth <= 768){

      $("#productTable").find(".col5").each(function (index) {

        if((prouductArray[index].length > 13)){
          $(this).find("a").text(prouductArray[index].substring(0,12) + "...");
        }else{
          $(this).find("a").text(prouductArray[index]);
        }
        
      });

    }else if(window.innerWidth <= 992){

      $("#productTable").find(".col5").each(function (index) {

        if((prouductArray[index].length > 12)){
          $(this).find("a").text(prouductArray[index].substring(0,11) + "...");
        }else{
          $(this).find("a").text(prouductArray[index]);
        }
        
      });

    }else if(window.innerWidth <= 1200){

      $("#productTable").find(".col5").each(function (index) {

        if((prouductArray[index].length > 19)){
          $(this).find("a").text(prouductArray[index].substring(0,18) + "...");
        }else{
          $(this).find("a").text(prouductArray[index]);
        }
        
      });

    }else if(window.innerWidth <= 1400){
  
      $("#productTable").find(".col5").each(function (index) {

        if((prouductArray[index].length > 29)){
          $(this).find("a").text(prouductArray[index].substring(0,28) + "...");
        }else{
          $(this).find("a").text(prouductArray[index]);
        }
        
      });

    }else{

      $("#productTable").find(".col5").each(function (index) {

        if((prouductArray[index].length > 39)){
          $(this).find("a").text(prouductArray[index].substring(0,38) + "...");
        }else{
          $(this).find("a").text(prouductArray[index]);
        }
        
      });

    }

  }

  // 사이즈가 변경될 때 상품관리페이지의 상품 이름을 조절
  $(window).resize(function() {

    if($("#productTable").html() != undefined){
  
      if(window.innerWidth <= 576){
  
        $("#productTable").find(".col5").each(function (index) {
  
          if((prouductArray[index].length > 6)){
            $(this).find("a").text(prouductArray[index].substring(0,5) + "...");
          }else{
            $(this).find("a").text(prouductArray[index]);
          }
          
        });
  
      }else if(window.innerWidth <= 768){
  
        $("#productTable").find(".col5").each(function (index) {
  
          if((prouductArray[index].length > 13)){
            $(this).find("a").text(prouductArray[index].substring(0,12) + "...");
          }else{
            $(this).find("a").text(prouductArray[index]);
          }
          
        });
  
      }else if(window.innerWidth <= 992){
  
        $("#productTable").find(".col5").each(function (index) {
  
          if((prouductArray[index].length > 12)){
            $(this).find("a").text(prouductArray[index].substring(0,11) + "...");
          }else{
            $(this).find("a").text(prouductArray[index]);
          }
          
        });
  
      }else if(window.innerWidth <= 1200){
  
        $("#productTable").find(".col5").each(function (index) {
  
          if((prouductArray[index].length > 19)){
            $(this).find("a").text(prouductArray[index].substring(0,18) + "...");
          }else{
            $(this).find("a").text(prouductArray[index]);
          }
          
        });
  
      }else if(window.innerWidth <= 1400){
    
        $("#productTable").find(".col5").each(function (index) {
  
          if((prouductArray[index].length > 29)){
            $(this).find("a").text(prouductArray[index].substring(0,28) + "...");
          }else{
            $(this).find("a").text(prouductArray[index]);
          }
          
        });
  
      }else{
  
        $("#productTable").find(".col5").each(function (index) {
  
          if((prouductArray[index].length > 39)){
            $(this).find("a").text(prouductArray[index].substring(0,38) + "...");
          }else{
            $(this).find("a").text(prouductArray[index]);
          }
          
        });
  
      }
  
    }
    
  });

  // 상품등록페이지에서의 중분류 초기설정&select박스 색상
  if($("#middleSort").find(".instant") != null){
    $("#middleSort").find(".instant").hide();
    $("#bigSort").css("background-color", $("select[name='bigSort'] option:selected").css("background-color"));
    $("#middleSort").css("background-color", $("select[name='middleSort'] option:selected").css("background-color"));

  }

});

// 상품등록페이지에서의 select박스 색상
function changeBigSort(obj){

  $("#bigSort").css("background-color", $("select[name='bigSort'] option:selected").css("background-color"));

  if($(obj).val() == "냉동식품"){
    
    $("#middleSort").val("볶음밥");
    $("#middleSort").css("background-color", $("select[name='middleSort'] option:selected").css("background-color"));

    $("#middleSort").find(".instant").hide();
    $("#middleSort").find(".frozen").show();

    $("select[name='brand']").removeClass("bg-warning");
    $("select[name='brand']").find("option").not("option[value='기타']").removeClass("bg-warning");

    $("select[name='brand']").addClass("bg-primary");
    $("select[name='brand']").find("option").not("option[value='기타']").addClass("bg-primary");


    
  }else{
    
    $("#middleSort").val("국물");
    $("#middleSort").css("background-color", $("select[name='middleSort'] option:selected").css("background-color"));

    $("#middleSort").find(".frozen").hide();
    $("#middleSort").find(".instant").show();

    $("select[name='brand']").removeClass("bg-primary");
    $("select[name='brand']").find("option").not("option[value='기타']").removeClass("bg-primary");

    $("select[name='brand']").addClass("bg-warning");
    $("select[name='brand']").find("option").not("option[value='기타']").addClass("bg-warning");

  }

}

// 이미지 미리보기
function previewImage(event, obj) {

  // 확장자를 추출하는 과정
  var valueArray = obj.value.split(".");
  var extension = valueArray[valueArray.length-1];

  if(extension == "png"){ // 확장자가 png일 경우

      // 원래 있던 이미지는 삭제
      $(obj).parent().next().find(".imageContainer").find("img").remove();

      // 이미지가 없다는 문구를 삭제
      $(obj).parent().next().find(".imageContainer").find("span").remove();

      // 리더기 생성
      var reader = new FileReader();

      // 리더기 작동
      reader.onload = function(event) {
          var img = document.createElement("img");
          $(img).attr("src", event.target.result);
          $(img).addClass("img-fluid");
          $(obj).parent().next().find(".imageContainer").append(img);
      };

      // 이미지를 인코딩
      reader.readAsDataURL(event.target.files[0]);

      // 버튼 변경
      $(obj).parent().next().find(".previewButton").removeClass("btn-secondary");
      $(obj).parent().next().find(".previewButton").addClass("btn-primary");

  }else{ // 확장자가 png가 아닐 경우

      alert("확장자는 png만 가능합니다.");

      // 이미지가 없다는 문구의 중복 방지를 위해 삭제
      $(obj).parent().next().find(".imageContainer").find("span").remove();

      // 파일input의 value값 초기화
      $(obj).val("");

      // 이미지가 있다면 삭제
      $(obj).parent().next().find(".imageContainer").find("img").remove();

      // 이미지가 없다는 문구를 생성하고 뿌리기
      var span = document.createElement("span");
      $(span).addClass("fs-5");
      $(span).text("이미지가 없습니다.");
      $(obj).parent().next().find(".imageContainer").append(span);

      // 버튼 변경
      $(obj).parent().next().find(".previewButton").removeClass("btn-primary");
      $(obj).parent().next().find(".previewButton").addClass("btn-secondary");

  }

}

// 상품등록페이지에서의 초기화
function formReset(){

  $("#bigSort").val("냉동식품");
  $("#bigSort").css("background-color", $("select[name='bigSort'] option:selected").css("background-color"));

  $("#middleSort").val("볶음밥");
  $("#middleSort").css("background-color", $("select[name='middleSort'] option:selected").css("background-color"));

  $("#middleSort").find(".instant").hide();
  $("#middleSort").find(".frozen").show();

  $("select[name='brand']").removeClass("bg-warning");
  $("select[name='brand']").find("option").not("option[value='기타']").removeClass("bg-warning");

  $("select[name='brand']").addClass("bg-primary");
  $("select[name='brand']").find("option").not("option[value='기타']").addClass("bg-primary");

  $(".previewButton").removeClass("btn-primary");
  $(".previewButton").addClass("btn-secondary");
  
}
