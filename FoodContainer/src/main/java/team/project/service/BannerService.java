package team.project.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import team.project.vo.BannerVO;

public interface BannerService {
	
	List<BannerVO> bannerList() throws Exception;
	
	void bannerInsert(BannerVO bannervo, MultipartFile bannerFile, HttpServletRequest request) throws Exception;
	
	int bannerDelete(int[] bannerIndexArr) throws Exception;
	
}
