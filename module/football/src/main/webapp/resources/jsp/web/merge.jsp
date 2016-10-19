<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
	String path = request.getContextPath();
%>

<html>
	<head>
		<title>修改病区</title>
		<link rel="stylesheet" href="<%=path%>/resources/jsp/web/css/basic_table.css" type="text/css" />
		<script language="JavaScript" src="<%=path%>/resources/jsp/web/javascript/public.js"></script>
		
		<script>
		function closeOpen() 
		{ 
			window.opener.location.href="ssdyAction.do?method=ssdySearch";
		}
		</script>


	</head>

	<body>
		<form action="<%=path%>/ssdyAction.do?method=ssdyMerge"
			method="post" name="ssdyForm" id="ssdyForm">
			<input type="hidden" name="id" value="${ssdy.id}">
	
			<div class="table_title_bg">
				<div class="table_title">
					<span>修改病区信息</span>
				</div>
			</div>
			<table>
				<tr>
					<td width="15%" >
						名称
					</td>
					<td width="35%">
						<input type="text" name="username" value="${ssdy.username }" class="required"/>
					</td>
				</tr>
					
				<tr>
					<td>
						备注
					</td>
					<td colspan="3">
						<textarea rows="4" cols="60" name="password" class="required">${ssdy.password}</textarea>
					</td>
				</tr>
				
				<tr>
					<td colspan="4">
					<br>
						<input name="SubmitD" type="submit" value="提交"
							 />
						<input name="Reset" type="button" value="重设"
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
