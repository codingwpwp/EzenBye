package team.project.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import team.project.vo.CouponVO;

@Repository
public class CouponDAO {
	@Autowired
	private SqlSession sqlSession;
	
	private static final String Namespace = "team.project.mapper.couponMapper";
	
	public List<CouponVO> couponList(int member_index) throws Exception {
		return sqlSession.selectList(Namespace+".couponList", member_index);
	}
	
	public CouponVO couponSelectOne(int coupon_index) throws Exception {
		return sqlSession.selectOne(Namespace+".couponSelectOne", coupon_index);
	}
	
}
