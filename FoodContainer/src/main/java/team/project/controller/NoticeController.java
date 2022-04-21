package team.project.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import team.project.service.MemberService;
import team.project.service.NoticeService;
import team.project.util.PagingUtil;
import team.project.vo.MemberVO;
import team.project.vo.NoticeVO;
import team.project.vo.SearchVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class NoticeController {
	
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
	
	@Autowired
	private NoticeService noticeService;
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value = "notice_main.do", method = RequestMethod.GET)
	public String notice(Locale locale, Model model, SearchVO searchVO, int nowPage, HttpSession session) throws Exception {
		
		if(session.getAttribute("member") != null) {
			MemberVO member = (MemberVO) session.getAttribute("member");
			int member_index = member.getMember_index();
			
			MemberVO memberInfor = memberService.memberInfor(member_index);
			model.addAttribute("memberInfor",memberInfor);
		}
		
		int realnowPage = 1;
		if(nowPage != 0) realnowPage = nowPage;
		
		List<NoticeVO> noticeList = noticeService.noticeList(searchVO, realnowPage);
		model.addAttribute("noticeList",noticeList);
		
		PagingUtil paging = noticeService.noticeListPaging(searchVO, realnowPage);
		
		model.addAttribute("paging", paging);
		
		return "notice/notice_main";
	}
	
	@RequestMapping(value = "notice_view.do", method = RequestMethod.GET)
	public String notice2(Locale locale, Model model, int nowPage, int notice_index, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//쿠키 관련
		String cookieName = "";
		int visitSwitch = 0;
		
		//회원 정보를 담음
		if(session.getAttribute("member") != null) {
			MemberVO member = (MemberVO) session.getAttribute("member");
			int member_index = member.getMember_index();
			
			MemberVO memberInfor = memberService.memberInfor(member_index);
			model.addAttribute("memberInfor",memberInfor);
		}
		
		NoticeVO noticeDetail = noticeService.noticeDetail(notice_index);
		
		// 쿠키 관련 조회수 방지
		if(session.getAttribute("member") != null) {
			MemberVO member = (MemberVO) session.getAttribute("member");
			int member_index = member.getMember_index();
			
			cookieName = noticeDetail.getNotice_index() + "-" + member_index;  
			
			Cookie[] cookies = request.getCookies();
	         if(cookies != null){
	            for(Cookie cook : cookies){   
	               if(cook.getName().equals(cookieName) && cook.getValue().equals("viewed")){   
	                  visitSwitch = 1;   
	                  break;   
	               }
	            }
	         }
	         if(visitSwitch == 0){   
	        	 
	             int result = noticeService.plusHit(notice_index);
	             if(result == 1){
	                Cookie cookie = new Cookie(cookieName, "viewed");   
	                cookie.setMaxAge(60 * 60 * 24);  
	                response.addCookie(cookie);     
	             }
	          }
		       
		}
		
		model.addAttribute("noticeDetail", noticeDetail);
		model.addAttribute("nowPage", nowPage);
		
		return "notice/notice_view";
	}
	
	@RequestMapping(value = "notice_insert.do", method = RequestMethod.GET)
	public String notice3(Locale locale, Model model, int nowPage) throws Exception {
		
		model.addAttribute("nowPage", nowPage);
		
		return "notice/notice_insert";
	}
	
	@RequestMapping(value = "notice_update.do", method = RequestMethod.GET)
	public String notice4(Locale locale, Model model, int notice_index, int nowPage) throws Exception {
		
		NoticeVO noticeDetail = noticeService.noticeDetail(notice_index);
		model.addAttribute("noticeDetail", noticeDetail);
		model.addAttribute("nowPage", nowPage);
		
		return "notice/notice_update";
	}
	
	@RequestMapping(value = "noticeInsert.do", method = RequestMethod.POST)
	public String notice5(Locale locale, Model model, NoticeVO vo) throws Exception {
		
		noticeService.noticeInsert(vo);
		
		return "redirect:notice_main.do?nowPage=1";
	}
	
	@RequestMapping(value = "noticeModify.do", method = RequestMethod.POST)
	public String notice6(Locale locale, Model model, NoticeVO vo, int nowPage, int notice_index) throws Exception {
		
		noticeService.noticeModify(vo);
		
		return "redirect:notice_view.do?nowPage="+nowPage+"&notice_index="+notice_index;
	}
	
	@RequestMapping(value = "noticeDelete.do", method = RequestMethod.POST)
	@ResponseBody
	 public String messageNonReadCount(Locale locale, Model model, int notice_index) throws Exception {
		  
		noticeService.noticeDelete(notice_index);

		return "true"; 
	  }
	
	
}
