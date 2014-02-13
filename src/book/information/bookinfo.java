package book.information;

public class bookinfo {
    private int bookId;
    // 书本Id
    private String bookName ;
    // 书名
    private int chapter;
    // 章节号
    private String content;
    // 章节内容
    
    
    
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
    
    public String getContent(){
    	return content;
    }
    public void setContent(String content){
    	this.content = content;
    }
}
    