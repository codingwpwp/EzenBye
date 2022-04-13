package team.project.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	
	// 비회원 상세주문 넣는 과정
	public int noMemberOrderProductInsert(List<OrderProductVO> orderProductList) throws Exception{
		return sqlSession.insert(Namespace + ".noMemberOrderProductInsert", orderProductList);
	}
	
	// 상품 판매량 늘려주기(원래 product쪽에서 해야 하는데 사정상 여기에다가 함)
	public int productQuantityUpdate(OrderProductVO orderProductvo)throws Exception{
		return sqlSession.insert(Namespace + ".productQuantityUpdate", orderProductvo);
	}
	
	/* 관리자페이지 */
	// 회원 주문 상세조회할때 주문들 불러오기
	public List<OrderProductVO> adminMemberOrderProductList(OrdersVO ordersvo) throws Exception {
		return sqlSession.selectList(Namespace + ".adminMemberOrderProductList", ordersvo);
	}
}
