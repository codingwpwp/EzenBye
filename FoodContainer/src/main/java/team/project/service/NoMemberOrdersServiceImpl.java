package team.project.service;

import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import team.project.dao.NoMemberOrderDAO;
import team.project.dao.OrderProductDAO;
import team.project.vo.CartVO;
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
	
	// 비회원 구매페이지에서 뿌려질 상품목록들
	@Override
	public List<CartVO> noMemberPurchaseList(HttpServletRequest request) throws Exception {
		
		// 세션에 있는 cartMap 소환
		HttpSession session = request.getSession();
		HashMap<String, Integer> cartMap = (HashMap<String, Integer>) session.getAttribute("cartMap");
		
		// 쿼리에 WHERE절로 집어 넣을 List(Mapper에 hashMap의 key를 못넣어서 그럼)
		List<String> productIndexList = new ArrayList<String>();
		for(String pidx : cartMap.keySet()){
			productIndexList.add(pidx);
		}
		
		// 상품번호들 넣어서 해당 상품 정보 불러오기
		List<CartVO> CartList = noMemberOrderDao.noMemberPurchaseList(productIndexList);
		
		// 각 상품에 대한 구매하려는 갯수를 해당 상품에 올바르게 집어 넣기
		for(String pidx : cartMap.keySet()){
			for(int i = 0; i < CartList.size(); i++) {
				if(pidx.equals(CartList.get(i).getProduct_index())) {
					CartList.get(i).setCart_count(cartMap.get(pidx));
					break;
				}
			}
		}
		
		return CartList;
	}

	// 비회원 결제하고 난뒤 DB에 올리는 과정
	@Override
	public void orderInsert(HttpServletRequest request, NoMemberOrdersVO noMemberOrdersvo, int[] price) throws Exception{
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
		
		// 큰 주문 단위 넣는 과정
		noMemberOrderDao.noMemberOrdersInsert(noMemberOrdersvo);

		// 이제 상세 주문을 넣어보자
		orderProductDao.noMemberOrderProductInsert(orderProductList);
		
		// 상품 판매량만 늘려주면 끝이다.
		for(int i = 0; i < orderProductList.size(); i++) {
			orderProductDao.productQuantityUpdate(orderProductList.get(i));
		}
		
		// 세션 비우기
		session.setAttribute("product_index", null);
		session.setAttribute("cart_count", null);
		
		//쿠키 사용
		Cookie[] cookies = request.getCookies();
		String currentCookie = null;
		if(cookies != null) {
			for(Cookie cookie : cookies) {
				if(cookie.getName().equals("pIndex")) {
					currentCookie = URLDecoder.decode(cookie.getValue(),"UTF-8");
				}
			}
		}
	}

}
