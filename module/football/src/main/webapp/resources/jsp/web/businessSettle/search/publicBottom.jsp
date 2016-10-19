<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<link rel="stylesheet" href="<%=path%>/resources/jsp/web/css/basic_his.css" type="text/css" />
		<script language="JavaScript" src="<%=path%>/resources/jsp/web/javascript/public.js"></script>
		<script type="text/javascript" src="<%=path%>/resources/js/jquery-1.11.0.min.js"></script>
		
		<script>
			// document ready
			$(document).ready(function(){ 
    			$.ajax({
					url: 'getData/',
					type: 'get',
					dataType: 'json',
					data: {
							'a': 'a1',
							'b': 'b2',
							}
				}).done(function(data, status, xhr) {
					var length = data.length;
					if(length > 0){
						for(var i=0;i<length;i++){
							var $tr = $("<tr></tr>");
							
							var $td1 =  $("<td> <input type=\"checkbox\" name=\"checkbox\" value=\"" + data[i].id + "\"/></td>");
							
							var $td2 =  $("<td>" + (i+1) +"</td>");
							var $td3 =  $("<td>" + data[i].type +"</td>");
							var $td4 =  $("<td>" + data[i].basicRelationshipName +"</td>");
							$tr.append($td1);
							$tr.append($td2);
							$tr.append($td3);
							$tr.append($td4);
							
							$("#record").append($tr);
						}
					}else{
						$("#noRecord").show();
					}
					
				}).fail(function(xhr, status, error) {
					alert('fail');
				});
 			}); 
			
			// add
			function showAdd()
			{	
				openWinByURL('add','添加病区',600,300,1);
			}

		</script>
	</head>
	<body>
		<form action="" name="ssdyForm">
			<input type="hidden" name="method" value="" />
			<div class="content">
				<div class="right_content">
					<div class="right_center">
						<div class="func_button">
							<ul>
								<li>
									<a href="#" onclick="showAdd();">增加</a>
								</li>
								<li>
									<a href="#" onclick="showMerge();">修改</a>
								</li>
								<li>
									<a href="#" onclick="showDelete();">删除</a>
								</li>
							</ul>
						</div>
						<div class="center_side_top"></div>
						<div class="center_table">
							<table>
								<thead>
									<tr id="checkbox">
										<th width="7%">
											<input type="checkbox" id="all" name="all"
												onclick="selectAll(this.checked);checkAll('checkbox')"
												title="选中/取消选中" />
										</th>
										<th>
											编码
										</th>
										<th>
											类型
										</th>
										<th>
											名称
										</th>
									</tr>
								</thead>
								<tbody id="record">
								
									<!-- no record display -->
									<tr id="noRecord" hidden>
										<td colspan="4" align="center" bgcolor="#EFF3F7"
											class="TableBody1" onmouseover="this.bgColor = '#DEE7FF';"
											onmouseout="this.bgColor='#EFF3F7';">
											没有找到相应的记录
										</td>
									</tr>
								</tbody>
								
								<tr>
									<td colspan="4" style="text-align: left">
										<span>选择：</span>
										<a href="javascript:selectAll(true);checkAll('checkbox');">全部</a>
										&nbsp;-&nbsp;
										<a href="javascript:selectAll(false);checkAll('checkbox')">无</a>
									</td>
								</tr>
							</table>
							<table class="pagination">
								<tr>
									<td height=20>
										&nbsp;&nbsp;
										<!-- 可以在这里插入分页导航条 -->
										
										<pg:pager items="${pm.total}"
											url="baseSickwardAction.do"
											export="currentPageNumber=pageNumber" maxPageItems="${ps }"
											maxIndexPages="10">
											<pg:param name="method" value="searchSickward" />
											<pg:first>
												<a href="${pageUrl}" id="firstpageurl">首页</a>
											</pg:first>
											<pg:prev>
												<a href="${pageUrl }">上一页</a>
											</pg:prev>
											<pg:pages>
												<c:choose>
													<c:when test="${ currentPageNumber eq pageNumber}">
														<font color="red">${pageNumber}</font>
													</c:when>
													<c:otherwise>
														<a href="${pageUrl }">${pageNumber }</a>
													</c:otherwise>
												</c:choose>
											</pg:pages>
											<pg:next>
												<a href="${pageUrl }">下一页</a>
											</pg:next>
											<pg:last>
												<a href="${pageUrl }">尾页</a>
											</pg:last>
										</pg:pager>
										<select class="select_test" name="pagesize"
											onchange="selectPagesize(this)">
											<c:forEach begin="5" end="50" step="5" var="i">
												<option value="${i}"
													<c:if test="${ps eq i }">selected</c:if>>
													${i}
												</option>
											</c:forEach>
										</select>
									</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
		</form>
		<%if (request.getAttribute("msg") != null) 
		{
		%>
		<script type="text/javascript">
		    alert("<%=request.getAttribute("msg")%>"); 
		</script>
		<%
		}
		%>
	</body>
	</html>
