package team.project.vo;

public class NoticeVO {
	private int notice_index;
	private String title;
	private int hit;
	private String contents;
	private String write_date;
	private String del_YN;
	
	public int getNotice_index() {
		return notice_index;
	}
	public void setNotice_index(int notice_index) {
		this.notice_index = notice_index;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
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
