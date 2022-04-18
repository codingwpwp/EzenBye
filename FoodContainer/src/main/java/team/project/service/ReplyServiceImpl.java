package team.project.service;

import java.util.List;

import javax.inject.Inject;

import team.project.dao.ReplyDAO;
import team.project.vo.ReplyVO;

public class ReplyServiceImpl implements ReplyService{
	
	@Inject
	private ReplyDAO replyDao;
	
	@Override
	public List<ReplyVO> readReply(int reply_index) throws Exception{
		return replyDao.readReply(reply_index);
	}
	@Override
	public void writeReply(ReplyVO vo)throws Exception{
		replyDao.writeReply(vo);
	}
	
}
