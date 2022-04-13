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
import team.project.vo.MemberVO;
import team.project.vo.ProductVO;
import team.project.vo.RecipeVO;

@Controller
public class RecipeController {
	private static final Logger logger = LoggerFactory.getLogger(RecipeController.class);
	@Autowired
	private RecipeService recipeService;
	@Autowired
	private ProductService productService;
	
//	@RequestMapping(value = "/recipelist.do", method = RequestMethod.GET)
//	public String selectList(Locale locale, Model model,RecipeVO vo) throws Exception{
//		List<RecipeVO> list = recipeService.selectList(vo);
//		return "recipe/recipemain";
//	}
	
	
	
	
	//레시피메인
	@RequestMapping(value = "/recipemain.do", method = RequestMethod.GET)
	public String recipe(Locale locale, Model model) {
		return "recipe/recipemain";
	}
	//레시피 작성 화면 view
	@RequestMapping(value = "/recipewrite.do", method = RequestMethod.GET)
	public String recipeWrite(Locale locale, Model model,ProductVO productVO) throws Exception{
		//셀렉터 박스 상품 리스트
		List<ProductVO> ProductListAll = productService.productListAll(productVO);
		System.out.println(ProductListAll);
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
		return "redirect:/recipemain.do";
	}
	
	
	//레시피 상세확인
	@RequestMapping(value = "/recipeview.do", method = RequestMethod.GET)
	public String recipe3(Locale locale, Model model) {
		return "recipe/recipeview";
	}
	//레시피내용 수정
	@RequestMapping(value = "/recipemodify.do", method = RequestMethod.GET)
	public String recipe4(Locale locale, Model model,RecipeVO vo) {
	
		return "recipe/recipemodify";
	}
	
	
	@RequestMapping(value = "/recipe/popup.do", method = RequestMethod.GET)
	public String popup(Locale locale, Model model) {
		return "recipe/popup";
	}
}
