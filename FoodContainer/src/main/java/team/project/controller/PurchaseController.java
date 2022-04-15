package team.project.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;

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
import team.project.service.NoMemberOrdersService;
import team.project.service.OrderProductService;
import team.project.service.ProductService;
import team.project.vo.CartVO;
import team.project.vo.CouponVO;
import team.project.vo.EmailVO;
import team.project.vo.MemberVO;
import team.project.vo.NoMemberOrdersVO;

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
	private NoMemberOrdersService noMemberOrdersService;
	
	@Autowired
	private OrderProductService orderProductService;
	
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
	
	/*---------------------------------------회원&비회원 공통-------------------------------------*/
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
	
	/*-------------------------------------------비회원----------------------------------------*/

	// 비회원 이메일 인증페이지로 이동(해시맵HashMap<String, String>으로 받는게 맞음.)
	@RequestMapping(value = "certification.do")
	public String nomember_certification(Model model, HttpServletRequest request) {
		
		 //세션 소환
		 HttpSession session =request.getSession();
		 
		 if(session.getAttribute("member") != null){
			// 회원인 경우
			 return "wrongAccessPage/wrongAccess";
		 }else {
			 // 비회원인 경우
			 
			 // 예시로 넣어봄(실제로 구현할 때는 String, Integer로 해놔야함.)
			 HashMap<String, Integer> cartMap = new HashMap<String, Integer>();
			 cartMap.put("PI02B", 3);
			 cartMap.put("PI01B", 5);
			 cartMap.put("PR02F", 4);
			 
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
				
				List<CartVO> cartList = productService.noMemberPurchaseList(request);
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
		// 상품 등록
		noMemberOrdersService.orderInsert(request, response, noMemberOrdersvo);
		// 임시 저장한걸 vo에 담기
		noMemberOrdersvo.setPw(tempPw);
		model.addAttribute("noMemberOrdersvo", noMemberOrdersvo);
		
		return "purchasePage/noMemberPurchaseOk";
	}	

}
