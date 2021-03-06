package team.project.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import team.project.vo.OrderProductVO;
import team.project.vo.OrdersVO;
import team.project.vo.ProductVO;

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
	// 회원 상세주문 넣는 쿼리
	public void memberOrderProductInsert(List<OrderProductVO> orderProductList) throws Exception{
		sqlSession.insert(Namespace + ".memberOrderProductInsert", orderProductList);
	}
	
	// 비회원 상세주문 넣는 쿼리
	public void noMemberOrderProductInsert(List<OrderProductVO> orderProductList) throws Exception{
		sqlSession.insert(Namespace + ".noMemberOrderProductInsert", orderProductList);
	}
	
	
	/* 관리자페이지 */
	
	// 메인페이지 30일 결산
	public List<HashMap<String, String>> sales() throws Exception{
		return sqlSession.selectList(Namespace + ".sales");
	}
	
	// 수익
	public List<ProductVO> revenue() throws Exception{
		return sqlSession.selectList(Namespace + ".revenue");
	}
	
	// 회원 주문 상세조회할때 주문들 불러오기
	public List<OrderProductVO> adminMemberOrderProductList(OrdersVO ordersvo) throws Exception {
		return sqlSession.selectList(Namespace + ".adminMemberOrderProductList", ordersvo);
	}
	
	// 비회원 주문 상세조회할 때 주문들 불러오기
	public List<OrderProductVO> adminNoMemberOrderProductList(String no_member_order_index) throws Exception{
		return sqlSession.selectList(Namespace + ".adminNoMemberOrderProductList", no_member_order_index);
	}
	
	public void deliveryOk(String orderItem_index) throws Exception{
		sqlSession.update(Namespace + ".deliveryOk", orderItem_index);
	}
}
