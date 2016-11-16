<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path;
%>
<html>
<head>
    <title>View Links</title>

    <link rel="stylesheet" type="text/css" href="<%=basePath%>/resources/css/coffee.milk.css"/>
</head>
<body>

    <div align="center">
        <table border="1" cellpadding="5">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Profession</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="user" items="${fArray}">
                    <tr>
                        <td><c:out value="${user.id}" /></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

</body>
</html>
