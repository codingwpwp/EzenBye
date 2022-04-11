package team.project.vo;

public class OrdersVO extends CouponVO{
	private String member_order_index;
	private int member_index;
	private String address;
	private String reciever;
	private String phone;
	private String request;
	private String delivery_free_YN;
	private int used_point;
	public int getUsed_point() {
		return used_point;
	}
	public void setUsed_point(int used_point) {
		this.used_point = used_point;
	}
	private int coupon_index;
	private int pay_price;
	private String order_date;
	
	public String getMember_order_index() {
		return member_order_index;
	}
	public void setMember_order_index(String member_order_index) {
		this.member_order_index = member_order_index;
	}
	public int getMember_index() {
		return member_index;
	}
	public void setMember_index(int member_index) {
		this.member_index = member_index;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getReciever() {
		return reciever;
	}
	public void setReciever(String reciever) {
		this.reciever = reciever;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getRequest() {
		return request;
	}
	public void setRequest(String request) {
		this.request = request;
	}
	public String getDelivery_free_YN() {
		return delivery_free_YN;
	}
	public void setDelivery_free_YN(String delivery_free_YN) {
		this.delivery_free_YN = delivery_free_YN;
	}
	public int getCoupon_index() {
		return coupon_index;
	}
	public void setCoupon_index(int coupon_index) {
		this.coupon_index = coupon_index;
	}
	public int getPay_price() {
		return pay_price;
	}
	public void setPay_price(int pay_price) {
		this.pay_price = pay_price;
	}
	public String getOrder_date() {
		return order_date;
	}
	public void setOrder_date(String order_date) {
		this.order_date = order_date;
	}
	
	
}
