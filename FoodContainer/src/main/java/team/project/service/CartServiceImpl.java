package team.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.project.dao.CartDAO;
import team.project.vo.CartVO;

@Service
public class CartServiceImpl implements CartService {
	@Autowired
	private CartDAO cartDAO;

	@Override
	public int cartInsert(CartVO cartVO) throws Exception {
		
		int cartInsert = cartDAO.cartInsert(cartVO);
		
		return cartInsert;
	}
	
	
}
