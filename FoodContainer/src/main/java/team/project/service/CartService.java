package team.project.service;

import java.util.List;

import team.project.vo.CartVO;

public interface CartService {
	
	int cartInsert(CartVO cartVO) throws Exception;
	
	List<CartVO> selectList(int member_index) throws Exception;
	
	List<CartVO> selectList(CartVO cartVO) throws Exception;
	
	void chooseShopbasketDelete(String cart_index) throws Exception;
	
	void shopbasketDelete(int cart_index) throws Exception;
	
	void cartCount(int cnt, int cart_index) throws Exception;
}
