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
public class loginController {
	private static final Logger logger = LoggerFactory.getLogger(loginController.class);

	
	@RequestMapping(value = "loginmain.do", method = RequestMethod.GET)
	public String login(Locale locale, Model model) {
		return "login/loginmain";
	}
	
}
