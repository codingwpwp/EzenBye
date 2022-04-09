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
		
		return sqlSession.insert(Namespace+".dibsProduct",dibsVO);
	}

	public DibsVO dibsSelect(DibsVO dibsVO) {
	
		return sqlSession.selectOne(Namespace+".dibsOverlap",dibsVO);
	}
	
	
}
