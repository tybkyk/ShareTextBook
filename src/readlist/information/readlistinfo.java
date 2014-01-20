package readlist.information;

import book.information.*;
import user.information.*;


//用于代表购买的商品（书）。包括书的数量。（购物项，购物车的一行）
public class readlistinfo {
	
    private int bookId;
    // 书本Id
    private String bookName ;
    // 书名
    private int chapter;
    // 章节号
    
    private int userId;
    // 用户Id
    private String userName ;
    // 用户姓名
	

	
	 public int getBookId(){
	    	return bookId;
	    }
	    public void setBookId(int bookId){
	    	this.bookId = bookId;
	    }
	   
	    
	    public String getBookName(){
	    	return bookName;
	    }
	    public void setBookName(String bookName){
	    	this.bookName = bookName;
	    }
	    
	    public int getChapter(){
	    	return chapter;
	    }
	    public void setChapter(int chapter){
	    	this.chapter = chapter;
	    }
	    
	
	    public int getUserId(){
	    	return userId;
	    }
	    public void setUserId(int userId){
	    	this.userId = userId;
	    }
	   
	    
	    public String getUserName(){
	    	return userName;
	    }
	    public void setUserName(String userName){
	    	this.userName = userName;
	    }
	
	
	
}
	