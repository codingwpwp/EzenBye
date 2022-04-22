package team.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import team.project.service.ServiceCenterService;
import team.project.util.PagingUtil;
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
		if(nowPage != null) realnowPage = Integer.parseInt(nowPage);
		
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
					   @RequestParam(value="sort2") String sort2,
					   @RequestParam(value="nowPage") String nowPage,
					   @RequestParam(value="serviceCenter_index") int serviceCenter_index) throws Exception{
		
		ServiceCenterVO vo = service.serviceCenterPageView(serviceCenter_index);
		model.addAttribute("view", vo);
		
		model.addAttribute("sort2", sort2);
		model.addAttribute("nowPage", nowPage);
		
		return "serviceCenterPage/serviceCenter_view";
	}

}
