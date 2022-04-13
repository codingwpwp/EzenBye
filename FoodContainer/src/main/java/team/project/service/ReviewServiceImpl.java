package team.project.service;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import team.project.dao.OrderProductDAO;
import team.project.dao.ReviewDAO;
import team.project.vo.ReviewVO;

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
	public List<ReviewVO> reviewList(int member_index) throws Exception {
		
		List<ReviewVO> reviewList = reviewDao.reviewList(member_index);
		
		return reviewList;
	}

	@Override
	public int countList(int member_index) throws Exception {
		
		int countList = reviewDao.countList(member_index);
		
		return countList;
	}
}



