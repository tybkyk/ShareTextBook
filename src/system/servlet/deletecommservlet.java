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


public class deletecommservlet extends HttpServlet {
	
	
	public deletecommservlet(){
		super();
	}
	
	public void init() throws ServletException{}
	
	
	
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {


		HttpSession session = request.getSession();
        int CommentId = Integer.parseInt(request.getParameter("id"));
        systemdao sDao = new systemdao();
        sDao.deleteComment(CommentId);

		  if( sDao.deleteComment(CommentId)){
	    	  ArrayList<commenttable> al=sDao.findAll();
				session.setAttribute("al", al);
	    	    response.sendRedirect("liuyanshow.jsp");
			}
	      else{
				response.sendRedirect("cuowu.jsp");
			}
        
    }
	
	
	
	
	
	

	/*
	public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		
		
		
		HttpSession session = request.getSession();

        String CommentId[] = request.getParameterValues("id");
        systemdao sDao = new systemdao();
        
        
        if( sDao.deleteCommentList(CommentId)){
	    	  ArrayList<commenttable> al=sDao.findAll();
				session.setAttribute("al", al);
	    	    response.sendRedirect("liuyanshow.jsp");
			}
	      else{
				response.sendRedirect("cuowu.jsp");
			}

    }
		*/
		public void destroy(){
			super.destroy();
		}
		
	}
		