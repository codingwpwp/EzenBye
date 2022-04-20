package team.project.controller;

import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import team.project.service.NoticeService;
import team.project.util.PagingUtil;
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
	
	@RequestMapping(value = "notice_main.do", method = RequestMethod.GET)
	public String notice(Locale locale, Model model, SearchVO searchVO, int nowPage) throws Exception {
		
		int realnowPage = 1;
		if(nowPage != 0) realnowPage = nowPage;
		
		List<NoticeVO> noticeList = noticeService.noticeList(searchVO, realnowPage);
		model.addAttribute("noticeList",noticeList);
		
		PagingUtil paging = noticeService.noticeListPaging(searchVO, realnowPage);
		
		model.addAttribute("paging", paging);
		
		return "notice/notice_main";
	}
	
	@RequestMapping(value = "notice_view.do", method = RequestMethod.GET)
	public String notice2(Locale locale, Model model, int nowPage, int notice_index) throws Exception {
		
		NoticeVO noticeDetail = noticeService.noticeDetail(notice_index);
		
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
	public String notice4(Locale locale, Model model) {
		return "notice/notice_update";
	}
	
	@RequestMapping(value = "noticeInsert.do", method = RequestMethod.POST)
	public String notice5(Locale locale, Model model, NoticeVO vo) throws Exception {
		
		noticeService.noticeInsert(vo);
		
		return "redirect:notice_main.do?nowPage=1";
	}
	
	
}
