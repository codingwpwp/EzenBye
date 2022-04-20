package team.project.service;

import java.util.List;

import team.project.util.PagingUtil;
import team.project.vo.NoticeVO;
import team.project.vo.SearchVO;

public interface NoticeService {
	
	List<NoticeVO> noticeList(SearchVO searchVO, int nowPage) throws Exception;
	
	PagingUtil noticeListPaging(SearchVO searchVO, int nowPage) throws Exception;
	
	NoticeVO noticeDetail(int notice_index) throws Exception;
	
	void noticeInsert(NoticeVO vo) throws Exception;
}
