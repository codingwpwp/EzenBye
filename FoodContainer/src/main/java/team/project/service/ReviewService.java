package team.project.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import team.project.util.PagingUtil;
import team.project.util.PagingUtil2;
import team.project.vo.ProductVO;
import team.project.vo.ReviewVO;
import team.project.vo.SearchVO;

public interface ReviewService {
	
	int reviewInsert(ReviewVO reviewVO, MultipartFile reviewImage, int rating, HttpServletRequest request) throws Exception;
	
	int revieweOk(String orderItem_index) throws Exception;
	
	List<ReviewVO> reviewList(SearchVO searchVO, int nowPage) throws Exception;
	
	PagingUtil countListPaging(SearchVO searchVO, int nowPage) throws Exception;
	
	int countList(int member_index) throws Exception;
	
	List<ReviewVO> review(String product_index) throws Exception;
	
	List<ReviewVO> viewReview(String product_index, int nowPage) throws Exception;
	
	List<ReviewVO> review(List<ProductVO> ProductListAll) throws Exception;
	
	List<ReviewVO> indexReview(List<ProductVO> popularList) throws Exception;
	
	int viewReviewCnt(String product_index) throws Exception;

	PagingUtil2 viewPaging(String product_index, int nowPageI) throws Exception;
	
}
