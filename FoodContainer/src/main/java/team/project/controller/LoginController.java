package team.project.controller;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
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

import team.project.service.MemberService;
import team.project.vo.MemberVO;

@Controller
public class LoginController {
	@Inject
	BCryptPasswordEncoder pwdEncoder;
	
	@Autowired
	private MemberService memberService;

	// 로그인 페이지로 이동
	@RequestMapping(value = "loginmain.do", method = RequestMethod.GET)
	public String login(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		// 세션 소환
		HttpSession session = request.getSession();
		
		if(session.getAttribute("member") != null) {
			return "redirect:index.do";
		}else {
			
			int loginFailCnt = 0;
			if(session.getAttribute("loginFailCnt") == null) {
				session.setAttribute("loginFailCnt", loginFailCnt);
			}else {
				loginFailCnt = (int)session.getAttribute("loginFailCnt");
			}
			model.addAttribute("loginFailCnt", loginFailCnt);
			
			
			// 아이디 저장 쿠키
			Cookie[] cookies = request.getCookies();
			String id = null;
			if(cookies != null) {
				for(Cookie cookie : cookies) {
					if(cookie.getName().equals("idCookie")) {
						id = URLDecoder.decode(cookie.getValue(),"UTF-8");
					}
				}
			}
			
			session.setAttribute("idCookie", id);
			
	        return "login/loginmain";
		}
		
	}
	
	// 로그인 검증 과정
	@RequestMapping(value ="loginmain.do", method= RequestMethod.POST)
	public String logingo(MemberVO vo, HttpServletRequest request, HttpServletResponse response) throws Exception{

		// 세션 소환
		HttpSession session = request.getSession();
		
		// 로그인 검증 과정(id, pw 비교해서 맞으면 login에 잘 담아서 오고 틀리면 null로 리턴)
		MemberVO login = memberService.Login(vo);
		
		// 로그인 검증 이후 세션에 어떻게 담을지에 대한 과정
		if(login !=null) {// 로그인 검증 통과의 경우
			// 세션에 로그인 정보를 저장(member_index, id, name, position 만 저정해놨음)
			session.setAttribute("member", login);
			
			// 실패 횟수 초기화
			int loginFailCnt = (int)session.getAttribute("loginFailCnt");
			loginFailCnt = 0;
			session.setAttribute("loginFailCnt", loginFailCnt);
			
			// 아이디 저장 부분
			String rememberIdYN = request.getParameter("rememberIdYN");
			System.out.println("rememberIdYN : " + rememberIdYN);
			
			if(rememberIdYN != null) {	// 아이디 저장 했을 때
				String id = URLEncoder.encode(vo.getId(), "UTF-8");
				Cookie idCookie = new Cookie("idCookie", id);
				idCookie.setPath("/controller");
			    response.addCookie(idCookie);
			}else {	// 아이디 저장 안 했을 때
				Cookie[] cookies = request.getCookies();
				if(cookies != null) {
					for(Cookie cookie : cookies) {
						if(cookie.getName().equals("idCookie")) {
							cookie = new Cookie("idCookie", null);
							cookie.setMaxAge(0);
							response.addCookie(cookie);
							break;
						}
					}
				}
				
			}
			
			// 임시비밀번호로 했을 때 마이페이지 변경으로 이동하는 로직도 짜야함
			if(session.getAttribute("needChangePw") != null) {
				MemberVO memberTemp = (MemberVO)session.getAttribute("needChangePw");
				if(vo.getId().equals(memberTemp.getId())) {
					session.setAttribute("needChangePw", null);
					return "redirect:mypage_changeInforOk.do";
				}
			}
			
			if(login.getPosition().equals("관리자")) {
				return "redirect:admin.do";
			}else {
				return "redirect:index.do";				
			}

		}else {// 로그인 검증 실패의 경우
			session.setAttribute("member", null);
			
			// 실패 횟수 증가
			int loginFailCnt = (int)session.getAttribute("loginFailCnt");
			loginFailCnt++;
			session.setAttribute("loginFailCnt", loginFailCnt);
			
			return "login/loginFail";
		}
	}
	
	// 아이디 찾기페이지로 이동
	@RequestMapping(value = "id_find.do", method = RequestMethod.GET)
	public String idFind(Model model, HttpServletRequest request) {
		
		// 세션 소환
		HttpSession session = request.getSession();
		
		if(session.getAttribute("member") != null) {
			return "redirect:index.do";
		}else {
			return "login/id_find";
		}
		
	}
	
	// 간편 아이디 찾기 결과 페이지로 이동
	@RequestMapping(value = "id_easy_check.do", method = RequestMethod.POST)
	public String idEasyCheck(Model model, HttpServletRequest request, MemberVO membervo) throws Exception{
		// 세션 소환
		HttpSession session = request.getSession();
		
		if(session.getAttribute("member") != null) {
			return "redirect:index.do";
		}else {

			String tempPhone = membervo.getPhone();
			String tempPhone1 = "";
			String tempPhone2 = "";
			if(tempPhone.length() == 7) {
				tempPhone1 = tempPhone.substring(0, 3);
				tempPhone2 = tempPhone.substring(3, 7);
			}else {
				tempPhone1 = tempPhone.substring(0, 4);
				tempPhone2 = tempPhone.substring(4, 8);
			}
			membervo.setPhone(tempPhone1 + "-" + tempPhone2);
			MemberVO tempMember = memberService.idEasyCheck(membervo);
			
			model.addAttribute("tempMember", tempMember);
			
			return "login/id_easy_check";
		}
	}
	
	// 이메일로 아이디 찾기 결과 페이지로 이동
	@RequestMapping(value = "id_email_check.do", method = RequestMethod.POST)
	public String emailEasyCheck(Model model, HttpServletRequest request) throws Exception {
		
		// 세션 소환
		HttpSession session = request.getSession();
		
		if(session.getAttribute("member") != null) {
			return "redirect:index.do";
		}else {
			
			if(request.getParameter("name") == null || request.getParameter("receiveMail") == null ) {
				return "redirect:index.do";
			}else {
				String name = request.getParameter("name");
				String email = request.getParameter("receiveMail");
				MemberVO tempMember = new MemberVO();
				tempMember.setName(name);
				tempMember.setEmail(email);
				
				tempMember = memberService.emailEasyCheck(tempMember);
				model.addAttribute("tempMember", tempMember);
				
				return "login/id_easy_check";
			}
			
		}
		
	}		
	
	// 비밀번호 찾기 페이지로 이동
	@RequestMapping(value = "pw_find.do", method = RequestMethod.GET)
	public String FindPw(Model model, HttpServletRequest request) {
		// 세션 소환
		HttpSession session = request.getSession();
		
		if(session.getAttribute("member") != null) {
			return "redirect:index.do";
		}else {
			return "login/pw_find";
		}
		
	}
	
	// 비밀번호 찾기페이지에서 인증번호 발송하는 비동기
	@RequestMapping(value = "sendEmailPw.do", method = RequestMethod.POST)
	@ResponseBody
	public String checkPwAndSendEmail(MemberVO vo) throws Exception{
		return memberService.checkPwAndSendEmail(vo);
	}
	
	// 임시비밀번호 발급 페이지
	@RequestMapping(value = "pw_email_check.do", method = RequestMethod.POST)
	public String tempPw(Model model, HttpServletRequest request, MemberVO vo) throws Exception{
		// 세션 소환
		HttpSession session = request.getSession();
		
		if(session.getAttribute("member") != null) {
			return "redirect:index.do";
		}else {
			if(vo.getId() == null || vo.getId().equals("")) {
				return "redirect:index.do";
			}else {
				MemberVO memberTemp = memberService.sendTempPw(vo);
				session.setAttribute("needChangePw", memberTemp);
				model.addAttribute("memberTemp", memberTemp);
				
				return "login/pw_email_check";
			}
		}
		
	}
	
	// 비밀번호확인(마이페이지?)
	@ResponseBody
	@RequestMapping(value = "pwChk", method = RequestMethod.POST)
	public boolean pwChk(MemberVO vo) throws Exception {
		
		MemberVO login =memberService.Login(vo);
		boolean pwChk = pwdEncoder.matches(vo.getPw(), login.getPw());
		return pwChk;
	}
	
	// 로그아웃
	@RequestMapping(value = "logout.do", method = RequestMethod.GET)
	public String loginout(HttpServletRequest request) throws Exception{
		HttpSession session = request.getSession();
		session.setAttribute("member", null);
		return "redirect:index.do";
	}
	
	
	
}