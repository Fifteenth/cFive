﻿<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
	
	<style type="text/css">
		#banner {position:relative; width:440px; height:310px; border:1px solid #666; overflow:hidden;}
		#banner_bg {position:absolute; bottom:0;background-color:#000;height:30px;filter: Alpha(Opacity=30);opacity:0.3;z-index:1000;cursor:pointer; width:478px; }
		#banner_info{position:absolute; bottom:0; left:5px;height:22px;color:#fff;z-index:1001;cursor:pointer}
		#banner_text {position:absolute;width:120px;z-index:1002; right:3px; bottom:3px;}
		#banner ul {position:absolute;list-style-type:none;filter: Alpha(Opacity=80);opacity:0.8; border:1px solid #fff;z-index:1002;
					margin:0; padding:0; bottom:3px; right:5px;}
		#banner ul li { padding:0px 8px;float:left;display:block;color:#FFF;border:#e5eaff 1px solid;background:#6f4f67;cursor:pointer}
		#banner ul li.on { background:#900}

		#banner_list a{position:absolute;} /*让四张图片都可以重叠在一起*/ /* -- 好像没什么用*/
		#banner_list a img {border:0px;width:440px;height:310px}
	</style>
	
	
	<script type="text/javascript" src="<%=basePath%>/resources/jquery-1.2.6.pack.js"></script>
	<script type="text/javascript">
		var t = n = 0, count;
		$(document).ready(function(){	
			count=$("#banner_list a").length;
			$("#banner_list a:not(:first-child)").hide();
			$("#banner_info").html($("#banner_list a:first-child").find("img").attr('alt'));
			$("#banner_info").click(function(){window.open($("#banner_list a:first-child").attr('href'), "_blank")});
			$("#banner li").click(function() {
				var i = $(this).text() - 1;//获取Li元素内的值，即1，2，3，4
				n = i;
				if (i >= count) return;
				$("#banner_info").html($("#banner_list a").eq(i).find("img").attr('alt'));
				$("#banner_info").unbind().click(function(){window.open($("#banner_list a").eq(i).attr('href'), "_blank")})
				$("#banner_list a").filter(":visible").fadeOut(500).parent().children().eq(i).fadeIn(1000);
				document.getElementById("banner").style.background="";
				$(this).toggleClass("on");
				$(this).siblings().removeAttr("class");
			});
			t = setInterval("showAuto()", 4000);
			$("#banner").hover(function(){clearInterval(t)}, function(){t = setInterval("showAuto()", 4000);});
		})
		
		function showAuto()
		{
			n = n >=(count - 1) ? 0 : ++n;
			$("#banner li").eq(n).trigger('click');
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
	<div id="navigation">
		<div class="shell">
			<div class="cl">&nbsp;</div>
			<ul>
				<li><a href="<%=basePath%>resources/jsp/leagueXCStandings.jsp" target="_blank"><h5>积分榜</h5></a></li>
				<li><a href="<%=basePath%>resources/jsp/leagueXCScorers.jsp" target="_blank"><h5>射手榜</h5></a></li>
			    <li><a href="#">公告</a></li>
			    <li><a href="#">图片</a></li>
			    <li><a href="#">视频</a></li>
			    <li><a href="#">论坛</a></li>
			    <li><a href="#">赞助商</a></li>
			</ul>
			<div class="cl">&nbsp;</div>
		</div>
	</div>
	<!-- End Navigation -->
	
	<!-- Heading -->
	<div id="heading">
		<div class="shell">
			<div id="heading-cnt">
				<div class="featured-side-item"	style="width: 230px; height: 10px; top: 10px; margin-top: 5px;";>
					<table width="100%">
						<tr>
							<td width="70%" style="text-align: left;"><strong>积分榜（第11轮)</strong></td>
							<td width="30%" style="text-align: right;">
								<a href="<%=basePath%>resources/jsp/leagueXCStandings.jsp" target="_blank">
								<strong><<详细</strong>
								</a>
							</td>
						</tr>
					</table>
				</div>
					
				<!-- Sub nav -->
				<div id="side-nav">
					
					
					<table cellspacing="0" cellpadding="0" width="230px">
						<tr>
							<th>排名</th>
							<th>球队</th>
							<th>积分</th>
						</tr>
						<tr>
							<td>1</td>
							<td>圣宝莱家居</td>
							<td>22</td>
						</tr>
						<tr>
							<td>2</td>
							<td>浒通大酒店</td>
							<td>21</td>
						</tr>
						<tr>
							<td>3</td>
							<td>名图贸易</td>
							<td>18</td>
						</tr>
						<tr>
							<td>4</td>
							<td>太平98</td>
							<td>18</td>
						</tr>
						<tr>
							<td>5</td>
							<td>阳澄湖宝盛</td>
							<td>15</td>
						</tr>
						<tr>
							<td>6</td>
							<td>绿茵传奇</td>
							<td>12</td>
						</tr>
						<tr>
							<td>7</td>
							<td>黄埭一队</td>
							<td>11</td>
						</tr>	
						<tr>
							<td>8</td>
							<td>冬宝一队</td>
							<td>11</td>
						</tr>	
						<tr>
							<td>9</td>
							<td>相城公安</td>
							<td>10</td>
						</tr>
						<tr>
							<td>10</td>
							<td>相城竞技</td>
							<td>7</td>
						</tr>
						<tr>
							<td>11</td>
							<td>陆慕黑马</td>
							<td>6</td>
						</tr>
						<tr>
							<td>12</td>
							<td>冬宝二队</td>
							<td>3</td>
						</tr>
						<tr>
							<td>13</td>
							<td>相城罗马</td>
							<td>1</td>
						</tr>					
					</table>
		
					<!--
					<ul>
					    <li class="active"><div class="link"><a href="#">1&nbsp;&nbsp;码农</a></div></li>
					    <li><div class="link"><a href="#">2&nbsp;&nbsp;周九晚五</a></div></li>
					    <li><div class="link"><a href="#">3&nbsp;&nbsp;民图</a></div></li>
					    <li><div class="link"><a href="#">4&nbsp;&nbsp;国米</a></div></li>
					</ul>
					-->
				</div>
				<!-- End Sub nav -->
				
				<!-- Widget -->
				<div id="heading-box">
					<div id="heading-box-cnt">
						<div class="cl">&nbsp;</div>
						
							
						<!-- Main Slide Item -->
						<div class="featured-main">
							<div id="banner">	
								<div id="banner_bg"></div>  <!--标题背景-->
								<div id="banner_info"></div> <!--标题-->
								<ul>
									<li class="on">1</li>
									<li>2</li>
									<li>3</li>
									<li>4</li>
								</ul>
							   <div id="banner_list">
									<a href="#" target="_blank"><img src="<%=basePath%>/resources/imgs/p1.jpg" /></a>
									<a href="#" target="_blank"><img src="<%=basePath%>/resources/imgs/p2.jpg" /></a>
									<a href="#" target="_blank"><img src="<%=basePath%>/resources/imgs/p3.jpg" /></a>
									<a href="#" target="_blank"><img src="<%=basePath%>/resources/imgs/p4.jpg" /></a>
								</div>
							</div>
							
							<!--
							<div class="featured-main-details">
								<div class="featured-main-details-cnt">									
									<h4><a href="#">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</a></h4>
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque turpis urna, rhoncus a tempus in, blandit vel nibh. Sed interdum erat eget lacus commodo mattis.</p>
								</div>
							</div>
							-->
						</div>
						<!-- End Main Slide Item -->
						
						
						
						
						<div class="featured-side">
							<h5>2015-06-06&nbsp;&nbsp;第12轮（下一轮）&nbsp;&nbsp;对阵情况</h5>
							
							<!-- Slide Item 1 -->
							<div class="featured-side-item" style="margin-top:20px;">
								<div class="cl">&nbsp;</div>
								<p><h5>当轮轮空 </h5></p>
								<h4 align="center">陆慕黑马</h4>
							</div>
							<div class="featured-side-item">
								<div class="cl">&nbsp;</div>
								<p><h5>12:10-13:40</h5></p>
								
								<table>
									<tr>
										<td width="50%"
											style="text-align: right; font-size: 12px; color: #9fea00;"><strong>绿茵传奇</strong></td>
										<td width="10%"
											style="text-align: center; font-size: 12px; color: #9fea00;"><strong>VS</strong></td>
										<td width="40%"
											style="text-align: left; font-size: 12px; color: #9fea00;"><strong>黄埭一队</strong></td>
									</tr>
									<tr>
										<td width="50%"
											style="text-align: right; font-size: 12px; color: #9fea00;"><strong>冬宝一队</strong></td>
										<td width="10%"
											style="text-align: center; font-size: 12px; color: #9fea00;"><strong>VS</strong></td>
										<td width="40%"
											style="text-align: left; font-size: 12px; color: #9fea00;"><strong>太平98</strong></td>
									</tr>
								</table>
							</div>
							<!-- End Slide Item 1 -->
							
							<!-- Slide Item 2 -->
							<div class="featured-side-item">
								<div class="cl">&nbsp;</div>
								<p><h5>13:40-15:20</h5></p>
																
								<table>
									<tr>
										<td width="50%"
											style="text-align: right; font-size: 12px; color: #9fea00;"><strong>相城罗马</strong></td>
										<td width="10%"
											style="text-align: center; font-size: 12px; color: #9fea00;"><strong>VS</strong></td>
										<td width="40%"
											style="text-align: left; font-size: 12px; color: #9fea00;"><strong>阳澄湖宝盛</strong></td>
									</tr>
									<tr>
										<td width="50%"
											style="text-align: right; font-size: 12px; color: #9fea00;"><strong>相城公安</strong></td>
										<td width="10%"
											style="text-align: center; font-size: 12px; color: #9fea00;"><strong>VS</strong></td>
										<td width="40%"
											style="text-align: left; font-size: 12px; color: #9fea00;"><strong>相城竞技</strong></td>
									</tr>
								</table>
							</div>
							<!-- End Slide Item 2 -->
							
							<!-- Slide Item 3 -->
							<div class="featured-side-item">
								<div class="cl">&nbsp;</div>
								<p><h5>15:20-17:00</h5></p>
																
								<table>
									<tr>
										<td width="50%"
											style="text-align: right; font-size: 12px; color: #9fea00;"><strong>圣宝莱家居</strong></td>
										<td width="10%"
											style="text-align: center; font-size: 12px; color: #9fea00;"><strong>VS</strong></td>
										<td width="40%"
											style="text-align: left; font-size: 12px; color: #9fea00;"><strong>东宝二队</strong></td>
									</tr>
									<tr>
										<td width="50%"
											style="text-align: right; font-size: 12px; color: #9fea00;"><strong>浒通大酒店</strong></td>
										<td width="10%"
											style="text-align: center; font-size: 12px; color: #9fea00;"><strong>VS</strong></td>
										<td width="40%"
											style="text-align: left; font-size: 12px; color: #9fea00;"><strong>名图贸易</strong></td>
									</tr>
								</table>
							</div>
							<!-- End Slide Item 3 -->
							
						</div>
						<div class="cl">&nbsp;</div>						
					</div>
				</div>
				<!-- End Widget -->
				
			</div>			
		</div>
	</div>
	<!-- End Heading -->
	
	<div style="text-align:center;margin-top: 4px;">
		最后更新时间：2015/06/01 16:03<br/>
		欢迎提供宝贵意见，联系人QQ：1278833522（咖啡程序员）
	</div>
	
	<div style="text-align:left;margin-top: 10px;margin-left: 100px">
		<h1>2015相城体育</h1>
	</div>
		
	<div style="text-align:left;margin-top: 24px;margin-left: 100px">
		<li>
			<a href="<%=basePath%>resources/jsp/peixun.html" target="_blank"><h3>相城少儿足球及游泳培训</img></h3></a>
		</li>
	</div>
</body>
</html>