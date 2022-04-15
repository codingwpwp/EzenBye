package team.project.dao;

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
}
