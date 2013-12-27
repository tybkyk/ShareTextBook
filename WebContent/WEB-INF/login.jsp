<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div style="text-align: center">
		<div>
			<form action="./login.do" method="post">
				USERNAME:<input type="text" name="userName"><br><br>
				PASSWORD: <input type="password" name="userPass"><br><br>
				  <input type="reset" value="RESET">&nbsp;&nbsp;
				  <input type="submit" value="SUBMIT">
				<input type="hidden" name="oper" value="login">
			</form>
		</div>
	</div>
</body>
</html>