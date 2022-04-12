package team.project.vo;

public class EmailVO {
    private String senderMail = "FoodContainer001@gmail.com";
    private String receiveMail;
    private String subject;
    private String message;

    public String getSenderMail() {
        return senderMail;
    }
    public void setSenderMail(String senderMail) {
        this.senderMail = senderMail;
    }
    public String getReceiveMail() {
        return receiveMail;
    }
    public void setReceiveMail(String receiveMail) {
        this.receiveMail = receiveMail;
    }
    public String getSubject() {
        return subject;
    }
    public void setSubject(String subject) {
        this.subject = subject;
    }
    public String getMessage() {
        return message;
    }
    public void setMessage(String message) {
        this.message = message;
    }
}
