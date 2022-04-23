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

	List<RecipeVO> viewRecipeList(RecipeVO recipeVO)throws Exception;
	
	//레시피 상세 조회
	public RecipeVO recipeRead(int recipe_index) throws Exception;
	

	//레시피 게시글 총 개수
	public int countRecipe() throws Exception;
	
	
	//레시피 수정
	public void updateRecipe(RecipeVO vo, MultipartFile tumnailImage,HttpServletRequest request) throws Exception;
	
	//레시피 삭제
	public void deletdRecipe(int recipe_index) throws Exception;
	
	//베스트 레시피
	public int initRank(int best_rank) throws Exception;
	
	public void updateRank(RecipeVO vo)throws Exception;
	
	
	
	//레시피 게시글 추천
	public int updateThumb(int recipe_index) throws Exception;
	
	 
	public void insertThumb(ThumbVO vo) throws Exception; 
	

	public  int getThumb(ThumbVO vo) throws Exception;
	
	//마이페이지 부분
	
	List<RecipeVO> recipeMypageList(SearchVO searchVO, int nowPage) throws Exception;
	
	PagingUtil recipeListPaging(SearchVO searchVO, int nowPage) throws Exception;

	int countRecipeMypage(SearchVO searchVO) throws Exception;

	
	/* 관리자 페이지 */
	// 베스트 레시피
	List<RecipeVO> adminBestRecipeList() throws Exception;
	
	// 레시피 해제&순위 조절
	void adminCancelBestRecipe(int[] ridxArr) throws Exception;
	
}
