package team.project.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import team.project.service.MemberService;
import team.project.vo.MemberVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class SignController {
	@Autowired
	private MemberService memberService;
	
	private static final Logger logger = LoggerFactory.getLogger(SignController.class);
	

	
	@RequestMapping(value = "member_sign.do", method = RequestMethod.GET)
	public String sign(Locale locale, Model model){
		return "sign/member_sign";
	}

	@RequestMapping(value = "member_sign.do", method = RequestMethod.POST)
	public String sign(Locale locale, Model model,MemberVO vo) throws Exception{
		logger.info("post member_sign");
//		int result = memberService.insertMember(vo);
		int result = memberService.idChk(vo);
		int result2 = memberService.nickChk(vo);
		try {
			if(result==1) {
				return "member_sigin.do";
			}else if(result==0){
				memberService.insertMember(vo);
			}
			if(result2==1) {
				return "member_sign.do";
			}else if(result2==0) {
				memberService.insertMember(vo);
			}
		}catch(Exception e){
			throw new RuntimeException();
		}
		
		return "sign/member_sign";
	}
	
	@RequestMapping(value="idChk", method = RequestMethod.POST)
	public int idChk(MemberVO vo) throws Exception {
		int result = memberService.idChk(vo);
		return result;
	}
	
	@RequestMapping(value="nickChk", method = RequestMethod.POST)
	public int nickChk(MemberVO vo) throws Exception {
		int result = memberService.nickChk(vo);
		return result;
	}
	
	@RequestMapping(value = "no_member_sign.do", method = RequestMethod.GET)
	public String sign2(Locale locale, Model model) {
		return "sign/no_member_sign";
	}
	
}
