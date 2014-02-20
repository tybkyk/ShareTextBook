package system.servlet;
 
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
 


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


//import user.information.*;
import system.comment.*;
import system.dao.*;
import user.information.*;
import book.information.*;


public class addcommservlet extends HttpServlet {
	
	
	public addcommservlet(){
		super();
	}
	
	public void init() throws ServletException{}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		//设置编码格式
	    request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
		//获取用户信息和留言信息
        
		HttpSession session = request.getSession();
		
		userinfo user = (userinfo)session.getAttribute("user");
		
		String content = request.getParameter("content");
		int bookid =   Integer.parseInt(request.getParameter("bid"));
		int chapter =  Integer.parseInt(request.getParameter("chapter"));
		
		
		commenttable comt = new commenttable();
		

    	 comt.setbId(bookid);
    	 comt.setChapter(chapter);
 		 comt.setUserId(user.getUserId());
 		 comt.setContent(content);		
		 comt.setDate(new Date(System.currentTimeMillis()));
		

		  systemdao systemDao = new systemdao();
		  
		  PrintWriter out = response.getWriter();
		  if(systemDao.insertComment(comt)){
			  out.write("1");
		  }
		  else{
			  out.write("2");
		  }
		  
		  
	      /*
	      if(systemDao.insertComment(comt)){
	    	  ArrayList<commenttable> al=systemDao.findAll();
				session.setAttribute("al", al);
	    	    response.sendRedirect("liuyanshow.jsp");
			}
	      else{
				response.sendRedirect("cuowu.jsp");
			}
			*/

	}
	
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

		public void destroy(){
			super.destroy();
		}
		
	}
		