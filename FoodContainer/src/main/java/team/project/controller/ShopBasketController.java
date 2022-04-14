package team.project.controller;

import java.net.URLDecoder;
import java.net.URLEncoder;
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
	public String home(Locale locale, Model model, HttpServletRequest request, ProductVO productVO, HttpServletResponse response) throws Exception{
		
		Cookie[] cookies = request.getCookies();
		String noMemberCartCookie = null;
		String product_index = request.getParameter("product_index");
		String cnt = request.getParameter("cnt");
		String changeCookie = null;
		ArrayList<String> noMemberCartArr = new ArrayList<>();
		
		if(cookies != null) {
			for(Cookie cookie : cookies) {
				if(cookie.getName().equals("noMemberCart")) {
					noMemberCartCookie = URLDecoder.decode(cookie.getValue(),"UTF-8");
				}
			}
		}
		
		if(noMemberCartCookie != null) {
			String[] tempCookieArr = noMemberCartCookie.split(",");
			if(product_index != null && cnt != null) {
				
				for(int i=0; i<tempCookieArr.length; i++) {
					
					if(tempCookieArr[i].substring(0,tempCookieArr[i].length()-1).equals(product_index)) {
						tempCookieArr[i] = product_index + cnt;
						
						if(i == 0) {
							changeCookie = tempCookieArr[i];
							System.out.println("1 ="+changeCookie);
						}else {
							String tempCookie = URLDecoder.decode(changeCookie,"UTF-8");
							changeCookie = URLEncoder.encode(tempCookie.toString()+","+tempCookieArr[i],"UTF-8");
							System.out.println("2 ="+changeCookie);
						}
						
					}else {
						if(i == 0) {
							changeCookie = tempCookieArr[i];
							System.out.println("3 ="+changeCookie);
						}else {
							String tempCookie = URLDecoder.decode(changeCookie,"UTF-8");
							changeCookie = URLEncoder.encode(tempCookie.toString()+","+tempCookieArr[i],"UTF-8");
							System.out.println("4 ="+changeCookie);
						}
					}
				}
				
				Cookie newCookie = new Cookie("noMemberCart",changeCookie);
				
				response.addCookie(newCookie);
			}
			
			for(int i=0; i<tempCookieArr.length; i++) {
				noMemberCartArr.add(tempCookieArr[i].substring(0,tempCookieArr[i].length()-1));
			}
			
			List<ProductVO> noMemberCartList = productService.noMemberCartList(noMemberCartArr);
			
			model.addAttribute("noMemberCart",noMemberCartList);
			model.addAttribute("noMemberCartCookie",tempCookieArr);
		}
		
		return "shopbasket/shopBasketMain";
	}
	
}
