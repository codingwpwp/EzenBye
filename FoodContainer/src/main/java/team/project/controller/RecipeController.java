package team.project.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

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
import team.project.service.ReplyService;
import team.project.util.PagingUtil;
import team.project.vo.MemberVO;
import team.project.vo.ProductVO;
import team.project.vo.RecipeVO;
import team.project.vo.ReplyVO;
import team.project.vo.SearchVO;

@Controller
public class RecipeController {
	private static final Logger logger = LoggerFactory.getLogger(RecipeController.class);
	@Autowired
	private RecipeService recipeService;
	@Autowired
	private ProductService productService;
	@Autowired
	private ReplyService replyService;
	

	
	
	//레시피 게시물 추천
	@RequestMapping(value = "recipeThumb", method = RequestMethod.POST)
	public int recipeThumb(int recipe_index) throws Exception{
		
		
		return recipeService.updateThumb(recipe_index); 
		
	}
	
	
	//레시피메인
	@RequestMapping(value = "/recipemain.do", method = RequestMethod.GET)
	public String recipe(Locale locale, Model model,RecipeVO vo,String nowPage,SearchVO searchvo,ReplyVO replyvo) throws Exception{
		//페이징
		int nowPageNum = 1;
		
		if(nowPage!=null) {
			nowPageNum = Integer.parseInt(nowPage);
		}
		int count = recipeService.countRecipe();
		
		searchvo.setDel_yn("N");
		//1.게시글 총갯수 구해오기
		//service 추가 작업
		//2.pagingutil 객체 생성
		PagingUtil pu = new PagingUtil(count,nowPageNum,6,5);
		pu.setStart(pu.getStart()-1);
		model.addAttribute("pu",pu);
		//레시피 게시물 리스트
		List<RecipeVO> recipeList = recipeService.recipeList(pu,searchvo);
		System.out.println(recipeList);
		if(searchvo.getSearchValue()!=null) {
			pu.setSearchValue(searchvo.getSearchValue());
			pu.setSearchType(searchvo.getSearchType());
		}
		model.addAttribute("recipeList", recipeList);
//		System.out.println("=======================");
//		System.out.println(vo.getThumbnail_image());
//		System.out.println("=======================");
		model.addAttribute("nowPage", nowPageNum);
		//3.2번 객체 model에 담
		
//		int replyList = replyService.countReply();
//		model.addAttribute("replyList",replyList);
//		System.out.println(replyList);
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
		System.out.println("==============================");
		System.out.println(vo.getMember_index());
		System.out.println(vo.getTitle());
		System.out.println(vo.getContents());
		System.out.println(vo.getProduct_index1());
		System.out.println(vo.getProduct_index2());
		System.out.println(vo.getProduct_index3());
		System.out.println("==============================");
		recipeService.insertRecipe(vo, tumnailImage, request);
		return "redirect:recipemain.do";
	}
	
	
	//레시피 상세확인
	@RequestMapping(value = "/recipeview.do", method = RequestMethod.GET)
	public String recipe3(Locale locale, Model model,RecipeVO vo,HttpServletRequest request,ProductVO productVO,ReplyVO replyvo,int recipe_index) throws Exception {
		logger.info("recipeRead");
	
		
		model.addAttribute("read", recipeService.recipeRead(vo.getRecipe_index()));
		List<ProductVO> ProductListAll = productService.productListAll(productVO);
		model.addAttribute("productListAll",ProductListAll);

		
		List<ReplyVO> replyList = replyService.replyList(replyvo);
		model.addAttribute("replyList",replyList);
		

		model.addAttribute("vo",vo);
		
		
		return "recipe/recipeview";
	}
	

	
	
	//레시피내용 수정 view
	@RequestMapping(value = "/recipemodify.do", method = RequestMethod.GET)
	public String recipemodify(Locale locale, Model model,RecipeVO vo,ProductVO productVO) throws Exception{
		model.addAttribute("read", recipeService.recipeRead(vo.getRecipe_index()));
		List<ProductVO> ProductListAll = productService.productListAll(productVO);
		model.addAttribute("productListAll",ProductListAll);
		
		
		model.addAttribute("vo", vo);
		System.out.println(vo);
		return "recipe/recipemodify";
	}
	
	//레시피 내용수정
	@RequestMapping(value = "/recipemodify", method = RequestMethod.POST)
	public String recipeupdate(Locale locale, Model model,RecipeVO vo,ProductVO productVO,@RequestParam("tumnailImage") MultipartFile tumnailImage, HttpServletRequest request) throws Exception{
		recipeService.updateRecipe(vo,tumnailImage, request);
		
		return "redirect:/recipeview.do?recipe_index="+vo.getRecipe_index();
	}
	//레시피 삭제
	@RequestMapping(value = "/recipedelete", method = RequestMethod.POST)
	public String recipedelete(Locale locale, Model model,int recipe_index)throws Exception{
		recipeService.deletdRecipe(recipe_index);
		return "redirect:/recipemain.do";
	}
	
	
	
	@RequestMapping(value = "/recipe/popup.do", method = RequestMethod.GET)
	public String popup(Locale locale, Model model) {
		return "recipe/popup";
	}
}
