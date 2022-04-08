package team.project.service;

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
		
		return dibsDAO.dibsInsert(dibsVO) ;
	}



}
