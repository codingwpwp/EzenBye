package team.project.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import team.project.vo.ReplyVO;

@Repository
public class ReplyDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final String Namespace = "team.project.mapper.replyMapper";
	//댓글 목록
	public List<ReplyVO> replyList(ReplyVO replyvo) throws Exception{
		return sqlSession.selectList(Namespace+".replyList",replyvo);
	}
	
	//댓글 작성
	public void writeReply(ReplyVO vo) throws Exception{
		sqlSession.insert(Namespace+".writeReply",vo);
	}
	//댓글 총 개수
	public int countReply() throws Exception{
		return sqlSession.selectOne(Namespace+".countReply");
	}
	
	
	
	//댓글 수정
	public void updateReply(ReplyVO vo) throws Exception{
		sqlSession.update(Namespace+".updateReply",vo);
	}
	
	//댓글 삭제
	public void deleteReply(ReplyVO vo) throws Exception{
		sqlSession.delete(Namespace+".deleteReply",vo);
	}
}
