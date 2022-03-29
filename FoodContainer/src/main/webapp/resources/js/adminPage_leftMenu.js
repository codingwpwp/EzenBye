var menuSw = 0;

$(window).resize(function(){
    if(window.innerWidth > 992 && menuSw == 1){
        $("#navLeftMenuIcon").trigger("click");
        menuSw = 0;
    }
});

function navLeftMenuButonFn(){
    if(menuSw == 0){
        menuSw = 1;
    }else{
        menuSw = 0;
    }
}