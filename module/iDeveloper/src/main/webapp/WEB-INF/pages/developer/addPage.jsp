<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path;
%>
<html>
<head>
    <meta name="_csrf" content="${_csrf.token}"/>
    <meta name="_csrf_header" content="${_csrf.headerName}"/>

    <title>Developer Add Page</title>

    <%-- Does sec tags need--%>
    <sec:csrfMetaTags/>
    <script type="text/javascript" src="<%=basePath%>/resources/javascript/jquery-1.11.0.min.js"></script>
    <script type="text/javascript">

        function add(){
            var token = $("meta[name='_csrf']").attr("content");
            var header = $("meta[name='_csrf_header']").attr("content");
            $.ajax({
                url: '/iDeveloper/add',
                type: 'Post',
                dataType: 'json',
                headers: {
                    header: token
                },
                data: {
                    title1: $("#title1").val(),
                    title2: $("#title2").val(),
                    title3: $("#title3").val(),
                    name: $("#name").val(),
                    description:$("#description").val(),
                    link: $("#link").val(),
                },
                beforeSend: function (xhr) {
                    xhr.setRequestHeader(header, token);
                },
            }).done(function(data, status, xhr) {
                alert('success');
            }).fail(function(xhr, status, error) {
                alert('fail');
            });
        };
    </script>
</head>
<body>
    <form>
        <table>
            <tr>
                <td>Title 1</td>
                <td>
                    <select id="title1">
                        <option value="-1"> ---- </option>
                        <option value="PROGRAM"> PROGRAM </option>
                        <option value="ISSUE"> ISSUE </option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>Title 2</td>
                <td>
                    <input id="title2">
                </td>
            </tr>
            <tr>
                <td>Title 3</td>
                <td>
                    <input id="title3">
                </td>
            </tr>
            <tr>
                <td>Name</td>
                <td>
                    <input id="name">
                </td>
            </tr>
            <tr>
                <td>Decription</td>
                <td>
                    <textarea id="description" rows="4" cols="50"></textarea>
                </td>
            </tr>
            <tr>
                <td>link</td>
                <td>
                    <input id="link" size="60">
                </td>
            </tr>
            <tr>
                <td>
                    <input type="button" onclick="add()" value="Add">
                </td>
            </tr>
        </table>


    </form>
</body>
</html>
