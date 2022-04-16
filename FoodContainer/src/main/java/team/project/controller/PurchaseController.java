package team.project.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import team.project.service.CouponService;
import team.project.service.EmailService;
import team.project.service.MemberService;
import team.project.service.NoMemberOrdersService;
import team.project.service.OrdersService;
import team.project.service.ProductService;
import team.project.vo.CartVO;
import team.project.vo.CouponVO;
import team.project.vo.EmailVO;
import team.project.vo.MemberVO;
import team.project.vo.NoMemberOrdersVO;
import team.project.vo.OrdersVO;

@RequestMapping(value = "/purchase/")
@Controller
public class PurchaseController {
	
	@Autowired
	private CouponService couponService;
	
	@Autowired
	private EmailService emailService;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private OrdersService ordersService;
	
	@Autowired
	private NoMemberOrdersService noMemberOrdersService;
	
	@Autowired
	private MemberService memberService;
	

	/*****************************************회원*******************************************/
	// 회원 장바구니에서 구매페이지
	@RequestMapping(value = "member.do")
	public String memberPurchase(Model model, HttpServletRequest request,
								 @RequestParam(value="cart_index", required = false) int[] cart_index) throws Exception {
		
		// 예시로 설정한 거임.
		int[] carr = new int[2];
		carr[0] = 1;
		carr[1] = 2;
		// 세션 소환
		HttpSession session =request.getSession();
		System.out.println(session.getAttribute("memberPurchaseNow"));
		if(session.getAttribute("member") == null){
			// 비회원인 경우
			return "wrongAccessPage/wrongAccess";
			
		}else {
			// 회원인 경우
			if((session.getAttribute("memberPurchaseNow") == null && carr == null) || (session.getAttribute("memberPurchaseNow") != null && cart_index != null)) {
				// 잘못된 접근
				return "wrongAccessPage/wrongAccess";
				
			}else {
				List<CartVO> cartList = new ArrayList<CartVO>();
				if(session.getAttribute("memberPurchaseNow") != null) {
					// 바로구매에서 오는 경우
					cartList = productService.purchaseListCaseOne(request);
					session.setAttribute("memberPurchaseNow", null);
					
				}else{
					// 장바구니에서 오는 경우
					cartList = productService.purchaseListCaseTwo(carr);
					
				}
				
				// 구매할 상품들을 모델&세션에 담기
				model.addAttribute("cartList", cartList);
				session.setAttribute("cartList", cartList);
				
				// 회원정보&쿠폰 조회
				couponList(model, session);
				
				return "purchasePage/purchasePage_member";
			}
		}
	}
	
	// 결제하고 난뒤 DB에 올리는 페이지
	@RequestMapping(value = "memberPurchaseOk.do", method = RequestMethod.POST)
	public String purchaseOk(Model model, HttpServletRequest request, OrdersVO ordersvo,
							 @RequestParam(value="newBasicAddress") String newBasicAddress) throws Exception{
		// 세션 소환
		HttpSession session =request.getSession();
		if(session.getAttribute("member") == null) {
			// 비회원인 경우
			return "wrongAccessPage/wrongAccess";
			
		}else {
			MemberVO member = (MemberVO)session.getAttribute("member");
			ordersvo.setMember_index(member.getMember_index());
			
			System.out.println("-------------------------------");
			System.out.println(ordersvo.getMember_order_index());
			System.out.println(ordersvo.getMember_index());
			System.out.println(ordersvo.getAddress());
			System.out.println(ordersvo.getReciever());
			System.out.println(ordersvo.getPhone());
			System.out.println(ordersvo.getRequest());
			System.out.println(ordersvo.getDelivery_free_YN());
			System.out.println(ordersvo.getCoupon_index());
			System.out.println(ordersvo.getUsed_point());
			System.out.println(ordersvo.getPay_price());
			System.out.println(newBasicAddress);
			System.out.println("-------------------------------");
			
			ordersService.orderInsert(session, ordersvo);
			
			return "purchasePage/memberPurchaseOk";
		}
		
	}
	/***************************************************************************************/
	
	/*************************************회원정보&쿠폰 조회*************************************/
	public void couponList(Model model, HttpSession session) throws Exception{
		MemberVO member = (MemberVO)session.getAttribute("member");
		MemberVO memberInfo = memberService.memberInfor(member.getMember_index());
		model.addAttribute("memberInfo", memberInfo);
		
		List<CouponVO> couponvo = couponService.couponList(member.getMember_index());
		model.addAttribute("couponList", couponvo);
	}
	/***************************************************************************************/
	
	
	/**********************************회원쿠폰 조회하는 비동기************************************/
	// 회원 구매페이지 내에서 쿠폰 적용하는 비동기
	@RequestMapping(value = "couponCheck.do", method = RequestMethod.POST)
	@ResponseBody
	public String coupon(Locale locale, Model model, int coupon_index) throws Exception {
		
		CouponVO couponvo = couponService.couponSelectOne(coupon_index);
		String discountPer = "" + couponvo.getDiscount_percent();
		
		return discountPer;
	}
	/***************************************************************************************/
	
	
	/**************************************회원&비회원 공통**************************************/
	// 결제화면 전에 상품 수량 확인 및 빼주기 비동기
	@RequestMapping(value = "checkProductInventory.do", method = RequestMethod.POST)
	@ResponseBody
	public String check(@RequestParam HashMap<String, String> cartMap) throws Exception {
		return productService.checkProductInventory(cartMap);
	}
	
	// 결제화면에서 취소할 경우 다시 상품 채워놓기 비동기
	@RequestMapping(value = "plusInventory.do", method = RequestMethod.POST)
	@ResponseBody
	public void plusInventory(@RequestParam HashMap<String, String> cartMap) throws Exception {
		productService.plusInventory(cartMap);
	}
	/***************************************************************************************/
	
	/*****************************************비회원******************************************/

	// 비회원 이메일 인증페이지로 이동(해시맵HashMap<String, String>으로 받는게 맞음.)
	@RequestMapping(value = "certification.do")
	public String nomember_certification(Model model, HttpServletRequest request,
										@RequestParam HashMap<String, String> cMap) {
		
		 //세션 소환
		 HttpSession session =request.getSession();
		 
		 if(session.getAttribute("member") != null){
			// 회원인 경우(바로구매할 경우)
			session.setAttribute("memberPurchaseNow", cMap);
			return "redirect:memberNow.do";
			
		 }else {
			// 비회원인 경우
			HashMap<String, Integer> cartMap = new HashMap<String, Integer>();
			for (Entry<String, String> entry : cMap.entrySet()) {
				 cartMap.put(entry.getKey(),  Integer.parseInt(entry.getValue()));
			} 
			session.setAttribute("cartMap", cartMap);
			 
			return "purchasePage/purchasePage_certification";
		 }
		
	}
	
	// 비회원 이메일 보내는 비동기
	@RequestMapping(value = "emailCertification.do", method = RequestMethod.POST)
	@ResponseBody
	public String SendEmail(EmailVO emailvo) throws Exception {
		
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
		
		// 이메일 내용에 인증번호 넣기
		String message = "인증번호는 " + randomNum + " 입니다. 3분이내에 입력하세요.";
		emailvo.setMessage(message);
		
		// 이베일 보내기
		emailService.sendEmail(emailvo);
		
		return randomNum;
	}
	
	// 비회원 구매페이지로 이동
	@RequestMapping(value = "noMember.do")
	public String noMemberPurchase(Model model,
								   HttpServletRequest request,
								   @RequestParam(value="name", required = false) String name,
								   @RequestParam(value="receiveMail", required = false) String email
								  ) throws Exception {

		// 세션 소환
		HttpSession session = request.getSession();
		
		if(session.getAttribute("member") != null) {
			// 회원인 경우
			return "wrongAccessPage/wrongAccess";
		}else {
			// 비회원인 경우
			
			// 세션에 상품번호와 갯수 리스트가 없는 경우(말이 안되는 경우라고 생각하면 된다.)
			if(session.getAttribute("cartMap") == null) {
				return "wrongAccessPage/cartNull";
				
			}else {	// 상품번호와 갯수리스트가 있는 경우(여기가 이제 제대로된 접근이다.)
				
				List<CartVO> cartList = productService.purchaseListCaseOne(request);
				model.addAttribute("cartList", cartList);
				
				model.addAttribute("name", name);
				model.addAttribute("email", email);
				
				return "purchasePage/purchasePage_noMember";
			}
			
		}
		
	}
	
	// 비회원 결제하고 난뒤 DB에 올리는 페이지
	@RequestMapping(value = "noMemberPurchaseOk.do", method = RequestMethod.POST)
	public String noMemberPurchaseOk(Model model,
									HttpServletRequest request,
									HttpServletResponse response,
									NoMemberOrdersVO noMemberOrdersvo) throws Exception{
		// 구매 완료 화면에 뿌려질 비밀번호를 여기에 임시 저장
		String tempPw = noMemberOrdersvo.getPw();
		// 비회원 주문 등록
		noMemberOrdersService.orderInsert(request, response, noMemberOrdersvo);
		// 임시 저장한걸 vo에 담기
		noMemberOrdersvo.setPw(tempPw);
		model.addAttribute("noMemberOrdersvo", noMemberOrdersvo);
		
		return "purchasePage/noMemberPurchaseOk";
	}	

}
