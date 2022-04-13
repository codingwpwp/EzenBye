package team.project.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import team.project.vo.ReviewVO;

public interface ReviewService {
	
	int reviewInsert(ReviewVO reviewVO, MultipartFile reviewImage, int rating, HttpServletRequest request) throws Exception;
	
	int revieweOk(String orderItem_index) throws Exception;
	
	List<ReviewVO> reviewList(int member_index) throws Exception;
	
	int countList(int member_index) throws Exception;
}
