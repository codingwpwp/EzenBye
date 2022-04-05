package team.project.controller;

import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import team.project.service.CouponService;
import team.project.vo.CouponVO;

@RequestMapping(value = "/purchase/")
@Controller
public class PurchaseController {
	
	@Autowired
	private CouponService couponService;
	
	@RequestMapping(value = "member.do", method = RequestMethod.GET)
	public String member_purchase(Locale locale, Model model) throws Exception {
		
		List<CouponVO> list = couponService.couponList(1);
		model.addAttribute("list", list);
		
		return "purchasePage/purchasePage_member";
	}
	
	@RequestMapping(value = "couponCheck.do", method = RequestMethod.POST)
	public String coupon(Locale locale, Model model, int coupon_index) throws Exception {
		
		CouponVO couponvo = couponService.couponSelectOne(coupon_index);
		model.addAttribute("couponvo", couponvo);
		//System.out.println(couponvo.getDiscount_percent());
		
		return "purchasePage/couponCheck";
	}
	
	
	@RequestMapping(value = "notMember.do", method = RequestMethod.GET)
	public String nomember_purchase(Locale locale, Model model) {
		return "purchasePage/purchasePage_notMember";
	}
	
	@RequestMapping(value = "certification.do", method = RequestMethod.GET)
	public String nomember_certification(Locale locale, Model model) {
		return "purchasePage/purchasePage_notMember_Certification";
	}

}
