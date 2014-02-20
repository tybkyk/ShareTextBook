package admin.servlet;

import javax.servlet.*;
import javax.servlet.http.*;

import admin.dao.admindao;

import java.io.*;

import user.dao.*;

public class adminloginservlet extends HttpServlet {

	private static final long serialVersionUID = 4745142977669047917L;

	public adminloginservlet() {
		super();
	}

	public void init() throws ServletException {
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String adminName = request.getParameter("AdminName");
		String Password = request.getParameter("Password");
		if (adminName == "" || Password == ""||adminName == null|| Password == null)
			response.sendRedirect("adminloginservlet.jsp");// 在commit以后2次判断管理员名密码，若有错误直接跳转,这句话防止被恶意修改js登录


		else {
			// 前台得到用户输入
			admindao adminDao = new admindao();
			int info = adminDao.check(adminName, Password);
			PrintWriter out = response.getWriter();
			// 调用方法判断用户是否存在
			if (info==1) {
				HttpSession session = request.getSession(true);				
				session.setMaxInactiveInterval(60); // 设置session失效时间（timeout），单位为秒
				session.setAttribute("adminname", adminName); // 用户名和密码正确，保存登录信息(获得session与jsp网页稍有不同)
				System.out.println("adminloginservlet.doPost()");
				request.getRequestDispatcher("/WEB-INF/AdminManagePage.jsp").forward(request, response);
			} else if (info == 2 || info == 3) {
				//2为不成功
				response.sendRedirect("AdminLogin.jsp");
			} else {
				System.out.println("草麻痹这个错一定不会出来的 出来就是电脑吃屎了");//这段应该不会发生
			}
		}
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void destroy() {
		super.destroy();
	}

}
