package team.project.controller;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import team.project.service.CouponService;
import team.project.service.MemberService;
import team.project.service.OrderProductService;
import team.project.service.OrdersService;
import team.project.service.ServiceCenterService;
import team.project.vo.MemberVO;
import team.project.vo.OrderProductVO;
import team.project.vo.OrdersVO;
import team.project.vo.ServiceCenterVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class MypageController {
	
	@RequestMapping(value = "memberSessionCheck.do", method = RequestMethod.POST)
	@ResponseBody
	public String memberSessionCheck(HttpSession session) throws Exception {

		MemberVO sessionMember = (MemberVO) session.getAttribute("member");
		if(sessionMember == null) {
			return "false";
		}else {
			return "true";
		}
	
	}
	
	@Autowired
	private ServiceCenterService serviceCenterService;
	@Autowired
	private CouponService couponService;
	@Autowired
	private OrdersService ordersService;
	@Autowired
	private OrderProductService orderProductService;
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value = "buyOk.do", method = RequestMethod.POST)
	@ResponseBody
	public String buyOk(String orderItem_index, int point, int member_index) throws Exception {
		
		int buyOk = orderProductService.buyOk(orderItem_index);
		memberService.updatePoint(point, member_index);
		
		return "true";
	}
	
	@RequestMapping(value = "mypage_main.do", method = RequestMethod.POST)
	public String main(Locale locale, Model model, int member_index, OrderProductVO opVO) throws Exception {
		
		MemberVO memberInfor = memberService.memberInfor(member_index);
		List<ServiceCenterVO> list = serviceCenterService.latelyServiceCenter(member_index);
		List<OrdersVO> ordersList = ordersService.ordersList(member_index);
		List<OrderProductVO> opList = orderProductService.orderProductList(opVO);
		int couponvo = couponService.mypageCouponCount(member_index);
		model.addAttribute("list",list);
		model.addAttribute("couponvo",couponvo);
		model.addAttribute("ordersList",ordersList);
		model.addAttribute("opList",opList);
		model.addAttribute("opListSize",opList.size());
		model.addAttribute("memberInfor",memberInfor);
		
		return "mypage/main";
	}
	
	@RequestMapping(value = "mypage_lookup.do", method = RequestMethod.GET)
	public String home2(Locale locale, Model model, HttpServletRequest request) {
		
		//1.세션 얻어옴
		//2.로그인 정보 추출
		//3.service(session정보)
		
		
		return "mypage/lookup";
	}
	
	@RequestMapping(value = "mypage_lookupView.do", method = RequestMethod.GET)
	public String lookupDetail(Locale locale, Model model, String member_order_index, OrderProductVO opVO) throws Exception {
		
		OrdersVO ordersDetail = ordersService.ordersDetail(member_order_index);
		OrdersVO ordersDetailJoin = ordersService.ordersDetailJoin(member_order_index);
		List<OrderProductVO> opList = orderProductService.orderProductList(opVO);
		model.addAttribute("ordersDetail",ordersDetail);
		
		model.addAttribute("ordersDetailJoin",ordersDetailJoin);
		
		model.addAttribute("opList",opList);
		
		return "mypage/lookupView";
	}
	
	@RequestMapping(value = "mypage_cancle.do", method = RequestMethod.GET)
	public String home4(Locale locale, Model model) {
		return "mypage/cancle";
	}
	@RequestMapping(value = "mypage_cancleView.do", method = RequestMethod.GET)
	public String home5(Locale locale, Model model) {
		return "mypage/cancleView";
	}
	@RequestMapping(value = "mypage_interItem.do", method = RequestMethod.GET)
	public String home6(Locale locale, Model model) {
		return "mypage/interItem";
	}
	@RequestMapping(value = "mypage_coupon.do", method = RequestMethod.GET)
	public String home7(Locale locale, Model model) {
		return "mypage/coupon";
	}
	@RequestMapping(value = "mypage_review.do", method = RequestMethod.GET)
	public String home8(Locale locale, Model model) {
		return "mypage/review";
	}
	@RequestMapping(value = "mypage_recipe.do", method = RequestMethod.GET)
	public String home9(Locale locale, Model model) {
		return "mypage/recipe";
	}
	@RequestMapping(value = "mypage_inquiries.do", method = RequestMethod.GET)
	public String home10(Locale locale, Model model) {
		return "mypage/inquiries";
	}
	@RequestMapping(value = "mypage_changeInfor.do", method = RequestMethod.GET)
	public String home11(Locale locale, Model model) {
		return "mypage/changeInfor";
	}
	@RequestMapping(value = "mypage_changeInforOk.do", method = RequestMethod.GET)
	public String home12(Locale locale, Model model) {
		return "mypage/changeInforOk";
	}
	@RequestMapping(value = "mypage_addressManage.do", method = RequestMethod.GET)
	public String home13(Locale locale, Model model) {
		return "mypage/addressManage";
	}
	@RequestMapping(value = "mypage_noteManage.do", method = RequestMethod.GET)
	public String home14(Locale locale, Model model) {
		return "mypage/noteManage";
	}
	@RequestMapping(value = "mypage_noteManageView.do", method = RequestMethod.GET)
	public String home15(Locale locale, Model model) {
		return "mypage/noteManageView";
	}
	@RequestMapping(value = "mypage_memberSecession.do", method = RequestMethod.GET)
	public String home16(Locale locale, Model model) {
		return "mypage/memberSecession";
	}
	
}
