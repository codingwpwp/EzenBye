package team.project.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import team.project.util.PagingUtil;
import team.project.vo.CartVO;
import team.project.vo.OrderProductVO;
import team.project.vo.ProductFilterVO;
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
	public List<ProductVO> productListAll2(List<ProductFilterVO> filterList) throws Exception{
		return sqlSession.selectList(Namespace+".ProductFilter",filterList);
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
	
	public List<ProductVO> productSearch(ProductVO productVO) throws Exception{
		return sqlSession.selectList(Namespace+".ProductSearch",productVO);
	}

	public List<ProductVO> recentProduct(List<ProductVO> recentProductArr) throws Exception{
		return sqlSession.selectList(Namespace+".recentProduct",recentProductArr);
	}
	

	
	/* **********************구매페이지************************ */
	
	// 회원&비회원 결제하려는 상품 수량 확인
	public int checkInventory(String product_index) throws Exception{
		return sqlSession.selectOne(Namespace + ".checkInventory", product_index);
	}
	// 회원&비회원 수량이 충분하다면 해당 갯수만큼 빼주기
	public void MinusInventory(CartVO cartvo) throws Exception{
		sqlSession.update(Namespace + ".MinusInventory", cartvo);
	}
	// 회원&비회원 다시 상품 채워놓기
	public void plusInventory(CartVO cartvo) throws Exception{
		sqlSession.update(Namespace + ".plusInventory", cartvo);
	}
	// 회원&비회원 상품 판매량 늘려주기
	public void productQuantityUpdate(OrderProductVO orderProductvo)throws Exception{
		sqlSession.update(Namespace + ".productQuantityUpdate", orderProductvo);
	}
	// 구매페이지에서 뿌려질 상품목록들(상품번호=갯수 의 경우)
	public List<CartVO> purchaseListCaseOne(List<String> productIndexList){
		return sqlSession.selectList(Namespace + ".purchaseListCaseOne", productIndexList);
	}
	// 구매페이지에서 뿌려질 상품목록들(카트번호=값 의 경우)
	public List<CartVO> purchaseListCaseTwo(List<Integer> cartIndex){
		return sqlSession.selectList(Namespace + ".purchaseListCaseTwo", cartIndex);
	}
	
	
	/* **********************여기서 부터는 관리자페이지********************** */
	
	// 관리자페이지 메인 최고 인기매출 상품 3개 뿌리기
	public List<ProductVO> adminMainProductList() throws Exception{
		return sqlSession.selectList(Namespace + ".adminMainProductList");
	}
	
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
	
	// 상품 복구
	public void adminProductDelYNisN(String product_index) throws Exception{
		sqlSession.update(Namespace + ".adminProductDelYNisN", product_index);
	}

}
