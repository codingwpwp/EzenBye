package team.project.controller;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
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
	public String productView(Locale locale, Model model, String index) throws Exception {
		
		ProductVO vo = productService.view(index);
		
		model.addAttribute("view",vo);
		
		return "product/productView";
	}

	@RequestMapping(value = "viewProductCookie.do", method = RequestMethod.GET)
	public String viewProductCookie(Locale locale, Model model, ProductVO productVO, HttpServletRequest request, HttpServletResponse response) {
		
		String viewProduct = request.getParameter("name");
		
		Cookie[] cookies = request.getCookies();
		
		Cookie cookieValue = null;
		
		for(Cookie cookie : cookies) {
			if(cookie.getName().equals("pIndex")) {
				cookieValue = cookie;
				break;
			}
		}
		
		if(cookieValue != null) {
			String tempCookie = cookieValue.getValue();
			
			
		}else{
			Cookie viewCookie = new Cookie("pIndex", viewProduct);
			response.addCookie(viewCookie);
		}
		
		return "base/rightAside";
		
	}

}
