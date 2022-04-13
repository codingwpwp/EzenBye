package team.project.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import team.project.service.CartService;
import team.project.service.CouponService;
import team.project.service.EmailService;
import team.project.service.OrdersService;
import team.project.vo.CartVO;
import team.project.vo.CouponVO;
import team.project.vo.EmailVO;
import team.project.vo.MemberVO;

@RequestMapping(value = "/purchase/")
@Controller
public class PurchaseController {
	
	@Autowired
	private CouponService couponService;
	
	@Autowired
	private EmailService emailService;
	
	@Autowired
	private OrdersService ordersService;
	
	// 회원 구매페이지
	@RequestMapping(value = "member.do", method = RequestMethod.GET)
	public String member_purchase(Locale locale, Model model, HttpServletRequest request,
								  List<CartVO> cartvo,
								  @RequestParam(value="product_index") String product_index,
								  @RequestParam(value="quantity") String quantity) throws Exception {

		// 세션 소환
		HttpSession session =request.getSession();
		MemberVO member;
		
		if(cartvo != null) {	// 장바구니페이지에서 오는 경우
			
			
			
		}else {	// 그 외의 경우(상품상세조회, 찜, 장바구니페이지의 각 상품의 바로구매)
			
			
			
		}
		
		
		// 회원이 존재하는 경우 해당 회원의 쿠폰 리스트 출력
		if(session.getAttribute("member") != null){
			member = (MemberVO)session.getAttribute("member");
			List<CouponVO> couponvo = couponService.couponList(member.getMember_index());
			System.out.println(couponvo);
			model.addAttribute("couponList", couponvo);
		}
		
		
		return "purchasePage/purchasePage_member";
	}
	
	// 회원 구매페이지 내에서 쿠폰 적용하는 비동기
	@RequestMapping(value = "couponCheck.do", method = RequestMethod.POST)
	@ResponseBody
	public String coupon(Locale locale, Model model, int coupon_index) throws Exception {
		
		CouponVO couponvo = couponService.couponSelectOne(coupon_index);
		String discountPer = "" + couponvo.getDiscount_percent();
		
		return discountPer;
	}
	
	// 결제하고 난뒤 DB에 올리는 페이지
	@RequestMapping(value = "purchaseOk.do", method = RequestMethod.POST)
	@ResponseBody
	public String purchaseOk(Locale locale, Model model, HttpServletRequest request) {

		String orderName = request.getParameter("orderName");
		System.out.println(orderName);
		return "purchasePage/purchaseOk";
	}	

	// 비회원 이메일 인증페이지로 이동
	@RequestMapping(value = "certification.do")
	public String nomember_certification(Locale locale, Model model,
										HttpServletRequest request) {
		
		//,
		//@RequestParam(value="product_index", required = false) String[] product_index,
		//@RequestParam(value="cart_count", required = false) int[] cart_count
		
		 //세션 소환
		 HttpSession session =request.getSession();
		 if(session.getAttribute("member") == null){ // 비회원인 경우
			 String[] product_index = new String[1];
			 int[] cart_count = new int[1];
			 
			 product_index[0] = "PI02B";
			 cart_count[0] = 3;
			 
			 System.out.println(product_index[0]);
			 System.out.println(cart_count[0]);
			 
			 // 세션에 상품번호, 갯수 저장
			 session.setAttribute("product_index", product_index);
			 session.setAttribute("cart_count", cart_count);
			 
			 return "purchasePage/purchasePage_certification"; 
		 }else {	// 회원인 경우
			 return "wrongAccessPage/wrongAccess";
		 }
		
	}
	
	// 비회원 이메일 보내는 비동기
	@RequestMapping(value = "emailCertification.do", method = RequestMethod.POST)
	@ResponseBody
	public String SendEmail(Locale locale, Model model, EmailVO emailvo) throws Exception {
		
		// 이메일 제목
		String subject = "FoodContainer 비회원 이메일 인증번호";
		emailvo.setSubject(subject);
		
		// 인증번호 생성
		String randomBox = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
		String randomNum = "";
		for(int i = 0; i < 6; i++) {
			int randomIndex = (int)(Math.random() * randomBox.length());
			randomNum += randomBox.substring(randomIndex, randomIndex + 1);
		}
		
		// 이메일 내용
		String message = "인증번호는 " + randomNum + " 입니다. 3분이내에 입력하세요.";
		emailvo.setMessage(message);
		
		emailService.sendEmail(emailvo);
		
		return randomNum;
	}
	
	// 비회원 구매페이지로 이동
	@RequestMapping(value = "noMember.do")
	public String noMemberPurchase(Locale locale, Model model,
									HttpServletRequest request,
									@RequestParam(value="name", required = false) String name,
									@RequestParam(value="receiveMail", required = false) String email) throws Exception {

		// 세션 소환
		HttpSession session = request.getSession();
		
		if(session.getAttribute("member") != null) {	// 회원인 경우
			return "wrongAccessPage/wrongAccess";
		}else {	// 비회원인 경우
			
			// 세션에 상품번호와 갯수 리스트가 없는 경우(말이 안되는 경우라고 생각하면 된다.)
			if(session.getAttribute("product_index") == null || session.getAttribute("cart_count") == null) {
				return "wrongAccessPage/cartNull";
			}else {	// 상품번호와 갯수리스트가 있는 경우(여기가 이제 제대로된 접근이다.)
				
				
				String[] product_index = (String[])session.getAttribute("product_index");
				int[] cart_count = (int[])session.getAttribute("cart_count");
				
				List<CartVO> CartList = ordersService.noMemberPurchaseList(product_index, cart_count);
				
				
				model.addAttribute("CartList", CartList);
				model.addAttribute("name", name);
				model.addAttribute("email", email);
				
				return "purchasePage/purchasePage_noMember";
			}
			
		}
		
		
		
	}

}
