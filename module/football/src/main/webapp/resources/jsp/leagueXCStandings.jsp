<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
	<title>相城足球联赛</title>
	<link rel="stylesheet" href="<%=basePath%>/resources/css/style.css" type="text/css" media="all" />
	<!--[if lte IE 6]><link rel="stylesheet" href="css/ie6.css" type="text/css" media="all" /><![endif]-->
	
	<link rel="stylesheet" href="<%=basePath%>/resources/tablecloth/tablecloth.css" type="text/css" media="screen" />
	<script type="text/javascript" src="<%=basePath%>/resources/jquery-1.2.6.pack.js"></script>
	<script type="text/javascript">
		var t = n = 0, count;
		$(document).ready(function(){
			
			var lastRound = <%=request.getAttribute("lastRound")%>;
			$("#round").append("积分榜（第" + lastRound + "轮)");
			standings();
		});
		
		// 积分榜
		function standings(){
			var array = <%=request.getAttribute("array")%>;
			for(var i=0;i<array.length;i++){
				var $tr = $("<tr></tr>");
				var $td1 =  $("<td>" + (i+1) +"</td>");
				var $td2 =  $("<td>" + array[i].club +"</td>");
				var $td3 =  $("<td>" + array[i].win +"</td>");
				var $td4 =  $("<td>" + array[i].draw +"</td>");
				var $td5 =  $("<td>" + array[i].lose +"</td>");
				var $td6 =  $("<td>" + array[i].goalEnter +"</td>");
				var $td7 =  $("<td>" + array[i].goalLose +"</td>");
				var $td8 =  $("<td>" + array[i].goalDifference +"</td>");
				var $td9 =  $("<td>" + array[i].integration +"</td>");
				$tr.append($td1);
				$tr.append($td2);
				$tr.append($td3);
				$tr.append($td4);
				$tr.append($td5);
				$tr.append($td6);
				$tr.append($td7);
				$tr.append($td8);
				$tr.append($td9);
				$("#table_league").append($tr);
			}
		}
	</script>
</head>
<body>
	<!-- Header -->
	<div id="header">
		<div class="shell">
			<!-- Logo -->
			<h1 id="logo" class="notext"><a href="#">业余足球联赛</a></h1>
			<!-- End Logo -->
		</div>
	</div>
	<!-- End Header -->
	
	<!-- Navigation -->
	<%@ include file="navigationDiv.jsp" %> 
	<!-- End Navigation -->
	
	<!-- Heading -->
	<div id="heading">
		<div class="shell">
			<div id="heading-cnt">
				
				<div id="side-nav"><h4 id="round" align="left"></h4>
					<table id="table_league" cellspacing="0" cellpadding="0" width="100%">
						<tr>
							<th>排名</th>
							<th>球队</th>
							<th>胜</th>
							<th>平</th>
							<th>负</th>
							<th>进球</th>
							<th>失球</th>
							<th>净胜球</th>
							<th>积分</th>
						</tr>
										
					</table>
		
				</div>
				
			</div>			
		</div>
	</div>
</body>
</html>