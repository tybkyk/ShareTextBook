package user.servlet;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;

import user.information.*;
import user.dao.*;

public class userregservlet extends HttpServlet {

	public userregservlet() {
		super();
	}

	public void init() throws ServletException {
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		// 设置编码格式为 UTF-8
		String userName = request.getParameter("userName");
		String userPassword = request.getParameter("userPassword");
		String userEmail = request.getParameter("userEmail");
		// 前台得到 用户输入数据

		userinfo user = new userinfo();
		// 实例化一个user对象
		user.setUserName(userName);
		user.setUserPassword(userPassword);
		user.setUserAurtority(1);// 设定1为用户权限
		user.setUserEmail(userEmail);

		// 将前台得到的数据存入ＶＯ
		userdao userDao = new userdao();
		// 实例化一个数据库操作对象
		int result = userDao.checkuser_exists(userName);
		if (result == 2) {
			userDao.insertUser(user);
			// 调用增加用户方法
			request.getRequestDispatcher("userlogin.jsp").forward(request, response);
			// 转到登录页面
		} else {
			response.sendRedirect("userreg.jsp");
		}
		user = null;
		userDao = null;
	}

	public void destroy() {
		super.destroy();
	}

}