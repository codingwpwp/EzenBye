package team.project.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import team.project.util.PagingUtil;
import team.project.vo.RecipeVO;
import team.project.vo.ThumbVO;

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
//	//레시피 상세 상품목록
//	public RecipeVO viewProduct1(String product_index1,String product_img1)throws Exception{
//		return sqlSession.selectOne(Namespace+".viewProduct"+product_index1,product_img1);
//	}
//	public RecipeVO viewProduct2(String product_index2,String product_img2)throws Exception{
//		return sqlSession.selectOne(Namespace+".viewProduct"+product_index2,product_img2);
//	}
//	public RecipeVO viewProduct3(String product_index3,String product_img3)throws Exception{
//		return sqlSession.selectOne(Namespace+".viewProduct"+product_index3,product_img3);
//	}
	
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
	
	
	

		
}


