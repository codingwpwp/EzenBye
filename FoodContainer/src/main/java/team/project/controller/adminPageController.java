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
public class adminPageController {
	
	private static final Logger logger = LoggerFactory.getLogger(adminPageController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "admin.do", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		return "adminPage/adminPage_main";
	}
	
	@RequestMapping(value = "admin1.do", method = RequestMethod.GET)
	public String home1(Locale locale, Model model) {
		return "adminPage/adminPage_member_list";
	}
	
	@RequestMapping(value = "admin2.do", method = RequestMethod.GET)
	public String home2(Locale locale, Model model) {
		return "adminPage/adminPage_member_detail";
	}
	
	@RequestMapping(value = "admin3.do", method = RequestMethod.GET)
	public String home3(Locale locale, Model model) {
		return "adminPage/adminPage_black_list";
	}
	
	@RequestMapping(value = "admin4.do", method = RequestMethod.GET)
	public String home4(Locale locale, Model model) {
		return "adminPage/adminPage_black_detail";
	}
	
	@RequestMapping(value = "admin5.do", method = RequestMethod.GET)
	public String home5(Locale locale, Model model) {
		return "adminPage/adminPage_delY_list";
	}
	
	@RequestMapping(value = "admin6.do", method = RequestMethod.GET)
	public String home6(Locale locale, Model model) {
		return "adminPage/adminPage_delY_detail";
	}
	
	@RequestMapping(value = "admin7.do", method = RequestMethod.GET)
	public String home7(Locale locale, Model model) {
		return "adminPage/adminPage_report_list";
	}
	
	@RequestMapping(value = "admin8.do", method = RequestMethod.GET)
	public String home8(Locale locale, Model model) {
		return "adminPage/adminPage_notMember_order_list";
	}
	
	@RequestMapping(value = "admin9.do", method = RequestMethod.GET)
	public String home9(Locale locale, Model model) {
		return "adminPage/adminPage_notMember_order_detail";
	}
	
	@RequestMapping(value = "admin10.do", method = RequestMethod.GET)
	public String home10(Locale locale, Model model) {
		return "adminPage/adminPage_product_manager";
	}
}
