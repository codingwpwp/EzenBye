package team.project.vo;

public class ReplyVO {
	private int reply_index;
	private int recipe_index;
	private int member_index;
	private String contents;
	private String reply_date;
	private String modify_yn;
	private String del_yn;
	private String name;
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	public String getDel_yn() {
		return del_yn;
	}
	public void setDel_yn(String del_yn) {
		this.del_yn = del_yn;
	}
	public int getReply_index() {
		return reply_index;
	}
	public void setReply_index(int reply_index) {
		this.reply_index = reply_index;
	}
	public int getRecipe_index() {
		return recipe_index;
	}
	public void setRecipe_index(int recipe_index) {
		this.recipe_index = recipe_index;
	}
	public int getMember_index() {
		return member_index;
	}
	public void setMember_index(int member_index) {
		this.member_index = member_index;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	
}
