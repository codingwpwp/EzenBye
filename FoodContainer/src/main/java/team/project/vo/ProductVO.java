package team.project.vo;


public class ProductVO {

	private String product_index;
	private String bigSort;
	private String middleSort;
	private String product_name;
	private int origin_price;
	private int sale_price = -1;
	private String brand;
	private int inventory;
	private int quantity;
	private String delivery_free_YN;
	private String thumbnail_image;
	private String detail_image;
	private String product_date;
	private String modify_YN;
	private String modify_date;
	private String del_YN;
	
	public String getProduct_index() {
		return product_index;
	}
	public void setProduct_index(String product_index) {
		this.product_index = product_index;
	}
	public String getBigSort() {
		return bigSort;
	}
	public void setBigSort(String bigSort) {
		this.bigSort = bigSort;
	}
	public String getMiddleSort() {
		return middleSort;
	}
	public void setMiddleSort(String middleSort) {
		this.middleSort = middleSort;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public int getOrigin_price() {
		return origin_price;
	}
	public void setOrigin_price(int origin_price) {
		this.origin_price = origin_price;
	}
	public int getSale_price() {
		return sale_price;
	}
	public void setSale_price(int sale_price) {
		this.sale_price = sale_price;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public int getInventory() {
		return inventory;
	}
	public void setInventory(int inventory) {
		this.inventory = inventory;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getDelivery_free_YN() {
		return delivery_free_YN;
	}
	public void setDelivery_free_YN(String delivery_free_YN) {
		this.delivery_free_YN = delivery_free_YN;
	}
	public String getThumbnail_image() {
		return thumbnail_image;
	}
	public void setThumbnail_image(String thumbnail_image) {
		this.thumbnail_image = thumbnail_image;
	}
	public String getDetail_image() {
		return detail_image;
	}
	public void setDetail_image(String detail_image) {
		this.detail_image = detail_image;
	}
	public String getProduct_date() {
		return product_date;
	}
	public void setProduct_date(String product_date) {
		this.product_date = product_date;
	}
	public String getModify_YN() {
		return modify_YN;
	}
	public void setModify_YN(String modify_YN) {
		this.modify_YN = modify_YN;
	}
	public String getModify_date() {
		return modify_date;
	}
	public void setModify_date(String modify_date) {
		this.modify_date = modify_date;
	}
	public String getDel_YN() {
		return del_YN;
	}
	public void setDel_YN(String del_YN) {
		this.del_YN = del_YN;
	}
	
	private String origin_product_index;
	public String getOrigin_product_index() {
		return origin_product_index;
	}
	public void setOrigin_product_index(String origin_product_index) {
		this.origin_product_index = origin_product_index;
	}
}
