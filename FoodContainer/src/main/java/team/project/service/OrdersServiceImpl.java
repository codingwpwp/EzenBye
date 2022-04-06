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

}
