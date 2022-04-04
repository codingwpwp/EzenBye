package team.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.project.dao.MemberDAO;
import team.project.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDAO memberDao;
	
	@Override
	public List<MemberVO> list(MemberVO vo) throws Exception {
		
		List<MemberVO> list = memberDao.list(vo);
		
		return list;
	}
	@Override
	public int Login(MemberVO vo) throws Exception{
		// TODO Auto-generated method stub
		return memberDao.Login(vo);
	}
}
