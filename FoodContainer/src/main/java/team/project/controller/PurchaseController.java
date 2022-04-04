package team.project.controller;

import java.util.Locale;
import java.text.DateFormat;
import java.util.Date;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class PurchaseController {
	private static final Logger logger = LoggerFactory.getLogger(PurchaseController.class);
	
	@RequestMapping(value = "member_purchase.do", method = RequestMethod.GET)
	public String member_purchase(Locale locale, Model model) {
		return "purchasePage/purchasePage_member";
	}
	
	@RequestMapping(value = "notMember_purchase.do", method = RequestMethod.GET)
	public String nomember_purchase(Locale locale, Model model) {
		return "purchasePage/purchasePage_notMember";
	}
	
	@RequestMapping(value = "notMember_certification.do", method = RequestMethod.GET)
	public String nomember_certification(Locale locale, Model model) {
		return "purchasePage/purchasePage_notMember_Certification";
	}

}
