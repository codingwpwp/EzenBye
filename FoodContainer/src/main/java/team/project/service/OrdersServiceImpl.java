package team.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.project.dao.OrdersDAO;
import team.project.vo.OrdersVO;

@Service
public class OrdersServiceImpl implements OrdersService{
	@Autowired
	private OrdersDAO ordersDAO;

	@Override
	public List<OrdersVO> ordersList(int member_index) throws Exception {
		List<OrdersVO> list = ordersDAO.ordersList(member_index);
		return list;
	}

	@Override
	public OrdersVO ordersDetail(String member_order_index) throws Exception {
		OrdersVO ordersDetail = ordersDAO.ordersDetail(member_order_index);
		return ordersDetail;
	}

	@Override
	public OrdersVO ordersDetailJoin(String member_order_index) throws Exception {
		OrdersVO ordersDetailJoin = ordersDAO.ordersDetailJoin(member_order_index);
		return ordersDetailJoin;
	}

}
