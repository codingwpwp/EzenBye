package team.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.project.dao.MessageDAO;
import team.project.util.PagingUtil;
import team.project.vo.MessageVO;
import team.project.vo.SearchVO;

@Service
public class MessageServiceImpl implements MessageService {
	@Autowired
	private MessageDAO messageDAO;

	@Override
	public List<MessageVO> messageList(SearchVO searchVO, int nowPage) throws Exception {
		// 페이징 처리
		PagingUtil paging = messageListPaging(searchVO, nowPage);
		
		// 페이징 내부 값 세팅
		paging.setMember_index(searchVO.getMember_index());
		paging.setDel_yn(searchVO.getDel_yn());
		paging.setSearchType(searchVO.getSearchType());
		paging.setSearchValue(searchVO.getSearchValue());
		paging.setStart(paging.getStart() - 1);
		
		return messageDAO.messageList(paging);
	}

	@Override
	public PagingUtil messageListPaging(SearchVO searchVO, int nowPage) throws Exception {
		int cnt = messageDAO.messageListCount(searchVO);
		return new PagingUtil(cnt, nowPage, 10, 5);
	}

	@Override
	public MessageVO messageListDetail(int message_index) throws Exception {
		
		MessageVO messageListDetail = messageDAO.messageListDetail(message_index);
		
		return messageListDetail;
	}

	@Override
	public void messageChooseDelete(String message_index) throws Exception {
		
		messageDAO.messageChooseDelete(message_index);
	}

	@Override
	public void messageDelete(int message_index) throws Exception {
		
		messageDAO.messageDelete(message_index);
		
	}

	@Override
	public void messageChooseRead(String message_index) throws Exception {
		
		messageDAO.messageChooseRead(message_index);
		
	}

	@Override
	public void messageRead(int message_index) throws Exception {
		
		messageDAO.messageRead(message_index);
		
	}

	@Override
	public int messageInsert(MessageVO vo) throws Exception {
		return messageDAO.messageInsert(vo);
	}

	@Override
	public int messageNonReadCount(int member_index) throws Exception {
		int messageNonReadCount = messageDAO.messageNonReadCount(member_index);
		return messageNonReadCount;
	}


}



