package team.project.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import team.project.vo.CartVO;
import team.project.vo.NoMemberOrdersVO;

public interface NoMemberOrdersService {
	
	// 비회원 구매페이지에서 뿌려질 상품목록들
	List<CartVO> noMemberPurchaseList(HttpServletRequest request) throws Exception;
	
	// 비회원 구매 완료 후 DB에 큰 주문, 작은 주문, 판매량 늘려주기
	void orderInsert(HttpServletRequest request, NoMemberOrdersVO noMemberOrdersvo, int[] price) throws Exception;
}
