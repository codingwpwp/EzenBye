package team.project.vo;

public class ReviewVO {
	private int review_index;
	private String product_index;
	private int member_index;
	private String image = null;
	private int star_count;
	private String contents;
	private String review_date;
	private String del_YN;
	public int getReview_index() {
		return review_index;
	}
	public void setReview_index(int review_index) {
		this.review_index = review_index;
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
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public int getStar_count() {
		return star_count;
	}
	public void setStar_count(int star_count) {
		this.star_count = star_count;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getReview_date() {
		return review_date;
	}
	public void setReview_date(String review_date) {
		this.review_date = review_date;
	}
	public String getDel_YN() {
		return del_YN;
	}
	public void setDel_YN(String del_YN) {
		this.del_YN = del_YN;
	}
}
