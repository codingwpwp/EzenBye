package team.project.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import team.project.vo.ServiceCenterVO;

@Repository
public class ServiceCenterDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final String Namespace = "team.project.mapper.serviceCenterMapper";
	
	public List<ServiceCenterVO> latelyServiceCenter(int member_index) throws Exception {
		
		return sqlSession.selectList(Namespace+".latelyServiceCenter",member_index);
	}
	
	public List<ServiceCenterVO> serviceCenterList(int member_index) throws Exception {
		
		return sqlSession.selectList(Namespace+".serviceCenterList",member_index);
	}
	
	public int countServiceCenter(int member_index) throws Exception {
		
		return sqlSession.selectOne(Namespace+".countServiceCenter",member_index);
	}
	
}
