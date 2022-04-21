package team.project.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import team.project.util.PagingUtil;
import team.project.vo.MemberVO;
import team.project.vo.SearchVO;

public interface MemberService {
	List<MemberVO> list(MemberVO vo) throws Exception;

	List<MemberVO> MemberList(MemberVO memberVO) throws Exception;

	public MemberVO Login(MemberVO vo) throws Exception;
	
	int insertMember(MemberVO vo) throws Exception;
	
	String idChk(String id) throws Exception;
	
	String nickChk(String nickname)throws Exception;
	
	String recomChk(String id) throws Exception;
	
	MemberVO memberInfor(int member_index) throws Exception;
	
	String pwChk(String pw) throws Exception;
	
	public void updatePoint(int point, int member_index);
	
	int mypageMemberDelete(MemberVO memberVO) throws Exception;
	
	int mypageMemberModify(MemberVO memberVO) throws Exception;
	
	MemberVO corretPW(MemberVO memberVO) throws Exception;
	
	int modifyPW(MemberVO memberVO) throws Exception;
	
	int mypageChangeAddress(MemberVO memberVO) throws Exception;
	
	/* 로그인 페이지 */
	// 간편 아이디 찾기
	public MemberVO idEasyCheck(MemberVO membervo) throws Exception;
	
	// 이메일 아이디 찾기
	public MemberVO emailEasyCheck(MemberVO membervo) throws Exception;

	// 비밀번호 찾기 페이지
	// 인증번호 발송(회원 존재하는지 여부도 따짐)
	public String checkPwAndSendEmail(MemberVO membervo) throws Exception;
	
	// 임시 비밀번호 발송
	public MemberVO sendTempPw(MemberVO membervo) throws Exception;
	
	/* 여기서 부터는 관리자페이지 */
	
	// 회원 조회
	List<MemberVO> adminMemberList(SearchVO searchvo, int nowPage) throws Exception;
	PagingUtil adminMemberPaging(SearchVO searchvo, int nowPage) throws Exception;
	
	// 회원 추방
	int adminChangeMemberDel_yn(int member_index) throws Exception;
	
	/* 여기서 부터는 이벤트페이지 */
	// 이벤트 페이지
	String eventTicket(int member_index) throws Exception;
	
	// 이벤트 결과에 따라 지금
	void eventResult(HttpServletRequest request, String result) throws Exception;
}
