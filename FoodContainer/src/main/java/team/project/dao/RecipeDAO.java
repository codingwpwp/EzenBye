package team.project.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import team.project.util.PagingUtil;
import team.project.vo.RecipeVO;

@Repository
public class RecipeDAO {
	@Autowired
	private SqlSession sqlSession;
	
	private static final String Namespace = "team.project.mapper.recipeMapper";
	
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
//	public void recipeThumb(int recipe_index) throws Exception{
//		sqlSession.update(Namespace+".recipeThumb",recipe_index);
//	}
	
	
	
	//레시피작성
	public void insertRecipe(RecipeVO vo)throws Exception{
		
		sqlSession.insert(Namespace+".insertRecipe",vo);	
		
	}

		
}


