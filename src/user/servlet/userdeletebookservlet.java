package user.servlet;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;

import book.information.*;
import user.information.*;
import book.dao.*;
import user.dao.*;

public class userdeletebookservlet extends HttpServlet {
	
	public userdeletebookservlet(){
		super();
	}
	
	public void init() throws ServletException{}

	//调服务类里边的方法从购物项里删除想要删除的书
	//BusinessService service=new BusinessServiceImpl();

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//获取到购物项
		String sid=request.getParameter("id");
		Cart cart=(Cart)request.getSession().getAttribute("cart");
		
		
		service.deleteCartItem(sid,cart);
		request.getRequestDispatcher("/WEB-INF/jsp/listcart.jsp").forward(request, response);

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
