package team.project.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.project.dao.OrderProductDAO;
import team.project.vo.OrderProductVO;
import team.project.vo.OrdersVO;
import team.project.vo.ProductVO;

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
	
	/* 관리자페이지 */
	
	// 30일 결산
	@Override
	public List<HashMap<String, String>> sales() throws Exception {
		return orderProductDAO.sales();
	}

	// 수익
	@Override
	public List<ProductVO> revenue() throws Exception {
		return orderProductDAO.revenue();
	}
	
	// 회원 주문 상세조회할때 주문들 불러오기
	@Override
	public List<OrderProductVO> adminMemberOrderProductList(OrdersVO ordersvo) throws Exception {
		return orderProductDAO.adminMemberOrderProductList(ordersvo);
	}

	// 비회원 주문 상세조회할때 주문들 불러오기
	@Override
	public List<OrderProductVO> adminNoMemberOrderProductList(String no_member_order_index) throws Exception {
		return orderProductDAO.adminNoMemberOrderProductList(no_member_order_index);
	}

}
