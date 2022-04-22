package team.project.service;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
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
import team.project.util.PagingUtil;
import team.project.vo.CartVO;
import team.project.vo.EmailVO;
import team.project.vo.NoMemberOrdersVO;
import team.project.vo.OrderProductVO;
import team.project.vo.SearchVO;

@Service
public class NoMemberOrdersServiceImpl implements NoMemberOrdersService{
	@Autowired
	private NoMemberOrderDAO noMemberOrderDao;
	
	@Autowired
	private OrderProductDAO orderProductDao;
	
	@Autowired
	private ProductDAO productDao;
	
	@Autowired
	private EmailService emailService;
	
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
			
		    
		    if(tempCurrentCookie.length() > 0) {
				
		    	tempCurrentCookie = tempCurrentCookie.substring(0, tempCurrentCookie.length() - 1);
				tempCurrentCookie = URLEncoder.encode(tempCurrentCookie, "UTF-8");
				Cookie pidxCookie = new Cookie("noMemberCart", tempCurrentCookie);
				pidxCookie.setPath("/" + request.getContextPath());
				
			    response.addCookie(pidxCookie);
			}else {
				Cookie pidxCookie = new Cookie("noMemberCart", "");
				tempCurrentCookie = URLEncoder.encode(tempCurrentCookie, "UTF-8");
				
				pidxCookie.setPath("/" + request.getContextPath());
				pidxCookie.setMaxAge(0);
			    response.addCookie(pidxCookie);
			}
		    
		}
	}


	@Override
	public NoMemberOrdersVO noMemberOrdersList(String no_member_order_index) throws Exception {
		NoMemberOrdersVO noMemberOrdersList = noMemberOrderDao.noMemberOrdersList(no_member_order_index);
		return noMemberOrdersList;
	}

	// 비회원 로그인(주문번호) 검증과정
	@Override
	public String noMemberLogin(NoMemberOrdersVO noMembervo) throws Exception {
		NoMemberOrdersVO vo = noMemberOrderDao.noMemberOrdersList(noMembervo.getNo_member_order_index());
		if(vo == null) {
			return null;
		}else {
			if(PasswordEncoder.matches(noMembervo.getPw(), vo.getPw())) {
				vo.setPw("");
				return vo.getNo_member_order_index();
			}else {
				return null;				
			}
		}

	}
	
	// 비회원 주문 비밀번호 찾기 이메일
	@Override
	public String noMemberCheckPwAndSendEmail(NoMemberOrdersVO vo) throws Exception {
		NoMemberOrdersVO tempvo = noMemberOrderDao.noMemberOrdersSelect(vo);
		
		if(tempvo == null) {
			return "none";
		}else {
			String randomAlpha = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
			String randomNum = "0123456789";
			String randomSpecial = "!@#$%^&*()";
			String randomTempPw = "";
			for(int i = 0; i < 15; i++) {
				if(i > 12) {
					int randomIndex = (int)(Math.random() * randomSpecial.length());
					randomTempPw += randomSpecial.substring(randomIndex, randomIndex + 1);
				}else if(i > 7 && i <= 12) {
					int randomIndex = (int)(Math.random() * randomNum.length());
					randomTempPw += randomNum.substring(randomIndex, randomIndex + 1);
				}else {
					int randomIndex = (int)(Math.random() * randomAlpha.length());
					randomTempPw += randomAlpha.substring(randomIndex, randomIndex + 1);
				}
			}
			
			tempvo.setPw(PasswordEncoder.encode(randomTempPw));
			
			noMemberOrderDao.noMemberOrdersInfoChange(tempvo);
			
			EmailVO evo = new EmailVO();
			evo.setSubject("FoodContainer " + tempvo.getName() + "님의 새로운 주문 비밀번호 입니다");
			evo.setReceiveMail(tempvo.getEmail());
			String message = "새로운 비밀번호는 " + randomTempPw + " 입니다. 현재 비밀번호는 입력 할 수 없습니다.";
			evo.setMessage(message);
			emailService.sendEmail(evo);
			
			return tempvo.getName();
		}
		
	}
	
	
	/* 관리자페이지 */
	
	// 비회원 주문 조회 리스트 출력
	@Override
	public List<NoMemberOrdersVO> adminNoMemberOrdersList(SearchVO searchvo, int nowPage) throws Exception {
		
		// 페이징 처리
		PagingUtil paging = adminNoMemberOrdersPaging(searchvo, nowPage);
		
		// 페이징 내부 값 세팅
		paging.setStart(paging.getStart() - 1);
		paging.setSearchType(searchvo.getSearchType());
		paging.setSearchValue(searchvo.getSearchValue());
		return noMemberOrderDao.adminNoMemberOrdersList(paging);
	}

	// 비회원 주문 조회 페이징
	@Override
	public PagingUtil adminNoMemberOrdersPaging(SearchVO searchvo, int nowPage) throws Exception {
		int cnt = noMemberOrderDao.adminNoMemberOrdersCount(searchvo);
		return new PagingUtil(cnt, nowPage, 10, 5);
	}



}
