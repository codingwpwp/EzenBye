package team.project.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import team.project.util.PagingUtil;
import team.project.vo.ProductVO;
import team.project.vo.SearchVO;

@Repository
public class ProductDAO {
	@Autowired
	private SqlSession sqlSession;
	
	private static final String Namespace = "team.project.mapper.productMapper";
	
	//상품조회
	public List<ProductVO> productListAll(ProductVO productVO) throws Exception{
		return sqlSession.selectList(Namespace+".ProductListAll",productVO);
	}
	//상세보기
	public ProductVO view(String index) {
		
		return sqlSession.selectOne(Namespace+".view",index);

	}
	//최근본 상품
	public List<ProductVO> cookieList(ArrayList<String> cookieArr) throws Exception{
		return sqlSession.selectList(Namespace+".cookiList",cookieArr);
	}
	//비회원 장바구니
	public List<ProductVO> noMemberCartList(ArrayList<String> noMemberCartArr) throws Exception{
		return sqlSession.selectList(Namespace+".noMemberCart",noMemberCartArr);
	}
	//메인 - 인기상품
	public List<ProductVO> popularList(ProductVO productVO) throws Exception{
		return sqlSession.selectList(Namespace+".popularList",productVO);
	}
	
	/*여기서 부터는 관리자페이지*/
	
	// 상품 조회할때 글의 갯수(페이징)
	public int adminProductListCount(SearchVO searchvo) throws Exception{
		return sqlSession.selectOne(Namespace + ".adminProductListCount", searchvo);
	}
	
	// 상품 조회
	public List<ProductVO> adminProductList(PagingUtil paging) throws Exception{
		return sqlSession.selectList(Namespace + ".adminProductList", paging);
	}
	
	// 상품 삭제
	public int adminProductDelYNisY(List<String> deleteIndexList) throws Exception {
		return sqlSession.update(Namespace + ".adminProductDelYNisY", deleteIndexList);
	}
	
	// 상품 상세조회
	public ProductVO adminProductSelectOne(String product_index) throws Exception{
		return sqlSession.selectOne(Namespace + ".adminProductSelectOne", product_index);
	}
	
	// 상품 등록&수정 전에 상품 번호를 조회하는 과정
	public List<String> adminProductIndexSelectList(String productIndex) throws Exception{
		return sqlSession.selectList(Namespace + ".adminProductIndexSelectList", productIndex);
	}
	
	// 상품 등록
	public int adminProductInsert(ProductVO product) throws Exception{
		return sqlSession.insert(Namespace + ".adminProductInsert", product);
	}
	
	// 상품 수정
	public int adminProductUpdate(ProductVO product) throws Exception{
		return sqlSession.update(Namespace + ".adminProductUpdate", product);
	}

}
