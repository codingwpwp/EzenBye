package team.project.service;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import team.project.vo.EmailVO;

@Service
public class EmailServiceImpl implements EmailService{
	
    @Inject
    JavaMailSender mailSender;
    
	@Override
	public void sendEmail(EmailVO emailvo) throws Exception {
		
		// 제목과 내용은 어쩔 수 없이 컨트롤러에서 vo에 알아서 집어 넣고 하세요.
		// 서비스 임플 파일은 절대 수정하면 안됨.
		// 그리고 메일 보내는데 시간 좀 걸림.
		
		// 두 줄은 나도 모름
        MimeMessage mail = mailSender.createMimeMessage();
        MimeMessageHelper mailHelper = new MimeMessageHelper(mail,"UTF-8");
        
        // 보내는 사람
        mailHelper.setFrom(emailvo.getSenderMail());
        // 받는 사람
        mailHelper.setTo(emailvo.getReceiveMail());
        // 제목
        mailHelper.setSubject(emailvo.getSubject());
        // 내용
        mailHelper.setText(emailvo.getMessage());
        
        // 메일 발송하기
        mailSender.send(mail);
	}
	
}
