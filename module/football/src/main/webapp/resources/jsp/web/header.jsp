<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
	String path = request.getContextPath();
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
	<head>
		<title>病区</title>
		<link rel="stylesheet" href="<%=path%>/resources/jsp/web/css/basic_his.css" type="text/css" />
		
		<script type="text/javascript" src="<%=path%>/resources/js/jquery-1.11.0.min.js"></script>
		<script type="text/javascript">
			(function(window,$){
		
				var dekota={
					
					url:'',
		
					init:function(){
						dekota.url='<%=path%>';
						$("#button_search").click(dekota.getList);
					},
					getList:function(){
						$.ajax({
							url: dekota.url + '/web/getList',
							type: 'get',//注意在传参数时，加：_method:'PATCH'　将对应后台的PATCH请求方法
							dataType: 'json',
						}).done(function(data, status, xhr) {
							alert('success');
						}).fail(function(xhr, status, error) {
							alert('fail');
						});
					},
				};
				window.dekota=(window.dekota)?window.dekota:dekota;
				$(function(){
					dekota.init();
				});
			})(window,jQuery);
		
		</script>
	</head>

	<body>
		<form>
			<div class="center_table">
				<table>
					<tr>
					    <td width="10%" style="text-align:center">
							查询条件
						</td>
						<td style="text-align:left;padding-left: 10px"><!-- 这里有CSS控制 -->
							<input type="text"  name="pkWardId" id="pkWardId"/>	
						</td>
					
						<td rowspan="2" width="20%">
							<input type="button" value="查询"  id="button_search"
								style="font-size: 13px; background: url(<%=path%>resources/images/menu_button.gif) repeat-x; width: 60px;" />
							<input type="reset" value="重置"
								style="font-size: 13px; background: url(<%=path%>resources/images/menu_button.gif) repeat-x; width: 60px;" />
						</td>
						
					</tr>
				</table>
			</div>
		</form>
		
	</body>
</html>
