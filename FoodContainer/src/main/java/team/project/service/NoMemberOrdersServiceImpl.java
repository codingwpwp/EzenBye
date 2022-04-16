package team.project.service;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import team.project.dao.NoMemberOrderDAO;
import team.project.dao.OrderProductDAO;
import team.project.dao.ProductDAO;
import team.project.vo.CartVO;
import team.project.vo.NoMemberOrdersVO;
import team.project.vo.OrderProductVO;

@Service
public class NoMemberOrdersServiceImpl implements NoMemberOrdersService{
	@Autowired
	private NoMemberOrderDAO noMemberOrderDao;
	
	@Autowired
	private OrderProductDAO orderProductDao;
	
	@Autowired
	private ProductDAO productDao;
	
	@Inject
	private BCryptPasswordEncoder PasswordEncoder;
	
	
	/* 비회원 구매페이지 */
	
	// 비회원 결제하고 난뒤 DB에 올리는 과정
	@Override
	public void orderInsert(HttpServletRequest request, HttpServletResponse response, NoMemberOrdersVO noMemberOrdersvo) throws Exception{
		// 세션 소환
		HttpSession session = request.getSession();
		List<CartVO> cartList = (List<CartVO>)session.getAttribute("cartList");
		
		// 상세 주문정보에 넣을 친구들 소환하고 for문 돌려서 집어 넣음
		List<OrderProductVO> orderProductList = new ArrayList<>();
		
		for(CartVO vo : cartList) {
			OrderProductVO opvo = new OrderProductVO();
			
			opvo.setNo_member_order_index(noMemberOrdersvo.getNo_member_order_index());
			opvo.setOrderItem_index(noMemberOrdersvo.getNo_member_order_index().substring(4, 8) + vo.getProduct_index() + vo.getCart_count());
			opvo.setProduct_index(vo.getProduct_index());
			opvo.setOrder_quantity(vo.getCart_count());
			opvo.setPrice(vo.getOrigin_price());
			opvo.setPoint(0);
			
			orderProductList.add(opvo);
		}
		
		// 주문 비밀번호 해쉬로 변환
		noMemberOrdersvo.setPw(PasswordEncoder.encode(noMemberOrdersvo.getPw()));
		
		// 큰 주문 단위 넣는 과정
		noMemberOrderDao.noMemberOrderInsert(noMemberOrdersvo);

		// 이제 상세 주문을 넣어보자
		orderProductDao.noMemberOrderProductInsert(orderProductList);
		
		// 상품 판매량만 늘려주면 끝이다.
		for(int i = 0; i < orderProductList.size(); i++) {
			productDao.productQuantityUpdate(orderProductList.get(i));
		}
		
		// DB작업 끝났으니까 비워줄거 비워주는 과정
		// 카트 세션 비우기
		session.setAttribute("cartList", null);
		
		// 쿠키에서 결제완료된 상품들을 삭제하는 과정(주석은 안달았음)
		Cookie[] cookies = request.getCookies();
		String currentCookie = null;
		if(cookies != null) {
			for(Cookie cookie : cookies) {
				if(cookie.getName().equals("noMemberCart")) {
					currentCookie = URLDecoder.decode(cookie.getValue(),"UTF-8");
				}
			}
		}
		if(currentCookie != null) {

			String[] cartProductIndexArray = currentCookie.split(",");
			for(CartVO vo : cartList) {
				for(int i = 0; i < cartProductIndexArray.length; i++) {
					if(cartProductIndexArray[i].contains(vo.getProduct_index())) {
						cartProductIndexArray[i] = "";
					}
				}
			}
			
			String tempCurrentCookie = "";
			for(int i = 0; i < cartProductIndexArray.length; i++) {
				if(!cartProductIndexArray[i].equals("")) {
					tempCurrentCookie += cartProductIndexArray[i] + ","; 
				}
			}
			
			tempCurrentCookie = tempCurrentCookie.substring(0, tempCurrentCookie.length() - 1);
			tempCurrentCookie = URLEncoder.encode(tempCurrentCookie, "UTF-8");
			Cookie pidxCookie = new Cookie("noMemberCart", tempCurrentCookie);
			pidxCookie.setPath("/controller");
			
		    response.addCookie(pidxCookie);
		    
		}
	}

}
