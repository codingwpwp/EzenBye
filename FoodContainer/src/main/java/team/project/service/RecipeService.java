package team.project.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import team.project.util.PagingUtil;
import team.project.vo.RecipeVO;
import team.project.vo.SearchVO;
import team.project.vo.ThumbVO;

public interface RecipeService {

	
	
	//레시피 번호
	public RecipeVO selectRecipe(int recipe_index) throws Exception;
	//레시피작성
	public void insertRecipe(RecipeVO vo, MultipartFile tumnailImage,HttpServletRequest request) throws Exception;

	//레시피 목록
	List<RecipeVO> recipeList(PagingUtil pu ,SearchVO searchvo)throws Exception;
	
	//레시피 상세 조회
	public RecipeVO recipeRead(int recipe_index) throws Exception;
	
//	//레시피 상세 상품
//	public RecipeVO viewProduct1(String product_index1,String product_img1)throws Exception;
//	
//	public RecipeVO viewProduct2(String product_index2,String product_img2)throws Exception;
//	
//	public RecipeVO viewProduct3(String product_index3,String product_img3)throws Exception;
	//레시피 게시글 총 개수
	public int countRecipe() throws Exception;
	
	
	//레시피 수정
	public void updateRecipe(RecipeVO vo, MultipartFile tumnailImage,HttpServletRequest request) throws Exception;
	
	//레시피 삭제
	public void deletdRecipe(int recipe_index) throws Exception;
	
	
	//레시피 게시글 추천
	public int updateThumb(int recipe_index) throws Exception;
	
	 
	public void insertThumb(ThumbVO vo) throws Exception; 
	

	public  int getThumb(ThumbVO vo) throws Exception;

	

	

	
	    
	
	
}
