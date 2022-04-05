package team.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.project.dao.ServiceCenterDAO;
import team.project.vo.ServiceCenterVO;

@Service
public class ServiceCenterServiceImpl implements ServiceCenterService {
	@Autowired
	private ServiceCenterDAO serviceCenterDAO;
	
	@Override
	public List<ServiceCenterVO> list(int member_index) throws Exception {
		
		List<ServiceCenterVO> list = serviceCenterDAO.list(member_index);
		
		return list;
	}
}
