package team.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.project.vo.EmailVO;
import team.project.vo.MemberVO;
@Service
public class SignServiceImpl implements SignService{
	@Autowired
	private EmailService emailService;
	
	@Override
	public String emailsend(MemberVO vo)throws Exception{
		
		EmailVO evo = new EmailVO();
		evo.setSubject("FoodContainer " + vo.getName() + "님의 이메일로 인증번호를 발송 하였습니다.");
		evo.setReceiveMail(vo.getEmail());
		
		String randomBox = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
		String randomNum = "";
		for(int i = 0; i < 6; i++) {
			int randomIndex = (int)(Math.random() * randomBox.length());
			randomNum += randomBox.substring(randomIndex, randomIndex + 1);
		}

		
		
		
		String message="인증번호는"+randomNum+"입니다.";
		evo.setMessage(message);
		emailService.sendEmail(evo);
		
		return randomNum;
		
		
		
	}
}
