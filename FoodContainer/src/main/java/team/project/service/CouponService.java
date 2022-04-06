package team.project.service;

import java.util.List;

import team.project.vo.CouponVO;

public interface CouponService {
	List<CouponVO> couponList(int member_index) throws Exception;
	
	CouponVO couponSelectOne(int coupon_index) throws Exception;
	
	int mypageCouponCount(int member_index) throws Exception;

}
