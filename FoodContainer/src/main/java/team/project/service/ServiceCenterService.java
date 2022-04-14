package team.project.service;

import java.util.List;

import team.project.vo.ServiceCenterVO;

public interface ServiceCenterService {
	List<ServiceCenterVO> latelyServiceCenter(int member_index) throws Exception;
	
	List<ServiceCenterVO> serviceCenterList(int member_index) throws Exception;
	
	int countServiceCenter(int member_index) throws Exception;
}
