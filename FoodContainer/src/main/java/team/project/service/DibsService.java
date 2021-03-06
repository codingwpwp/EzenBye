package team.project.service;

import java.util.List;

import team.project.vo.DibsVO;



public interface DibsService {
	
	int dibsInsert(DibsVO dibsVO) throws Exception;
	
	DibsVO dibsSelect(DibsVO dibsVO) throws Exception;
	
	int dibsDelete(DibsVO dibsVO) throws Exception;
	
	List<DibsVO> dibsListAll(DibsVO dibsVO) throws Exception;
	
	List<DibsVO> dibsListAllJoin(int member_index) throws Exception;
	
	int dibsListCount(int member_index) throws Exception;
}
