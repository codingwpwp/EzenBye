package team.project.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import team.project.vo.ProductVO;

@Repository
public class ProductDAO {
	@Autowired
	private SqlSession sqlSession;
	
	private static final String Namespace = "team.project.mapper.productMapper";
	
	public List<ProductVO> productListAll(ProductVO productVO) throws Exception{
		return sqlSession.selectList(Namespace+".ProductListAll",productVO);
	}
	
	public ProductVO ProductSelectOne(ProductVO productVO) throws Exception{
		return sqlSession.selectOne(Namespace+".ProductSelectOne", productVO);
	}
	
	public void ProductIndexList(ProductVO productVO) throws Exception{
		List<ProductVO> ProductIndexList =  sqlSession.selectList(Namespace+".ProductIndexList", productVO);
	}
}
