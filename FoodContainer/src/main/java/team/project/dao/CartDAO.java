package team.project.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import team.project.vo.CartVO;

@Repository
public class CartDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final String Namespace = "team.project.mapper.cartMapper";
	
	public int cartInsert(CartVO cartVO) throws Exception {
		
		return sqlSession.insert(Namespace+".cartInsert",cartVO);
	}
	
	public List<CartVO> selectList(int member_index) throws Exception {
		
		return sqlSession.selectList(Namespace+".selectList",member_index);
	}
	
	public List<CartVO> selectList(CartVO cartVO) throws Exception {
		
		return sqlSession.selectList(Namespace+".selectList",cartVO);
	}
	
	public void chooseShopbasketDelete(String cart_index) throws Exception {
		sqlSession.delete(Namespace+".chooseShopbasketDelete",cart_index);
	}
	
	public void shopbasketDelete(int cart_index) throws Exception {
		sqlSession.delete(Namespace+".shopbasketDelete",cart_index);
	}
	
	public void cartCount(int cnt, int cart_index) throws Exception {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("cnt", cnt);
		map.put("cart_index", cart_index);
		sqlSession.update(Namespace+".cartCount",map);
		
	}
	
}
