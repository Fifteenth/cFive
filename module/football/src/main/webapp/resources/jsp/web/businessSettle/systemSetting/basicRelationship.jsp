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
		
		<link rel="stylesheet" href="<%=path%>/resources/jsp/web/css/style.css" type="text/css" />
		<link rel="stylesheet" href="<%=path%>/resources/jsp/web/css/style_common.css" type="text/css" />
		<script language="JavaScript" src="<%=path%>/resources/jsp/web/javascript/public.js"></script>
		<title>系统</title>
	</head>
	<body>
		<form action="" name="indexForm">
		
			<div class="content_head">
				
				
				<div class="box">
					<div class="user_info">
						<div id="time_" style="margin-right: 8px">
							当前访问的是：系统管理->关系维护
						</div> 
					</div>
				</div>
				
				
				<!-- Head + Menu -->
				<%@ include file="../../navigationDiv.jsp" %> 
				
			     
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

