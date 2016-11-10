<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Login</title>
</head>
<body>

<h1>System Login</h1>

<div>
    <c:if test="${param.error != null}">
        <p>wrong username or password</p>
    </c:if>
    <c:if test="${param.logout != null}">
        <p>L=You alread log out！</p>
    </c:if>
</div>
<c:url value="/login" var="loginUrl"/>
<form action="${loginUrl}" method="post" id="loginForm">
    <div>
        <input type="text" name="username" class="username" placeholder="用户名" autocomplete="off"/>
    </div>
    <div>
        <input type="password" name="password" class="password" placeholder="密码" oncontextmenu="return false" onpaste="return false"/>
    </div>
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    <button id="submit" type="submit">Login</button>
</form>


</body>
</html>