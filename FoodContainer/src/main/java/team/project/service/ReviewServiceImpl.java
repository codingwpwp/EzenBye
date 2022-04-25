package team.project.service;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import team.project.dao.OrderProductDAO;
import team.project.dao.ReviewDAO;
import team.project.util.PagingUtil;
import team.project.vo.ProductVO;
import team.project.vo.ReviewVO;
import team.project.vo.SearchVO;

@Service
public class ReviewServiceImpl implements ReviewService {
	@Autowired
	private ReviewDAO reviewDao;

	@Override
	public int reviewInsert(ReviewVO reviewVO, MultipartFile reviewImage, int rating, HttpServletRequest request) throws Exception {
		
		// 파일명을 VO에 담기
		reviewVO.setImage(reviewImage.getOriginalFilename());
		reviewVO.setStar_count(rating);
		// 파일을 업로드 하는 과정
		String path = request.getSession().getServletContext().getRealPath("/resources/img/review");
		File dir = new File(path);
		if (!dir.exists()) dir.mkdirs();
		if (!reviewImage.getOriginalFilename().isEmpty()) reviewImage.transferTo(new File(path, reviewImage.getOriginalFilename()));
		
		return reviewDao.reviewInsert(reviewVO);
	}

	@Override
	public int revieweOk(String orderItem_index) throws Exception {
		int revieweOk = reviewDao.revieweOk(orderItem_index);
		return revieweOk;
	}

	@Override
	public List<ReviewVO> reviewList(SearchVO searchVO, int nowPage) throws Exception {
		
		PagingUtil paging = countListPaging(searchVO, nowPage);
		
		paging.setMember_index(searchVO.getMember_index());
		paging.setStart(paging.getStart() - 1);
		
		return reviewDao.reviewList(paging);
	}
	
	@Override
	public PagingUtil countListPaging(SearchVO searchVO, int nowPage) throws Exception {
		int cnt = reviewDao.countReviewList(searchVO);
		return new PagingUtil(cnt, nowPage, 10, 5);
	}

	@Override
	public int countList(int member_index) throws Exception {
		
		int countList = reviewDao.countList(member_index);
		
		return countList;
	}

	@Override
	public List<ReviewVO> review(String product_index) throws Exception {
		
		List<ReviewVO> review = reviewDao.review(product_index);
		
		return review;
	}
	
	@Override
	public List<ReviewVO> review(List<ProductVO> ProductListAll) throws Exception {
		
		List<ReviewVO> review = reviewDao.review(ProductListAll);
		
		return review;
	}
	
	@Override
	public List<ReviewVO> indexReview(List<ProductVO> popularList) throws Exception {
		
		List<ReviewVO> review = reviewDao.review(popularList);
		
		return review;
	}

	@Override
	public int viewReviewCnt(String product_index) throws Exception {
		
		return reviewDao.viewReviewCnt(product_index);
	}

	@Override
	public PagingUtil viewPaging(String product_index, int nowPage) throws Exception {
		
		int viewReviewCnt = reviewDao.viewReviewCnt(product_index);
		
		PagingUtil viewPaging = new PagingUtil(viewReviewCnt, nowPage, 5, 5);
		
		return viewPaging;
	}

	@Override
	public List<ReviewVO> viewReview(String product_index, int nowPage) throws Exception {
		
		PagingUtil pagingUtil = viewPaging(product_index, nowPage);
		
		return reviewDao.viewReview(pagingUtil);
	}
}



