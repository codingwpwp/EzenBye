package team.project.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class MypageController {
	
	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "mypage_main.do", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		return "mypage/main";
	}
	@RequestMapping(value = "mypage_lookup.do", method = RequestMethod.GET)
	public String home2(Locale locale, Model model) {
		return "mypage/lookup";
	}
	@RequestMapping(value = "mypage_lookupView.do", method = RequestMethod.GET)
	public String home3(Locale locale, Model model) {
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
}
