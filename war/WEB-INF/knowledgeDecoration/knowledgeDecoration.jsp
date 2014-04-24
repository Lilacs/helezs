<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" import="java.util.*,com.helezs.pojo.Writings"%>
<%@ page import="com.helezs.pojo.Writings" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
<link href="css/global.css" rel="stylesheet" media="all">
<link href="css/events.css" rel="stylesheet" media="all">
<link href="js/bootstrap-3.0.3/css/bootstrap.min.css" rel="stylesheet">
<link href="js/bootstrap-3.0.3/css/bootstrap-theme.min.css" rel="stylesheet">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<title>菏泽和乐居装饰-装修知识-官方网站|菏泽装修|菏泽最好的装饰装修公司|菏泽装修公司|菏泽装修|菏泽家装|菏泽装修设计</title>
<meta content="菏泽和乐居装饰主要经营项目:房屋装修,家居装饰,室内设计,别墅装修,宾馆装修等.打造专业品质装修装饰,装修热线 184 5400 0379 " name="description">
<meta content="菏泽装修|菏泽家装|菏泽最好的装修公司|菏泽最好的装饰公司|菏泽装修|菏泽装饰|菏泽装修公司|菏泽装饰公司|菏泽房屋装修|菏泽二手房屋装修|菏泽装修设计|家居装饰|会所装修|宾馆装修" name="keywords">
</head>

<body class="mainBody">
	<%@include file="/WEB-INF/common/head.jsp" %>
	<div  class="contentArea">
		<!-- 左边分类,右边列表 -->
		<div  class="contentLeft">
			<div align="center">
				<a style="color: #6CAC05;font-size: 18;margin-left: 0px;">装修宝典</a><br/>
				<hr style="color: #6CAC05;width: 160px;"/>
			</div>
			<div id="menu">
			<ul>
				<li class="current_page_item"><a href="" accesskey="1" title="">热门文章</a></li>
				<li class="current_page_item"><a href="" accesskey="2" title="">最新文章</a></li>
			</ul>
			</div>
		</div>
		<div class="contentRight">
			<div style="margin-left: 50px;">
				<ol class="breadcrumb" style="width: 140px;">
				  <li><span>位置</span></li>
				  <li><a href="knowledgeDecoration" class="active">装修知识</a></li>
				</ol>
			</div>
			<div style="margin-left: 50px;">
				<div class="panel panel-default" style="width: 645px;">
				  <!-- Table -->
				  <table class="table">
				  		<thead>
				  			<tr>
				  				<td><strong>标题</strong></td>
				  				<td  align="center"><strong>时间</strong></td>
				  			</tr>
				  		</thead>
				  	<% 
						List<Writings> lw = (List<Writings>)request.getAttribute("knowledgeDecoration");
						if(lw.size() != 0){
							for(Writings w : lw){
					%>
						<tr>
							<td align="left">
								<a href="knowledgeDecorationText?id=<%=w.getId() %>" style="color: black;"><%=w.getTitle() %></a>	
							</td >
							<td align="center" style="color: gray;font-size: small;">
								<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(w.getCreationTimeD())  %>
							</td>
						</tr>
					
					<%		
							}
						}
					%>
					
				  </table>
				</div>
			</div>
			<div style="margin-left: 50px;margin-bottom: 0px;" align="center">
				<ul class="pagination">
				<%
					int pageSize = (Integer)(request.getAttribute("pageSize") == null ? 0:request.getAttribute("pageSize"));
					int p = (Integer)(request.getAttribute("page") == null ? 0:request.getAttribute("page"));
					if(p == 1){
				%>
						<li><a>上一页</a></li>
				<%
					}else{
				%>
						<li><a href="knowledgeDecoration?pageNumber=<%=p-1 %>">上一页</a></li>	
				<%
					}
				%>
				<%
					for(int i = 1;i <= pageSize; i++){
						if(i == p){
				%>
					<li><a  style="color: red;"><%=i %></a></li>
				<%			
						continue;
						}
				%>
					<li><a href="knowledgeDecoration?pageNumber=<%=i %>"><%=i %></a></li>
				<%
					}
				%>
				<%
					if(p == pageSize){
				%>
					<li><a>下一页</a>	</li>
				<%		
					}else{
				%>
					<li><a href="knowledgeDecoration?pageNumber=<%=p+1 %>">下一页</a>	</li>
				<%		
					}
				%>
				</ul>
			</div>
		</div>
	</div>
	<%@include file="/WEB-INF/common/foot.jsp" %>
</body>
</html>
