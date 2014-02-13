ShareTextBook
=============

ShareTextBook by yk and xyf

12.23 	Establish the project on github
		PS:	put css file in ../css ,
			js file in ../js,
			public pages in ../Pages,
			inpublic pages that create/response by jsp/servlet in WEB-INF/view/..
			
12.24	Create new branch:Developing

12.26   Create interface(roughly)

12.27   Try to use servlet to connect DB and realize user login(it is rough)

12.31   Finish user login and user register(it is rough)

1.5     Finish user comment table and we can insert comment into database(it is rough)

1.7     Establish the database(stbdb)

1.10    Finish user select book function and show each book from database(it is rough)

1.15    Finish user book-list and add book which in database to book-list(also call it bookmarks)(it is rough)

1.21    Modify user login and register 

2.6     Finish book-reading fuction

2.8     Finish convertPDFservlet, but cannot handle Chinese characters

2.12	Finish login. Pay attention to the description of session standard in dic.txt
		for example：1，use uname for username。。。
					 2，if you want to create a link to logout,please call:userlogin.jsp?action=logout
					 3, estimate the parameter of session or url before you use them, do like this:
						if (request.getParameter("xxx") != null) {
							//then use them ,do what you wanna do.
						}
						
						***Attention!!!!!!!!!***session.getAttribute("xxx") needs to be included in the try {}catch(){}
						***Because request.getParameter("xxx")(even xxx doesn't exist) will not cause any error 
						but session.getAttribute("xxx") will not!!
