package team.project.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import team.project.dao.NoMemberOrderDAO;
import team.project.dao.OrderProductDAO;
import team.project.vo.NoMemberOrdersVO;
import team.project.vo.OrderProductVO;

@Service
public class NoMemberOrdersServiceImpl implements NoMemberOrdersService{
	@Autowired
	private NoMemberOrderDAO noMemberOrderDao;
	
	@Autowired
	private OrderProductDAO orderProductDao;

	@Inject
	private BCryptPasswordEncoder PasswordEncoder;

	// 비회원 결제하고 난뒤 DB에 올리는 과정
	@Override
	public int orderInsert(HttpServletRequest request, NoMemberOrdersVO noMemberOrdersvo, int[] price) throws Exception{
		// 세션 소환
		HttpSession session = request.getSession();
		String[] product_index = (String[])session.getAttribute("product_index");
		int[] cart_count = (int[])session.getAttribute("cart_count");
		
		// 상세 주문정보에 넣을 친구들 소환하고 for문 돌려서 집어 넣음
		List<OrderProductVO> orderProductList = new ArrayList<>();
		
		for(int i = 0; i < product_index.length; i++) {
			OrderProductVO vo = new OrderProductVO();
			
			vo.setNo_member_order_index(noMemberOrdersvo.getNo_member_order_index());
			String orderItemIndex = "N" + noMemberOrdersvo.getNo_member_order_index().substring(4, 8) + product_index[i] + cart_count[i];
			System.out.println(orderItemIndex);
			vo.setOrderItem_index(orderItemIndex);
			vo.setProduct_index(product_index[i]);
			vo.setPrice(price[i]);
			vo.setPoint(0);
			orderProductList.add(vo);
		}
		
		// 주문 비밀번호 해쉬로 변환
		noMemberOrdersvo.setPw(PasswordEncoder.encode(noMemberOrdersvo.getPw()));
		
		int orderResult = noMemberOrderDao.noMemberOrdersInsert(noMemberOrdersvo);
		System.out.println(orderResult);
		if(orderResult != 1) { // 주문 잘 안들어갔을 때
			return -2;
		}else {	// 잘 들어갔을 때
			// 이제 상세 주문을 넣어보자
			int orderProductResult = orderProductDao.noMemberOrderProductInsert(orderProductList);
			
			// 상품 잘 집어넣지 못했을 때
			if(orderProductResult != product_index.length) {
				return -1;
			}else {
				// 상품 판매량만 늘려주면 끝이다.
				int quantityResult = 0;
				for(int i = 0; i < orderProductList.size(); i++) {
					int result = orderProductDao.productQuantityUpdate(orderProductList.get(i));
					if(result != 1) {
						break;
					}else {
						quantityResult++;
					}
				}
				if(quantityResult != orderProductList.size()) {
					return 0;
				}else {
					session.setAttribute("product_index", null);
					session.setAttribute("cart_count", null);
					return 1;
				}
			}
		}
	}

}
