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

}
