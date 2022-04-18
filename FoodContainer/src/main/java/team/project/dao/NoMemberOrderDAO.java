package team.project.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import team.project.vo.NoMemberOrdersVO;

@Repository
public class NoMemberOrderDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final String Namespace = "team.project.mapper.noMemberOrdersMapper";
	
	// 큰 단위 주문 넣는 메소드
	public void noMemberOrderInsert(NoMemberOrdersVO noMemberOrdersvo) throws Exception{
		sqlSession.insert(Namespace + ".noMemberOrdersInsert", noMemberOrdersvo);
	}
	
	public NoMemberOrdersVO noMemberOrdersList(String no_member_order_index) throws Exception{
		return sqlSession.selectOne(Namespace + ".noMemberOrdersList", no_member_order_index);
	}
	
}
