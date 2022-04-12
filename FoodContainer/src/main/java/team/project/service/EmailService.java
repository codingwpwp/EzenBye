package team.project.service;

import team.project.vo.EmailVO;

public interface EmailService {
	public void sendEmail(EmailVO emailvo) throws Exception;
}
