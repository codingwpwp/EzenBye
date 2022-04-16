package team.project.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import team.project.vo.MessageVO;

@Repository
public class MessageDAO {
	@Autowired
	private SqlSession sqlSession;
	
	private static final String Namespace = "team.project.mapper.messageMapper";
	
	public List<MessageVO> messageList(int member_index) throws Exception {
		
		return sqlSession.selectList(Namespace+".messageList",member_index);
	}
	
	
}
