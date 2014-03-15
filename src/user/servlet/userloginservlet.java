package user.servlet;

import javax.servlet.*;
import javax.servlet.http.*;

import java.io.*;

import user.dao.*;

public class userloginservlet extends HttpServlet {

	private static final long serialVersionUID = 4745142977669047917L;

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
		if (userName == "" || userPassword == ""||userName == null|| userPassword == null)
			response.sendRedirect("userreg.jsp");// 在commit以后2次判断用户名密码，若有错误直接跳转,这句话防止被恶意修改js登录
		//登录页面不是用表单写的，所以不能通过servlet跳转

		else {
			// 前台得到用户输入
			userdao userDao = new userdao();
			String[] info = userDao.check(userName, userPassword);
			String uid = info[0];//uid与验证信息的数组包
			PrintWriter out = response.getWriter();
			// 调用方法判断用户是否存在
			if (info[1].equals("2")) {
				HttpSession session = request.getSession(true);				
				session.setMaxInactiveInterval(10*60); // 设置session失效时间（timeout），单位为秒
				session.setAttribute("uname", userName); // 用户名和密码正确，保存登录信息(获得session与jsp网页稍有不同)
				session.setAttribute("uid", uid);
				Cookie cookie = new Cookie("JSESSIONID", session.getId());
		        cookie.setMaxAge(session.getMaxInactiveInterval());
		        response.addCookie(cookie);
				out.write("1");//1为成功
				out.flush();
				out.close();				
			} else if (info[1] == "3" || info[1] == "4") {
				out.write("2");//2为不成功
				out.flush();
				out.close();
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
