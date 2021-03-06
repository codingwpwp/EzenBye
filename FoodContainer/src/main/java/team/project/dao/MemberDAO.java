package team.project.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import team.project.util.PagingUtil;
import team.project.vo.MemberVO;
import team.project.vo.SearchVO;

@Repository
public class MemberDAO {
	@Autowired
	private SqlSession sqlSession;
	
	private static final String Namespace = "team.project.mapper.MemberMapper";
	
	public List<MemberVO> list(MemberVO vo) throws Exception {
		
		return sqlSession.selectList(Namespace+".selectMember",vo);
	}
	
public List<MemberVO> MemberList(MemberVO memberVO) throws Exception {
		
		return sqlSession.selectList(Namespace+".memberList",memberVO);
	}
	
	//로그인
	public MemberVO Login(MemberVO vo) throws Exception {
		return sqlSession.selectOne(Namespace+".Login", vo);
	}
	
	//회원가입
	public int insertMember(MemberVO vo) throws Exception{
		return sqlSession.insert(Namespace+".insertMember",vo);	
	}
	public void updateRecom(MemberVO vo) throws Exception{
		sqlSession.update(Namespace+".updateRecom",vo);
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
	
	/* 로그인 페이지 */
	// 간편 아이디 찾기
	public MemberVO idEasyCheck(MemberVO membervo) throws Exception{
		return sqlSession.selectOne(Namespace + ".idEasyCheck", membervo);
	}
	// 이메일 아이디 찾기
	public MemberVO emailEasyCheck(MemberVO membervo) throws Exception{
		return sqlSession.selectOne(Namespace + ".emailEasyCheck", membervo);
	}
	
	// 비밀번호 찾기 페이지
	// 회원 존재하는지 여부
	public int pwCheckYN(MemberVO membervo) throws Exception{
		return sqlSession.selectOne(Namespace + ".pwCheckYN", membervo);
	}
	// 임시 비밀번호로 변경
	public void changeTempPw(MemberVO membervo) throws Exception{
		sqlSession.update(Namespace + ".changeTempPw", membervo);
	}
	
	public MemberVO memberInfor(int member_index) throws Exception{
		return sqlSession.selectOne(Namespace+".memberInfor",member_index);
	}
	
	public int mypageMemberDelete(MemberVO memberVO) throws Exception{
		return sqlSession.update(Namespace + ".mypageMemberDelete", memberVO);
	}
	
	public int mypageMemberModify(MemberVO memberVO) throws Exception{
		return sqlSession.update(Namespace + ".mypageMemberModify", memberVO);
	}
	
	public MemberVO corretPW(MemberVO memberVO) throws Exception{
		return sqlSession.selectOne(Namespace + ".corretPW", memberVO);
	}
	
	public int modifyPW(MemberVO memberVO) throws Exception{
		return sqlSession.update(Namespace + ".modifyPW", memberVO);
	}
	
	public int mypageChangeAddress(MemberVO memberVO) throws Exception{
		return sqlSession.update(Namespace + ".mypageChangeAddress", memberVO);
	}
	
	/*여기서 부터는 관리자페이지*/
	
	// 회원 조회할때 글의 갯수(페이징)
	public int adminMemberListCount(SearchVO searchvo) throws Exception{
		return sqlSession.selectOne(Namespace + ".adminMemberListCount", searchvo);
	}
	
	// 회원 조회
	public List<MemberVO> adminMemberList(PagingUtil paging) throws Exception{
		return sqlSession.selectList(Namespace + ".adminMemberList", paging);
	}
	
	// 회원 추방
	public int adminChangeMemberDel_yn(int member_index) throws Exception{
		return sqlSession.update(Namespace + ".adminChangeMemberDel_yn", member_index);
	}
	
	/* 이벤트 페이지 */
	// 티켓 조회
	public int eventTicketCheck(int member_index) throws Exception{
		return sqlSession.selectOne(Namespace + ".eventTicketCheck", member_index);
	}
	
	// 티켓 하나 깎기
	public void eventTicketMinus(int member_index) throws Exception{
		sqlSession.update(Namespace + ".eventTicketMinus", member_index);
	}

}
