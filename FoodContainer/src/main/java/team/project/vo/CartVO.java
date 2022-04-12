package team.project.vo;

public class CartVO extends ProductVO{
	private int cart_index;
	private String product_index;
	private int member_index;
	private int cart_count = 1;
	private String cart_date;
	
	public int getCart_index() {
		return cart_index;
	}
	public void setCart_index(int cart_index) {
		this.cart_index = cart_index;
	}
	public String getProduct_index() {
		return product_index;
	}
	public void setProduct_index(String product_index) {
		this.product_index = product_index;
	}
	public int getMember_index() {
		return member_index;
	}
	public void setMember_index(int member_index) {
		this.member_index = member_index;
	}
	public int getCart_count() {
		return cart_count;
	}
	public void setCart_count(int cart_count) {
		this.cart_count = cart_count;
	}
	public String getCart_date() {
		return cart_date;
	}
	public void setCart_date(String cart_date) {
		this.cart_date = cart_date;
	}
}
