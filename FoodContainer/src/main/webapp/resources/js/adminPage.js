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
    
  })

});