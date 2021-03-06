package team.project.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import team.project.util.PagingUtil;
import team.project.vo.RecipeVO;
import team.project.vo.SearchVO;
import team.project.vo.ThumbVO;

@Repository
public class RecipeDAO {
	@Autowired
	private SqlSession sqlSession;
	
	private static final String Namespace = "team.project.mapper.recipeMapper";
	
	//레시피 번호 찾기
	public RecipeVO selectRecipe(int recipe_index) throws Exception{
		return sqlSession.selectOne(Namespace+".selectRecipe",recipe_index);
	}
	
	//레시피 목록 조회
	public List<RecipeVO> recipeList(PagingUtil pu ) throws Exception {
		return sqlSession.selectList(Namespace + ".recipeList", pu );
	}
	//레시피 상세 조회 
	public RecipeVO recipeRead(int recipe_index) throws Exception{
		return sqlSession.selectOne(Namespace+".recipeRead",recipe_index);
	}

	//레시피 게시물 조회수
	public void recipeHit(int recipe_index) throws Exception{
		sqlSession.update(Namespace+".recipeHit",recipe_index);
	}

	
	//레시피 게시물 총 개수
	public int countRecipe() throws Exception{
		return sqlSession.selectOne(Namespace+".countRecipe");
	}
	
	
	//레시피 게시물 추천
	public int getThumb(ThumbVO vo) throws Exception{
		return sqlSession.selectOne(Namespace+".getThumb",vo);
	}
	
	public void insertThumb(ThumbVO vo)throws Exception{
		sqlSession.insert(Namespace+".insertThumb",vo);
	}
	public int updateThumb(int recipe_index) throws Exception{
		return sqlSession.update(Namespace+".updateThumb",recipe_index);
	}
	
	
	//레시피작성
	public void insertRecipe(RecipeVO vo)throws Exception{
		
		sqlSession.insert(Namespace+".insertRecipe",vo);	
		
	}
	
	//레시피 수정
	public void updateRecipe(RecipeVO vo)throws Exception{
		sqlSession.update(Namespace+".updateRecipe",vo);
	}
	//레시피 삭제
	public void deletdRecipe(int recipe_index) throws Exception{
		sqlSession.update(Namespace+".deletdRecipe",recipe_index);
	}
	
	//베스트 레시피
	
	public int initRank(int best_rank)throws Exception{
		return sqlSession.update(Namespace+".initRank",best_rank);
	}
	public void updateRank(RecipeVO vo)throws Exception{
		sqlSession.update(Namespace+".updateRank",vo);
	}
	
	public List<RecipeVO> viewRecipeList(RecipeVO recipeVO) throws Exception {
		return sqlSession.selectList(Namespace + ".viewRecipeList", recipeVO);
	}
	
	//마이페이지
	public int countRecipeMypage(SearchVO searchVO) throws Exception {
		
		return sqlSession.selectOne(Namespace+".countRecipeMypage",searchVO);
	}
	
	public List<RecipeVO> recipeMypageList(PagingUtil paging) throws Exception {
		
		return sqlSession.selectList(Namespace+".recipeMypageList",paging);
	}
	
	/* 관리자 페이지 */
	
	// 베스트 레시피
	public List<RecipeVO> adminBestRecipeList() throws Exception {
		
		return sqlSession.selectList(Namespace + ".adminBestRecipeList");
	}
	
	// 레시피 해제
	public void adminCancelBestRecipe(List<Integer> ridxList) throws Exception{
		sqlSession.update(Namespace + ".adminCancelBestRecipe", ridxList);
	}
	
	// 순위 조절1
	public void adminUpdateBestRecipeRankOne() throws Exception{
		sqlSession.update(Namespace + ".adminUpdateBestRecipeRankOne");
	}
	
	// 순위 조절2
	public void adminUpdateBestRecipeRankTwo() throws Exception{
		sqlSession.update(Namespace + ".adminUpdateBestRecipeRankTwo");
	}
	
	//추천수 증가
	public int thumbPlus(int recipe_index) throws Exception{
		return sqlSession.update(Namespace + ".thumbPlus",recipe_index);
	}
	
	//추천테이블 추가
	public int thumbTablePlus(int recipe_index, int member_index) throws Exception{
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("recipe_index", recipe_index);
		map.put("member_index", member_index);
		try {
			return sqlSession.insert(Namespace + ".thumbTablePlus",map);
        }catch(Exception e) {
        	e.printStackTrace();
        }
		return -1;
	}
}


