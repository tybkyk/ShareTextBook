<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>留言板</title>
</head>
<body>
<form name="commentForm" method = "post" >
<div>

<textarea id="txt"  name="content" rows="5" cols="35"></textarea>
<br/>

				<span id="spanalert"></span> 
				
				<br /> 
<input type="radio" name="choose" value="0" />写评论
<input type="radio" name="choose" value="1" />提意见
<br/>
<input type="button" value="留言" style="width: 50px"  id="btn" />
<input type="reset" name="reset"  style="width: 50px" value="重置"/>


<ul id="message"></ul>

</div>

</form>

<script type="text/javascript">
var oTxt=document.getElementById('txt');
var oBtn=document.getElementById('btn');
var oMessage=document.getElementById('message');
var aLi=oMessage.getElementsByTagName('li');
var Obj=document.getElementsByName("choose"); 

//敏感词过滤
function filterText(sText) {
    var reBadWords = /caonima/gi; //自行添加
    return sText.replace(reBadWords, function (sMatch) {
        return sMatch.replace(/./g, "");
    });            
}



oBtn.onclick=function(){
	
for(var i=0;i<Obj.length;i++){if(Obj[i].checked){break}}; 
	
	if(oTxt.value==""){
		alert("请输入留言内容");
	}
	else if(i==Obj.length){
		alert("请输入选项");
	}
	else{
		//var oLi=document.createElement('li');
		//var oP=document.createElement('p');
		
		//oP.innerHTML=filterText(oTxt.value);

		//oLi.appendChild(oP);
		/*
		if(aLi.length>0){
			oMessage.insertBefore(oLi,oMessage.firstChild);
		}else{
			oMessage.appendChild(oLi);
		}
		*/
		//alert(Obj[i].value); 
		
		
		var xmlHttp;
		if (window.XMLHttpRequest)
		  {// code for IE7+, Firefox, Chrome, Opera, Safari
		  xmlHttp=new XMLHttpRequest();
		  }
		else
		  {// code for IE6, IE5
		  xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
		  }

		var url = "addcommservlet?content="+ filterText(oMessage.value)+"choose="+Obj[i].value;
		xmlHttp.open("POST", url, true);
		
		
		xmlHttp.onreadystatechange = function() {
			if (xmlHttp.readyState == 4) {
				if (xmlHttp.status == 200) {
					if (xmlHttp.responseText == "1") {
						document.getElementById("spanalert").innerHTML = "<font color='red'>"
								+ "charuzhengque" + "</font>";
						
					} else if (xmlHttp.responseText == "2") {
						document.getElementById("spanalert").innerHTML = "<font color='red'>"
								+ "chauruyoucuowu" + "</font>";
					}
				} else {
					alert("请求失败，错误码=" + xmlHttp.status);
				}
			}
		};
		xmlHttp.send(null);
	}
}
	
</script>
</body>
</html>







