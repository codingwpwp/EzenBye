package team.project.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import team.project.util.PagingUtil;
import team.project.vo.MessageVO;
import team.project.vo.SearchVO;

@Repository
public class MessageDAO {
	@Autowired
	private SqlSession sqlSession;
	
	private static final String Namespace = "team.project.mapper.messageMapper";
	
	public int messageListCount(SearchVO searchVO) throws Exception {
		
		return sqlSession.selectOne(Namespace+".messageListCount",searchVO);
	}
	
	public List<MessageVO> messageList(PagingUtil paging) throws Exception {
		
		return sqlSession.selectList(Namespace+".messageList",paging);
	}
	
	public MessageVO messageListDetail(int message_index) throws Exception {
		
		return sqlSession.selectOne(Namespace+".messageListDetail",message_index);
	}
	
	public void messageChooseDelete(String message_index) throws Exception {
		
		sqlSession.update(Namespace+".messageChooseDelete",message_index);
	}
	
	public void messageDelete(int message_index) throws Exception {
		
		sqlSession.update(Namespace+".messageDelete",message_index);
	}
	
	public void messageChooseRead(String message_index) throws Exception {
		
		sqlSession.update(Namespace+".messageChooseRead",message_index);
	}
	
	public void messageRead(int message_index) throws Exception {
		
		sqlSession.update(Namespace+".messageRead",message_index);
	}
	
	public int messageInsert(MessageVO vo) throws Exception{
		return sqlSession.insert(Namespace + ".messageInsert", vo);
	}
	
}
