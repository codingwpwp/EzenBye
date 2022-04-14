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
	public List<ServiceCenterVO> latelyServiceCenter(int member_index) throws Exception {
		
		List<ServiceCenterVO> list = serviceCenterDAO.latelyServiceCenter(member_index);
		
		return list;
	}

	@Override
	public List<ServiceCenterVO> serviceCenterList(int member_index) throws Exception {
		
		List<ServiceCenterVO> serviceCenterList = serviceCenterDAO.serviceCenterList(member_index);
		
		return serviceCenterList;
	}

	@Override
	public int countServiceCenter(int member_index) throws Exception {
		
		int countServiceCenter = serviceCenterDAO.countServiceCenter(member_index);
		
		return countServiceCenter;
	}
}
