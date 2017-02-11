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
    <script src="//cdn.ckeditor.com/4.6.0/standard/ckeditor.js"></script>
    <script type="text/javascript" src="<%=basePath%>/resources/javascript/jquery-1.11.0.min.js"></script>
    <script type="text/javascript">

        function save(){
            var token = $("meta[name='_csrf']").attr("content");
            var header = $("meta[name='_csrf_header']").attr("content");
            $.ajax({
                url: '/iDeveloper/update',
                type: 'Post',
                dataType: 'json',
                headers: {
                    header: token
                },
                data: {
                    id:$("#id").val(),
                    title1: $("#title1").val(),
                    title2: $("#title2").val(),
                    title3: $("#title3").val(),
                    name: $("#name").val(),
                    //description:$("#description").val(),
                    description:CKEDITOR.instances['description'].getData(),
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
                    <input id="id" value="${fModel.id}" hidden>
                    <input id="title1" value="${fModel.title1}">
                </td>
            </tr>
            <tr>
                <td>Title 2</td>
                <td>
                    <input id="title2" value="${fModel.title2}">
                </td>
            </tr>
            <tr>
                <td>Title 3</td>
                <td>
                    <input id="title3" value="${fModel.title3}">
                </td>
            </tr>
            <tr>
                <td>Name</td>
                <td>
                    <input id="name" value="${fModel.name}">
                </td>
            </tr>
            <tr>
                <td>Decription</td>
                <td>
                    <textarea id="description" name="description">${fModel.description}</textarea>
                    <script>
                        CKEDITOR.replace('description' );
                    </script>
                </td>
            </tr>
            <tr>
                <td>Decription</td>
                <td>
                    ${fModel.description}
                    <script>
                        CKEDITOR.replace('description' );
                    </script>
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
                    <input type="button" onclick="save()" value="Save">
                </td>
            </tr>
        </table>


    </form>
</body>
</html>