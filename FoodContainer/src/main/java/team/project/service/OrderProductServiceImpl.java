package team.project.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.project.dao.OrderProductDAO;
import team.project.vo.CartVO;
import team.project.vo.OrderProductVO;
import team.project.vo.OrdersVO;

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
	// 회원 주문 상세조회할때 주문들 불러오기
	@Override
	public List<OrderProductVO> adminMemberOrderProductList(OrdersVO ordersvo) throws Exception {
		return orderProductDAO.adminMemberOrderProductList(ordersvo);
	}

	/* 구매페이지 */
	// 밑에 두개는 원래 상품페이지에서 하려는데 사정상 여기에다가함
	// 회원&비회원 공통 결제하려는 상품 수량 확인 및 빼주기
	@Override
	public String checkProductInventory(HashMap<String, String> cartMap) throws Exception {

		int checkInventoryResult = 0;
		
		for(String pidx : cartMap.keySet()) {
			int inventory = orderProductDAO.checkInventory(pidx);
			if(Integer.parseInt(cartMap.get(pidx)) > inventory) {
				break;
			}else {
				checkInventoryResult++;
			}
		}
		
		if(checkInventoryResult != cartMap.size()) {
			// 수량이 충분하지 않는 경우
			return "Fail";
		}else {
			// 수량이 충분하다면 해당 갯수만큼 빼주기
			for(String pidx : cartMap.keySet()) {
				CartVO vo = new CartVO();
				vo.setProduct_index(pidx);
				vo.setCart_count(Integer.parseInt(cartMap.get(pidx)));
				orderProductDAO.MinusInventory(vo);
			}
			String randomBox = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
			
			Date now = new Date();
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
			String order_index = simpleDateFormat.format(now).substring(2);
			for(int i = 0; i < 3; i++) {
				int randomIndex = (int)(Math.random() * randomBox.length());
				order_index += randomBox.substring(randomIndex, randomIndex + 1);
			}
			
			return order_index;
		}
		
	}
	// 회원&비회원 공통 다시 상품 채워놓기
	@Override
	public void plusInventory(HashMap<String, String> cartMap) throws Exception {
		for(String pidx : cartMap.keySet()) {
			CartVO vo = new CartVO();
			vo.setProduct_index(pidx);
			vo.setCart_count(Integer.parseInt(cartMap.get(pidx)));
			orderProductDAO.plusInventory(vo);
		}
	}

}
