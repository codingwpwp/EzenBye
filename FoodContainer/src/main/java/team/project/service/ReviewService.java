package team.project.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import team.project.util.PagingUtil;
import team.project.vo.ReviewVO;
import team.project.vo.SearchVO;

public interface ReviewService {
	
	int reviewInsert(ReviewVO reviewVO, MultipartFile reviewImage, int rating, HttpServletRequest request) throws Exception;
	
	int revieweOk(String orderItem_index) throws Exception;
	
	List<ReviewVO> reviewList(SearchVO searchVO, int nowPage) throws Exception;
	
	PagingUtil countListPaging(SearchVO searchVO, int nowPage) throws Exception;
	
	int countList(int member_index) throws Exception;
}
