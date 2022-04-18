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
	public List<ReplyVO> readReply(int reply_index) throws Exception{
		return sqlSession.selectList(Namespace+".readReply",reply_index);
	}
	
	//댓글 작성
	public void writeReply(ReplyVO vo) throws Exception{
		sqlSession.insert(Namespace+".writeReply",vo);
	}
	
	
}
