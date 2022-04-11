package team.project.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import team.project.service.DibsService;
import team.project.service.ProductService;
import team.project.vo.DibsVO;
import team.project.vo.MemberVO;
import team.project.vo.ProductVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class MainController {
	
	@Autowired
	private ProductService productService;
	@Autowired
	private DibsService dibsService;
	
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "index.do", method = RequestMethod.GET)
	public String index(Locale locale, Model model) {
		
		model.addAttribute("test","test");
		
		return "index/index";
	}
	
	@RequestMapping(value = "productList.do", method = RequestMethod.GET)
	public String productList(Locale locale, Model model, ProductVO productVO, HttpServletRequest request, DibsVO dibsVO) throws Exception {
		
		List<ProductVO> ProductListAll = productService.productListAll(productVO);
		
		model.addAttribute("productListAll",ProductListAll);
		
		List<DibsVO> dibsListAll = dibsService.dibsListAll(dibsVO);
		
		model.addAttribute("userDibsList", dibsListAll);
		
		return "product/productList";
	}
	
	@RequestMapping(value = "productView.do", method = RequestMethod.GET)
	public String productView(Locale locale, Model model, HttpServletRequest request) throws Exception {
		
		String product_index = request.getParameter("product_index");
		
		ProductVO vo = productService.view(product_index);
		
		model.addAttribute("view",vo);
		
		//쿠키 사용
		Cookie[] cookies = request.getCookies();
		
		String currentCookie = null;
	
		ArrayList<String> cookieArr = new ArrayList<>();
		
		for(Cookie cookie : cookies) {
			if(cookie.getName().equals("pIndex")) {
				currentCookie = URLDecoder.decode(cookie.getValue(),"UTF-8");
			}
		}
		
		if(currentCookie != null) {
			
			
			String[] CookieList = currentCookie.split(",");
			
			
			for(int i=0; i < CookieList.length; i++) {
				cookieArr.add(CookieList[i]);
			}
			
		}
		
		List<ProductVO> cookieListArr = productService.cookieList(cookieArr);
		
		model.addAttribute("viewCookie", cookieListArr);
		
		return "product/productView";
	}

	@RequestMapping(value = "viewProductCookie.do", method = RequestMethod.GET)
	public void viewProductCookie(Locale locale, Model model, ProductVO productVO, HttpServletRequest request, 
									HttpServletResponse response) throws UnsupportedEncodingException {
		//쿠키 value
		String viewProduct = request.getParameter("name");
		//모든 쿠키 호출
		Cookie[] cookies = request.getCookies();
		
		Cookie cookieValue = null;
		Cookie viewCookie;
		
		boolean overlap = false;
		//쿠키가 있을 경우
		for(Cookie cookie : cookies) {
			if(cookie.getName().equals("pIndex")) {
				System.out.println("1");
				cookieValue = cookie;
				break;
			}
		}
		//찾는 쿠키가 존재할 때
		if(cookieValue != null) {
			System.out.println("3");
			String tempCookie = URLDecoder.decode(cookieValue.getValue(),"UTF-8");
			String[] tempCookieArr = tempCookie.split(",");
			//중복방지
			for(int i=0; i<tempCookieArr.length; i++) {
				if(tempCookieArr[i].equals(viewProduct)) {
					System.out.println("6");
					overlap = true;
					break;
				}
			}
			
			if(!(overlap)) {
				//쿠키가 한 개
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
		//찾는 쿠키가 없을 때
		}else{
			System.out.println("2");
			viewCookie = new Cookie("pIndex", viewProduct);
			response.addCookie(viewCookie);
		}
		
		
	}

	@RequestMapping(value = "noMemberCartCookie.do", method = RequestMethod.GET)
	public void noMemberCartCookie(Locale locale, Model model, ProductVO productVO, HttpServletRequest request, 
									HttpServletResponse response) throws UnsupportedEncodingException {
		//쿠키 value
		String viewProduct = request.getParameter("product_index");
		//모든 쿠키 호출
		Cookie[] cookies = request.getCookies();
		
		Cookie cookieValue = null;
		Cookie noMemberCartCookie;
		
		boolean overlap = false;
		//쿠키가 있을 경우
		for(Cookie cookie : cookies) {
			if(cookie.getName().equals("noMemberCart")) {
				System.out.println("1");
				cookieValue = cookie;
				break;
			}
		}
		//찾는 쿠키가 존재할 때
		if(cookieValue != null) {
			System.out.println("3");
			String tempCookie = URLDecoder.decode(cookieValue.getValue(),"UTF-8");
			String[] tempCookieArr = tempCookie.split(",");
			//중복방지
			for(int i=0; i<tempCookieArr.length; i++) {
				if(tempCookieArr[i].equals(viewProduct)) {
					System.out.println("5");
					overlap = true;
					break;
				}
			}
			
			if(!(overlap)) {
				//기존 쿠키에 결합
				System.out.println("4");
				String setCookie = URLEncoder.encode(tempCookie.toString() + "," + viewProduct,"UTF-8");
				System.out.println(setCookie);
				noMemberCartCookie = new Cookie("noMemberCart", setCookie);
				response.addCookie(noMemberCartCookie);
			}
		//찾는 쿠키가 없을 때
		}else{
			System.out.println("2");
			noMemberCartCookie = new Cookie("noMemberCart", viewProduct);
			response.addCookie(noMemberCartCookie);
		}
		
		
	}
}
