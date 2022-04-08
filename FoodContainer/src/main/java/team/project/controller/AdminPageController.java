package team.project.controller;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import team.project.service.BannerService;
import team.project.service.ProductService;
import team.project.util.PagingUtil;
import team.project.vo.BannerVO;
import team.project.vo.ProductVO;
import team.project.vo.SearchVO;

@Controller
public class AdminPageController {
	
	@Autowired
	private ProductService productService;
	@Autowired
	private BannerService bannerService;

	@RequestMapping(value = "admin.do", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		return "adminPage/adminPage_main";
	}

	@RequestMapping(value = "member_list.do", method = RequestMethod.GET)
	public String member_list(Locale locale, Model model) {
		return "adminPage/adminPage_member_list";
	}

	@RequestMapping(value = "member_detail.do", method = RequestMethod.GET)
	public String member_detail(Locale locale, Model model) {
		return "adminPage/adminPage_member_detail";
	}

	@RequestMapping(value = "black_list.do", method = RequestMethod.GET)
	public String black_list(Locale locale, Model model) {
		return "adminPage/adminPage_black_list";
	}

	@RequestMapping(value = "black_detail.do", method = RequestMethod.GET)
	public String black_detail(Locale locale, Model model) {
		return "adminPage/adminPage_black_detail";
	}

	@RequestMapping(value = "dely_list.do", method = RequestMethod.GET)
	public String dely_list(Locale locale, Model model) {
		return "adminPage/adminPage_delY_list";
	}

	@RequestMapping(value = "dely_detail.do", method = RequestMethod.GET)
	public String dely_detail(Locale locale, Model model) {
		return "adminPage/adminPage_delY_detail";
	}

	@RequestMapping(value = "report.do", method = RequestMethod.GET)
	public String report(Locale locale, Model model) {
		return "adminPage/adminPage_report_list";
	}

	@RequestMapping(value = "member_order_list.do", method = RequestMethod.GET)
	public String member_order_list(Locale locale, Model model) {
		return "adminPage/adminPage_member_order_list";
	}

	@RequestMapping(value = "member_order_detail.do", method = RequestMethod.GET)
	public String member_order_detail(Locale locale, Model model) {
		return "adminPage/adminPage_member_order_detail";
	}

	@RequestMapping(value = "notMember_order_list.do", method = RequestMethod.GET)
	public String notMember_order_list(Locale locale, Model model) {
		return "adminPage/adminPage_notMember_order_list";
	}

	@RequestMapping(value = "notMember_order_detail.do", method = RequestMethod.GET)
	public String notMember_order_detail(Locale locale, Model model) {
		return "adminPage/adminPage_notMember_order_detail";
	}

	@RequestMapping(value = "cancel_list.do", method = RequestMethod.GET)
	public String cancel_list(Locale locale, Model model) {
		return "adminPage/adminPage_order_cancel_list";
	}

	// 등록 상품 조회 페이지
	@RequestMapping(value = "product_main.do", method = RequestMethod.GET)
	public String product_main(Locale locale, Model model, SearchVO searchvo, String nowPage) throws Exception {

		// 사전 작업
		searchvo.setDel_YN("N");
		int realnowPage = 1;
		if(nowPage != null && nowPage.equals("")) realnowPage = Integer.parseInt(nowPage);
		
		// 리스트 출력
		List<ProductVO> productList = productService.adminProductList(searchvo, realnowPage);
		model.addAttribute("productList", productList);
		
		// 페이징 출력
		PagingUtil paging = productService.adminProductPaging(searchvo, realnowPage);
		model.addAttribute("paging", paging);

		return "adminPage/adminPage_product_main";
	}
	
	// 등록 상품 조회 페이지에서 선택 상품 삭제하는 비동기
	@RequestMapping(value = "productDelete.do", method = RequestMethod.POST)
	@ResponseBody
	public String productDelete(Locale locale, Model model,
							  @RequestParam(value="product_index") String[] productIndexArr) throws Exception {
		
		int result = productService.adminProductDelYNisY(productIndexArr);
		
		if(result > 0) {
			return "deleteSuccess";
		}else {
			return "deleteFail";
		}
		
	}

	// 등록 상품 상세조회 페이지
	@RequestMapping(value = "product_detail.do", method = RequestMethod.GET)
	public String product_detail(Locale locale, Model model, String product_index) throws Exception {
		
		ProductVO product = productService.adminProductSelectOne(product_index);
		model.addAttribute("product", product);
		
		return "adminPage/adminPage_product_detail";
	}

	// 상품 등록 페이지
	@RequestMapping(value = "product_register.do", method = RequestMethod.GET)
	public String product_register(Locale locale, Model model) {
		return "adminPage/adminPage_product_register";
	}

	// 상품을 실제로 DB에 등록하는 과정
	@RequestMapping(value = "product_register.do", method = RequestMethod.POST)
	public String product_registerOk(Locale locale, Model model, ProductVO product,
									 @RequestParam("tumnailImage") MultipartFile tumnailImage,
									 @RequestParam("detailImage") MultipartFile detailImage,
									 HttpServletRequest request) throws Exception {

		product.setThumbnail_image(tumnailImage.getOriginalFilename());
		product.setDetail_image(detailImage.getOriginalFilename());
		
		int result = productService.adminProductInsert(product, tumnailImage, detailImage, request);
		
		if(result == 1) {
			return "redirect:admin.do";
		}else {
			return "redirect:product_register.do";
		}
		
	}

	// 상품 수정 페이지
	@RequestMapping(value = "product_modify.do", method = RequestMethod.GET)
	public String product_modify(Locale locale, Model model, String product_index) throws Exception {
		
		ProductVO product = productService.adminProductSelectOne(product_index);
		model.addAttribute("product", product);
		
		return "adminPage/adminPage_product_modify";
	}

	@RequestMapping(value = "product_delete_detail.do", method = RequestMethod.GET)
	public String product_delete_detail(Locale locale, Model model) {
		return "adminPage/adminPage_product_delete_detail";
	}

	@RequestMapping(value = "product_delete_list.do", method = RequestMethod.GET)
	public String product_delete_list(Locale locale, Model model) {
		return "adminPage/adminPage_product_delete_list";
	}

	// 배너 페이지 이동
	@RequestMapping(value = "banner.do", method = RequestMethod.GET)
	public String banner(Locale locale, Model model) throws Exception {
		
		List<BannerVO> bannerList = bannerService.bannerList();
		model.addAttribute("bannerList", bannerList);
		
		return "adminPage/adminPage_banner";
	}
	
	// 배너 등록
	@RequestMapping(value = "bannerRegister.do", method = RequestMethod.POST)
	public String bannerRegister(Locale locale, Model model, BannerVO bannervo,
								@RequestParam("bannerFile") MultipartFile bannerFile,
								HttpServletRequest request) throws Exception {
		
		bannerService.bannerInsert(bannervo, bannerFile, request);
		
		return "redirect:banner.do";
	}
	
	// 배너 삭제
	@RequestMapping(value = "bannerDelete.do", method = RequestMethod.POST)
	@ResponseBody
	public String bannerDelete(Locale locale, Model model,
							  @RequestParam(value="banner_index") int[] bannerIndexArr) throws Exception {
		
		int result = bannerService.bannerDelete(bannerIndexArr);
		
		if(result > 0) {
			return "deleteSuccess";
		}else {
			return "deleteFail";
		}
		
	}
	@RequestMapping(value = "bestRecipe.do", method = RequestMethod.GET)
	public String bestRecipe(Locale locale, Model model) {
		return "adminPage/adminPage_bestRecipe";
	}

	@RequestMapping(value = "event.do", method = RequestMethod.GET)
	public String event(Locale locale, Model model) {
		return "adminPage/adminPage_event";
	}

	@RequestMapping(value = "settlement.do", method = RequestMethod.GET)
	public String settlement(Locale locale, Model model) {
		return "adminPage/adminPage_settlement";
	}
}
