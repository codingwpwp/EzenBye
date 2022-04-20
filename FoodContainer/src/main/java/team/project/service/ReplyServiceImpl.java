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
	
	//댓글 수정
	@Override
	public void updateReply(ReplyVO vo) throws Exception{
		replyDao.updateReply(vo);
	}
		
	//댓글 삭제
	@Override
	public void deleteReply(int reply_index)throws Exception{
		replyDao.deleteReply(reply_index);
	}
	
	//선택된 댓글 조회
	@Override
	public ReplyVO selectReply(int reply_index)throws Exception{
		return replyDao.selectReply(reply_index);
		
	}
}
