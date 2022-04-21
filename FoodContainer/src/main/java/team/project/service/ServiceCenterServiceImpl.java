package team.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.project.dao.ServiceCenterDAO;
import team.project.util.PagingUtil;
import team.project.vo.SearchVO;
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
	public List<ServiceCenterVO> serviceCenterList(SearchVO searchVO, int nowPage) throws Exception {
		
		PagingUtil paging = serviceCenterListPaging(searchVO, nowPage);
		
		paging.setMember_index(searchVO.getMember_index());
	
		paging.setStart(paging.getStart() - 1);
		
		return serviceCenterDAO.serviceCenterList(paging);
	}
	
	@Override
	public PagingUtil serviceCenterListPaging(SearchVO searchVO, int nowPage) throws Exception {
		int cnt = serviceCenterDAO.countServiceCenters(searchVO);
		return new PagingUtil(cnt, nowPage, 10, 5);
	}

	@Override
	public int countServiceCenter(int member_index) throws Exception {
		
		int countServiceCenter = serviceCenterDAO.countServiceCenter(member_index);
		
		return countServiceCenter;
	}

	/* 고객센터페이지 */
	
	// 종류2에 대한 FAQ조회
	@Override
	public List<ServiceCenterVO> serviceCenterPageFAQList(String sort2) throws Exception {
		return serviceCenterDAO.serviceCenterPageFAQList(sort2);
	}
	
	// 종류2에 대한 1:1문의 페이징
	@Override
	public PagingUtil serviceCenterPagingUtil(String sort2, int nowPage) throws Exception{
		int cnt = serviceCenterDAO.serviceCenterPageListCount(sort2);
		PagingUtil paging = new PagingUtil(cnt, nowPage, 10, 8);
		paging.setStart(paging.getStart() - 1);
		return paging;
	}

	// 종류2에 대한 1:1문의 리스트 출력
	@Override
	public List<ServiceCenterVO> serviceCenterPageList(String sort2, int nowPage) throws Exception {
		PagingUtil paging = serviceCenterPagingUtil(sort2, nowPage);
		
		// 리스트 출력을 하기 위한 매퍼에 조건 값을 넣기 위해서 억지로 vo에 담는과정
		ServiceCenterVO tempvo = new ServiceCenterVO();
		tempvo.setServiceCenter_index(paging.getStart());	// start
		tempvo.setMember_index(paging.getPerPage());		// perPage
		tempvo.setSort2(sort2);								// sort2
		
		return serviceCenterDAO.serviceCenterPageList(tempvo);
	}
	
}
