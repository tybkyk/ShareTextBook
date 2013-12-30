package user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import user.information.*;
import user.dao.*;

public class userloginservlet extends HttpServlet {

	public userloginservlet() {
		super();
	}

	public void init() throws ServletException {
	}

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
		String message = "";

		if (info == 0) {
			message = "yonghukong";
			request.setAttribute("message", message);
			// request.getRequestDispatcher("/userlogin.jsp").forward(request,
			// response);
			response.sendRedirect("userlogin.jsp");
		} else if (info == 1) {
			message = "mimakong";
			request.setAttribute("message", message);
			// request.getRequestDispatcher("/userlogin.jsp").forward(request,
			// response);
			response.sendRedirect("userlogin.jsp");
		} else if (info == 2) {
			// message = "mimazhengque";
			// request.setAttribute("message", message);
			HttpSession hs = request.getSession(true);
			// hs.setMaxInactiveInterval(30);
			hs.setAttribute("name", userName);
			// request.getRequestDispatcher("/....jsp").forward(request,
			// response);
			response.sendRedirect("....jsp");
		} else if (info == 3) {
			// 如果用户存在，检索数据，跳到用户列表显示页面
			// message = "mimayouwu";
			request.setAttribute("message", "mimayouwu");
			// request.getRequestDispatcher("/....jsp").forward(request,
			// response);
			response.sendRedirect("userlogin.jsp");
		} else {
			message = "wugaiyonghu";
			request.setAttribute("message", message);
			// request.getRequestDispatcher("/userreg.jsp").forward(request,
			// response);
			response.sendRedirect("userreg.jsp");;
		}

	}

	public void destroy() {
		super.destroy();
	}

}
