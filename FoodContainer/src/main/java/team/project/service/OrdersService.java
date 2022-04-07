package team.project.service;

import java.util.List;

import team.project.vo.OrdersVO;

public interface OrdersService {
	List<OrdersVO> ordersList(int member_index) throws Exception;
	
	OrdersVO ordersDetail(String member_order_index) throws Exception;
}
