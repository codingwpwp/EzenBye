package team.project.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import team.project.vo.RecipeVO;

@Repository
public class RecipeDAO {
	@Autowired
	private SqlSession sqlSession;
	
	private static final String Namespace = "team.project.mapper.recipeMapper";
	
	
	//레시피작성
	public int insertRecipe(RecipeVO vo)throws Exception{
		
		return sqlSession.insert(Namespace+".insertRecipe",vo);	
		
	}
	
}
