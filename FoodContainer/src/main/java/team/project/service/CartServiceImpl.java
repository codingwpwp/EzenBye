package team.project.service;

import java.util.List;

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

	@Override
	public List<CartVO> selectList(int member_index) throws Exception {
		
		List<CartVO> selectList = cartDAO.selectList(member_index);
		
		return selectList;
	}

	@Override
	public List<CartVO> selectList(CartVO cartVO) throws Exception {
		
		List<CartVO> selectList = cartDAO.selectList(cartVO);
		
		return selectList;
	}

	@Override
	public void chooseShopbasketDelete(String cart_index) throws Exception {
		cartDAO.chooseShopbasketDelete(cart_index);
	}

	@Override
	public void shopbasketDelete(int cart_index) throws Exception {
		cartDAO.shopbasketDelete(cart_index);
	}

	@Override
	public void cartCount(int cnt, int cart_index) throws Exception {
		cartDAO.cartCount(cnt, cart_index);
	}
	
	
}
