package team.project.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Arrays;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
	public String productView(Locale locale, Model model, String index, HttpServletRequest request) throws Exception {
		
		ProductVO vo = productService.view(index);
		
		model.addAttribute("view",vo);
		
		Cookie[] cookies = request.getCookies();
		
		String currentCookie = null;
		
		for(Cookie cookie : cookies) {
			if(cookie.getName().equals("pIndex")) {
				currentCookie = URLDecoder.decode(cookie.getValue(),"UTF-8");
			}
		}
		
		model.addAttribute("viewCookie", currentCookie);
		
		return "product/productView";
	}

	@RequestMapping(value = "viewProductCookie.do", method = RequestMethod.GET)
	public void viewProductCookie(Locale locale, Model model, ProductVO productVO, HttpServletRequest request, 
									HttpServletResponse response) throws UnsupportedEncodingException {
		
		String viewProduct = request.getParameter("name");
		
		Cookie[] cookies = request.getCookies();
		
		Cookie cookieValue = null;
		Cookie viewCookie;
		
		boolean overlap = false;
		
		for(Cookie cookie : cookies) {
			if(cookie.getName().equals("pIndex")) {
				System.out.println("1");
				cookieValue = cookie;
				break;
			}
		}
		
		if(cookieValue != null) {
			System.out.println("3");
			String tempCookie = URLDecoder.decode(cookieValue.getValue(),"UTF-8");
			String[] tempCookieArr = tempCookie.split(",");
			
			for(int i=0; i<tempCookieArr.length; i++) {
				if(tempCookieArr[i].equals(viewProduct)) {
					System.out.println("6");
					overlap = true;
					break;
				}
			}
			
			if(!(overlap)) {
				if(tempCookieArr.length < 2) {
					System.out.println("4");
					String setCookie = URLEncoder.encode(viewProduct + "," + tempCookieArr[0],"UTF-8");
					viewCookie = new Cookie("pIndex", setCookie);
					response.addCookie(viewCookie);
				}else {
					System.out.println("5");
					String setCookies = URLEncoder.encode(viewProduct + "," + tempCookieArr[0] + "," + tempCookieArr[1],"UTF-8");
					viewCookie = new Cookie("pIndex", setCookies);
					response.addCookie(viewCookie);
				}
			}
		}else{
			System.out.println("2");
			viewCookie = new Cookie("pIndex", viewProduct);
			response.addCookie(viewCookie);
		}
		
		
	}

}
