package team.project.vo;

public class ReplyVO {
	private int reply_index;
	private int recipe_index;
	private int member_index;
	private String contents;
	
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
