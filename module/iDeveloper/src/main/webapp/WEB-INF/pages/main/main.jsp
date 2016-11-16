<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path;
%>
<html>
<head>
	<title>Main page</title>

	<link rel="stylesheet" type="text/css" href="<%=basePath%>/resources/css/coffee.milk.css"/>
	<script type="text/javascript" src="<%=basePath%>/resources/javascript/jquery-1.11.0.min.js"></script>

	<script type="text/javascript">
		$(document).ready(function(){
			var $thead = $("<thead id=\"thead\"></thead>");
			$("#table_issue").append($thead);
			var array = <%=request.getAttribute("fArray")%>;
			var $th1 =  $("<th>NO.</th>");
			var $th2 =  $("<th>Title 1</th>");
			var $th3 =  $("<th>Title 2</th>");
			var $th4 =  $("<th>Title 3</th>");
			var $th5 =  $("<th>Name</th>");
			var $th6 =  $("<th>Descrption</th>");
			var $th7 =  $("<th>link</th>");
			$("#thead").append($th1);
			$("#thead").append($th2);
			$("#thead").append($th3);
			$("#thead").append($th4);
			$("#thead").append($th5);
			$("#thead").append($th6);
			$("#thead").append($th7);
			var $tbody = $("<tbody id=\"tbody\"></tbody>");
			$("#table_issue").append($tbody);
			for(var i=0;i<array.length;i++){
				var $tr;
				if(i%2 == 1){
					$tr = $("<tr class=\"odd\"></tr>");
				}else{
					$tr = $("<tr></tr>");
				}
				var $td1 =  $("<td>" + (i+1) +"</td>");
				var $td2 =  $("<td>" + array[i].title1 +"</td>");
				var $td3 =  $("<td>" + array[i].title2 +"</td>");
				var $td4 =  $("<td>" + array[i].title3 +"</td>");
				var $td5 =  $("<td><a href='<%=basePath%>/viewLink/" + array[i].id + "' target='_blank'>" + array[i].name + "</a></td>");
				var $td6 =  $("<td>" + array[i].description +"</td>");
				var $td7;
				var link = array[i].link;
				if(link != null && link != '') {
					$td7 = $("<td id=\"td_link\"><a href='" + link + "' target='_blank'>link</a></td>");
				}else{
					$td7 = $("<td> unsolved </td>");
				}
				$tr.append($td1);
				$tr.append($td2);
				$tr.append($td3);
				$tr.append($td4);
				$tr.append($td5);
				$tr.append($td6);
				$tr.append($td7);
				$("#tbody").append($tr);
			}
		});
	</script>

</head>

<body>
	<h1>ISSUE</h1>

	<div style="width: 90%; margin: auto">
		<input type="text"/> <input type="button" value="search"/>
		<table id="table_issue" style="width: 100%;margin: auto;padding-top: 10px">
		</table>
	</div>
</body>
</html>