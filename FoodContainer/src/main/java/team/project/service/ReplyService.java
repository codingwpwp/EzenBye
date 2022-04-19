package team.project.service;

import java.util.List;

import team.project.vo.ReplyVO;

public interface ReplyService {

	//댓글 목록
	List<ReplyVO> replyList(ReplyVO replyvo) throws Exception;
	//댓글 작성
	public void writeReply(ReplyVO vo) throws Exception;
	
	
	//댓글 총 개수
	public int countReply() throws Exception;
}
