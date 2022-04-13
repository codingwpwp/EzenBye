package team.project.vo;

public class RecipeVO {
	private int member_index;
	private String title;
	private String thumbnail_image;
	private String contents;
	private int product_index1;
	private int product_index2;
	private int product_index3;
	private int hit;
	private int thumb;
	private String write_date;
	private int best_rank;
	public String getTitle() {
		return title;
	}
	
	public int getMember_index() {
		return member_index;
	}

	public void setMember_index(int member_index) {
		this.member_index = member_index;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	public String getThumbnail_image() {
		return thumbnail_image;
	}
	public void setThumbnail_image(String thumbnail_image) {
		this.thumbnail_image = thumbnail_image;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public int getProduct_index1() {
		return product_index1;
	}
	public void setProduct_index1(int product_index1) {
		this.product_index1 = product_index1;
	}
	public int getProduct_index2() {
		return product_index2;
	}
	public void setProduct_index2(int product_index2) {
		this.product_index2 = product_index2;
	}
	public int getProduct_index3() {
		return product_index3;
	}
	public void setProduct_index3(int product_index3) {
		this.product_index3 = product_index3;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public int getThumb() {
		return thumb;
	}
	public void setThumb(int thumb) {
		this.thumb = thumb;
	}
	public String getWrite_date() {
		return write_date;
	}
	public void setWrite_date(String write_date) {
		this.write_date = write_date;
	}
	public int getBest_rank() {
		return best_rank;
	}
	public void setBest_rank(int best_rank) {
		this.best_rank = best_rank;
	}
	
	
}
