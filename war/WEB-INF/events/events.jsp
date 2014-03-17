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
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<script src="js/jquery-1.8.3.min.js"></script>
<script src="js/slides.min.jquery.js"></script>
<title>菏泽和乐居装饰-活动推广-官方网站|菏泽装修|菏泽最好的装饰装修公司|菏泽装修公司|菏泽装修|菏泽家装|菏泽装修设计</title>
<meta content="菏泽和乐居装饰主要经营项目:房屋装修,家居装饰,室内设计,别墅装修,宾馆装修等.打造专业品质装修装饰,装修热线 184 5400 0379 " name="description">
<meta content="菏泽装修|菏泽家装|菏泽最好的装修公司|菏泽最好的装饰公司|菏泽装修|菏泽装饰|菏泽装修公司|菏泽装饰公司|菏泽房屋装修|菏泽二手房屋装修|菏泽装修设计|家居装饰|会所装修|宾馆装修" name="keywords">
</head>

<body class="mainBody">
	<%@include file="/WEB-INF/common/head.jsp" %>
	<div  class="contentArea">
		<!-- 左边分类,右边列表 -->
		<div  class="contentLeft">
			<div align="center">
				<a style="color: #6CAC05;font-size: 18;margin-left: 0px;">活动介绍</a><br/>
				<hr style="color: #6CAC05;width: 160px;"/>
			</div>
			<div id="menu">
			<ul>
				<li class="current_page_item"><a href="" accesskey="1" title="">近期活动</a></li>
				<li class="current_page_item"><a href="" accesskey="2" title="">热门活动</a></li>
			</ul>
			</div>
		</div>
		<div class="contentRight">
			<!-- 内容列表(暂无分页) --> 
			<div style="margin-left: 50px;">
				<span>位置></span><a href="#">活动推广</a>
			</div>
			<div style="background-color: #FAFAFA;height: 650px;margin-left: 50px;">
				<table width="600px;" style="margin-left: 50px;border-radius:5px;margin-top: 1px;" cellspacing="10px;" border="0">
					<% 
						List<Writings> lw = (List<Writings>)request.getAttribute("events");
						if(lw.size() != 0){
							for(Writings w : lw){
					%>
						<tr>
							<td align="left">
								<a href="eventsText?id=<%=w.getId() %>" style="color: black;"><%=w.getTitle() %></a>	
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
	</div>
	<%@include file="/WEB-INF/common/foot.jsp" %>
</body>
</html>
