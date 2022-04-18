package team.project.service;

import java.util.List;

import team.project.vo.ReplyVO;

public interface ReplyService {

	List<ReplyVO> readReply(int reply_index) throws Exception;
	public void writeReply(ReplyVO vo) throws Exception;
}
