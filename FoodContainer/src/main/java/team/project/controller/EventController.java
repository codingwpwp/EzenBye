package team.project.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import team.project.service.MemberService;
import team.project.vo.MemberVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class EventController {
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value = "event.do", method = RequestMethod.GET)
	public String welcomeEvent(Model model, HttpServletRequest request) throws Exception{
		
		// 세션 소환
		HttpSession session = request.getSession();
		MemberVO member = null;
		if(session.getAttribute("member") == null) {
			// 비회원인 경우
		}else {
			// 회원인 경우
			member = (MemberVO)session.getAttribute("member");
			member = memberService.memberInfor(member.getMember_index());
		}
		
		model.addAttribute("member", member);
		return "eventPage/event";
	}
	
	@RequestMapping(value = "event.do", method = RequestMethod.POST)
	@ResponseBody
	public String checkEvent(Model model, HttpServletRequest request) throws Exception{
		
		// 세션 소환
		HttpSession session = request.getSession();
		if(session.getAttribute("member") == null) {
			// 비회원인 경우
			return "Fail";
		}else {
			// 회원인 경우
			MemberVO member = (MemberVO)session.getAttribute("member");
			return memberService.eventTicket(member.getMember_index());
		}
	}
	
	// 결과에 따라서 지급	
	@RequestMapping(value = "eventResult.do", method = RequestMethod.POST)
	@ResponseBody
	public void eventResult(Model model, HttpServletRequest request, @RequestParam(value="result") String result) throws Exception{
		memberService.eventResult(request, result);
		
	}
	
}
