package team.project.service;

import java.util.HashMap;
import java.util.List;

import team.project.vo.OrderProductVO;
import team.project.vo.OrdersVO;

public interface OrderProductService {
	List<OrderProductVO> orderProductList(OrderProductVO vo) throws Exception;
	
	int buyOk(String orderItem_index) throws Exception;
	
	
	/* 구매페이지 */
	// 밑에 두개는 원래 상품페이지에서 하려는데 사정상 여기에다가함
	// 회원&비회원 공통 결제하려는 상품 수량 확인 및 빼주기
	String checkProductInventory(HashMap<String, String> cartMap) throws Exception;
	// 회원&비회원 공통 다시 상품 채워놓기
	void plusInventory(HashMap<String, String> cartMap) throws Exception;
	
	/* 관리자페이지 */
	// 회원 주문 상세조회할때 주문들 불러오기
	List<OrderProductVO> adminMemberOrderProductList(OrdersVO ordersvo) throws Exception;
}
