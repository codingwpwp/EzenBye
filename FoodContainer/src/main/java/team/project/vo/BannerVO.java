package team.project.vo;

public class BannerVO {
	private int banner_index;
	private String name;
	private String image;
	private String link_YN;
	private String link;
	private String register_date;
	public int getBanner_index() {
		return banner_index;
	}
	public void setBanner_index(int banner_index) {
		this.banner_index = banner_index;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getLink_YN() {
		return link_YN;
	}
	public void setLink_YN(String link_YN) {
		this.link_YN = link_YN;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public String getRegister_date() {
		return register_date;
	}
	public void setRegister_date(String register_date) {
		this.register_date = register_date;
	}
}
