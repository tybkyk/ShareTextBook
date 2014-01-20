package user.information;

public class userinfo {
    //private int userId;
    // 用户Id
    private String userName ;
    // 用户姓名
    private String userPassword;
    // 用户密码
    private int userAurtority;
    // 用户状态
    private String userEmail;
    //用户邮箱
    /*
    public int getUserId(){
    	return userId;
    }
    public void setUserId(int userId){
    	this.userId = userId;
    }
    */
    
    public String getUserName(){
    	return userName;
    }
    public void setUserName(String userName){
    	this.userName = userName;
    }
    
    public String getUserPassword(){
    	return userPassword;
    }
    public void setUserPassword(String userPassword){
    	this.userPassword = userPassword;
    }
    
    public int getUserAurtority(){
    	return userAurtority;
    }
    public void setUserAurtority(int userAurtority){
    	this.userAurtority = userAurtority;
    }
    
    public String getUserEmail(){
    	return userEmail;
    }
    public void setUserEmail(String userEmail){
    	this.userEmail=userEmail;
    }
}
