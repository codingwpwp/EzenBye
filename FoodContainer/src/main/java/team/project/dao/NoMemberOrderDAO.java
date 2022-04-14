package team.project.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import team.project.vo.CartVO;
import team.project.vo.NoMemberOrdersVO;

@Repository
public class NoMemberOrderDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final String Namespace = "team.project.mapper.noMemberOrdersMapper";
	
	// 비회원 구매할 목록들 뿌리기
	public List<CartVO> noMemberPurchaseList(List<String> productIndexList){
		return sqlSession.selectList(Namespace + ".noMemberPurchaseList", productIndexList);
	}
	
	// 큰 단위 주문 넣는 메소드
	public void noMemberOrdersInsert(NoMemberOrdersVO noMemberOrdersvo) throws Exception{
		sqlSession.insert(Namespace + ".noMemberOrdersInsert", noMemberOrdersvo);
	}
	
}
