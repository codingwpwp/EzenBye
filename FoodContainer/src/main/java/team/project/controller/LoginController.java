package team.project.controller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import team.project.service.MemberService;
import team.project.vo.MemberVO;

@Controller
public class LoginController {
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

	@Autowired
	   private MemberService memberService;
	   
	   @RequestMapping(value ="loginmain.do", method= RequestMethod.POST)
	   public String logingo(MemberVO vo,HttpServletRequest req,RedirectAttributes rttr,@RequestParam("id")String id
	                     ,@RequestParam("pw")String pw) throws Exception{
	      
	      HttpSession session =req.getSession();
	      MemberVO login = memberService.Login(vo);
	      
	      String path="";
	      vo = new MemberVO();
	      System.out.println(id);
	      System.out.println(pw);
	      vo.setId(id);
	      vo.setPw(pw);
	      System.out.println(vo.getId()+","+vo.getPw());
	      
	      
	      
	      
	      if(login ==null) {
	         session.setAttribute("member",null);
	         rttr.addFlashAttribute("msg",false);
	         path="home";
	      }else {
	         
	         session.setAttribute("member", login);
	      }
	      return "index/index";
	         
	      
	   }
	
	@RequestMapping(value = "loginmain.do", method = RequestMethod.GET)
	public String login(Locale locale, Model model,HttpSession session) throws Exception{
		session.invalidate();
		return "login/loginmain";
	}
	
	@RequestMapping(value = "logout.do", method = RequestMethod.GET)
	public String loginout(HttpServletRequest request) throws Exception{
		logger.info("로그아웃");
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:index.do";
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