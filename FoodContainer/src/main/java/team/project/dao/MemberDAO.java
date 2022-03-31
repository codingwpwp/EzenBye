package team.project.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import team.project.vo.MemberVO;

@Repository
public class MemberDAO {
	@Autowired
	private SqlSession sqlSession;
	
	private static final String Namespace = "team.project.mapper.memberMapper";
	
	public List<MemberVO> list(MemberVO vo) throws Exception {
		
		return sqlSession.selectList(Namespace+".selectMember",vo);
	}
}
