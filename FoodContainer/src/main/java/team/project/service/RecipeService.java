package team.project.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import team.project.vo.RecipeVO;

public interface RecipeService {

	//레시피작성
	public void insertRecipe(RecipeVO vo, MultipartFile tumnailImage,HttpServletRequest request) throws Exception;

	//레시피 목록
	List<RecipeVO> recipeList()throws Exception;
	
	//레시피 상세 조회
	public RecipeVO recipeRead(int recipe_index) throws Exception;
	//레시피 게시글 총 개수
	public int countRecipe() throws Exception;
	
	//레시피 게시글 추천
//	public void recipeThumb(int recipe_index) throws Exception;
}
