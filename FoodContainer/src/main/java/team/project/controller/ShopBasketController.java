package team.project.controller;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import team.project.service.CartService;
import team.project.service.ProductService;
import team.project.vo.CartVO;
import team.project.vo.MemberVO;
import team.project.vo.ProductVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class ShopBasketController {
	
	private static final Logger logger = LoggerFactory.getLogger(ShopBasketController.class);
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private CartService cartService;
	
	// 상품 선택삭제
	@RequestMapping(value = "chooseShopbasketDelete.do", method = RequestMethod.POST)
	@ResponseBody
	public String chooseShopbasketDelete(HttpServletRequest request) throws Exception {
		
		String[] valueArr = request.getParameterValues("valueArr");
		
		int size = valueArr.length;
		for(int i = 0; i<size; i++) {
			cartService.chooseShopbasketDelete(valueArr[i]);
		}
		return "redirect:shopBasket_main.do";
	}
	
	// 상품 삭제
	@RequestMapping(value = "shopbasketDelete.do", method = RequestMethod.POST)
	@ResponseBody
	public String shopbasketDelete(int cart_index) throws Exception {
		
		cartService.shopbasketDelete(cart_index);
		
		return "redirect:shopBasket_main.do";
	}
	
	// 상품 cnt 감소
	@RequestMapping(value = "cartCount.do", method = RequestMethod.POST)
	@ResponseBody
	public String cartCount(@RequestParam(value="cart_index") int cart_index, @RequestParam(value="cnt") int cnt) throws Exception {
		
		cartService.cartCount(cnt, cart_index);
		
		return "redirect:shopBasket_main.do";
	}
	
	@RequestMapping(value = "shopBasket_main.do", method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpServletRequest request, ProductVO productVO, HttpServletResponse response, HttpSession session) throws Exception{
		
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
					
					if(tempCookieArr[i].length() < 7) {
						
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
					}else {
						if(tempCookieArr[i].substring(0,tempCookieArr[i].length()-2).equals(product_index)) {
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
				}
				
				Cookie newCookie = new Cookie("noMemberCart",changeCookie);
				
				response.addCookie(newCookie);
			}
			
			for(int i=0; i<tempCookieArr.length; i++) {
				if(tempCookieArr[i].length() < 7) {
					noMemberCartArr.add(tempCookieArr[i].substring(0,tempCookieArr[i].length()-1));
				}else {
					noMemberCartArr.add(tempCookieArr[i].substring(0,tempCookieArr[i].length()-2));
				}
			}
			
			List<ProductVO> noMemberCartList = productService.noMemberCartList(noMemberCartArr);
			
			model.addAttribute("noMemberCart",noMemberCartList);
			model.addAttribute("noMemberCartCookie",tempCookieArr);
		}
		
		// 회원 장바구니 불러오기
		int member_index = 0;
		
		if((MemberVO) session.getAttribute("member") != null) {
			MemberVO member = (MemberVO) session.getAttribute("member");
		    member_index = member.getMember_index();
		    
		    List<CartVO> selectList = cartService.selectList(member_index);
			
			model.addAttribute("selectList",selectList);
		}
		
		return "shopbasket/shopBasketMain";
	}
	
}
