package system.servlet;


import java.io.IOException;  
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;  

import java.io.File;
import java.io.StringReader;
import java.sql.*;

import dbmannerger.dbconnector;
import system.dao.*;

  


public class topdfservlet extends HttpServlet { 

	public topdfservlet(){
		super();
	}
	
	public void init() throws ServletException{}

  
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {  
  
    	
    	systemdao sysDao = new systemdao();
    		
    		File pdfFile = new File("C:/Users/SPOCK/pdf/1.pdf"); //地址可以改变
    		StringReader strReader = null;
    		
    		 dbconnector dbcon = new dbconnector();
    	      Connection con = null;
    	      Statement stmt = null;
    	      
    	      
    	      StringBuffer html = new StringBuffer();  
    	      
    	      
    	      try {
    	          con = dbcon.initDB();
    	          stmt = con.createStatement();
    	          int chapter = 1;//session中获取
    	          int id = 3;//session中获取
    	          String SQL = "select * from books where bchapter="+chapter+" and bid='"+id+"'" ;
    	          ResultSet rs = stmt.executeQuery(SQL);
    	          
    	          
    	         
    	          while(rs.next()) 
    	  	   	{
    	  	    	 
    	        	  html.append("<html>")  
  		            .append("<head>")   
  		            .append("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />")   
  		             .append("<style type=\"text/css\"/>")
  	        	    .append("*{")
  	        		  .append("font-family:KaiTi_GB2312;")
  	        		  .append("}")
	        	        .append("</style>")
  		            .append("</head>")  
  		            .append("<body>")  
  		            .append("<font face=\"KaiTi_GB2312\">") 
  		            .append(rs.getString("content"))
  		            .append("</font>")   
  		            .append("</body></html>"); 
    	        	  
    	        	  
    	        	  strReader = new StringReader(html.toString());  
    	        	  sysDao.generatePDF_1(pdfFile, strReader);  
    	  	   	}
    	  	          
    	    
    	 } catch (Exception e) {
    	  System.out.println("记录数量获取失败！");
    	  e.printStackTrace();
    	 }
    }
    	
 
    

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException {  

		doPost(request, response);
	}

	public void destroy(){
			super.destroy();
		}
}  
