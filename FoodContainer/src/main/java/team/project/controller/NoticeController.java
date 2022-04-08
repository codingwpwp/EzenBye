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
public class NoticeController {
	
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
	
	
	@RequestMapping(value = "notice_main.do", method = RequestMethod.GET)
	public String notice(Locale locale, Model model) {
		return "notice/notice_main";
	}
	@RequestMapping(value = "notice_view.do", method = RequestMethod.GET)
	public String notice2(Locale locale, Model model) {
		return "notice/notice_view";
	}
	@RequestMapping(value = "notice_insert.do", method = RequestMethod.GET)
	public String notice3(Locale locale, Model model) {
		return "notice/notice_insert";
	}
	@RequestMapping(value = "notice_update.do", method = RequestMethod.GET)
	public String notice4(Locale locale, Model model) {
		return "notice/notice_update";
	}
	
}
