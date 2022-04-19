package team.project.service;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import team.project.dao.BannerDAO;
import team.project.vo.BannerVO;

@Service
public class BannerServiceImpl implements BannerService {
	
	@Autowired
	private BannerDAO bannerDao;
	
	// 관리자메인 페이지 배너
	@Override
	public List<BannerVO> adminMainBanner() throws Exception {
		return bannerDao.adminMainBanner();
	}
	
	// 배너 조회
	@Override
	public List<BannerVO> bannerList() throws Exception {
		List<BannerVO> bList = bannerDao.bannerList();
		
		return bList;
	}
	
	// 배너 등록
	@Override
	public int bannerInsert(BannerVO bannervo, MultipartFile bannerFile, HttpServletRequest request) throws Exception {
		
		// 파일명을 VO에 담기
		bannervo.setImage(bannerFile.getOriginalFilename());
		
		// 파일을 업로드 하는 과정
		String path = request.getSession().getServletContext().getRealPath("/resources/img/배너");
		File dir = new File(path);
		if (!dir.exists()) dir.mkdirs();
		if (!bannerFile.getOriginalFilename().isEmpty()) bannerFile.transferTo(new File(path, bannerFile.getOriginalFilename()));
		
		return bannerDao.bannerInsert(bannervo);
	}

	// 배너 수정
	@Override
	public int bannerModify(BannerVO bannervo, MultipartFile bannerFile, HttpServletRequest request) throws Exception {
		
		// 파일명을 VO에 담기
		bannervo.setImage(bannerFile.getOriginalFilename());
		
		// 파일을 업로드 하는 과정
		String path = request.getSession().getServletContext().getRealPath("/resources/img/배너");
		File dir = new File(path);
		if (!dir.exists()) dir.mkdirs();
		if (!bannerFile.getOriginalFilename().isEmpty()) bannerFile.transferTo(new File(path, bannerFile.getOriginalFilename()));
		
		return bannerDao.bannerUpdate(bannervo);
	}

	// 배너 삭제
	@Override
	public int bannerDelete(int[] bannerIndexArr) throws Exception {
		
		// list타입으로 변환하는 과정
		List<Integer> bannerIndexList = new ArrayList<Integer>();
		if(bannerIndexArr.length != 0) {
			for(int i = 0; i < bannerIndexArr.length; i++){
				bannerIndexList.add(bannerIndexArr[i]);
			}
		}
		
		return bannerDao.bannerDelete(bannerIndexList);
	}
	
	//메인
	@Override
	public List<BannerVO> mainBannerList(BannerVO bannerVO) throws Exception {
		List<BannerVO> mainBannerList = bannerDao.mainBannerList(bannerVO);
		return mainBannerList;
	}

}
 