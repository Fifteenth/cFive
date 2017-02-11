<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path;
%>

<link rel="stylesheet" type="text/css" href="<%=basePath%>/resources/css/coffee.milk.css"/>

<div align="center">
    <table id="table_issue" style="width: 100%;margin: auto;padding-top: 10px">
        <thead>
        <tr>
            <th>NO.</th>
            <th>Title 1</th>
            <th>Title 2</th>
            <th>Title 3</th>
            <th>Name</th>
            <%--<th>Descrption</th>--%>
            <th>link</th>
        </tr>
        </thead>
        <tbody>
            <c:forEach var="fItem" items="${fArray}" varStatus="counter">
                <tr class="${counter.index % 2 == 0 ? 'odd' : 'even'}">
                    <td><c:out value="${counter.count}" /></td>
                    <td><c:out value="${fItem.title1}" /></td>
                    <td><c:out value="${fItem.title2}" /></td>
                    <td><c:out value="${fItem.title3}" /></td>
                    <td><a href='<%=basePath%>/viewPage/${fItem.id}' target='_blank'> ${fItem.name}</a></td>
                    <%--<td><c:out value="${fItem.description}" /></td>--%>
                    <c:choose>
                        <c:when test="${fItem.link != null && fItem.link != ''}">
                            <td id=\"td_link\"><a href='${fItem.link}' +  target='_blank'>link</a></td>
                        </c:when>
                        <c:otherwise>
                            <td> unsolved </td>
                        </c:otherwise>
                    </c:choose>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>