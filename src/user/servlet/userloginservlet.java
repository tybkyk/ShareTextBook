
package user.servlet;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;

import user.information.*;
import user.dao.*;

public class userloginservlet extends HttpServlet {
	
	public userloginservlet(){
		super();
	}
	
	public void init() throws ServletException{}
	
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String userName = request.getParameter("userName");
        String userPassword = request.getParameter("userPassword");     
        
        
        // 前台得到用户输入
        userdao userDao = new userdao();
        int info = userDao.check(userName, userPassword);
        // 调用方法判断用户是否存在
      
       if(info == 0){
        	HttpSession session = request.getSession(true);
			request.getSession().setMaxInactiveInterval(30*60);		// 设置session失效时间（timeout），单位为秒
			request.getSession().setAttribute("name", userName);		// 用户名和密码正确，保存登录信息(获得session与jsp网页稍有不同)
			
			response.sendRedirect("userselectbook.jsp");
        }
        else if(info == 1){
        	HttpSession session = request.getSession(true);
            session.setAttribute("message", "<script>alert('用户密码错误！');</script>");
            request.getRequestDispatcher("/userlogin.jsp").forward(request, response);
        }
        else{
        	HttpSession session = request.getSession(true);
            session.setAttribute("message", "<script>alert('无该用户,请注册！！');</script>");
            //需要演示
            request.getRequestDispatcher("/userreg.jsp").forward(request, response);
        }

    }
	
	public void destroy(){
		super.destroy();
	}
	
	
}
















