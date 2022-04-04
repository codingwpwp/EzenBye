package team.project.vo;

public class CouponVO {
	private int coupon_index;
	private int member_index;
	private String make_date;
	private String coupon_title;
	private int discount_percent;
	public int getCoupon_index() {
		return coupon_index;
	}
	public void setCoupon_index(int coupon_index) {
		this.coupon_index = coupon_index;
	}
	public int getMember_index() {
		return member_index;
	}
	public void setMember_index(int member_index) {
		this.member_index = member_index;
	}
	public String getMake_date() {
		return make_date;
	}
	public void setMake_date(String make_date) {
		this.make_date = make_date;
	}
	public String getCoupon_title() {
		return coupon_title;
	}
	public void setCoupon_title(String coupon_title) {
		this.coupon_title = coupon_title;
	}
	public int getDiscount_percent() {
		return discount_percent;
	}
	public void setDiscount_percent(int discount_percent) {
		this.discount_percent = discount_percent;
	}	
}
