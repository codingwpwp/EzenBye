package team.project.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import team.project.util.PagingUtil;
import team.project.vo.NoMemberOrdersVO;
import team.project.vo.SearchVO;

@Repository
public class NoMemberOrderDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final String Namespace = "team.project.mapper.noMemberOrdersMapper";
	
	// 비회원 주문번호 조회
	public NoMemberOrdersVO noMemberOrdersSelect(NoMemberOrdersVO vo) throws Exception{
		return sqlSession.selectOne(Namespace + ".noMemberOrdersSelect", vo);
	}
	
	// 비회원 주문 비번 변경
	public void noMemberOrdersInfoChange(NoMemberOrdersVO noMemberOrdersvo) throws Exception{
		sqlSession.update(Namespace + ".noMemberOrdersInfoChange", noMemberOrdersvo);
	}
	
	// 큰 단위 주문 넣는 메소드
	public void noMemberOrderInsert(NoMemberOrdersVO noMemberOrdersvo) throws Exception{
		sqlSession.insert(Namespace + ".noMemberOrdersInsert", noMemberOrdersvo);
	}
	
	public NoMemberOrdersVO noMemberOrdersList(String no_member_order_index) throws Exception{
		return sqlSession.selectOne(Namespace + ".noMemberOrdersList", no_member_order_index);
	}
	
	/* 여기서 부터는 관리자페이지 */
	
	// 회원 주문 조회할때 글의 갯수(페이징)
	public int adminNoMemberOrdersCount(SearchVO searchvo) throws Exception{
		return sqlSession.selectOne(Namespace + ".adminNoMemberOrdersCount", searchvo);
	}
	// 비회원 주문 조회
	public List<NoMemberOrdersVO> adminNoMemberOrdersList(PagingUtil paging) throws Exception{
		return sqlSession.selectList(Namespace + ".adminNoMemberOrdersList", paging);
	}
}
