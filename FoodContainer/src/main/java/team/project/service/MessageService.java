package team.project.service;

import java.util.List;

import team.project.util.PagingUtil;
import team.project.vo.MessageVO;
import team.project.vo.SearchVO;

public interface MessageService {
	
	List<MessageVO> messageList(SearchVO searchVO, int nowPage) throws Exception;
	
	PagingUtil messageListPaging(SearchVO searchVO, int nowPage) throws Exception;
	
	MessageVO messageListDetail(int message_index) throws Exception;
	
	void messageChooseDelete(String message_index) throws Exception;
	
	void messageDelete(int message_index) throws Exception;
	
	void messageChooseRead(String message_index) throws Exception;
	
	void messageRead(int message_index) throws Exception;
	
	int messageInsert(MessageVO vo) throws Exception;
	
	int messageNonReadCount(int member_index) throws Exception;
}
