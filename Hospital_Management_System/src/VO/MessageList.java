package VO;

public class MessageList {
	
	private int id,adminid;
	private String messageto,subject,messagecomment,date,messageupdate;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getAdminid() {
		return adminid;
	}
	public void setAdminid(int adminid) {
		this.adminid = adminid;
	}
	public String getMessageto() {
		return messageto;
	}
	public void setMessageto(String messageto) {
		this.messageto = messageto;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getMessagecomment() {
		return messagecomment;
	}
	public void setMessagecomment(String messagecomment) {
		this.messagecomment = messagecomment;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getMessageupdate() {
		return messageupdate;
	}
	public void setMessageupdate(String messageupdate) {
		this.messageupdate = messageupdate;
	}
}
