package team.project.controller;

import java.io.File;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import team.project.service.BannerService;
import team.project.service.ProductService;
import team.project.vo.BannerVO;
import team.project.vo.ProductVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class AdminPageController {
	
	@Autowired
	private ProductService productService;
	@Autowired
	private BannerService bannerService;

	private static final Logger logger = LoggerFactory.getLogger(AdminPageController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
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

	@RequestMapping(value = "product_main.do", method = RequestMethod.GET)
	public String product_main(Locale locale, Model model, ProductVO productVO) throws Exception {

		List<ProductVO> ProductListAll = productService.productListAll(productVO);
		model.addAttribute("productListAll", ProductListAll);

		return "adminPage/adminPage_product_main";
	}

	@RequestMapping(value = "product_register.do", method = RequestMethod.GET)
	public String product_register(Locale locale, Model model) {
		return "adminPage/adminPage_product_register";
	}

	@RequestMapping(value = "product_register.do", method = RequestMethod.POST)
	public String product_registerOk(Locale locale, Model model, ProductVO productVO,
									 @RequestParam("tumnailImage") MultipartFile tumnailImage,
									 @RequestParam("detailImage") MultipartFile detailImage,
									 HttpServletRequest request) throws Exception {

		productVO.setThumbnail_image(tumnailImage.getOriginalFilename());
		productVO.setDetail_image(detailImage.getOriginalFilename());
		/*System.out.println(productVO.getProduct_index());
		System.out.println(productVO.getBigSort());
		System.out.println(productVO.getMiddleSort());
		System.out.println(productVO.getProduct_name());
		System.out.println(productVO.getOrigin_price());
		System.out.println(productVO.getSale_price());
		System.out.println(productVO.getBrand());
		System.out.println(productVO.getInventory());
		System.out.println(productVO.getQuantity());
		System.out.println(productVO.getDelivery_free_YN());
		System.out.println(productVO.getThumbnail_image());
		System.out.println(productVO.getDetail_image());*/

		String path = request.getSession().getServletContext().getRealPath("/resources/img/" + productVO.getBrand() + "/" + productVO.getMiddleSort());
		System.out.println("path::" + path);

		File dir = new File(path);
		if (!dir.exists()) dir.mkdirs();
		if (!productVO.getThumbnail_image().isEmpty()) tumnailImage.transferTo(new File(path, productVO.getThumbnail_image()));
		if (!productVO.getDetail_image().isEmpty()) detailImage.transferTo(new File(path, productVO.getDetail_image()));
		
		//productService.insertProduct(productVO, tumnailImage, detailImage);
		

		return "product_register.do";
	}

	@RequestMapping(value = "product_detail.do", method = RequestMethod.GET)
	public String product_detail(Locale locale, Model model, ProductVO productVO) throws Exception {

		ProductVO productvo = productService.ProductSelectOne(productVO);
		model.addAttribute("productvo", productvo);

		return "adminPage/adminPage_product_detail";
	}

	@RequestMapping(value = "product_modify.do", method = RequestMethod.GET)
	public String product_modify(Locale locale, Model model) {
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

	@RequestMapping(value = "banner.do", method = RequestMethod.GET)
	public String banner(Locale locale, Model model) throws Exception {
		
		List<BannerVO> bannerList = bannerService.bannerList();
		model.addAttribute("bannerList", bannerList);
		
		return "adminPage/adminPage_banner";
	}
	@RequestMapping(value = "bannerRegister.do", method = RequestMethod.POST)
	public String bannerRegister(Locale locale, Model model, BannerVO bannervo,
								@RequestParam("bannerFile") MultipartFile bannerFile,
								HttpServletRequest request) throws Exception {
		
		bannerService.bannerInsert(bannervo, bannerFile, request);
		
		
		return "redirect:banner.do";
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
