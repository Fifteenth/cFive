<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path;
%>
<nav id="left" class="column">
    <h5>NAVIGATION</h5>
    <ul>
        <c:forEach var="fItem" items="${fMenuItemArray}">
            <li>
                <a href="<%=basePath%>/query/navigation/${fItem}">${fItem}</a>
            </li>
        </c:forEach>
    </ul>
    <h4>Group</h4>
    <%--<ul>
        <li><a href="<%=basePath%>/query/group/Web Server">Web Server</a></li>
    </ul>
    <ul>
        <li><a href="<%=basePath%>/query/group/Log">Log</a></li>
    </ul>--%>
    <h3>popular</h3>
    <%--<ul>
        <li><a href="<%=basePath%>/query/popular/mybatis">mybatis</a></li>
    </ul>--%>
</nav>