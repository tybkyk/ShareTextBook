package system.servlet;
 
import java.io.IOException;
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
		//String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		
		
		commenttable comt = new commenttable();
		

//有两个位，留言的id需要你帮我弄一下，书的id和章节号，怎么获得
		
		// comt.setId();
    	// comt.setbId();
    	// comt.setChapter();
 		 comt.setUserId(user.getUserId());
 		 comt.setContent(content);		
		comt.setDate(new Date(System.currentTimeMillis()));
		

		  systemdao systemDao = new systemdao();
		  systemDao.insertComment(comt);
		  

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
		