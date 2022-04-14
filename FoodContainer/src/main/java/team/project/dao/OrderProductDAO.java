package team.project.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import team.project.vo.CartVO;
import team.project.vo.OrderProductVO;
import team.project.vo.OrdersVO;

@Repository
public class OrderProductDAO {
	@Autowired
	private SqlSession sqlSession;
	
	private static final String Namespace = "team.project.mapper.orderProductMapper";
	
	public List<OrderProductVO> orderProductList(OrderProductVO vo) throws Exception {
		return sqlSession.selectList(Namespace+".orderProductList", vo);
	}
	
	public int buyOk(String orderItem_index) throws Exception {
		return sqlSession.update(Namespace+".buyOk",orderItem_index);
	}
	
	/* 구매페이지 */
	// 밑에 세개는 원래 상품페이지에서 하려는데 사정상 여기에다가함
	// 회원&비회원 공통 결제하려는 상품 수량 확인
	public int checkInventory(String product_index) throws Exception{
		return sqlSession.selectOne(Namespace + ".checkInventory", product_index);
	}
	// 회원&비회원 공통 수량이 충분하다면 해당 갯수만큼 빼주기
	public void MinusInventory(CartVO cartvo) throws Exception{
		sqlSession.update(Namespace + ".MinusInventory", cartvo);
	}
	// 회원&비회원 공통 다시 상품 채워놓기
	public void plusInventory(CartVO cartvo) throws Exception{
		sqlSession.update(Namespace + ".plusInventory", cartvo);
	}
	
	
	// 비회원 상세주문 넣는 과정
	public void noMemberOrderProductInsert(List<OrderProductVO> orderProductList) throws Exception{
		sqlSession.insert(Namespace + ".noMemberOrderProductInsert", orderProductList);
	}
	
	// 상품 판매량 늘려주기(원래 product쪽에서 해야 하는데 사정상 여기에다가 함)
	public void productQuantityUpdate(OrderProductVO orderProductvo)throws Exception{
		sqlSession.insert(Namespace + ".productQuantityUpdate", orderProductvo);
	}
	
	/* 관리자페이지 */
	// 회원 주문 상세조회할때 주문들 불러오기
	public List<OrderProductVO> adminMemberOrderProductList(OrdersVO ordersvo) throws Exception {
		return sqlSession.selectList(Namespace + ".adminMemberOrderProductList", ordersvo);
	}
}
