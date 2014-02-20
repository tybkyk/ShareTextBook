<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>CSS3点击显示</title>
<style>
*{ margin:0; padding:0; }
html{ height:100%; }
p{ padding:10px 0; }
body{ min-height:100%; font-family:arial; position:relative; }
body.sideMenu{ margin:0; -webkit-transform:none; transform:none; }
#sideToggle{ display:none; }
#sideToggle:checked + aside{ left:0; }
#sideToggle:checked ~ #wrap{ padding-left:220px; }
body > aside{ position:absolute; top:0; bottom:0; left:-200px; width:200px; background:#f1103a; transition:0.2s ease-out; -webkit-transition:0.2s ease-out; }
body > aside > h2{ color:#FFF; text-align:center; font-weight:normal; padding:10px; }
#wrap{ margin-left:20px; padding:10px; transition:0.25s ease-out; -webkit-transition:0.25s ease-out; }
  #wrap > label{ display:inline-block; }
    #wrap > label{ 
      background:#f1103a;
      border-radius:50px;
      color: #FFF;
      cursor: pointer;
      display: block;
      font-family: Courier New;
      font-size: 25px;
      font-weight: bold;
      width: 30px;
      height: 30px;
      line-height: 35px;
      text-align: center;
      text-shadow: 0 -4px;
    }
    #wrap > label:hover{ background:#000; }
</style>
</head>
<body>
<input type='checkbox' id='sideToggle'>
<aside><h2>Side Menu</h2></aside>
<div id='wrap'>
     <label id='sideMenuControl' for='sideToggle'>=</label>
    <p>HTML5/CSS3点击显示侧边框   </p>
  </div>
</body>
</html>