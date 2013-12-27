
package test00;



import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class welcome extends HttpServlet {
	public welcome(){
		super();
	}
	public void init() throws ServletException{}
	public void process(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		res.setContentType("text/html;charset=UTF-8");
		try {
			//从session中得到用户名
			HttpSession hs=req.getSession(true);
			String myName=(String)hs.getAttribute("name");
			
			if(myName==null){
				//返回登陆界面
				res.sendRedirect("login?info=error1");
				return;
			}
			
	
			PrintWriter pw = res.getWriter();
			pw.println("Welcom,hello<br>");
			pw.println("你的用户名是："+myName);
			
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		process(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		process(req, res);
	}
	public void destroy(){}

}
