$(document).ready(function() {
    var gift;
    var rotationPos = new Array(60,120,180,240,300,360);
	var eventSw = 0;
    // 처음에 천천히 돌게하는 메소드
    TweenLite.to($(".board_on"), 3000, {css:{rotation: 30000}, ease: Linear.easeNone});

    

    $(".join").on("click",function(){
		if(eventSw == 1){
		}else{
			eventSw = 1;
			$.ajax({
				url: "event.do",
				type: "post",
				success: function(data){
					console.log(data);
					if(data == "Fail"){
						alert("회원만 참여가 가능합니다");
						eventSw = 0;
					}else if(data == "noTicket"){
						alert("티켓이 없습니다");
						eventSw = 0;
					}else{
						var result = data.trim();
						$("#event_ticket").text( parseInt($("#event_ticket").text()) - 1 );
						$.ajax({
							url: "eventResult.do",
							type: "post",
							data: "result=" + result,
							success: function(){}
						});
						iniGame(Math.floor(result - 1));
					}
				}
			});
		}
    });
    

    function iniGame(num){
        gift = num;
        TweenLite.killTweensOf($(".board_on"));
        TweenLite.to($(".board_on"), 0, {css:{rotation:rotationPos[num]}});
        TweenLite.from($(".board_on"),5, {css:{rotation:-3000}, onComplete:endGame, ease:Sine.easeOut});
    }

    
    function endGame(){
        $("#popup_gift .lottery_present" ).text(function() {
			switch(gift + 1){
				case 1 : return "축하합니다 10%쿠폰에 당첨되었습니다!!"
				break;
				
				case 2 : return "축하합니다 5%쿠폰에 당첨되었습니다!!";
				break;
				
				case 3 : return "축하합니다 1,000포인트가 당첨 되었습니다!";
				break;
				
				case 4 : return "초대박!!!!50,000포인트 증정!!";
				break;
				
				case 5 : return "10포인트ㅋㅋ";
				break;
				
				case 6 : return "10포인트ㅋㅋ";
			}
        });
        $('<img  src="/controller/resources/img/이벤트/coupon' + (gift + 1) + '.png" />').prependTo("#popup_gift .lottery_present");
        
        setTimeout(function() {
            openPopup("popup_gift");
        }, 1000);
    }

    function openPopup(id) {
        closePopup();
        $('.popup').slideUp(0);
        var popupid = id;
        $('body').append('<div id="fade"></div>');
        
        $('#fade').css({
        	'filter' : 'alpha(opacity=60)'
        }).fadeIn(300);
        
        var popuptopmargin = ($('#' + popupid).height()) / 2;
        var popupleftmargin = ($('#' + popupid).width()) / 2;
        $('#' + popupid).css({
            'margin-left' : -popupleftmargin
        });
        $('#' + popupid).slideDown(500);
        
        TweenLite.to($(".board_on"), 3000, {css:{rotation: 30000}, ease: Linear.easeNone});
    }
    $(".close").click(closePopup);
    function closePopup() {
		eventSw = 0;
        $('#fade').fadeOut(300, function() {});
        $('.popup').slideUp(400);
        return false;
    }
});