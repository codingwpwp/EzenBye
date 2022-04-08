package team.project.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import team.project.vo.OrdersVO;

@Repository
public class OrdersDAO {
	@Autowired
	private SqlSession sqlSession;
	
	private static final String Namespace = "team.project.mapper.ordersMapper";
	
	public List<OrdersVO> ordersList(int member_index) throws Exception {
		return sqlSession.selectList(Namespace+".ordersList", member_index);
	}
	
	public OrdersVO ordersDetail(String member_order_index) throws Exception {
		return sqlSession.selectOne(Namespace+".ordersDetail", member_order_index);
	}
	
	public OrdersVO ordersDetailJoin(String member_order_index) throws Exception {
		return sqlSession.selectOne(Namespace+".ordersDetailJoin", member_order_index);
	}
	
}
