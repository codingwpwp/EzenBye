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
public class signController {
	
	private static final Logger logger = LoggerFactory.getLogger(signController.class);
	
	
	@RequestMapping(value = "member_sign.do", method = RequestMethod.GET)
	public String sign(Locale locale, Model model) {
		return "sign/member_sign";
	}
	@RequestMapping(value = "no_member_sign.do", method = RequestMethod.GET)
	public String sign2(Locale locale, Model model) {
		return "sign/no_member_sign";
	}
	
}
