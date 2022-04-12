package team.project.service;

import team.project.vo.CartVO;

public interface CartService {
	
	int cartInsert(CartVO cartVO) throws Exception;
}
