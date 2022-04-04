package team.project.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import team.project.service.ProductService;
import team.project.vo.ProductVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class mainController {
	
	@Autowired
	private ProductService productService;
	
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "index.do", method = RequestMethod.GET)
	public String index(Locale locale, Model model) {
		
		
		return "index/index";
	}
	
	@RequestMapping(value = "productList.do", method = RequestMethod.GET)
	public String productList(Locale locale, Model model, ProductVO productVO) throws Exception {
		
		List<ProductVO> ProductListAll = productService.productListAll(productVO);
		
		model.addAttribute("productListAll",ProductListAll);
		
		return "product/productList";
	}
	
	@RequestMapping(value = "productView.do", method = RequestMethod.GET)
	public String productView(Locale locale, Model model) {
		
		
		return "product/productView";
	}

}
