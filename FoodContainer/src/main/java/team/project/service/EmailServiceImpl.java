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
        
        MimeMessage mail = mailSender.createMimeMessage();
        MimeMessageHelper mailHelper = new MimeMessageHelper(mail,"UTF-8");
        
        mailHelper.setFrom(emailvo.getSenderMail());
        mailHelper.setTo(emailvo.getReceiveMail());
        mailHelper.setSubject(emailvo.getSubject());
        mailHelper.setText(emailvo.getMessage());
        
        mailSender.send(mail);
	}
	
}
