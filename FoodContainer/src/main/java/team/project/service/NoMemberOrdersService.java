package team.project.service;

import javax.servlet.http.HttpServletRequest;

import team.project.vo.NoMemberOrdersVO;

public interface NoMemberOrdersService {
	int orderInsert(HttpServletRequest request, NoMemberOrdersVO noMemberOrdersvo, int[] price) throws Exception;
}
