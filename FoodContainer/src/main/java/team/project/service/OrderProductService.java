package team.project.service;

import java.util.HashMap;
import java.util.List;

import team.project.vo.OrderProductVO;
import team.project.vo.OrdersVO;

public interface OrderProductService {
	List<OrderProductVO> orderProductList(OrderProductVO vo) throws Exception;
	
	int buyOk(String orderItem_index) throws Exception;
	
	
	/* 관리자페이지 */
	// 30일 결산
	List<HashMap<String, String>> sales() throws Exception;
	
	// 회원 주문 상세조회할때 주문들 불러오기
	List<OrderProductVO> adminMemberOrderProductList(OrdersVO ordersvo) throws Exception;
	
	// 비회원 주문 상세조회할때 주문들 불러오기
	List<OrderProductVO> adminNoMemberOrderProductList(String no_member_order_index) throws Exception;
}
