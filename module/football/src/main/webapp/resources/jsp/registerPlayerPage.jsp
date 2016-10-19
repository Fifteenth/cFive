<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<base href="<%=basePath%>">

<title>球员注册</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
</head>
<body>
<div style="width:800px;margin-top:10px;margin-left: auto;margin-right: auto;text-align: center;">
	<h2>球员注册</h2>
</div>
<div style="width:800px;margin-left: auto;margin-right: auto;">
	<fieldset class="uk-form">
		<legend>[球员] 个人资料</legend>
		<div class="uk-form-row">
			<label>身份证号：</label>
			<input id="idCard" type="text" class="uk-width-1-1">
			<button class="uk-button uk-button-primary uk-button-large" id="btnGet">获取人员</button>
			<button class="uk-button uk-button-primary uk-button-large" id="btnRegister">注册</button>
		</div>
		<div>
			&nbsp;
		</div>
		<div class="uk-form-row">
			<label>&nbsp;&nbsp;&nbsp;&nbsp;姓名：</label>
			<input id="name" type="text" class="uk-width-1-1 uk-form-success" disabled>
		</div>
		<div class="uk-form-row">
			
			<label>&nbsp;&nbsp;&nbsp;&nbsp;号码：</label>
			<input id="number" type="text" class="uk-width-1-1" disabled>
		</div>
		<div class="uk-form-row">
			<label>&nbsp;&nbsp;&nbsp;&nbsp;球队：</label>
			<input id="club" type="text" class="uk-width-1-1 uk-form-danger" disabled>
		</div>
	</fieldset>
	
	<fieldset class="uk-form">
		<legend>[球员] 比赛记录</legend>
		
		<div>
		<table width="100%">
			<tr>
				<th width="20%">赛季</th>
				<th width="16%">进球</th>
				<th width="16%">助攻</th>
				<th width="16%">红牌</th>
				<th width="16%">黄牌</th>
				<th width="16%">备注</th>
			</tr>
		</table>
		
		<table id="playerRecordList" width="100%">
		</table>
		
	</fieldset>
	
</div>

<script type="text/javascript" src="<%=basePath%>/resources/js/jquery-1.11.0.min.js"></script>
<script type="text/javascript">
	(function(window,$){

		var dekota={
			url:'',
			init:function(){
				dekota.url='<%=basePath%>';
				$("#btnGet").click(dekota.getPlayer);
				$("#btnRegister").click(dekota.registerPlayer);
				$("#btnAdd").click(dekota.addPlayer);
				$("#btnDel").click(dekota.delPlayer);
				$("#btnUpdate").click(dekota.updatePlayer);
				$("#btnList").click(dekota.listPlayer);
			},
			getPlayer:function(){
				if($("#idCard").val() == null || $("#idCard").val() == ''){
					alert('请输入身份证号，谢谢！！');
					return;
				}
				$.ajax({
					url: dekota.url + 'player/getPlayer/' + $("#idCard").val(),
					type: 'GET',
					dataType: 'json'
				}).done(function(resultJson, status, xhr) {
					if(resultJson.result == 'error_1'){
						alert('没有查到球员信息，请确认输入的身份证是否正确！');
						return;
					}
					
					
					$("#name").val(resultJson.player.name);
					$("#number").val(resultJson.player.number);
					$("#club").val(resultJson.player.club);
					
					// clear
					$('#playerRecordList').empty();
					
					var playerRecordList = resultJson.playerRecordList;
					var length = playerRecordList.length;
					
					if(length == 0){
						$('#playerRecordList').append("<tr><td align=center width=\"100%\">--没有数据--</td>" + "</tr>");
						return;	
					}
					
					for(i=0;i<length;i++){
						var playerRecord = playerRecordList[i];
						
						$('#playerRecordList').append("<tr>" 
										+ "<td align=center width=\"20%\">" + playerRecord.season + "</td>"
										+ "<td align=center width=\"16%\">" + playerRecord.goal + "</td>"
										+ "<td align=center width=\"16%\">" + playerRecord.assist + "</td>"
										+ "<td align=center width=\"16%\">" + playerRecord.redCard + "</td>"
										+ "<td align=center width=\"16%\">" + playerRecord.yellowCard + "</td>"
										+ "<td align=center width=\"16%\">" + playerRecord.remark + "</td>"
										+ "</tr>");
					}
				}).fail(function(xhr, status, error) {
					alert('查询失败，请稍后再试');
				});
			},
			registerPlayer:function(){
				$.ajax({
					url: dekota.url + 'player/registerPlayer/',
					type: 'POST',
					dataType: 'json',
					data: {
							playerNumber: $("#playerNumber").val(),
							playerName:$("#playerName").val(),
							club:$("#club").val()
							}
				}).done(function(data, status, xhr) {
					alert('success');
				}).fail(function(xhr, status, error) {
					alert('fail');
				});
			},
			updatePlayer:function(){
				$.ajax({
					url: dekota.url + 'player/updatePlayer/',
					type: 'PUT',//注意在传参数时，加：_method:'PUT'　将对应后台的PUT请求方法
					dataType: 'json',
					data: {
							playerNumber: $("#playerNumber").val(),
							playerName:$("#playerName").val(),
							club:$("#club").val()
							}
				}).done(function(data, status, xhr) {
					alert('success');
				}).fail(function(xhr, status, error) {
					alert('fail');
				});
			},
			delPlayer:function(){
				$.ajax({
					url: dekota.url + 'player/deletePlayer/' + $("#playerNumber").val(),
					type: 'DELETE',
					dataType: 'json',
					data: {
							playerNumber: $("#playerNumber").val(),
							playerName:$("#playerName").val(),
							club:$("#club").val()
							}
				}).done(function(data, status, xhr) {
					alert('success');
				}).fail(function(xhr, status, error) {
					alert('fail');
				});
			},
			listPlayer:function(){
				$.ajax({
					url: dekota.url + 'player/listPlayer',
					type: 'GET',
					dataType: 'json'
				}).done(function(data, status, xhr) {
				}).fail(function(xhr, status, error) {
				});
			}
		};
		window.dekota=(window.dekota)?window.dekota:dekota;
		$(function(){
			dekota.init();
		});
	})(window,jQuery);

</script>
</body>
</html>
