package team.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.project.dao.MessageDAO;
import team.project.vo.MessageVO;

@Service
public class MessageServiceImpl implements MessageService {
	@Autowired
	private MessageDAO messageDAO;

	@Override
	public List<MessageVO> messageList(int member_index) throws Exception {
		
		List<MessageVO> messageList = messageDAO.messageList(member_index);
		
		return messageList;
	}

}



