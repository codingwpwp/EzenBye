package team.project.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
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
	
	//로그인
	public MemberVO Login(MemberVO vo) throws Exception {
	        return sqlSession.selectOne(Namespace+".Login", vo);
	    }
	
	//회원가입
	public int insertMember(MemberVO vo) throws Exception{
		return sqlSession.insert(Namespace+".insertMember",vo);	
	}
	
	public int idChk(MemberVO vo) throws Exception{
		int result =sqlSession.selectOne(".idChk",vo);
		return result;
	}
	
//	public int nickChk(MemberVO vo) throws Exception{
//		int result =sqlSession.selectOne(".nickChk",vo);
//		return result;
//	}
}
