<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>

<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<head>
	<link rel="stylesheet" href="<%=path%>/resources/jsp/menu/css/dtree.css" type="text/css">
	<script LANGUAGE="JavaScript" src="<%=path%>/resources/jsp/menu/javascript/outlook.js"></script>
	<script type="text/javascript" src="<%=basePath%>/resources/js/jquery-1.11.0.min.js"></script>
</head>
<body class="pagebody">
	
	<script>
	
		d = new dTree('d');
		<c:forEach items="${modules}" var="module">
			d.add(${module.id},${module.parentId},"${module.name}","${module.url}","","content");
		</c:forEach>
		document.write(d);
		d.closeAll();
		
	</script>


</body>