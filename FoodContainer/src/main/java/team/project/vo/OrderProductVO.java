package team.project.vo;

public class OrderProductVO extends ProductVO{
	private String member_order_index;
	private String no_member_order_index;
	private String orderItem_index;
	private String product_index;
	private int quantity;
	private int price;
	private String order_status;
	private int point;
	private String buy_YN;
	
	public String getMember_order_index() {
		return member_order_index;
	}
	public void setMember_order_index(String member_order_index) {
		this.member_order_index = member_order_index;
	}
	public String getNo_member_order_index() {
		return no_member_order_index;
	}
	public void setNo_member_order_index(String no_member_order_index) {
		this.no_member_order_index = no_member_order_index;
	}
	public String getOrderItem_index() {
		return orderItem_index;
	}
	public void setOrderItem_index(String orderItem_index) {
		this.orderItem_index = orderItem_index;
	}
	public String getProduct_index() {
		return product_index;
	}
	public void setProduct_index(String product_index) {
		this.product_index = product_index;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getOrder_status() {
		return order_status;
	}
	public void setOrder_status(String order_status) {
		this.order_status = order_status;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public String getBuy_YN() {
		return buy_YN;
	}
	public void setBuy_YN(String buy_YN) {
		this.buy_YN = buy_YN;
	}
	
}
