// IMP.request_pay(param, callback) 결제창 호출
function requestPay() {
    var IMP = window.IMP; // 생략 가능
    IMP.init("imp13071934"); // 예: imp00000000
    IMP.request_pay({ // param
        pg: "html5_inicis",                    // pg사 선택
        pay_method: "card",                    // 지불 수단
        merchant_uid: "ORD20180131-0000011",   // 주문번호
        name: "노르웨이 회전 의자",              // 상품이름
        amount: 1000,                          // 가격
        buyer_email: "gildong@gmail.com",      // 구매자 이메일
        buyer_name: "홍길동",                   // 구매자 이름
        buyer_tel: "010-4242-4242",            // 구매자 번호
        buyer_addr: "서울특별시 강남구 신사동",   // 구매자 주소
        buyer_postcode: "01181",               // 구매자 우편번호
        m_redirect_url: "https://naver.com"     //  결제 후에 이동 될 주소
    }, function (rsp) { // callback
        console.log(rsp);
        if (rsp.success) {
            alert("결제성공");
        } else {
            alert("결제에 실패하였습니다 (" +  rsp.error_msg + ")");
        }
        
    });
}