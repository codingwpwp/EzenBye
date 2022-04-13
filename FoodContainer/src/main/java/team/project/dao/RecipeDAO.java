package team.project.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import team.project.vo.RecipeVO;

@Repository
public class RecipeDAO {
	@Autowired
	private SqlSession sqlSession;
	
	private static final String Namespace = "team.project.mapper.recipeMapper";
	
//	public List<RecipeVO> selectList(RecipeVO vo) throws Exception {
//		return sqlSession.selectList(Namespace + ".selectRecipe");
//	}
	
	//레시피작성
	public void insertRecipe(RecipeVO vo)throws Exception{
		
		sqlSession.insert(Namespace+".insertRecipe",vo);	
		
	}


	
	
	

	
	
}
