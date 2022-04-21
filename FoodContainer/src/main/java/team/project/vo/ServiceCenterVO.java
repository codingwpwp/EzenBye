package team.project.vo;

public class ServiceCenterVO extends MemberVO{
	private int serviceCenter_index;
	private int member_index;
	private String sort1;
	private String sort2;
	private String title;
	private String contents;
	private String write_date;
	private String del_YN;
	private String progress;
	
	public String getProgress() {
		return progress;
	}
	public void setProgress(String progress) {
		this.progress = progress;
	}
	public int getServiceCenter_index() {
		return serviceCenter_index;
	}
	public void setServiceCenter_index(int serviceCenter_index) {
		this.serviceCenter_index = serviceCenter_index;
	}
	public int getMember_index() {
		return member_index;
	}
	public void setMember_index(int member_index) {
		this.member_index = member_index;
	}
	public String getSort1() {
		return sort1;
	}
	public void setSort1(String sort1) {
		this.sort1 = sort1;
	}
	public String getSort2() {
		return sort2;
	}
	public void setSort2(String sort2) {
		this.sort2 = sort2;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getWrite_date() {
		return write_date;
	}
	public void setWrite_date(String write_date) {
		this.write_date = write_date;
	}
	public String getDel_YN() {
		return del_YN;
	}
	public void setDel_YN(String del_YN) {
		this.del_YN = del_YN;
	}
	
}
