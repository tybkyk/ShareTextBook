package system.comment;

import java.sql.Date;


public class commenttable{

	private int id;
	private int bid;
	private int chapter;
	private String userName;
	private int userId;
	private Date date;
	private String content;
	private String bname;
	//private int commentDispaly;
	
	 
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public int getbId() {
		return bid;
	}
	public void setbId(int bid) {
		this.bid = bid;
	}

	public int getChapter() {
		return chapter;
	}
	public void setChapter(int chapter) {
		this.chapter = chapter;
	}
	
	

	public String getuserName() {
		return userName;
	}
	public void setuserName(String userName) {
		this.userName = userName;
	}

	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	
	public String getBname() {
		return bname;
	}
	public void setBname(String bname) {
		this.bname = bname;
	}
	
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	/*
	public int getcommentDispaly() {
		return commentDispaly;
	}
	public void commentDispaly(int commentDispaly) {
		this.commentDispaly = commentDispaly;
	}
	*/

	
	
}
