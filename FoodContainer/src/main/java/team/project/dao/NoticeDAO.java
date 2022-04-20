package team.project.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import team.project.util.PagingUtil;
import team.project.vo.NoticeVO;
import team.project.vo.SearchVO;

@Repository
public class NoticeDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final String Namespace = "team.project.mapper.noticeMapper";
	
	public int countNotice(SearchVO searchVO) throws Exception {
		
		return sqlSession.selectOne(Namespace+".countNotice",searchVO);
	}
	
	public List<NoticeVO> noticeList(PagingUtil paging) throws Exception {
		
		return sqlSession.selectList(Namespace+".noticeList",paging);
	}
	
	public NoticeVO noticeDetail(int notice_index) throws Exception {
		
		return sqlSession.selectOne(Namespace+".noticeDetail",notice_index);
	}
	
	public void noticeInsert(NoticeVO vo) throws Exception {
		
		sqlSession.insert(Namespace+".noticeInsert",vo);
	}
	
}
