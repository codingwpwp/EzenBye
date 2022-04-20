package team.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.project.dao.NoticeDAO;
import team.project.util.PagingUtil;
import team.project.vo.NoticeVO;
import team.project.vo.SearchVO;

@Service
public class NoticeServiceImpl implements NoticeService {
	@Autowired
	private NoticeDAO noticeDAO;

	@Override
	public List<NoticeVO> noticeList(SearchVO searchVO, int nowPage) throws Exception {
		PagingUtil paging = noticeListPaging(searchVO, nowPage);
	
		paging.setStart(paging.getStart() - 1);
		
		return noticeDAO.noticeList(paging);
	}

	@Override
	public PagingUtil noticeListPaging(SearchVO searchVO, int nowPage) throws Exception {
		int cnt = noticeDAO.countNotice(searchVO);
		return new PagingUtil(cnt, nowPage, 10, 5);
	}

	@Override
	public NoticeVO noticeDetail(int notice_index) throws Exception {
		NoticeVO noticeDetail = noticeDAO.noticeDetail(notice_index);
		return noticeDetail;
	}

	@Override
	public void noticeInsert(NoticeVO vo) throws Exception {
		noticeDAO.noticeInsert(vo);
	}
	
	
}
 