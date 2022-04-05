package team.project.service;

import java.util.List;

import team.project.vo.ServiceCenterVO;

public interface ServiceCenterService {
	List<ServiceCenterVO> list(int member_index) throws Exception;
}
