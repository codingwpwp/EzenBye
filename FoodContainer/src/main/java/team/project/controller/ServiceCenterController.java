package team.project.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import team.project.service.ServiceCenterService;
import team.project.util.PagingUtil;
import team.project.vo.MemberVO;
import team.project.vo.ServiceCenterReplyVO;
import team.project.vo.ServiceCenterVO;

@Controller
public class ServiceCenterController {
	
	@Autowired
	ServiceCenterService service;

	// 고객센터 메인
	@RequestMapping(value = "serviceCenter.do", method = RequestMethod.GET)
	public String serviceCenter(Model model,
								@RequestParam(value="sort2", required = false) String sort2,
								@RequestParam(value="nowPage", required = false) String nowPage) throws Exception{

		int realnowPage = 1;
		if(sort2 == null) sort2 = "상품";
		if(nowPage != null && !nowPage.equals("")) realnowPage = Integer.parseInt(nowPage);
		
		model.addAttribute("sort2", sort2);
		
		List<ServiceCenterVO> FAQList = service.serviceCenterPageFAQList(sort2);
		model.addAttribute("FAQList", FAQList);
		
		List<ServiceCenterVO> sList = service.serviceCenterPageList(sort2, realnowPage);
		model.addAttribute("sList", sList);
		
		PagingUtil paging = service.serviceCenterPagingUtil(sort2, realnowPage);
		model.addAttribute("paging", paging);
		
		return "serviceCenterPage/serviceCenter_main";
	}
	
	// 고객센터 메인 FAQ비동기
	@RequestMapping(value = "FAQAjax.do", method = RequestMethod.POST)
	@ResponseBody
	public List<ServiceCenterVO> FAQAjax(@RequestParam(value="sort2") String sort2) throws Exception{
		return service.serviceCenterPageFAQList(sort2);
	}

	// 고객센터 메인 페이징비동기
	@RequestMapping(value = "pagingAjax.do", method = RequestMethod.POST)
	@ResponseBody
	public PagingUtil pagingAjax(Model model, @RequestParam(value="sort2") String sort2) throws Exception{
		return service.serviceCenterPagingUtil(sort2, 1);
	}
	
	// 고객센터 메인 1:1문의비동기
	@RequestMapping(value = "sListAjax.do", method = RequestMethod.POST)
	@ResponseBody
	public List<ServiceCenterVO> sListAjax(Model model, @RequestParam(value="sort2") String sort2) throws Exception{
		return service.serviceCenterPageList(sort2, 1);
	}
	
	// 고객센터 글 보기
	@RequestMapping(value = "serviceCenter_view.do", method = RequestMethod.GET)
	public String view(Model model,
					   @RequestParam(value="sort2", required = false) String sort2,
					   @RequestParam(value="nowPage", required = false) String nowPage,
					   @RequestParam(value="serviceCenter_index") int serviceCenter_index) throws Exception{
		
		ServiceCenterVO vo = service.serviceCenterPageView(serviceCenter_index);
		model.addAttribute("view", vo);
		
		model.addAttribute("sort2", sort2);
		model.addAttribute("nowPage", nowPage);
		
		ServiceCenterReplyVO rvo = service.reply(vo.getServiceCenter_index());
		model.addAttribute("reply", rvo);
		
		return "serviceCenterPage/serviceCenter_view";
	}
	
	// 고객센터 글 작성
	@RequestMapping(value = "serviceCenter_insert.do", method = RequestMethod.GET)
	public String insert(Model model, HttpServletRequest request,
						@RequestParam(value="sort1", required = false) String sort1,
						@RequestParam(value="sort2") String sort2,
						@RequestParam(value="nowPage") String nowPage) throws Exception{
		
		// 세션 소환
		HttpSession session = request.getSession();
		if(session.getAttribute("member") == null) {
			return "redirect:index.do";
		}else {
			MemberVO vo = (MemberVO)session.getAttribute("member");
			if(sort1 == null) {
				return "redirect:index.do";
			}else {
				if(sort1.equals("FAQ")) {
					if(!vo.getPosition().equals("관리자")) {
						return "redirect:index.do";
					}
				}else if(sort1.equals("1:1문의")) {
					if(vo.getPosition().equals("관리자")) {
						return "redirect:index.do";
					}
				}
				model.addAttribute("sort1", sort1);
				model.addAttribute("sort2", sort2);
				model.addAttribute("nowPage", nowPage);
				
				return "serviceCenterPage/serviceCenter_insert";
			}
		}
		
	}

	// 고객센터 글 등록
	@RequestMapping(value = "serviceCenter_insert.do", method = RequestMethod.POST)
	public String insertOk(HttpServletRequest request, ServiceCenterVO vo) throws Exception{
		// 세션 소환
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO)session.getAttribute("member");
		
		vo.setMember_index(mvo.getMember_index());
		if(mvo.getPosition().equals("관리자")) {
			vo.setSort1("FAQ");
		}else {
			vo.setSort1("1:1문의");
		}
		
		service.insert(vo);
		
		return "redirect:serviceCenter.do";
	}
	
	
	// 고객센터 답변 등록
	@RequestMapping(value = "replyInsert.do", method = RequestMethod.POST)
	public String replyInsert(HttpServletRequest request, ServiceCenterReplyVO vo) throws Exception{
		
		service.replyInsert(vo);
		service.update(vo.getServiceCenter_index());
		
		return "redirect:serviceCenter.do";
	}

	// 고객센터 글 삭제
	@RequestMapping(value = "serviceCenter_delete.do", method = RequestMethod.GET)
	public String deleteser(int serviceCenter_index) throws Exception{
		
		System.out.println(serviceCenter_index);
		System.out.println(serviceCenter_index);
		System.out.println(serviceCenter_index);
		System.out.println(serviceCenter_index);
		service.deleteser(serviceCenter_index);
		
		return "redirect:serviceCenter.do";
	}
	
}
