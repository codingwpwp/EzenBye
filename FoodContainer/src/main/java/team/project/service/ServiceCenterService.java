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
	
	
	/* 고객센터 */
	// 종류2에 대한 FAQ조회
	List<ServiceCenterVO> serviceCenterPageFAQList(String sort2) throws Exception;
	
	// 종류2에 대한 1:1문의 리스트 출력
	List<ServiceCenterVO> serviceCenterPageList(String sort2, int nowPage) throws Exception;
	
	// 종류2에 대한 1:1문의 페이징
	PagingUtil serviceCenterPagingUtil(String sort2, int nowPage) throws Exception;
	
}
