package test00;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;

public class login extends HttpServlet {
	public login(){
		super();
	}
	
	public void init() throws ServletException{}
	public void process(HttpServletRequest req,HttpServletResponse res)
		    throws ServletException,IOException{
			try{			
			   res.setContentType("text/html;charset=UTF-8");
			    //业务逻辑
			    PrintWriter pw=res.getWriter();
			    //返回登录界面
			    pw.println("<html>");
			    pw.println("<body>");
			    //得到erro信息
			    String info=(String)req.getParameter("info");
			    if(info!=null){
			    	pw.println("<h1>你的用户名或是密码错误！</h1><br>");
			    	//到时候再改吧
			    	//res.sendRedirect("/userlogin.jsp");
			    }
		
			    pw.println("<h1>登录界面</h1>");
			    pw.println("<form action=check method=post>");
			    pw.println("用户名：<input type=text name=username><br>");
			    pw.println("密码：<input type=password name=passwd><br>");
			    pw.println("<input type=submit value=loging><br>");
			    pw.println("</form>");
			    pw.println("</body>");
			    pw.println("</html>");
			 
			}catch(Exception ex){
				ex.printStackTrace();
			}
	}

		public void doGet(HttpServletRequest req,HttpServletResponse res)
		    throws ServletException,IOException{
			process(req,res);
		}
		public void doPost(HttpServletRequest req,HttpServletResponse res)
		    throws ServletException,IOException{
			process(req,res);
		}
	
	public void destroy(){
		super.destroy();
	}
}
