package team.project.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.project.dao.ReplyDAO;
import team.project.vo.ReplyVO;
@Service
public class ReplyServiceImpl implements ReplyService{
	
	@Autowired
	private ReplyDAO replyDao;
	
	@Override
	public List<ReplyVO> replyList(ReplyVO replyvo) throws Exception{
		return replyDao.replyList(replyvo);
	}
	@Override
	public void writeReply(ReplyVO vo)throws Exception{
		replyDao.writeReply(vo);
	}
	@Override
	public int countReply() throws Exception{
		return replyDao.countReply();
	}
}
