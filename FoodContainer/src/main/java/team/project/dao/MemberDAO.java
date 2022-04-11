package team.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import team.project.vo.MemberVO;

@Repository
public class MemberDAO {
	@Autowired
	private SqlSession sqlSession;
	
	private static final String Namespace = "team.project.mapper.MemberMapper";
	
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
	//아이디중복체크
	public String idChk(String id) throws Exception{
		int result =sqlSession.selectOne(Namespace+".idChk",id);
		
		System.out.println(result);
		return Integer.toString(result);
	}
	//닉네임 중복체크
	public String nickChk(String nickname) throws Exception{
		int result =sqlSession.selectOne(Namespace+".nickChk",nickname);
		System.out.println(result);
		return Integer.toString(result);
	}
	//추천인 확인
	public String recomChk(String id) throws Exception{
		int result =sqlSession.selectOne(Namespace+".recomChk",id);
		System.out.println(result);
		return Integer.toString(result);
	}
	//비밀번호 확인
	public String pwChk(String pw) throws Exception{
		int result =sqlSession.selectOne(Namespace+".pwChk",pw);
		
		return Integer.toString(result);
	}
	
	public MemberVO memberInfor(int member_index) throws Exception{
		return sqlSession.selectOne(Namespace+".memberInfor",member_index);
	}
	
}
