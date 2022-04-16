package team.project.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import team.project.vo.NoMemberOrdersVO;

public interface NoMemberOrdersService {
	
	// 비회원 구매 완료 후 DB에 큰 주문, 작은 주문, 판매량 늘려주기
	void orderInsert(HttpServletRequest request, HttpServletResponse response, NoMemberOrdersVO noMemberOrdersvo) throws Exception;
}
