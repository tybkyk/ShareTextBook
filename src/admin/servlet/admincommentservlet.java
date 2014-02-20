package admin.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.dao.admindao;


public class admincommentservlet extends HttpServlet {

	public admincommentservlet() {
		super();
	}

	public void init() throws ServletException {
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		// 设置编码格式为 UTF-8
		
		PrintWriter out = response.getWriter();
		String comid = request.getParameter("comid");
		admindao admd=new admindao();
		int flag=0;
		flag=admd.deletecomt(comid);
		if(flag==1){
			out.write("1");//1为成功
			out.flush();
			out.close();		
		}
		else if(flag==0){
			out.write("2");//2为不成功
			out.flush();
			out.close();
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
