<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<base href="<%=basePath%>">

<title>咖啡程序员 个人分享</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="咖啡程序员,相城足球联赛">
	<meta http-equiv="description" content="咖啡程序员 个人分享">
</head>
<body background="<%=basePath%>/resources/imgs/pp.jpg">
<div
	style="width:800px;margin-top:10px;margin-left: auto;margin-right: auto;text-align: center;">
	<h2>咖啡程序员 个人分享</h2>
</div>
<div style="width:800px;margin-left: auto;margin-right: auto;">
	<fieldset class="uk-form">
		<legend>分享链接</legend>
		<div class="uk-form-row" style="margin-top: 20px;">
			<a href="#">个人博客</a>
		</div>
		<div class="uk-form-row" style="margin-top: 20px;">
			<a href="<%=basePath%>league/xc">相城足球联赛</a>
		</div>
	</fieldset>
</div>

</body>
</html>
