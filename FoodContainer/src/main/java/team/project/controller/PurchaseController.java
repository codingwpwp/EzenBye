package team.project.controller;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import team.project.service.CouponService;
import team.project.service.EmailService;
import team.project.vo.CouponVO;
import team.project.vo.EmailVO;

@RequestMapping(value = "/purchase/")
@Controller
public class PurchaseController {
	
	@Autowired
	private CouponService couponService;
	
	@Autowired
	private EmailService emailService;
	
	// 회원 구매페이지
	@RequestMapping(value = "member.do", method = RequestMethod.GET)
	public String member_purchase(Locale locale, Model model) throws Exception {
		
		List<CouponVO> couponVO = couponService.couponList(1);
		model.addAttribute("couponList", couponVO);
		
		return "purchasePage/purchasePage_member";
	}
	
	// 비회원 구매페이지
	@RequestMapping(value = "noMember.do", method = RequestMethod.POST)
	public String nomember_purchase(Locale locale, Model model,
									@RequestParam(value="name") String name,
									@RequestParam(value="receiveMail") String email) {
		model.addAttribute("name", name);
		model.addAttribute("email", email);
		
		return "purchasePage/purchasePage_noMember";
	}
	// 비회원 이메일 인증
	@RequestMapping(value = "certification.do", method = RequestMethod.GET)
	public String nomember_certification(Locale locale, Model model) {
		return "purchasePage/purchasePage_certification";
	}
	
	// 비회원 이메일 보내기
	@RequestMapping(value = "certification.do", method = RequestMethod.POST)
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

}
