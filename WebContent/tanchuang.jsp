<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script type="text/javascript" src="js/jquery-1.4.4.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

		// 更多新闻
		function ml_close_demo() {
			$('.float-news').animate({
				left : '-450px'
			}, 300, function() {
				$('.float-open').delay(50).animate({
					left : '-2px'
				}, 300);
			});
		}
		function ml_open_demo() {
			$('.float-open').animate({
				left : '-70px'
			}, 100, function() {
				$('.float-news').delay(50).animate({
					left : '0px'
				}, 300);
			});
		}

		$('.float-close').click(function() {
			ml_close_demo();
			return false;
		});
		$('.open-btn').click(function() {
			ml_open_demo();
			return false;
		});

	});
</script>

<style type="text/css">
* {
	margin: 0;
	padding: 0;
	list-style-type: none;
}

a,img {
	border: 0;
}

body {
	_background-image: url(about:blank); /*用浏览器空白页面作为背景*/
	_background-attachment: fixed;
	/* prevent screen flash in IE6 确保滚动条滚动时，元素不闪动*/
}

body {
	font: 12px/180% Arial, Helvetica, sans-serif, "新宋体";
	background: #E3E4E2;
}
/* float-news */
.float-news,.float-open {
	background: #fbfbfb;
	border: 2px solid #e1e1e1;
	border-left: 0 none;
	border-top-right-radius: 4px;
	border-bottom-right-radius: 4px;
	box-shadow: 1px 1px 2px rgba(0, 0, 0, 0.5);
	display: inline-block;
	font-size: 16px;
	border-left: 0 none;
	border-top-right-radius: 4px;
	border-bottom-right-radius: 4px;
	box-shadow: 1px 1px 2px rgba(0, 0, 0, 0.5);
	display: inline-block;
	font-size: 16px;
	border: 2px solid #e1e1e1;
	border-left: 0 none;
	border-top-right-radius: 4px;
	border-bottom-right-radius: 4px;
	box-shadow: 1px 1px 2px rgba(0, 0, 0, 0.5);
	display: inline-block;
	font-size: 16px;
}

.float-news {
	overflow: scroll;
	height: 550px;
	left: 0px;
	padding: 10px 15px;
	width: 340px;
	z-index: 100;
	top: 117px;
	_margin-top: 117px;
}

.float-open {
	height: 48px;
	left: -70px;
	padding: 4px 4px 4px 6px;
	width: 48px;
	z-index: 99;
	top: 206px;
	_margin-top: 206px;
}

.float-news,.float-open {
	position: fixed;
	*zoom: 1;
	_position: absolute;
	_top: expression(eval(document.documentElement.scrollTop));
	_top: expression(eval(document.documentElement.scrollTop));
	_top: expression(eval(document.documentElement.scrollTop));
}

.float-close {
	background: url(images/nav-close.png) no-repeat left top;
	overflow: hidden;
	height: 48px;
	opacity: .6;
	filter: alpha(opacity = 60);
	position: absolute;
	right: 9px;
	text-indent: 100%;
	top: 10px;
	white-space: nowrap;
	width: 48px;
}

.open-btn {
	background: url(images/ml-open-demo.png) no-repeat left top;
	display: block;
	overflow: hidden;
	height: 48px;
	opacity: .6;
	filter: alpha(opacity = 60);
	text-indent: 100%;
	white-space: nowrap;
	width: 48px;
}

.float-close:hover,.open-btn:hover {
	opacity: 1;
	filter: alpha(opacity = 100);
}

.commentlist h3 {
	color: #333;
	border-bottom: 4px solid #F2F2F2;
	font-size: 26px;
	height: 54px;
	line-height: 54px;
	font-family: Microsoft Yahei, simsun, arial, sans-serif;
}

.commentlist ul {
	margin-top: 10px;
}

.commentlist li {
	position: relative;
	height: 30px;
	line-height: 30px;
	font-size: 14px;
	border-bottom: 1px #ccc dotted
}

.commentlist li a {
	color: #404040;
}

.commentlist li span {
	position: absolute;
	right: 0;
	color: #ccc;
}

.commentlist li:last-child {
	border-bottom: 0;
}
</style>

<div class="float-open" id="float-open" style="left: -2px;">
	<a class="open-btn" href="javascript:void(0);">&gt;</a>
</div>

<div class="float-news" id="float-news" style="left: -450px;">
	<a class="float-close" href="javascript:void(0);">X</a>
	<div class="commentlist">
		<h3>评论</h3>
		<ul>
			<li>hahah</li>
			<li>hahah</li>
			<li>hahah</li>
			<li>hahah</li>
			<li>hahah</li>
			<li>hahah</li>
			<li>hahah</li>
			<li>hahah</li>
			<li>hahah</li>
			<li>hahah</li>
			<li>hahah</li>
			<li>hahah</li>
			<li>hahah</li>
			<li>hahah</li>
			<li>hahah</li>
			<li>hahah</li>
			<li>hahah</li>
			<li>hahah</li>
		</ul>
	</div>
</div>

<div style="height: 2000px;"></div>