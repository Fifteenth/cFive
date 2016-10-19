<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script language="JavaScript" src="../resources/jsp/web/javascript/public.js"></script>
<link rel="stylesheet" href="../resources/jsp/web/css/style.css" type="text/css" />

<title>系统</title>

<style type="text/css">
* {
	margin: 0;
	padding: 0;
	border: 0;
}

body {
	font-size: 14px;
	font-family: Arial, Helvetica, sans-serif;
	text-align: center;
}

.user_info {
	float: right;
	margin-top: 25px;
	margin-right: 25px;
}

.user_info span {
	font-size: 11px;
	color: #258;
	font-family: Verdana;
	font-weight: bolder;
}

.content_head {
	background: url(../resources/jsp/web/images/bg.jpg) no-repeat;
	height: 435px;
	width: 782px;
    /*text-align:center;*//* 不加就能居中*/
    margin:0 auto; /*不加这个就不居中了，改为左对齐*/
 
}

.box {
	height: 40px;
	margin-top: 0px;
	width: 782px;
}

.buttom_welcome {
	float: right;
	margin-right: 20px;
	margin-top: 15px;
}

.buttom_welcome a {
	background: url(images/menu_button.gif) repeat-x;
	color: #FFFFFF;
	font-size: 14px;
	text-decoration: none;
}

#iframebody {
	height: 300px;
	margin-top: 50px;
	margin-align: center;
	width: 780px;
}
</style>
<script type="text/javascript">
	function welcome() {
		var welcomtTitle = document.all.welcome.value;
		var now = new Date();
		var str = welcomtTitle + "  当前时间：";
		var year = now.getYear();
		var month = (now.getMonth() + 1);
		var day = now.getDate();
		var hour = now.getHours();
		var minutes = now.getMinutes();
		var seconds = now.getSeconds();
		str = str + year;
		str = str + (month < 10 ? "-0" : "-") + month;
		str = str + (day < 10 ? "-0" : "-") + day + " ";
		str = str + hour;
		str = str + (minutes < 10 ? ":0" : ":") + minutes;
		str = str + (seconds < 10 ? ":0" : ":") + seconds;
		document.getElementById("time_").innerHTML = str;
		var ctimer = setTimeout('welcome()', 960);
	}
</script>

	</head>
	<body>
		<form action="" name="indexForm">
		
			<div class="content_head">
				
				
				<div class="box">
					<div class="user_info">
						<div id="time_">您好：${login} ，欢迎登录！</div> 
					</div>
				</div>
				
				
				<!-- Head + Menu -->
				<%@ include file="navigationDiv.jsp" %> 
				
			     
				<div id="iframebody">
				
					<iframe src="header" frameborder="0"
						name="head"  height="32"
						width="705" scrolling="no" marginheight="1" id="head" >
					</iframe>
				
					<iframe src="bottom" frameborder="0"
						name="bottom"  height="275"
						width="705" scrolling="auto" id="bottom" >
					</iframe>
				</div>
				
				
			</div>
			
			
			
		</form>
	</body>
</html>

