package team.project.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import team.project.vo.ReviewVO;

@Repository
public class ReviewDAO {
	@Autowired
	private SqlSession sqlSession;
	
	private static final String Namespace = "team.project.mapper.reviewMapper";
	
	public int reviewInsert(ReviewVO reviewVO) throws Exception {
		return sqlSession.insert(Namespace + ".reviewInsert", reviewVO);
	}
	
	public int revieweOk(String orderItem_index) throws Exception {
		return sqlSession.update(Namespace + ".revieweOk", orderItem_index);
	}
}
