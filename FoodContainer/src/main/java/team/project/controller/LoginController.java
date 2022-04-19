package team.project.controller;

import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import nl.captcha.Captcha;
import nl.captcha.servlet.CaptchaServletUtil;
import team.project.service.MemberService;
import team.project.vo.MemberVO;

@Controller
public class LoginController {
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	@Inject
	BCryptPasswordEncoder pwdEncoder;
	
	@Autowired
	private MemberService memberService;

	// 로그인 페이지로 이동
	@RequestMapping(value = "loginmain.do", method = RequestMethod.GET)
	public String login(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		// 세션 소환
		HttpSession session =request.getSession();
		
		if(session.getAttribute("member") != null) {
			return "redirect:index.do";
		}else {

			/*
			 * Captcha captcha = new Captcha.Builder(148, 48) .addText() // default: 5개의
			 * 숫자+문자 .addNoise().addNoise().addNoise().addNoise().addNoise().addNoise() //
			 * 시야 방해 라인 3개 .addBackground() // 기본 하얀색 배경 .build();
			 * 
			 * response.setHeader("Cache-Control", "no-cache");
			 * response.setDateHeader("Expires", 0); response.setHeader("Pragma",
			 * "no-cache"); response.setDateHeader("Max-Age", 0);
			 * response.setContentType("image/png"); CaptchaServletUtil.writeImage(response,
			 * captcha.getImage()); // 이미지 그리기 session.setAttribute("captcha",
			 * captcha.getAnswer()); // 값 저장
			 */
	        return "login/loginmain";
		}
		
	}
	
	// 로그인 검증 과정
	@RequestMapping(value ="loginmain.do", method= RequestMethod.POST)
	public String logingo(MemberVO vo,HttpServletRequest req,RedirectAttributes rttr) throws Exception{

		// 세션 소환
		HttpSession session =req.getSession();
		
		// 로그인 검증 과정(id, pw 비교해서 맞으면 login에 잘 담아서 오고 틀리면 null로 리턴)
		MemberVO login = memberService.Login(vo);
		
		// 로그인 검증 이후 세션에 어떻게 담을지에 대한 과정
		if(login !=null) {// 로그인 검증 통과의 경우
			// 세션에 로그인 정보를 저장(member_index, id, name 만 저정해놨음)
			session.setAttribute("member", login);
			if(login.getPosition().equals("관리자")) {
				return "redirect:admin.do";
			}else {
				return "redirect:index.do";				
			}

		}else {// 로그인 검증 실패의 경우
			session.setAttribute("member", null);
			return "login/loginmain";
		}
	}
	
	//비밀번호확인
	@ResponseBody
	@RequestMapping(value = "pwChk", method = RequestMethod.POST)
	public boolean pwChk(MemberVO vo) throws Exception {
		
		MemberVO login =memberService.Login(vo);
		boolean pwChk = pwdEncoder.matches(vo.getPw(), login.getPw());
		return pwChk;
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