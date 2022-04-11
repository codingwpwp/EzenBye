package team.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.project.dao.MemberDAO;
import team.project.mapper.MemberMapper;
import team.project.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDAO memberDao;
	
	@Autowired
	private MemberMapper memberMapper;
	
	@Override
	public List<MemberVO> list(MemberVO vo) throws Exception {
		
		List<MemberVO> list = memberDao.list(vo);
		
		return list;
	}
	@Override
	public MemberVO Login(MemberVO vo) throws Exception{
		// TODO Auto-generated method stub
		System.out.println(vo.getId()+"test"+vo.getPw());
		MemberVO mvo= memberDao.Login(vo);
		
		return mvo;
	}
	@Override
	public int insertMember(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
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
 