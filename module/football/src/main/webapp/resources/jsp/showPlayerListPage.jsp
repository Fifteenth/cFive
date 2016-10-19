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

<title>WebRoot/index.jsp</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
</head>
<body>
<div style="width:800px;margin-top:10px;margin-left: auto;margin-right: auto;text-align: center;">
	<h2>Club</h2>
</div>
<div style="width:800px;margin-left: auto;margin-right: auto;">
	<fieldset class="uk-form">
		<legend>Player</legend>
		<div class="uk-form-row">
			号码：<input id="playerNumber" type="text" class="uk-width-1-1">
		</div>
		<div class="uk-form-row">
			姓名：<input id="playerName" type="text" class="uk-width-1-1 uk-form-success">
		</div>
		<div class="uk-form-row">
			球队：<input id="club" type="text" class="uk-width-1-1 uk-form-danger">
		</div>
		<!-- 
		<div class="uk-form-row">
			<select id="form-s-s">
				<option>---请选择---</option>
				<option>是</option>
				<option>否</option>
			</select>
		</div>
		 
		<div class="uk-form-row">
			<input id="birthDay" type="date" />
		</div>
		-->
	</fieldset>
	
	<fieldset class="uk-form">
		<legend>Player List</legend>
		
		<div></div>
		<dir></dir>
		<dir></dir>
	</fieldset>
	
	<fieldset class="uk-form">
		<legend>Action[Restful]</legend>
		<button class="uk-button uk-button-primary uk-button-large" id="btnGet">获取人员GET</button>
		<button class="uk-button uk-button-primary uk-button-large" id="btnAdd">添加人员POST</button>
		<button class="uk-button uk-button-primary uk-button-large" id="btnUpdate">更新人员PUT</button>
		<button class="uk-button uk-button-danger uk-button-large" id="btnDel">删除人员DELETE</button>
		<button class="uk-button uk-button-primary uk-button-large" id="btnList">查询列表PATCH</button>
	</fieldset>
</div>

<script type="text/javascript" src="<%=basePath%>/resources/js/jquery-1.11.0.min.js"></script>
<script type="text/javascript">
	(function(window,$){

		var dekota={
			url:'',
			init:function(){
				dekota.url='<%=basePath%>';
				$("#btnGet").click(dekota.getPerson);
				$("#btnAdd").click(dekota.addPerson);
				$("#btnDel").click(dekota.delPerson);
				$("#btnUpdate").click(dekota.updatePerson);
				$("#btnList").click(dekota.listPerson);
			},
			getPerson:function(){
				$.ajax({
					url: dekota.url + 'player/showPlayer/101/',
					type: 'GET',
					dataType: 'json'
				}).done(function(data, status, xhr) {
					$("#playerNumber").val(data.number);
					$("#playerName").val(data.name);
					$("#club").val(data.club);
					//$("#birthDay").val(data.birthDay);// TODO
				}).fail(function(xhr, status, error) {
					alert('fail');
				});
			},
			addPerson:function(){
				$.ajax({
					url: dekota.url + 'player/addPlayer/',
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
			updatePerson:function(){
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
			delPerson:function(){
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
			listPerson:function(){
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
