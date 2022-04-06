package team.project.service;

import java.util.List;

import team.project.vo.OrderProductVO;

public interface OrderProductService {
	List<OrderProductVO> orderProductList(OrderProductVO vo) throws Exception;

}
