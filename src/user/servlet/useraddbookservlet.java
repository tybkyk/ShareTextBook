package user.servlet;

import javax.servlet.*;
import javax.servlet.http.*;

import java.io.*;
import java.util.ArrayList;

import book.information.*;
import user.information.*;
import book.dao.*;
import user.dao.*;
import readlist.information.*;
import readlist.dao.*;


//还未完成！！

public class useraddbookservlet extends HttpServlet {
	
	public useraddbookservlet(){
		super();
	}
	
	public void init() throws ServletException{}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//1.获取要买的书
		String sid=request.getParameter("id");
		bookdao bdao = new bookdao();
		
		bookinfo book =bdao.findbook(sid);
		readlistdao rdao = new readlistdao();
		
        HttpSession session = request.getSession();
		
		userinfo user = (userinfo)session.getAttribute("user");
		


		if(rdao.addbook(book, user)){
			
	    	  ArrayList<readlistinfo> al=rdao.findAll();
				session.setAttribute("al", al);
	    	    response.sendRedirect("mainpage.jsp");
			}
	      else{
				response.sendRedirect("cuowu.jsp");
			}

	}
		
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}
	
}