package team.project.controller;

import java.util.Locale;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
//	@Inject
//	BCryptPasswordEncoder pwdEncoder;
	

	@RequestMapping(value = "member_sign.do", method = RequestMethod.GET)
	public String sign(Locale locale, Model model){
		return "sign/member_sign";
	}
//	@ResponseBody
//	@RequestMapping(value = "member_sign.do", method = RequestMethod.POST)
//	public String sign(Locale locale, Model model,MemberVO vo,String id,String nickname) throws Exception{
//		logger.info("post member_sign");
////		int result = memberService.insertMember(vo);
//		String result = memberService.idChk(id);
//		String result2 = memberService.nickChk(nickname);
//		try {
//			if(result=="1") {
//				
//				return "sign/member_sign";
//			}else if(result=="0"){
//				
//				memberService.insertMember(vo);
//				
//			}
//			if(result2=="1") {
//				return "member_sign.do";
//			}else if(result2=="0") {
//				memberService.insertMember(vo);
//			}
//		}catch(Exception e){
//			throw new RuntimeException();
//		}
//		
//		return "sign/member_sign";
//	}
	
	@RequestMapping(value = "member_sign.do", method = RequestMethod.POST)
	public String sign(Locale locale, Model model,MemberVO vo) throws Exception{
		
		int result = memberService.insertMember(vo);
		
		return "sign/member_sign";
	}
	
	
	//아이디중복
	@ResponseBody
	@RequestMapping(value="idChk", method = RequestMethod.POST)
	public String idChk(String id) throws Exception {
		System.out.println(id);
		MemberVO vo = new MemberVO();
		vo.setId(id);
		String result = memberService.idChk(id);
		return result;
	}
	
	//닉네임중복
	@ResponseBody
	@RequestMapping(value="nickChk", method = RequestMethod.POST)
	public String nickChk(String nickname) throws Exception {
		System.out.println(nickname);
		MemberVO vo = new MemberVO();
		vo.setNickname(nickname);
		String result = memberService.nickChk(nickname);
		return result;
	}
	
	//추천인확인
	@ResponseBody
	@RequestMapping(value="recomChk", method = RequestMethod.POST)
	public String recomChk(String id) throws Exception {
		System.out.println(id);
		MemberVO vo = new MemberVO();
		vo.setRecommender(id);
		String result = memberService.recomChk(id);
		return result;
	}
	
	@RequestMapping(value = "no_member_sign.do", method = RequestMethod.GET)
	public String sign2(Locale locale, Model model) {
		return "sign/no_member_sign";
	}
	
}
