package team.project.service;

import java.util.List;

import team.project.util.PagingUtil;
import team.project.vo.MemberVO;
import team.project.vo.SearchVO;

public interface MemberService {
	List<MemberVO> list(MemberVO vo) throws Exception;

	public MemberVO Login(MemberVO vo) throws Exception;
	
	int insertMember(MemberVO vo) throws Exception;
	
	String idChk(String id) throws Exception;
	
	String nickChk(String nickname)throws Exception;
	
	String recomChk(String id) throws Exception;
	
	MemberVO memberInfor(int member_index) throws Exception;
	
	String pwChk(String pw) throws Exception;
	
	public void updatePoint(int point, int member_index);
	
	int mypageMemberDelete(MemberVO memberVO) throws Exception;
	
	/* 여기서 부터는 관리자페이지 */
	
	// 회원 조회
	List<MemberVO> adminMemberList(SearchVO searchvo, int nowPage) throws Exception;
	PagingUtil adminMemberPaging(SearchVO searchvo, int nowPage) throws Exception;
	
	// 회원 추방
	int adminChangeMemberDel_yn(int member_index) throws Exception;
}
