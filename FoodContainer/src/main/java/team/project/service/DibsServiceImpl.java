package team.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.project.dao.DibsDAO;
import team.project.vo.DibsVO;

@Service
public class DibsServiceImpl implements DibsService {
	
	@Autowired
	private DibsDAO dibsDAO;

	@Override
	public int dibsInsert(DibsVO dibsVO) throws Exception {
		
		return dibsDAO.dibsInsert(dibsVO);
	}

	@Override
	public DibsVO dibsSelect(DibsVO dibsVO) throws Exception {
		
		return dibsDAO.dibsSelect(dibsVO);
	}

	@Override
	public int dibsDelete(DibsVO dibsVO) throws Exception {
		
		return dibsDAO.dibsDelete(dibsVO);
	}

	@Override
	public List<DibsVO> dibsListAll(DibsVO dibsVO) throws Exception {
		
		List<DibsVO> dibsListAll = dibsDAO.dibsListAll(dibsVO);
		
		return dibsListAll;
	}

	@Override
	public List<DibsVO> dibsListAllJoin(int member_index) throws Exception {
		
		List<DibsVO> dibsListAllJoin = dibsDAO.dibsListAllJoin(member_index);
		
		return dibsListAllJoin;
	}

	@Override
	public int dibsListCount(int member_index) throws Exception {
		int dibsListCount = dibsDAO.dibsListCount(member_index);
		return dibsListCount;
	}

	



}
