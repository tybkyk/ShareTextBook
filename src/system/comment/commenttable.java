package system.comment;

import java.sql.Date;


public class commenttable{

	//private static final long serialVersionUID = 1L;
	//private int id;
	private String userName;
	private Date date;
	private String content;
	 
	/*
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	*/
	
	public String getuserName() {
		return userName;
	}
	public void setuserName(String userName) {
		this.userName = userName;
	}
	
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}

	
	
}
