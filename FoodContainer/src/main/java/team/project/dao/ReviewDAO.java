package team.project.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import team.project.util.PagingUtil;
import team.project.util.PagingUtil2;
import team.project.vo.ProductVO;
import team.project.vo.ReviewVO;
import team.project.vo.SearchVO;

@Repository
public class ReviewDAO {
	@Autowired
	private SqlSession sqlSession;
	
	private static final String Namespace = "team.project.mapper.reviewMapper";
	
	public int reviewInsert(ReviewVO reviewVO) throws Exception {
		return sqlSession.insert(Namespace + ".reviewInsert", reviewVO);
	}
	
	public int revieweOk(String orderItem_index) throws Exception {
		return sqlSession.update(Namespace + ".revieweOk", orderItem_index);
	}
	
	public int countList(int member_index) throws Exception {
		return sqlSession.selectOne(Namespace + ".countList", member_index);
	}
	
	public int countReviewList(SearchVO searchVO) throws Exception {
		return sqlSession.selectOne(Namespace + ".countReviewList", searchVO);
	}
	
	public List<ReviewVO> reviewList(PagingUtil paging) throws Exception {
		return sqlSession.selectList(Namespace + ".reviewList", paging);
	}
	
	public List<ReviewVO> review(String product_index) throws Exception {
		return sqlSession.selectList(Namespace + ".viewReviewList", product_index);
	}
	
	public List<ReviewVO> viewReview(PagingUtil2 pagingUtil) throws Exception {
		return sqlSession.selectList(Namespace + ".viewReivewPaging", pagingUtil);
	}
	
	public List<ReviewVO> review(List<ProductVO> ProductListAll) throws Exception {
		return sqlSession.selectList(Namespace + ".viewReviewListArr", ProductListAll);
	}
	
	public List<ReviewVO> indexReview(List<ProductVO> popularList) throws Exception {
		return sqlSession.selectList(Namespace + ".viewReviewListArr", popularList);
	}
	
	public int viewReviewCnt(String product_index) throws Exception {
		return sqlSession.selectOne(Namespace + ".viewReviewCnt", product_index);
	}
	
	public List<ReviewVO> viewReivewPaging(String product_index) throws Exception {
		return sqlSession.selectList(Namespace + ".viewReivewPaging", product_index);
	}
}
