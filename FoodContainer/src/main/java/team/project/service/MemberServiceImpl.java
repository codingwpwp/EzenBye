package team.project.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import team.project.dao.MemberDAO;
import team.project.mapper.MemberMapper;
import team.project.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDAO memberDao;
	
//	@Inject
//    PasswordEncoder passwordEncoder;
	
	@Autowired
	private MemberMapper memberMapper;
	
	@Override
	public List<MemberVO> list(MemberVO vo) throws Exception {
		
		List<MemberVO> list = memberDao.list(vo);
		
		return list;
	}
	@Override
	public MemberVO Login(MemberVO vo) throws Exception{
		MemberVO mvo= memberDao.Login(vo);
		
		return mvo;
	}
	@Override
	public int insertMember(MemberVO vo) throws Exception {
//		String encPassword = passwordEncoder.encode(vo.getPw());
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
	
}
 