package team.project.service;

import java.util.List;

import team.project.vo.MemberVO;

public interface MemberService {
	List<MemberVO> list(MemberVO vo) throws Exception;
}
