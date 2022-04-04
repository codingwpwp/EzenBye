package team.project.controller;

import java.util.Locale;
import java.text.DateFormat;
import java.util.Date;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import team.project.service.MemberServiceImpl;
import team.project.vo.MemberVO;

@Controller
public class loginController {
	private static final Logger logger = LoggerFactory.getLogger(loginController.class);

	@Autowired
	private MemberServiceImpl memberServiceImpl;
	
	@RequestMapping(value ="loginmain.do", method= RequestMethod.POST)
	public String logingo(@RequestParam("id")String id
							,@RequestParam("pw")String pw) throws Exception{
		String path="";
		MemberVO vo = new MemberVO();
		
		vo.setId(id);
		vo.setPw(pw);
		
		int result = memberServiceImpl.Login(vo);
		
		if(result ==1) {
			path="home";
		}else {
			path="login/loginmain";
		}
		return path;
			
		
	}
	
	@RequestMapping(value = "loginmain.do", method = RequestMethod.GET)
	public String login(Locale locale, Model model) {
		return "login/loginmain";
	}
	
	@RequestMapping(value = "id_find.do", method = RequestMethod.GET)
	public String login2(Locale locale, Model model) {
		return "login/id_find";
	}
	
	@RequestMapping(value = "id_easy_check.do", method = RequestMethod.GET)
	public String login3(Locale locale, Model model) {
		return "login/id_easy_check";
	}
	
	@RequestMapping(value = "id_email_check.do", method = RequestMethod.GET)
	public String login4(Locale locale, Model model) {
		return "login/id_email_check";
	}
	
	@RequestMapping(value = "pw_find.do", method = RequestMethod.GET)
	public String login5(Locale locale, Model model) {
		return "login/pw_find";
	}
	
	@RequestMapping(value = "pw_email_check.do", method = RequestMethod.GET)
	public String login6(Locale locale, Model model) {
		return "login/pw_email_check";
	}
	
}
