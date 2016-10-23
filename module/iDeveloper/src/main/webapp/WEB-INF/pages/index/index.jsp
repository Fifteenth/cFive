<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path;
%>
<html>
<head>
	<title>首页</title>

	<script type="text/javascript" src="<%=basePath%>/resources/javascript/jquery-1.11.0.min.js"></script>
</head>

<body>
<h1>首页</h1>

<h2>登录成功</h2>

<%=request.getAttribute("aa")%>
</body>
</html>