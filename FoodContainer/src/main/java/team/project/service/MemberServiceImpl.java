package team.project.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.mysql.cj.Session;

import team.project.dao.CouponDAO;
import team.project.dao.MemberDAO;
import team.project.mapper.MemberMapper;
import team.project.util.PagingUtil;
import team.project.vo.CouponVO;
import team.project.vo.EmailVO;
import team.project.vo.MemberVO;
import team.project.vo.SearchVO;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDAO memberDao;
	@Autowired
	private MemberMapper memberMapper;
	@Autowired
	private CouponDAO couponDao;
	@Autowired
	private EmailService emailService;
	@Inject
	private BCryptPasswordEncoder PasswordEncoder;
	
	@Override
	public List<MemberVO> list(MemberVO vo) throws Exception {
		
		List<MemberVO> list = memberDao.list(vo);
		
		return list;
	}
	
	// 로그인 검증과정
	@Override
	public MemberVO Login(MemberVO vo) throws Exception{
		
		// vo의 id만 넣어서 조회하기
		MemberVO memberFromDB = memberDao.Login(vo);
		
		// id부터 없는경우
		if(memberFromDB == null) {
			return null;
		}else {// id는 일단 있는 경우
			if(PasswordEncoder.matches(vo.getPw(), memberFromDB.getPw())) {	// 비밀번호 비교해서 일치하는 경우
				memberFromDB.setPw("");
				return memberFromDB;
			}else {	// 비밀번호가 일치하지 않는 경우
				return null;
			}
		}

	}
	
	//마이페이지 개인정보 현재 비밀번호 일치하는지 판별
	@Override
	public MemberVO corretPW(MemberVO memberVO) throws Exception {
		
		MemberVO memberFromDB = memberDao.corretPW(memberVO);
		
		// id부터 없는경우
				if(memberFromDB == null) {
					return null;
				}else {// id는 일단 있는 경우
					if(PasswordEncoder.matches(memberVO.getPw1(), memberFromDB.getPw())) {	// 비밀번호 비교해서 일치하는 경우
						memberFromDB.setPw("");
						return memberFromDB;
					}else {	// 비밀번호가 일치하지 않는 경우
						return null;
					}
				}
	}
	
	//마이페이지 비밀번호 변경
	@Override
	public int modifyPW(MemberVO memberVO) throws Exception {
		
		memberVO.setPw(PasswordEncoder.encode(memberVO.getPw()));
		
		return memberDao.modifyPW(memberVO);
	}
	
	@Override
	public void insertMember(MemberVO vo) throws Exception {
		vo.setPw(PasswordEncoder.encode(vo.getPw()));
		 memberDao.insertMember(vo);
		 //추천인포인트
		 if(vo.getRecommender()!=null && !vo.getRecommender().equals("")) {
			 memberDao.updateRecom(vo);
		 }
		
	}
	
	@Override
	public String idChk(String id) throws Exception{
		String result = memberDao.idChk(id);
		return result;
	}
	
	@Override
	public String nickChk(String nickname)throws Exception{
		String result = memberDao.nickChk(nickname);
		return result;
	}
	@Override
	public String recomChk(String id)throws Exception{
		String result = memberDao.recomChk(id);
		return result;
	}
	
	public String pwChk(String pw)throws Exception{
		String result = memberDao.pwChk(pw);
		return result;
	}
	
	@Override
	public MemberVO memberInfor(int member_index) throws Exception {
		MemberVO memberInfor = memberDao.memberInfor(member_index);
		return memberInfor;
	}
	@Override
	public void updatePoint(int point, int member_index) {
		memberMapper.updatePoint(point, member_index);
	}
	
	@Override
	public int mypageMemberDelete(MemberVO memberVO) throws Exception {
		int mypageMemberDelete = memberDao.mypageMemberDelete(memberVO);
		return mypageMemberDelete;
	}
	
	@Override
	public int mypageMemberModify(MemberVO memberVO) throws Exception {
		int mypageMemberModify = memberDao.mypageMemberModify(memberVO);
		return mypageMemberModify;
	}
	
	@Override
	public int mypageChangeAddress(MemberVO memberVO) throws Exception {
		int mypageChangeAddress = memberDao.mypageChangeAddress(memberVO);
		return mypageChangeAddress;
	}

	/* 로그인 페이지 */
	// 간편 아이디 찾기
	@Override
	public MemberVO idEasyCheck(MemberVO membervo) throws Exception {
		MemberVO tempMember = memberDao.idEasyCheck(membervo);
		if(tempMember != null) {
			String id = tempMember.getId();
			String tempId = id.substring(0, 4);
			String tempId2 = id.substring(4, id.length());
			String stars = "";
			for(int i = 0; i < tempId2.length(); i++) {
				stars += "*";
			}
			tempMember.setId(tempId + stars);
		}
		
		return tempMember;
	}
	
	// 이메일 아이디 찾기
	@Override
	public MemberVO emailEasyCheck(MemberVO membervo) throws Exception {
		return memberDao.emailEasyCheck(membervo);
	}
	

	// 비밀번호 찾기 페이지
	// 인증번호 발송(회원 존재하는지 여부도 따짐)
	@Override
	public String checkPwAndSendEmail(MemberVO membervo) throws Exception {
		
		int result = memberDao.pwCheckYN(membervo);
		if(result != 1) {
			return "none";
		}else {
			EmailVO evo = new EmailVO();
			evo.setSubject("FoodContainer 비밀번호 찾기 이메일 인증번호");
			evo.setReceiveMail(membervo.getEmail());
			
			// 인증번호 생성
			String randomBox = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
			String randomNum = "";
			for(int i = 0; i < 6; i++) {
				int randomIndex = (int)(Math.random() * randomBox.length());
				randomNum += randomBox.substring(randomIndex, randomIndex + 1);
			}
			
			// 이메일 내용에 인증번호 넣기
			String message = "인증번호는 " + randomNum + " 입니다. 3분이내에 입력하세요.";
			evo.setMessage(message);
			
			emailService.sendEmail(evo);
			
			return randomNum;
		}
	}
	
	// 임시 비밀번호 발송
	@Override
	public MemberVO sendTempPw(MemberVO membervo) throws Exception {
		
		// 임시 비밀번호로 변경
		String randomAlpha = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
		String randomNum = "0123456789";
		String randomSpecial = "!@#$%^&*()";
		String randomTempPw = "";
		for(int i = 0; i < 15; i++) {
			if(i > 12) {
				int randomIndex = (int)(Math.random() * randomSpecial.length());
				randomTempPw += randomSpecial.substring(randomIndex, randomIndex + 1);
			}else if(i > 7 && i <= 12) {
				int randomIndex = (int)(Math.random() * randomNum.length());
				randomTempPw += randomNum.substring(randomIndex, randomIndex + 1);
			}else {
				int randomIndex = (int)(Math.random() * randomAlpha.length());
				randomTempPw += randomAlpha.substring(randomIndex, randomIndex + 1);
			}
		}
		
		membervo.setPw(PasswordEncoder.encode(randomTempPw));
		
		memberDao.changeTempPw(membervo);
		
		// 이제 임시 비밀번호를 이메일로 전송
		// membervo.setPhone(randomTempPw);
		
		EmailVO evo = new EmailVO();
		evo.setSubject("FoodContainer " + membervo.getName() + "님의 임시 비밀번호입니다");
		evo.setReceiveMail(membervo.getEmail());
		String message = "임시 비밀번호는 " + randomTempPw + " 입니다. 현재 비밀번호는 입력 할 수 없습니다. 로그인 이후 변경을 권장합니다.";
		evo.setMessage(message);
		emailService.sendEmail(evo);
		
		return membervo;
	}
	
	/* 여기서 부터는 관리자페이지 */
	
	// 회원 조회(페이징 + 리스트 출력)
	@Override
	public List<MemberVO> adminMemberList(SearchVO searchvo, int nowPage) throws Exception {
		
		// 페이징 처리
		PagingUtil paging = adminMemberPaging(searchvo, nowPage);
		
		// 페이징 내부 값 세팅
		paging.setDel_yn(searchvo.getDel_yn());
		paging.setSearchType(searchvo.getSearchType());
		paging.setSearchValue(searchvo.getSearchValue());
		paging.setStart(paging.getStart() - 1);
		
		return memberDao.adminMemberList(paging);
	}

	// 회원 조회(페이징)
	@Override
	public PagingUtil adminMemberPaging(SearchVO searchvo, int nowPage) throws Exception {
		int cnt = memberDao.adminMemberListCount(searchvo);
		return new PagingUtil(cnt, nowPage, 10, 5);
	}

	// 회원 추방
	@Override
	public int adminChangeMemberDel_yn(int member_index) throws Exception {
		return memberDao.adminChangeMemberDel_yn(member_index);
	}

	/* 이벤트 페이지 */
	// 룰렛 돌리기 전에 티켓 체크
	@Override
	public String eventTicket(int member_index) throws Exception {
		int ticket = memberDao.eventTicketCheck(member_index);
		if(ticket <= 0) {
			return "noTicket";
		}else {
			memberDao.eventTicketMinus(member_index);
			int gacha = (int)(Math.random() * 100) + 1;
			
//			int[] gachaArr = new int[1000];
//			for(int i = 0; i < gachaArr.length; i++) {
//				int g = (int)(Math.random() * 100) + 1;
//				gachaArr[i] = g;
//			}
//			
//			
//			int r170 = 0;
//			int r7180 = 0;
//			int r8188 = 0;
//			int r8998 = 0;
//			int r99100 = 0;
//			for(int i = 0; i < gachaArr.length; i++) {
//				
//				if(gachaArr[i] >= 1 && gachaArr[i] <= 35) {			// 10p
//					r170++;
//				}else if(gachaArr[i] >= 36 && gachaArr[i] <= 70) {	// 10p
//					r170++;
//				}else if(gachaArr[i] >= 71 && gachaArr[i] <= 80) {	// 5%쿠폰
//					r7180++;
//				}else if(gachaArr[i] >= 81 && gachaArr[i] <= 88) {	// 10%쿠폰
//					r8188++;
//				}else if(gachaArr[i] >= 89 && gachaArr[i] <= 98) {	// 1,000p
//					r8998++;
//				}else{									// 50,000p
//					r99100++;
//				}
//				
//			}
//			System.out.println(r170 + "번 나옴");
//			System.out.println(r7180 + "번 나옴");
//			System.out.println(r8188 + "번 나옴");
//			System.out.println(r8998 + "번 나옴");
//			System.out.println(r99100 + "번 나옴");

			
			if(gacha >= 1 && gacha <= 35) {			// 10p
				return "6";
			}else if(gacha >= 36 && gacha <= 70) {	// 10p
				return "5";
			}else if(gacha >= 71 && gacha <= 80) {	// 5%쿠폰
				return "2";
			}else if(gacha >= 81 && gacha <= 88) {	// 10%쿠폰
				return "1";
			}else if(gacha >= 89 && gacha <= 98) {	// 1,000p
				return "3";
			}else{									// 50,000p
				return "4";
			}
		}
	}
	
	// 이벤트 결과에 따라 지급
	@Override
	public void eventResult(HttpServletRequest request, String r) throws Exception {
		int result = Integer.parseInt(r);
		int point = 0;
		String title = "";
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO)session.getAttribute("member");
		
		if(result == 3) {
			point = 1000;
		}else if(result == 4) {
			point = 50000;
		}else if(result == 5 || result == 6) {
			point = 10;
		}
		
		if(point == 0) {	// 쿠폰의 경우
			if(result == 1) {
				title = "룰렛 이벤트 10%쿠폰";
				point = 10;
			}else {
				title = "룰렛 이벤트 5%쿠폰";
				point = 5;
			}
			CouponVO couponvo = new CouponVO();
			couponvo.setMember_index(member.getMember_index());
			couponvo.setCoupon_title(title);
			couponvo.setDiscount_percent(point);
			couponDao.eventCouponInsert(couponvo);
			
		}else {
			memberMapper.updatePoint(point, member.getMember_index());
		}
		
	}

	@Override
	public List<MemberVO> MemberList(MemberVO memberVO) throws Exception {
		
		List<MemberVO> MemberList = memberDao.MemberList(memberVO);
		
		return MemberList;
	}
	
}
 