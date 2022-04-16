package team.project.service;

import java.util.List;

import team.project.vo.MessageVO;

public interface MessageService {
	
	List<MessageVO> messageList(int member_index) throws Exception;
	
}
