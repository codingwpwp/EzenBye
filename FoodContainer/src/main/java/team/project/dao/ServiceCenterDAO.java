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
	
	public List<ServiceCenterVO> list(int member_index) throws Exception {
		
		return sqlSession.selectList(Namespace+".latelyServiceCenter",member_index);
	}
	
}
