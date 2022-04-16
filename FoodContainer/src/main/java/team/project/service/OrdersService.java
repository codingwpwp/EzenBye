package team.project.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import team.project.util.PagingUtil;
import team.project.vo.OrdersVO;
import team.project.vo.SearchVO;

public interface OrdersService {
	List<OrdersVO> ordersList(int member_index) throws Exception;
	
	List<OrdersVO> ordersListAll(int member_index) throws Exception;
	
	OrdersVO ordersDetail(String member_order_index) throws Exception;
	
	OrdersVO ordersDetailJoin(String member_order_index) throws Exception;
	
	
	/* 회원 구매 페이지 */
	// 회원 결제하고 난뒤 DB에 올리는 과정
	void orderInsert(HttpSession session, OrdersVO ordersvo, String newBasicAddress) throws Exception;
	
	
	/* 여기서 부터는 관리자페이지 */
	// 회원 주문 조회
	List<OrdersVO> adminMemberOrdersList(SearchVO searchvo, int nowPage) throws Exception;
	PagingUtil adminMemberOrdersPaging(SearchVO searchvo, int nowPage) throws Exception;
	
	// 회원 주문 상세조회 할때 대략적인 정보
	OrdersVO adminMemberOrder(OrdersVO ordersvo) throws Exception;
}
