package test00;


import javax.servlet.*;
import javax.servlet.http.*;

import java.io.*;
import java.sql.*;

public class check extends HttpServlet{
	public check(){
		super();
	}
	public void init() throws ServletException{}
	/*
	public void process(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
	    res.setContentType("text/html;charset=UTF-8");//处理中文乱码
	    PrintWriter pw=res.getWriter();
		try {
			// 接收用户名和密码
			String u = req.getParameter("username");
			String p = req.getParameter("passwd");
			
			if (u.equals("sp")&&p.equals("123")) {
				//将用户名和密码放入到session中
				HttpSession hs=req.getSession(true);
				hs.setMaxInactiveInterval(30);
				hs.setAttribute("name",u);
				
				res.sendRedirect("welcome?uname="+u+"&pass="+p);//会在浏览器地址栏中传输
			} else {
				
				res.sendRedirect("login?info=error1");
				
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

*/
	
	
	
	
	
	public void process(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		res.setContentType("text/html;charset=UTF-8");// 处理中文乱码
		PrintWriter pw = res.getWriter();
		
		
	    String DBDRIVER = "com.mysql.jdbc.Driver" ;
		   // 定义MySQL数据库的连接地址
	    String DBURL = "jdbc:mysql://localhost:3306/test" ;
		   // MySQL数据库的连接用户名(需要改变)
        String DBUSER = "root" ;
		   // MySQL数据库的连接密码
		String DBPASSWORD = "12345678";

		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			// 接收用户名和密码
			String u = req.getParameter("username");
			String p = req.getParameter("passwd");

			// 连接数据库
			 Class.forName(DBDRIVER).newInstance();// 加载驱动
			// 得到连接
			con = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);
			// 创建Statement
			stmt = con.createStatement();
			rs = stmt.executeQuery("select passwd from users where username='"
					+ u + "'");

			if (rs.next()) {
				// 说明用户是存在的
				String dbPasswd = rs.getString(1);
				if (dbPasswd.equals(p)) {
					// 真的合法
					// 将用户信息存入session中
					HttpSession hs = req.getSession(true);
					hs.setMaxInactiveInterval(30);
					hs.setAttribute("name", u);
					res.sendRedirect("welcome");// 跳转
				} else {
					res.sendRedirect("login");
				}
			} else {
				// 说明用户名不存在
				res.sendRedirect("login?info=error1");
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {// 按打开对象的逆序关闭对象
			try {
				if (rs != null) {
					rs.close();
				}
				if (stmt != null) {
					stmt.close();
				}
				if (con != null) {
					con.close();
				}
			} catch (Exception ex) {
				ex.printStackTrace();
			}
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
