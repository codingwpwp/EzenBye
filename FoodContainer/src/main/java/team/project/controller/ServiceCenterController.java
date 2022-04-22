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
	
	@RequestMapping(value = "FAQAjax.do", method = RequestMethod.POST)
	@ResponseBody
	public List<ServiceCenterVO> FAQAjax(Model model, @RequestParam(value="sort2") String sort2) throws Exception{
		
		List<ServiceCenterVO> FAQList = service.serviceCenterPageFAQList(sort2);
		
		return FAQList;
	}

}
