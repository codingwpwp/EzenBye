package team.project.vo;

public class ServiceCenterReplyVO extends MemberVO{
	private int serviceCenter_reply_index;
	private int serviceCenter_index;
	private String contents;
	private String reply_date;
	private String modify_yn;
	public int getServiceCenter_reply_index() {
		return serviceCenter_reply_index;
	}
	public void setServiceCenter_reply_index(int serviceCenter_reply_index) {
		this.serviceCenter_reply_index = serviceCenter_reply_index;
	}
	public int getServiceCenter_index() {
		return serviceCenter_index;
	}
	public void setServiceCenter_index(int serviceCenter_index) {
		this.serviceCenter_index = serviceCenter_index;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getReply_date() {
		return reply_date;
	}
	public void setReply_date(String reply_date) {
		this.reply_date = reply_date;
	}
	public String getModify_yn() {
		return modify_yn;
	}
	public void setModify_yn(String modify_yn) {
		this.modify_yn = modify_yn;
	}
}
