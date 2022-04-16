package team.project.controller;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.multipart.MultipartFile;

import team.project.service.ProductService;
import team.project.service.RecipeService;
import team.project.util.PagingUtil;
import team.project.vo.MemberVO;
import team.project.vo.ProductVO;
import team.project.vo.RecipeVO;
import team.project.vo.SearchVO;

@Controller
public class RecipeController {
	private static final Logger logger = LoggerFactory.getLogger(RecipeController.class);
	@Autowired
	private RecipeService recipeService;
	@Autowired
	private ProductService productService;
	
	
	
	//레시피 목록 조회
	@RequestMapping(value = "/recipeList", method = RequestMethod.GET)
	public String selectList(Locale locale, Model model,int recipe_index,@RequestParam(value="nowPage") int nowPage,
			@RequestParam(value="cntPage")int cntPage) throws Exception{
		List<RecipeVO> recipeList = recipeService.recipeList();		
		model.addAttribute("recipeList", recipeList);	
	
		
		return "recipe/recipeList";
	}
	
	
	//레시피 게시물 추천
//	@RequestMapping(value = "/recipeThumb", method = RequestMethod.GET)
//	public int recipeThumb(int recipe_index) throws Exception{
//		
//		recipeService.recipeThumb(recipe_index);
//		return recipe_index;
//		
//	}
	
	
	//레시피메인
	@RequestMapping(value = "/recipemain.do", method = RequestMethod.GET)
	public String recipe(Locale locale, Model model,RecipeVO vo,String nowPage) throws Exception{
			
		List<RecipeVO> recipeList = recipeService.recipeList();
		model.addAttribute("recipeList", recipeList);		
		
		int nowPageNum = 0;
		
		if(nowPage!=null) {
			nowPageNum = Integer.parseInt(nowPage);
		}
		
		int count = recipeService.countRecipe();
		
		//1.게시글 총갯수 구해오기
		//service 추가 작업
		//2.pagingutil 객체 생성
		PagingUtil pu = new PagingUtil(count,nowPageNum,6,10);
		System.out.println(pu);
		model.addAttribute("pu",pu);
		
		
		//3.2번 객체 model에 담
		
		return "recipe/recipemain";
	}
	//레시피 작성 화면 view
	@RequestMapping(value = "/recipewrite.do", method = RequestMethod.GET)
	public String recipeWrite(Locale locale, Model model,ProductVO productVO) throws Exception{
		//셀렉터 박스 상품 리스트
		List<ProductVO> ProductListAll = productService.productListAll(productVO);
		model.addAttribute("productListAll",ProductListAll);
		return "recipe/recipewrite";
	}
	
	//레시피 작성
	@ResponseBody
	@RequestMapping(value = "/recipewrite.do", method = RequestMethod.POST)
	public String recipeInsert(RecipeVO vo, @RequestParam("tumnailImage") MultipartFile tumnailImage, HttpServletRequest request) throws Exception{ 	
		System.out.println(vo);
		HttpSession session = request.getSession();
		//회원
		MemberVO member = (MemberVO)session.getAttribute("member");
		vo.setMember_index(member.getMember_index());
		recipeService.insertRecipe(vo, tumnailImage, request);
		return "redirect:recipemain.do";
	}
	
	
	//레시피 상세확인
	@RequestMapping(value = "/recipeview.do", method = RequestMethod.GET)
	public String recipe3(Locale locale, Model model,RecipeVO vo,HttpServletRequest request) throws Exception {
		logger.info("recipeRead");
		model.addAttribute("read", recipeService.recipeRead(vo.getRecipe_index()));
		
	
		return "recipe/recipeview";
	}
	//레시피내용 수정
	@RequestMapping(value = "/recipemodify.do", method = RequestMethod.GET)
	public String recipe4(Locale locale, Model model,RecipeVO vo,ProductVO productVO) throws Exception{
		List<ProductVO> ProductListAll = productService.productListAll(productVO);
		model.addAttribute("productListAll",ProductListAll);
		
		return "recipe/recipemodify";
	}
	
	
	@RequestMapping(value = "/recipe/popup.do", method = RequestMethod.GET)
	public String popup(Locale locale, Model model) {
		return "recipe/popup";
	}
}
