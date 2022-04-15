package team.project.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import team.project.dao.MemberDAO;
import team.project.mapper.MemberMapper;
import team.project.util.PagingUtil;
import team.project.vo.MemberVO;
import team.project.vo.SearchVO;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDAO memberDao;
	@Autowired
	private MemberMapper memberMapper;
	@Inject
	private BCryptPasswordEncoder PasswordEncoder;
	
	@Override
	public List<MemberVO> list(MemberVO vo) throws Exception {
		
		List<MemberVO> list = memberDao.list(vo);
		
		return list;
	}
	
	// 로그인 검증과정
	@Override
	public MemberVO Login(MemberVO vo) throws Exception{
		
		// vo의 id만 넣어서 조회하기
		MemberVO memberFromDB = memberDao.Login(vo);
		
		// id부터 없는경우
		if(memberFromDB == null) {
			return null;
		}else {// id는 일단 있는 경우
			if(PasswordEncoder.matches(vo.getPw(), memberFromDB.getPw())) {	// 비밀번호 비교해서 일치하는 경우
				memberFromDB.setPw("");
				return memberFromDB;
			}else {	// 비밀번호가 일치하지 않는 경우
				return null;
			}
		}

	}
	
	//마이페이지 개인정보 현재 비밀번호 일치하는지 판별
	@Override
	public MemberVO corretPW(MemberVO memberVO) throws Exception {
		
		MemberVO memberFromDB = memberDao.corretPW(memberVO);
		
		// id부터 없는경우
				if(memberFromDB == null) {
					return null;
				}else {// id는 일단 있는 경우
					if(PasswordEncoder.matches(memberVO.getPw1(), memberFromDB.getPw())) {	// 비밀번호 비교해서 일치하는 경우
						memberFromDB.setPw("");
						return memberFromDB;
					}else {	// 비밀번호가 일치하지 않는 경우
						return null;
					}
				}
	}
	
	//마이페이지 비밀번호 변경
	@Override
	public int modifyPW(MemberVO memberVO) throws Exception {
		
		memberVO.setPw(PasswordEncoder.encode(memberVO.getPw()));
		
		return memberDao.modifyPW(memberVO);
	}
	
	@Override
	public int insertMember(MemberVO vo) throws Exception {
		vo.setPw(PasswordEncoder.encode(vo.getPw()));
		return memberDao.insertMember(vo);
		
	}
	
	@Override
	public String idChk(String id) throws Exception{
		String result = memberDao.idChk(id);
		return result;
	}
	
	@Override
	public String nickChk(String nickname)throws Exception{
		String result = memberDao.nickChk(nickname);
		return result;
	}
	@Override
	public String recomChk(String id)throws Exception{
		String result = memberDao.recomChk(id);
		return result;
	}
	
	public String pwChk(String pw)throws Exception{
		String result = memberDao.pwChk(pw);
		return result;
	}
	
	@Override
	public MemberVO memberInfor(int member_index) throws Exception {
		MemberVO memberInfor = memberDao.memberInfor(member_index);
		return memberInfor;
	}
	@Override
	public void updatePoint(int point, int member_index) {
		memberMapper.updatePoint(point, member_index);
	}
	
	@Override
	public int mypageMemberDelete(MemberVO memberVO) throws Exception {
		int mypageMemberDelete = memberDao.mypageMemberDelete(memberVO);
		return mypageMemberDelete;
	}
	
	@Override
	public int mypageMemberModify(MemberVO memberVO) throws Exception {
		int mypageMemberModify = memberDao.mypageMemberModify(memberVO);
		return mypageMemberModify;
	}
	
	@Override
	public int mypageChangeAddress(MemberVO memberVO) throws Exception {
		int mypageChangeAddress = memberDao.mypageChangeAddress(memberVO);
		return mypageChangeAddress;
	}
	/* 여기서 부터는 관리자페이지 */
	
	// 회원 조회(페이징 + 리스트 출력)
	@Override
	public List<MemberVO> adminMemberList(SearchVO searchvo, int nowPage) throws Exception {
		
		// 페이징 처리
		PagingUtil paging = adminMemberPaging(searchvo, nowPage);
		
		// 페이징 내부 값 세팅
		paging.setDel_yn(searchvo.getDel_yn());
		paging.setSearchType(searchvo.getSearchType());
		paging.setSearchValue(searchvo.getSearchValue());
		paging.setStart(paging.getStart() - 1);
		
		return memberDao.adminMemberList(paging);
	}

	// 회원 조회(페이징)
	@Override
	public PagingUtil adminMemberPaging(SearchVO searchvo, int nowPage) throws Exception {
		int cnt = memberDao.adminMemberListCount(searchvo);
		return new PagingUtil(cnt, nowPage, 10, 5);
	}

	// 회원 추방
	@Override
	public int adminChangeMemberDel_yn(int member_index) throws Exception {
		return memberDao.adminChangeMemberDel_yn(member_index);
	}

	
	
}
 