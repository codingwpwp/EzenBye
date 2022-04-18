package team.project.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import team.project.util.PagingUtil;
import team.project.vo.NoMemberOrdersVO;
import team.project.vo.SearchVO;

public interface NoMemberOrdersService {
	
	// 비회원 구매 완료 후 DB에 큰 주문, 작은 주문, 판매량 늘려주기
	void orderInsert(HttpServletRequest request, HttpServletResponse response, NoMemberOrdersVO noMemberOrdersvo) throws Exception;
	
	NoMemberOrdersVO noMemberOrdersList(String no_member_order_index) throws Exception;
	
	/* 여기서 부터는 관리자페이지 */
	// 비회원 주문 조회
	List<NoMemberOrdersVO> adminNoMemberOrdersList(SearchVO searchvo, int nowPage) throws Exception;
	PagingUtil adminNoMemberOrdersPaging(SearchVO searchvo, int nowPage) throws Exception;
}
