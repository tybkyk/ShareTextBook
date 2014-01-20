package user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.information.*;
import user.dao.*;

public class userregservlet extends HttpServlet {
	
	public userregservlet(){
		super();
	}
	
	public void init() throws ServletException{}
	
	
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
        user.setUserAurtority(0);
        user.setUserEmail(userEmail);

        // 将前台得到的数据存入ＶＯ
        userdao userDao = new userdao();
        // 实例化一个数据库操作对象
        userDao.insertUser(user);
        // 调用增加用户方法
        request.getRequestDispatcher("/userlogin.jsp").forward(request,
                response);
        // 转到登录页面
    	}
	
	public void destroy(){
		super.destroy();
	}

}