package team.project.controller;

import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import team.project.service.NoMemberOrdersService;
import team.project.service.OrderProductService;
import team.project.vo.NoMemberOrdersVO;
import team.project.vo.OrderProductVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class LookupNonController {
	
	@Autowired
	private NoMemberOrdersService noMemberOrdersService;
	
	@Autowired
	private OrderProductService orderProductService;
	
	@RequestMapping(value = "lookupNon.do", method = RequestMethod.POST)
	public String noMemberOrdersList(Locale locale, Model model, String no_member_order_index, OrderProductVO opVO) throws Exception {
		
		NoMemberOrdersVO noMemberOrdersList = noMemberOrdersService.noMemberOrdersList(no_member_order_index);
		model.addAttribute("noMemberOrdersList",noMemberOrdersList);
		
		List<OrderProductVO> opList = orderProductService.orderProductList(opVO);
		model.addAttribute("opList",opList);
		
		return "lookupnon/lookupNon";
	}
	
}
