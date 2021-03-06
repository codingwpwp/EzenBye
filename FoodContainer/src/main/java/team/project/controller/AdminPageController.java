package team.project.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.multipart.MultipartFile;

import team.project.dao.OrderProductDAO;
import team.project.service.BannerService;
import team.project.service.MemberService;
import team.project.service.MessageService;
import team.project.service.NoMemberOrdersService;
import team.project.service.OrderProductService;
import team.project.service.OrdersService;
import team.project.service.ProductService;
import team.project.service.RecipeService;
import team.project.service.ServiceCenterService;
import team.project.util.PagingUtil;
import team.project.vo.BannerVO;
import team.project.vo.MemberVO;
import team.project.vo.MessageVO;
import team.project.vo.NoMemberOrdersVO;
import team.project.vo.OrderProductVO;
import team.project.vo.OrdersVO;
import team.project.vo.ProductVO;
import team.project.vo.RecipeVO;
import team.project.vo.SearchVO;
import team.project.vo.ServiceCenterVO;

@Controller
public class AdminPageController {

	@Autowired
	private MemberService memberService;
	@Autowired
	private ProductService productService;
	@Autowired
	private BannerService bannerService;
	@Autowired
	private OrdersService ordersService;
	@Autowired
	private OrderProductService orderProductService;
	@Autowired
	private NoMemberOrdersService noMemberOrdersService;
	@Autowired
	private MessageService messageService;
	@Autowired
	private ServiceCenterService service;
	@Autowired
	private RecipeService recipeService;
	@Autowired
	private OrderProductDAO orderProductDao;

	MemberVO member;
	
	// ?????????????????? ??????
	@RequestMapping(value = "admin.do", method = RequestMethod.GET)
	public String home(Model model, HttpServletRequest request)  throws Exception{
		
		HttpSession session = request.getSession();
		if(session.getAttribute("member") == null) {	// ????????? ????????? ???
			return "wrongAccessPage/needLogin";
		}else {
			member = (MemberVO)session.getAttribute("member");
			if(!member.getPosition().equals("?????????")) {	// ???????????? ?????? ??????
				return "wrongAccessPage/wrongAccess";
			}else {										// ???????????? ??????
				
				// ??????
				List<HashMap<String, String>> salesList = orderProductService.sales();
				model.addAttribute("salesList", salesList);
				
				// ??????
				List<ProductVO> revenueList = orderProductService.revenue();
				model.addAttribute("rList", revenueList);
				
				// ?????? ?????? ??????
				List<ServiceCenterVO> serviceList = service.adminService();
				model.addAttribute("sList", serviceList);
				
				// ???????????? ?????? 3??? ?????????
				List<BannerVO> bannerList = bannerService.adminMainBanner();
				model.addAttribute("bList", bannerList);
				
				// ???????????? ?????? 3??? ?????????
				List<ProductVO> productList = productService.adminMainProductList();
				model.addAttribute("pList", productList);
				
				return "adminPage/adminPage_main";
			}
		}
		
	}

	// ?????? ?????? ?????? ?????????????????? ??????
	@RequestMapping(value = "member_list.do", method = RequestMethod.GET)
	public String memberList(Model model, HttpServletRequest request, SearchVO searchvo, int nowPage) throws Exception{
		
		// ?????? ??????
		HttpSession session = request.getSession();
		if(session.getAttribute("member") == null) {	// ????????? ????????? ???
			return "wrongAccessPage/needLogin";
		}else {
			member = (MemberVO)session.getAttribute("member");
			if(!member.getPosition().equals("?????????")) {	// ???????????? ?????? ??????
				return "wrongAccessPage/wrongAccess";
			}else {										// ???????????? ??????

				// del_yn = "N"
				searchvo.setDel_yn("N");
				// ???????????????
				int realnowPage = 1;
				if(nowPage != 0) realnowPage = nowPage;
				
				// ????????? ??????
				List<MemberVO> memberList = memberService.adminMemberList(searchvo, realnowPage);
				model.addAttribute("memberList", memberList);
				
				// ????????? + ????????? ??????
				PagingUtil paging = memberService.adminMemberPaging(searchvo, realnowPage);
				if(searchvo.getSearchValue() != null) {
					paging.setSearchValue(searchvo.getSearchValue());
					paging.setSearchType(searchvo.getSearchType());
				}
				model.addAttribute("paging", paging);
				
				return "adminPage/adminPage_member_list";
				
			}
		}
		
	}
	
	// ?????? ?????? ?????? ?????? ?????????????????? ??????
	@RequestMapping(value = "member_detail.do", method = RequestMethod.GET)
	public String memberDetail(Model model, HttpServletRequest request, SearchVO searchvo, int nowPage, int member_index) throws Exception{
		
		
		// ?????? ??????
		HttpSession session = request.getSession();
		if(session.getAttribute("member") == null) {	// ????????? ????????? ???
			return "wrongAccessPage/needLogin";
		}else {
			member = (MemberVO)session.getAttribute("member");
			if(!member.getPosition().equals("?????????")) {	// ???????????? ?????? ??????
				return "wrongAccessPage/wrongAccess";
			}else {										// ???????????? ??????
				MemberVO member = memberService.memberInfor(member_index);
				member.setPw("");
				model.addAttribute("m", member);
				
				// ??????&?????????
				model.addAttribute("searchType", searchvo.getSearchType());
				model.addAttribute("searchValue", searchvo.getSearchValue());
				model.addAttribute("nowPage", nowPage);
				
				return "adminPage/adminPage_member_detail";
			}
		}
		
	}
	
	// ????????? ???????????? ??????
	@RequestMapping(value = "memberDely.do", method = RequestMethod.POST)
	@ResponseBody
	public String memberDely(int member_index) throws Exception{
		int result = memberService.adminChangeMemberDel_yn(member_index);
		if(result > 0) {
			return "Success";
		}else {
			return "Fail";
		}
	}

	// ????????? ?????? ?????????????????? ??????
	@RequestMapping(value = "dely_list.do", method = RequestMethod.GET)
	public String memberDelyList(Model model, HttpServletRequest request, SearchVO searchvo, int nowPage) throws Exception{
		
		// ?????? ??????
		HttpSession session = request.getSession();
		if(session.getAttribute("member") == null) {	// ????????? ????????? ???
			return "wrongAccessPage/needLogin";
		}else {
			member = (MemberVO)session.getAttribute("member");
			if(!member.getPosition().equals("?????????")) {	// ???????????? ?????? ??????
				return "wrongAccessPage/wrongAccess";
			}else {										// ???????????? ??????

				// del_yn = "Y"
				searchvo.setDel_yn("Y");
				// ???????????????
				int realnowPage = 1;
				if(nowPage != 0) realnowPage = nowPage;
				
				// ????????? ??????
				List<MemberVO> memberList = memberService.adminMemberList(searchvo, realnowPage);
				model.addAttribute("memberList", memberList);
				
				// ????????? ??????
				PagingUtil paging = memberService.adminMemberPaging(searchvo, realnowPage);
				model.addAttribute("paging", paging);
				
				return "adminPage/adminPage_delY_list";
				
				
			}
		}
		
	}
	
	// ???????????? ?????? ?????????
	@RequestMapping(value = "sendMessage.do", method = RequestMethod.POST)
	@ResponseBody
	public String message(MessageVO vo) throws Exception{
		
		int result = messageService.messageInsert(vo);
		
		if(result == 1) {
			return "Success";
		}else {
			return "Fail";
		}
	}

	// ????????? ?????? ?????? ?????????????????? ??????
	@RequestMapping(value = "dely_detail.do", method = RequestMethod.GET)
	public String memberDelYDetail(Model model, HttpServletRequest request, int nowPage, int member_index) throws Exception{
		
		// ?????? ??????
		HttpSession session = request.getSession();
		if(session.getAttribute("member") == null) {	// ????????? ????????? ???
			return "wrongAccessPage/needLogin";
		}else {
			member = (MemberVO)session.getAttribute("member");
			if(!member.getPosition().equals("?????????")) {	// ???????????? ?????? ??????
				return "wrongAccessPage/wrongAccess";
			}else {										// ???????????? ??????
				MemberVO member = memberService.memberInfor(member_index);
				member.setPw("");
				model.addAttribute("m", member);
				
				// ?????????
				model.addAttribute("nowPage", nowPage);
				
				return "adminPage/adminPage_delY_detail";
			}
		}
		
	}


	// ?????? ?????? ?????????????????? ??????
	@RequestMapping(value = "member_order_list.do", method = RequestMethod.GET)
	public String memberOrderList(Model model, HttpServletRequest request, SearchVO searchvo, int nowPage) throws Exception {
		
		
		// ?????? ??????
		HttpSession session = request.getSession();
		if(session.getAttribute("member") == null) {	// ????????? ????????? ???
			return "wrongAccessPage/needLogin";
		}else {
			member = (MemberVO)session.getAttribute("member");
			if(!member.getPosition().equals("?????????")) {	// ???????????? ?????? ??????
				return "wrongAccessPage/wrongAccess";
			}else {										// ???????????? ??????
				
				// ???????????????
				int realnowPage = 1;
				if(nowPage != 0) realnowPage = nowPage;
				
				// ????????? ??????
				List<OrdersVO> memberOrdersList = ordersService.adminMemberOrdersList(searchvo, realnowPage);
				model.addAttribute("memberOrdersList", memberOrdersList);
		 
				// ????????? + ????????? ??????
				PagingUtil paging = ordersService.adminMemberOrdersPaging(searchvo, realnowPage);
				if(searchvo.getSearchValue() != null) paging.setSearchValue(searchvo.getSearchValue());
				model.addAttribute("paging", paging);	
				
				return "adminPage/adminPage_member_order_list";
			}
		}
	}

	// ?????? ?????? ???????????????????????? ??????
	@RequestMapping(value = "member_order_detail.do", method = RequestMethod.GET)
	public String memberOrderOne(Model model, HttpServletRequest request,
			OrdersVO ordersvo,
			@RequestParam(value="searchValue", required = false) String searchValue,
			@RequestParam(value="nowPage", required = false) int nowPage) throws Exception{
		
		
		// ?????? ??????
		HttpSession session = request.getSession();
		if(session.getAttribute("member") == null) {	// ????????? ????????? ???
			return "wrongAccessPage/needLogin";
		}else {
			member = (MemberVO)session.getAttribute("member");
			if(!member.getPosition().equals("?????????")) {	// ???????????? ?????? ??????
				return "wrongAccessPage/wrongAccess";
			}else {										// ???????????? ??????

				// ?????? ?????? ?????????????????? ????????? ????????????
				List<OrderProductVO> adminMemberOrderProductList = orderProductService.adminMemberOrderProductList(ordersvo);
				model.addAttribute("opList", adminMemberOrderProductList);
				
				// ?????? ?????? ???????????? ?????? ???????????? ??????
				OrdersVO order = ordersService.adminMemberOrder(ordersvo);
				model.addAttribute("order", order);
				
				// ?????? ?????? ???????????? ?????? ??????
				OrdersVO ordersDetailJoin = ordersService.ordersDetailJoin(ordersvo.getMember_order_index());
				model.addAttribute("orderCoupon",ordersDetailJoin);
				
				// ?????????&?????????
				model.addAttribute("searchValue", searchValue);
				model.addAttribute("nowPage", nowPage);
				
				return "adminPage/adminPage_member_order_detail";				
				
			}
		}
	}

	// ????????? ?????? ?????????????????? ??????
	@RequestMapping(value = "noMember_order_list.do", method = RequestMethod.GET)
	public String noMemberOrderList(Model model, HttpServletRequest request, SearchVO searchvo, int nowPage) throws Exception{
		
		// ?????? ??????
		HttpSession session = request.getSession();
		if(session.getAttribute("member") == null) {	// ????????? ????????? ???
			return "wrongAccessPage/needLogin";
		}else {
			member = (MemberVO)session.getAttribute("member");
			if(!member.getPosition().equals("?????????")) {	// ???????????? ?????? ??????
				return "wrongAccessPage/wrongAccess";
			}else {										// ???????????? ??????
				
				// ???????????????
				int realnowPage = 1;
				if(nowPage != 0) realnowPage = nowPage;
				
				// ????????? ??????
				List<NoMemberOrdersVO> noMemberOrdersList = noMemberOrdersService.adminNoMemberOrdersList(searchvo, realnowPage);
				model.addAttribute("noMemberOrdersList", noMemberOrdersList);
		 
				// ????????? + ????????? ??????
				PagingUtil paging = noMemberOrdersService.adminNoMemberOrdersPaging(searchvo, realnowPage);
				if(searchvo.getSearchValue() != null) {
					paging.setSearchValue(searchvo.getSearchValue());
					paging.setSearchType(searchvo.getSearchType());
				}
				model.addAttribute("paging", paging);	
				
				return "adminPage/adminPage_noMember_order_list";				
				
			}
		}
	}

	// ????????? ?????? ???????????????????????? ??????
	@RequestMapping(value = "noMember_order_detail.do", method = RequestMethod.GET)
	public String noMemberOrderOne(Model model, HttpServletRequest request,
			@RequestParam(value="no_member_order_index") String no_member_order_index,
			@RequestParam(value="searchType", required = false) String searchType,
			@RequestParam(value="searchValue", required = false) String searchValue,
			@RequestParam(value="nowPage", required = false) int nowPage) throws Exception{
		// ?????? ??????
		HttpSession session = request.getSession();
		if(session.getAttribute("member") == null) {	// ????????? ????????? ???
			return "wrongAccessPage/needLogin";
		}else {
			member = (MemberVO)session.getAttribute("member");
			if(!member.getPosition().equals("?????????")) {	// ???????????? ?????? ??????
				return "wrongAccessPage/wrongAccess";
			}else {										// ???????????? ??????
				// ????????? ?????? ?????? ????????? ??????
				List<OrderProductVO> adminNoMemberOrderProductList = orderProductService.adminNoMemberOrderProductList(no_member_order_index);
				model.addAttribute("nopList", adminNoMemberOrderProductList);
				
				// ????????? ?????? ???????????? ??????
				NoMemberOrdersVO order = noMemberOrdersService.noMemberOrdersList(no_member_order_index);
				model.addAttribute("order", order);
				
				// ?????????&?????????
				model.addAttribute("searchType", searchType);
				model.addAttribute("searchValue", searchValue);
				model.addAttribute("nowPage", nowPage);
				
				return "adminPage/adminPage_noMember_order_detail";			
			}
		}
		
	}
	
	// ?????????????????? ?????????
	@RequestMapping(value = "deliveryOk.do", method = RequestMethod.POST)
	@ResponseStatus(value = HttpStatus.OK)
	public void deliveryOk(@RequestParam(value="orderItem_index") String orderItem_index) throws Exception{
		orderProductDao.deliveryOk(orderItem_index);
	}
	
	// ?????? ?????? ?????? ???????????? ??????
	@RequestMapping(value = "product_main.do", method = RequestMethod.GET)
	public String productList(Model model, HttpServletRequest request, SearchVO searchvo, int nowPage) throws Exception {
		
		// ?????? ??????
		HttpSession session = request.getSession();
		if(session.getAttribute("member") == null) {	// ????????? ????????? ???
			return "wrongAccessPage/needLogin";
		}else {
			member = (MemberVO)session.getAttribute("member");
			if(!member.getPosition().equals("?????????")) {	// ???????????? ?????? ??????
				return "wrongAccessPage/wrongAccess";
			}else {										// ???????????? ??????
				
				// del_YN = "N"
				searchvo.setDel_YN("N");
				// ???????????????
				int realnowPage = 1;
				if(nowPage != 0) realnowPage = nowPage;
				
				// ????????? ??????
				List<ProductVO> productList = productService.adminProductList(searchvo, realnowPage);
				model.addAttribute("productList", productList);
				
				// ????????? + ????????? ??????
				PagingUtil paging = productService.adminProductPaging(searchvo, realnowPage);
				if(searchvo.getSearchValue() != null) paging.setSearchValue(searchvo.getSearchValue());
				model.addAttribute("paging", paging);
				
				// ???????????? ???????????? ????????? ???????????? ????????????????????? ?????? ?????? ???????????? ???????????? ?????? ???????????? ??? ???????????? ???????????? ???????????? ???????????? ?????? ?????? ??????
				session.setAttribute("nowPage", nowPage);
				if(searchvo.getSearchValue() != null) {
					session.setAttribute("searchValue", searchvo.getSearchValue());
				}else {
					session.setAttribute("searchValue", "");
				}
				session.setAttribute("route", 1);

				return "adminPage/adminPage_product_main";				
				
				
			}
		}

	}
	
	// ?????? ?????? ?????? ??????????????? ?????? ?????? ???????????? ?????????
	@RequestMapping(value = "productDelete.do", method = RequestMethod.POST)
	@ResponseBody
	public String productDelete(Model model, @RequestParam(value="product_index") String[] productIndexArr) throws Exception {
		
		int result = productService.adminProductDelYNisY(productIndexArr);
		
		if(result > 0) {
			return "deleteSuccess";
		}else {
			return "deleteFail";
		}
		
	}

	// ?????? ?????? ???????????? ???????????? ??????
	@RequestMapping(value = "product_detail.do", method = RequestMethod.GET)
	public String productOne(Model model, HttpServletRequest request,String product_index) throws Exception {
	
		// ?????? ??????
		HttpSession session = request.getSession();
		if(session.getAttribute("member") == null) {	// ????????? ????????? ???
			return "wrongAccessPage/needLogin";
		}else {
			member = (MemberVO)session.getAttribute("member");
			if(!member.getPosition().equals("?????????")) {	// ???????????? ?????? ??????
				return "wrongAccessPage/wrongAccess";
			}else {										// ???????????? ??????

				ProductVO product = productService.adminProductSelectOne(product_index);
				model.addAttribute("product", product);
				
				session.setAttribute("route", 2);
				
				return "adminPage/adminPage_product_detail";
			}
		}
	}

	// ?????? ?????? ???????????? ??????
	@RequestMapping(value = "product_register.do", method = RequestMethod.GET)
	public String productRegister(HttpServletRequest request) {

		// ?????? ??????
		HttpSession session = request.getSession();
		if(session.getAttribute("member") == null) {	// ????????? ????????? ???
			return "wrongAccessPage/needLogin";
		}else {
			member = (MemberVO)session.getAttribute("member");
			if(!member.getPosition().equals("?????????")) {	// ???????????? ?????? ??????
				return "wrongAccessPage/wrongAccess";
			}else {										// ???????????? ??????
				return "adminPage/adminPage_product_register";
			}
		}

	}

	// ????????? ????????? DB??? ???????????? ??????
	@RequestMapping(value = "product_register.do", method = RequestMethod.POST)
	public String productInsert(ProductVO product,
								@RequestParam("tumnailImage") MultipartFile tumnailImage,
								@RequestParam("detailImage") MultipartFile detailImage,
								HttpServletRequest request) throws Exception {
		
		int result = productService.adminProductInsert(product, tumnailImage, detailImage, request);
		
		if(result == 1) {
			return "redirect:product_main.do?nowPage=1";
		}else {
			return "redirect:product_register.do";
		}
		
	}

	// ?????? ?????? ???????????? ??????
	@RequestMapping(value = "product_modify.do", method = RequestMethod.GET)
	public String productModify(Model model, HttpServletRequest request, String product_index) throws Exception {
		
		// ?????? ??????
		HttpSession session = request.getSession();
		if(session.getAttribute("member") == null) {	// ????????? ????????? ???
			return "wrongAccessPage/needLogin";
		}else {
			member = (MemberVO)session.getAttribute("member");
			if(!member.getPosition().equals("?????????")) {	// ???????????? ?????? ??????
				return "wrongAccessPage/wrongAccess";
			}else {										// ???????????? ??????

				ProductVO product = productService.adminProductSelectOne(product_index);
				model.addAttribute("product", product);
				
				return "adminPage/adminPage_product_modify";
			}
		}
	}
	
	// ????????? ????????? DB??? ???????????? ??????
	@RequestMapping(value = "product_modify.do", method = RequestMethod.POST)
	public String productUpdate(ProductVO product,
			 @RequestParam("tumnailImage") MultipartFile tumnailImage,
			 @RequestParam("detailImage") MultipartFile detailImage,
			 HttpServletRequest request) throws Exception {
		
		int result = productService.adminProductUpdate(product, tumnailImage, detailImage, request);
		
		if(result == 1) {
			return "redirect:product_main.do?nowPage=1";
		}else {
			return "redirect:product_modify.do?product_inex=" + product.getProduct_index();
		}
	}

	// ????????? ?????? ??????
	@RequestMapping(value = "product_delete_list.do", method = RequestMethod.GET)
	public String product_delete_list(Model model, HttpServletRequest request, SearchVO searchvo, int nowPage) throws Exception{
		
		// ?????? ??????
		HttpSession session = request.getSession();
		if(session.getAttribute("member") == null) {	// ????????? ????????? ???
			return "wrongAccessPage/needLogin";
		}else {
			member = (MemberVO)session.getAttribute("member");
			if(!member.getPosition().equals("?????????")) {	// ???????????? ?????? ??????
				return "wrongAccessPage/wrongAccess";
			}else {										// ???????????? ??????
				
				// del_YN = "Y"
				searchvo.setDel_YN("Y");
				// ???????????????
				int realnowPage = 1;
				if(nowPage != 0) realnowPage = nowPage;
				
				// ????????? ??????
				List<ProductVO> productList = productService.adminProductList(searchvo, realnowPage);
				model.addAttribute("productList", productList);
				
				// ????????? + ????????? ??????
				PagingUtil paging = productService.adminProductPaging(searchvo, realnowPage);
				if(searchvo.getSearchValue() != null) paging.setSearchValue(searchvo.getSearchValue());
				model.addAttribute("paging", paging);
				
				return "adminPage/adminPage_product_delete_list";		
			}
		}
		
	}
	
	// ????????? ?????? ????????????
	@RequestMapping(value = "product_delete_detail.do", method = RequestMethod.GET)
	public String product_delete_detail(Model model, HttpServletRequest request,String product_index,
			SearchVO searchvo, int nowPage) throws Exception{
		
		// ?????? ??????
		HttpSession session = request.getSession();
		if(session.getAttribute("member") == null) {	// ????????? ????????? ???
			return "wrongAccessPage/needLogin";
		}else {
			member = (MemberVO)session.getAttribute("member");
			if(!member.getPosition().equals("?????????")) {	// ???????????? ?????? ??????
				return "wrongAccessPage/wrongAccess";
			}else {										// ???????????? ??????
				
				ProductVO product = productService.adminProductSelectOne(product_index);
				model.addAttribute("product", product);
				model.addAttribute("searchValue", searchvo.getSearchValue());
				model.addAttribute("nowPage", nowPage);
				
				return "adminPage/adminPage_product_delete_detail";				
			}
		}

	}

	// ?????? ??????
	@RequestMapping(value = "changeDelYNinN.do", method = RequestMethod.POST)
	@ResponseBody
	public String productDelN(@RequestParam("product_index") String product_index) throws Exception{
		productService.adminProductDelYNisN(product_index);
		return "Success";
	}	

	// ?????? ????????? ??????
	@RequestMapping(value = "banner.do", method = RequestMethod.GET)
	public String banner(Model model, HttpServletRequest request) throws Exception {
	
		// ?????? ??????
		HttpSession session = request.getSession();
		if(session.getAttribute("member") == null) {	// ????????? ????????? ???
			return "wrongAccessPage/needLogin";
		}else {
			member = (MemberVO)session.getAttribute("member");
			if(!member.getPosition().equals("?????????")) {	// ???????????? ?????? ??????
				return "wrongAccessPage/wrongAccess";
			}else {										// ???????????? ??????

				List<BannerVO> bannerList = bannerService.bannerList();
				model.addAttribute("bannerList", bannerList);
				
				return "adminPage/adminPage_banner";		
			}
		}
	}
	
	// ?????? ??????
	@RequestMapping(value = "bannerRegister.do", method = RequestMethod.POST)
	public String bannerRegister(BannerVO bannervo,
								 @RequestParam("bannerFile") MultipartFile bannerFile,
								 HttpServletRequest request) throws Exception {
		
		int result = bannerService.bannerInsert(bannervo, bannerFile, request);
		
		if(result > 0) {
			return "redirect:banner.do";
		}else {
			return "redirect:admin.do";
		}
		
	}
	
	// ?????? ??????
	@RequestMapping(value = "bannerModify.do", method = RequestMethod.POST)
	public String bannerModify(BannerVO bannervo,
							   @RequestParam("bannerFile") MultipartFile bannerFile,
							   HttpServletRequest request) throws Exception {
		
		int result = bannerService.bannerModify(bannervo, bannerFile, request);
		
		if(result > 0) {
			return "redirect:banner.do";
		}else {
			return "redirect:admin.do";
		}
	}
	
	// ?????? ??????
	@RequestMapping(value = "bannerDelete.do", method = RequestMethod.POST)
	@ResponseBody
	public String bannerDelete(@RequestParam(value="banner_index") int[] bannerIndexArr) throws Exception {
		
		int result = bannerService.bannerDelete(bannerIndexArr);
		
		if(result > 0) {
			return "deleteSuccess";
		}else {
			return "deleteFail";
		}
		
	}
	
	// ????????? ?????????
	@RequestMapping(value = "bestRecipe.do", method = RequestMethod.GET)
	public String bestRecipe(Model model, HttpServletRequest request) throws Exception{
		
		// ?????? ??????
		HttpSession session = request.getSession();
		if(session.getAttribute("member") == null) {	// ????????? ????????? ???
			return "wrongAccessPage/needLogin";
		}else {
			member = (MemberVO)session.getAttribute("member");
			if(!member.getPosition().equals("?????????")) {	// ???????????? ?????? ??????
				return "wrongAccessPage/wrongAccess";
			}else {										// ???????????? ??????
				
				List<RecipeVO> bestRecipeList = recipeService.adminBestRecipeList();
				model.addAttribute("bestRecipeList", bestRecipeList);
				
				return "adminPage/adminPage_bestRecipe";
			}
		}
	}
	
	// ????????? ????????? ??????
	@RequestMapping(value = "bestRecipe.do", method = RequestMethod.POST)
	public String cancelRecipe(@RequestParam(value="recipe_index") int[] ridxArr) throws Exception{
		recipeService.adminCancelBestRecipe(ridxArr);
		return "redirect:bestRecipe.do";
	}
	
}
