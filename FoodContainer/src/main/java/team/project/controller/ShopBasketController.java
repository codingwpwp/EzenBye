package team.project.controller;

import java.net.URLDecoder;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

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
public class ShopBasketController {
	
	private static final Logger logger = LoggerFactory.getLogger(ShopBasketController.class);
	
	@Autowired
	private ProductService productService;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "shopBasket_main.do", method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpServletRequest request, ProductVO productVO) throws Exception{
		
		Cookie[] cookies = request.getCookies();
		String noMemberCartCookie = null;
		ArrayList<String> noMemberCartArr = new ArrayList<>();
		ArrayList<String> noMemberCartArrProductCnt = new ArrayList<>();
		
		if(cookies != null) {
			for(Cookie cookie : cookies) {
				if(cookie.getName().equals("noMemberCart")) {
					noMemberCartCookie = URLDecoder.decode(cookie.getValue(),"UTF-8");
				}
			}
		}
		
		if(noMemberCartCookie != null) {
			String[] tempCookieArr = noMemberCartCookie.split(",");
			
			for(int i=0; i<tempCookieArr.length; i++) {
				noMemberCartArr.add(tempCookieArr[i].substring(0,tempCookieArr[i].length()-1));
				noMemberCartArrProductCnt.add(tempCookieArr[i].substring(tempCookieArr[i].length()-1,tempCookieArr[i].length()));
			}
			
			List<ProductVO> noMemberCartList = productService.noMemberCartList(noMemberCartArr);
			
			model.addAttribute("noMemberCart",noMemberCartList);
			model.addAttribute("noMemberCartCookie",tempCookieArr);
		}
		
		return "shopbasket/shopBasketMain";
	}
	
}
