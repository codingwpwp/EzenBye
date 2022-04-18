package team.project.service;

import java.util.List;

import team.project.util.PagingUtil;
import team.project.vo.SearchVO;
import team.project.vo.ServiceCenterVO;

public interface ServiceCenterService {
	List<ServiceCenterVO> latelyServiceCenter(int member_index) throws Exception;
	
	List<ServiceCenterVO> serviceCenterList(SearchVO searchVO, int nowPage) throws Exception;
	
	PagingUtil serviceCenterListPaging(SearchVO searchVO, int nowPage) throws Exception;
	
	int countServiceCenter(int member_index) throws Exception;
}
