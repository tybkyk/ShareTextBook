<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>留言板</title>
</head>

<script type="text/javascript">
    
    function checkinput()
    {
        var t=document.commentForm.title.value;
        if(t=="")
        {
        alert("没有输入biaoti！");
        return false;
        }
        
        var c=document.commentForm.content.value;
        
        if(c=="")
        {
       	 alert("没有输入neirong！");
       	 return false;
        }
    }
   

</script>

<body>
	<form name="commentForm" action="addcommservlet" method="post"
		onsubmit="return checkinput()">

		<div align="center">
			<h2>评论</h2>

			留言主题 <input type="text" id="title" value="" name="title" /> <br />

			<br /> 留言内容
			<textarea name="content" rows="5" cols="35" id="content"></textarea>



			<br />
			<h2></h2>
			<input type="Submit" name="submit" style="width: 210px" value="提交" />
			<input type="reset" name="reset" style="width: 210px" value="重置" />
			
			
		</div>

	</form>


</body>


</html>







