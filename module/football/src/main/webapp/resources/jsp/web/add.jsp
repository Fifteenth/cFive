<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
	String path = request.getContextPath();
%>

<html>
	<head>
		<title>增加</title>
		<link rel="stylesheet" href="<%=path%>/resources/jsp/web/css/basic_table.css" type="text/css" />
		<script language="JavaScript" src="<%=path%>/resources/jsp/web/javascript/public.js"></script>

       	<script type="text/javascript">
		//关闭窗口
		function closeOpen() 
		{ 
			window.opener.location.href="ssdyAction.do?method=ssdySearch";
		}
	</script>
	</head>

	<body>
		<form action="<%=path%>/ssdyAction.do?method=ssdyAdd"
			method="post" name="ssdyForm" id="ssdyForm">
			<div class="table_title_bg">
				<div class="table_title">
					<span>添加</span>
				</div>
			</div>
			<table>
				<tr>
					<td width="20%" style="text-align:center">
						用户名
					</td>
					<td width="40%" style="text-align:center;padding-left: 0px"><!-- 这里有CSS控制 -->
						<input type="text" name="username" class="required"/>
					</td>
				</tr>
				<tr>
					<td style="text-align:center">
						密码
					</td>
					<td width="40%" style="text-align:center;padding-left: 0px">
						<textarea rows="4" name="password" class="required"></textarea>
					</td>
				</tr>
				
				<tr>
					<td colspan="4" style="text-align:center;padding-left: 0px">
					<br>
						<input type="submit" name="SubmitD" value="提交"/>
						<input type="button" name="Reset"  value="清空"
							onclick="showClear();" />
						<input name="Close" type="button" value="关闭"
							onclick="javascript:window.close();closeOpen();" />
					</td>
				</tr>
			</table>
		</form>
	    <%if (request.getAttribute("msg") != null) 
		{
		%>
		<script type="text/javascript">
		    alert("<%=request.getAttribute("msg")%>"); 
		</script>
		<%
		}
		%>
	</body>
</html>
