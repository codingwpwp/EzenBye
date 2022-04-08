package team.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.project.dao.OrderProductDAO;
import team.project.vo.OrderProductVO;

@Service
public class OrderProductServiceImpl implements OrderProductService{
	@Autowired
	private OrderProductDAO orderProductDAO;

	@Override
	public List<OrderProductVO> orderProductList(OrderProductVO vo) throws Exception {
		List<OrderProductVO> opVO = orderProductDAO.orderProductList(vo);
		return opVO;
	}

	@Override
	public int buyOk(String orderItem_index) throws Exception {
		int buyOk = orderProductDAO.buyOk(orderItem_index);
		return buyOk;
	}

}
