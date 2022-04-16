package team.project.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.project.dao.OrderProductDAO;
import team.project.dao.OrdersDAO;
import team.project.dao.ProductDAO;
import team.project.util.PagingUtil;
import team.project.vo.CartVO;
import team.project.vo.OrderProductVO;
import team.project.vo.OrdersVO;
import team.project.vo.SearchVO;

@Service
public class OrdersServiceImpl implements OrdersService{
	@Autowired
	private OrdersDAO ordersDAO;
	
	@Autowired
	private OrderProductDAO orderProductDao;
	
	@Autowired
	private ProductDAO productDao;

	@Override
	public List<OrdersVO> ordersList(int member_index) throws Exception {
		List<OrdersVO> list = ordersDAO.ordersList(member_index);
		return list;
	}
	
	@Override
	public List<OrdersVO> ordersListAll(int member_index) throws Exception {
		List<OrdersVO> list = ordersDAO.ordersListAll(member_index);
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
	
	/* 회원 구매 페이지 */
	// 회원 결제하고 난뒤 DB에 올리는 과정
	@Override
	public void orderInsert(HttpSession session, OrdersVO ordersvo) throws Exception {
		List<CartVO> cartList = (List<CartVO>)session.getAttribute("cartList");
		
		// 상세 주문정보에 넣을 친구들 소환하고 for문 돌려서 집어 넣음
		List<OrderProductVO> orderProductList = new ArrayList<>();
		for(CartVO vo : cartList) {
			OrderProductVO opvo = new OrderProductVO();
			
			opvo.setMember_order_index(ordersvo.getMember_order_index());
			opvo.setOrderItem_index(ordersvo.getMember_order_index().substring(4, 8) + vo.getProduct_index() + vo.getCart_count());
			opvo.setProduct_index(vo.getProduct_index());
			opvo.setOrder_quantity(vo.getCart_count());
			opvo.setPrice(vo.getOrigin_price());
			opvo.setPoint(vo.getOrigin_price() / 100);
			
			orderProductList.add(opvo);
		}
		
		// 큰 주문 넣기
		ordersDAO.memberOrderInsert(ordersvo);
		
		// 작은 주문 넣기
		orderProductDao.memberOrderProductInsert(orderProductList);
		
		// 상품 판매량 늘려주기
		for(int i = 0; i < orderProductList.size(); i++) {
			productDao.productQuantityUpdate(orderProductList.get(i));
		}
		
		// 회원 포인트&쿠폰 사용
		
		// 장바구니 비우기
	}

	/* 여기서 부터는 관리자페이지 */
	
	// 회원 주문 조회 리스트 출력
	@Override
	public List<OrdersVO> adminMemberOrdersList(SearchVO searchvo, int nowPage) throws Exception {
		
		// 페이징 처리
		PagingUtil paging = adminMemberOrdersPaging(searchvo, nowPage);
		
		//페이징 내부 값 세팅
		paging.setStart(paging.getStart() - 1);
		paging.setSearchValue(searchvo.getSearchValue());
		return ordersDAO.adminMemberOrdersList(paging);
	}
	
	// 회원 주문 조회 페이징
	@Override
	public PagingUtil adminMemberOrdersPaging(SearchVO searchvo, int nowPage) throws Exception{
		int cnt = ordersDAO.adminMemberOrdersCount(searchvo);
		return new PagingUtil(cnt, nowPage, 10, 5);
		
	}
	
	// 회원 주문 상세조회 할때 대략적인 정보
	@Override
	public OrdersVO adminMemberOrder(OrdersVO ordersvo) throws Exception {
		return ordersDAO.adminMemberOrder(ordersvo);
	}

}
