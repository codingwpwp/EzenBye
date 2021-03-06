package team.project.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import team.project.util.PagingUtil;
import team.project.vo.CartVO;
import team.project.vo.CouponVO;
import team.project.vo.MemberVO;
import team.project.vo.OrdersVO;
import team.project.vo.SearchVO;

@Repository
public class OrdersDAO {
	@Autowired
	private SqlSession sqlSession;
	
	private static final String Namespace = "team.project.mapper.ordersMapper";
	
	public List<OrdersVO> ordersList(int member_index) throws Exception {
		return sqlSession.selectList(Namespace+".ordersList", member_index);
	}
	
	public List<OrdersVO> ordersListAll(int member_index) throws Exception {
		return sqlSession.selectList(Namespace+".ordersListAll", member_index);
	}
	
	public OrdersVO ordersDetail(String member_order_index) throws Exception {
		return sqlSession.selectOne(Namespace+".ordersDetail", member_order_index);
	}
	
	public OrdersVO ordersDetailJoin(String member_order_index) throws Exception {
		return sqlSession.selectOne(Namespace+".ordersDetailJoin", member_order_index);
	}
	
	/* 회원 구매 페이지 */
	// 회원 결제하고 난뒤 DB에 올리는 과정
	public void memberOrderInsert(OrdersVO ordersvo) throws Exception{
		sqlSession.insert(Namespace + ".memberOrderInsert", ordersvo);
	}
	// 회원 결제하고 난뒤 포인트&이벤트 티켓
	public void memberStatusUpdate(MemberVO membervo) throws Exception{
		sqlSession.update(Namespace + ".memberStatusUpdate", membervo);
	}
	// 회원 결제하고 난뒤 쿠폰사용
	public void couponUpdate(int coupon_index) throws Exception{
		sqlSession.update(Namespace + ".couponUpdate", coupon_index);
	}
	// 회원 결제하고 난뒤 배송지 업데이트
	public void addressUpdate(MemberVO membervo) throws Exception{
		sqlSession.update(Namespace + ".addressUpdate", membervo);
	}
	// 회원 결제하고 난뒤 장바구니 비우기
	public void cartUpdate(CartVO cartvo) throws Exception{
		sqlSession.delete(Namespace + ".cartUpdate", cartvo);
		
	}
	
	/* 여기서 부터는 관리자페이지 */
	
	// 회원 주문 조회할때 글의 갯수(페이징)
	public int adminMemberOrdersCount(SearchVO searchvot) throws Exception{
		return sqlSession.selectOne(Namespace + ".adminMemberOrdersCount", searchvot);
	}
	// 회원 주문 조회
	public List<OrdersVO> adminMemberOrdersList(PagingUtil paging) throws Exception{
		return sqlSession.selectList(Namespace + ".adminMemberOrdersList", paging);
	}
	// 회원 주문 상세조회 할때 대략적인 정보를 불러오는 쿼리
	public OrdersVO adminMemberOrder(OrdersVO ordersvo) throws Exception{
		return sqlSession.selectOne(Namespace + ".adminMemberOrder", ordersvo);
	}
}
