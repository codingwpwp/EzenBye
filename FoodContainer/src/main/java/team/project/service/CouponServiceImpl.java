package team.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.project.dao.CouponDAO;
import team.project.vo.CouponVO;

@Service
public class CouponServiceImpl implements CouponService {
	@Autowired
	private CouponDAO couponDao;
	
	@Override
	public List<CouponVO> couponList(int member_index) throws Exception {
		List<CouponVO> list = couponDao.couponList(member_index);
		return list;
	}
	
	@Override
	public CouponVO couponSelectOne(int coupon_index) throws Exception {
		CouponVO couponvo = couponDao.couponSelectOne(coupon_index);
		return couponvo;
	}
}
 