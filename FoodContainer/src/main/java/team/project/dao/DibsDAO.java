package team.project.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import team.project.vo.DibsVO;
import team.project.vo.ProductVO;

@Repository
public class DibsDAO {
	@Autowired
	private SqlSession sqlSession;
	
	private static final String Namespace = "team.project.mapper.dibsMapper";
	
	public int dibsInsert(DibsVO dibsVO) throws Exception{
		
		return sqlSession.insert(Namespace+".dibsInsert",dibsVO);
	}

	public DibsVO dibsSelect(DibsVO dibsVO) {
	
		return sqlSession.selectOne(Namespace+".dibsOverlap",dibsVO);
	}
	
	public int dibsDelete(DibsVO dibsVO) throws Exception{
		
		return sqlSession.delete(Namespace+".dibsDelete",dibsVO);
	}
	
	public List<DibsVO> dibsListAll(DibsVO dibsVO) throws Exception{
		
		return sqlSession.selectList(Namespace+".dibsListAll",dibsVO);
	}
	
	public List<DibsVO> dibsListAllJoin(int member_index) throws Exception{
		
		return sqlSession.selectList(Namespace+".dibsListAllJoin",member_index);
	}
	
	
	public int dibsListCount(int member_index) throws Exception{
		
		return sqlSession.selectOne(Namespace+".dibsListCount",member_index);
	}
	
}
