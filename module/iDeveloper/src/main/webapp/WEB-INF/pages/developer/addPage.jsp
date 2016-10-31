<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path;
%>
<html>
<head>
    <title>Developer Add Page</title>

    <sec:csrfMetaTags/>
    <script type="text/javascript" src="<%=basePath%>/resources/javascript/jquery-1.11.0.min.js"></script>

    <script type="text/javascript">
        function add(){
                $.ajax({
                    url: '/five/iDeveloper/add',
                    type: 'Post',
                    dataType: 'json',
                    data: {
                        playerNumber: '11',
                    }
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
                    <select>
                        <option value="1"> ---- </option>
                        <option value="1"> JAVA </option>
                        <option value="1"> Net </option>
                        <option value="1"> JAVA </option>
                        <option value="1"> JAVA </option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>Title 2</td>
                <td>
                    <select>
                        <option value="1"> ---- </option>
                        <option value="1"> JAVA </option>
                        <option value="1"> Net </option>
                        <option value="1"> JAVA </option>
                        <option value="1"> JAVA </option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>Title 3</td>
                <td>
                    <select>
                        <option value="1"> ---- </option>
                        <option value="1"> JAVA </option>
                        <option value="1"> Net </option>
                        <option value="1"> JAVA </option>
                        <option value="1"> JAVA </option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>Decription</td>
                <td>
                    <textarea rows="4" cols="50"></textarea>
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
