<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="com.helezs.pojo.Writings" %>
<%@ page import="java.util.List" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link href="css/global.css" rel="stylesheet" media="all">
<link href="css/cases.css" rel="stylesheet" media="all">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<script src="js/jquery-1.8.3.min.js"></script>
<script src="js/slides.min.jquery.js"></script>
<title>菏泽和乐居装饰-装修案例-官方网站|菏泽装修|菏泽最好的装饰装修公司|菏泽装修公司|菏泽装修|菏泽家装|菏泽装修设计</title>
<meta content="菏泽和乐居装饰主要经营项目:房屋装修,家居装饰,室内设计,别墅装修,宾馆装修等.打造专业品质装修装饰,装修热线 184 5400 0379 " name="description">
<meta content="菏泽装修|菏泽家装|菏泽最好的装修公司|菏泽最好的装饰公司|菏泽装修|菏泽装饰|菏泽装修公司|菏泽装饰公司|菏泽房屋装修|菏泽二手房屋装修|菏泽装修设计|家居装饰|会所装修|宾馆装修" name="keywords">
</head>

<body class="mainBody">
	<%@include file="/WEB-INF/common/head.jsp" %>
	<div  class="contentArea">
		<!-- 左边分类,右边列表 -->
		<div  class="contentLeft">
			<div align="center">
				<a style="color: #6CAC05;font-size: 18;margin-left: 0px;">风格分类</a><br/>
				<hr style="color: #6CAC05;width: 160px;"/>
			</div>
			<div id="menu">
			<ul>
				<li class="current_page_item"><a href="" accesskey="1" title="">美式</a></li>
				<li class="current_page_item"><a href="" accesskey="2" title="">欧式</a></li>
				<li class="current_page_item"><a href="" accesskey="3" title="">现代</a></li>
				<li class="current_page_item"><a href="" accesskey="4" title="">新中式</a></li>
				<li class="current_page_item"><a href="" accesskey="5" title="">混搭</a></li>
				<li class="current_page_item"><a href="" accesskey="6" title="">地中海</a></li>
				<li class="current_page_item"><a href="" accesskey="7" title="">复式</a></li>
				<li class="current_page_item"><a href="" accesskey="8" title="">东南亚</a></li>
				<li class="current_page_item"><a href="" accesskey="9" title="">田园</a></li>
			</ul>
			</div>
			<!-- 风格:美式、欧式、现代、新中式、混搭、地中海、复式、东南亚、工装、田园 -->
		</div>
		<div class="contentRight">
			<!-- 内容列表(暂无分页) --> 
			<div style="margin-left: 50px;">
				<span>位置></span><a href="#">装修案例</a>
			</div>
			<br />
			<div style="min-height: 550px;">
			<%
				List<Writings> lw = (List)request.getAttribute("decorationCaseWritings");
				if(lw.size() != 0){
					for(Writings w : lw){
			%>
			<table style="margin-left: 50px;background-color: #FAFAFA;border-radius:5px;margin-top: 2px;" cellspacing="0px;" border="0">
				<tr>
					<td width="120px;" height="90px;" align="center" rowspan="4"><img src="images/index01.jpg" style="width: 80px;height: 80px;border-bottom-left-radius: 4em;border-top-left-radius: 4em;"></td>
				</tr>
				<tr>
					<td width="455px;" valign="middle"><div><a href="casesText?id=<%=w.getId() %>" style="font-weight: bold;"><%=w.getTitle() %></a></div></td>
				</tr>
				<tr>
					<td>
						<div style="font-size: small;color: gray;cursor: default;">
							<label>户型:</label><span><%=w.getApartmentLayout() == null ? "暂无" : w.getApartmentLayout()%></span>&nbsp;&nbsp;
							<label>面积:</label><span><%=w.getArea() == null ? "暂无" : w.getArea()%>㎡</span>&nbsp;&nbsp;&nbsp;
							<label>风格:</label><span><%=w.getStyle() == null ? "暂无" : w.getStyle()%></span>
						</div>
					</td>
				</tr>
				<tr>	
					<td>
						<div style="color: graytext;font-weight: lighter;font-size: small;">
							<label>简介:</label><span><%=w.getSubtitle() == null ? "暂无" : w.getSubtitle() %></span>
						</div>
					</td>
				</tr>
			</table>
			<%	
					}
				}
			%>
			</div>
			<div style="margin-left: 50px;margin-bottom: 0px;" align="center">
				<%
					int pageSize = (Integer)(request.getAttribute("pageSize") == null ? 0:request.getAttribute("pageSize"));
					int p = (Integer)(request.getAttribute("page") == null ? 0:request.getAttribute("page"));
					if(p == 1){
				%>
						<a style="color: gray;">上一页</a>	
				<%
					}else{
				%>
						<a href="cases?pageNumber=<%=p-1 %>">上一页</a>	
				<%
					}
				%>
				<%
					for(int i = 1;i <= pageSize; i++){
						if(i == p){
				%>
					<a  style="color: red;"><%=i %></a>
				<%			
						continue;
						}
				%>
					<a href="cases?pageNumber=<%=i %>"><%=i %></a>	
				<%
					}
				%>
				<%
					if(p == pageSize){
				%>
					<a style="color: gray;">下一页</a>	
				<%		
					}else{
				%>
					<a href="cases?pageNumber=<%=p+1 %>">下一页</a>	
				<%		
					}
				%>
			</div>
		</div>
	</div>
	<%@include file="/WEB-INF/common/foot.jsp" %>
</body>
</html>
