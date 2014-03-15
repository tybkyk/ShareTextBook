package user.servlet;

import javax.servlet.*;
import javax.servlet.http.*;

import java.io.*;

import book.information.*;
import user.information.*;
import book.dao.*;
import readlist.dao.*;

public class useraddbookservlet extends HttpServlet {
//加书签
	public useraddbookservlet() {
		super();
	}

	public void init() throws ServletException {
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String bid = request.getParameter("bid");
		String chapter = request.getParameter("chapter");
		String bname = request.getParameter("bname");
		bname = new String(bname.getBytes("iso-8859-1"), "utf-8");
		HttpSession session = request.getSession(true);
		String uid = (String) session.getAttribute("uid");
		boolean flag = false;

		PrintWriter out = response.getWriter();

		bookinfo book = new bookinfo();
		book.setBookId(Integer.parseInt(bid));
		book.setChapter(Integer.parseInt(chapter));
		book.setBookName(bname);

		readlistdao rdao = new readlistdao();
		if (uid != null) {
			flag = rdao.addbookmark(book, uid);

			if (flag == true) {
				out.print("1");//success
				out.flush();
				out.close();
			} else {
				out.print("2");//fail
				out.flush();
				out.close();
			}
			
		}else{
			out.print("3");
			out.flush();
			out.close();
		} 
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

}