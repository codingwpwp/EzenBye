package team.project.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import team.project.vo.MemberVO;

public interface MemberService {
	List<MemberVO> list(MemberVO vo) throws Exception;

	public MemberVO Login(MemberVO vo) throws Exception;
	
	int insertMember(MemberVO vo) throws Exception;
	
	String idChk(String id) throws Exception;
	
	String nickChk(String nickname)throws Exception;
	
	String recomChk(String id) throws Exception;
	
	MemberVO memberInfor(int member_index) throws Exception;
	
	public void updatePoint(int point, int member_index);
}
