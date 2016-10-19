<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>  

<div class="example">
				
      <ul id="nav">
          <li><a href="<%=path%>/web/index">首页</a></li>
          <li><a href="#">业务登记</a>
              <ul>
                      <li><a href="<%=basePath%>/businessSettle/rechargePrivate/page">充值售卡数据登记</a></li>
                      <li><a href="<%=basePath%>/businessSettle/groupSales/page">团售业务登记</a></li>
                      <li><a href="<%=basePath%>/businessSettle/rechargePublic/page">对公充值业务登记</a></li>
                      <li><a href="<%=basePath%>/businessSettle/rechargeAgency/page">代理商户充值登记</a></li>
              </ul>
          </li>
          <li>
          	<a href="#">数据查询</a>
              <div>
                  <ul>
                      <li><a href="<%=basePath%>/businessSettle/private/page">私业务数据查询</a></li>
                      <li><a href="<%=basePath%>/businessSettle/public/page">团售业务数据查询</a></li>
                  </ul>
              </div>
          </li>
          <li>
          	<a href="#">系统管理</a>
          	<div>
                  <ul>
                      <li><a href="<%=basePath%>/businessSettle/authority/page">权限分配</a></li>
                      <li><a href="<%=basePath%>/businessSettle/basicRelationship/page">关系维护</a></li>
                  </ul>
              </div>
          </li>
      </ul>
			        
</div>