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
<title>菏泽和乐居装饰-装修知识-正文-官方网站|菏泽装修|菏泽最好的装饰装修公司|菏泽装修公司|菏泽装修|菏泽家装|菏泽装修设计</title>
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
			<!-- 内容列表(暂无分页) --> 
			<%
				Writings writings = (Writings)request.getAttribute("writings");
				String content = (String)request.getAttribute("content");
			%>
			<div style="margin-left: 50px;">
				<ol class="breadcrumb" style="width: 400px;">
				  <li><span>位置</span></li>
				  <li><a href="knowledgeDecoration" class="active">装修知识</a></li>
				  <li><a style="cursor: pointer;" class="active">文章正文</a></li>
				</ol>
			</div>
			
			<table style="margin-left: 50px;background-color: #FAFAFA;border-radius:5px;margin-top: 2px;" cellspacing="0px;" border="0" width="100%;">
				<tr>
					<td align="center">
						<br />
						<h2 style="margin-left: -50px;">${writings.title }</h2>
					</td>
				</tr>
				<tr>
					<td style="color: gray;font-size: small;" align="center">
						<span style="margin-left: -50px;"><%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(writings.getCreationTimeD()) %></span>&nbsp;&nbsp;&nbsp;&nbsp;
						<label>阅读次数:</label><span>${writings.count }</span>
					</td>
				</tr>
				<tr>
					<td>
						<div style="margin: 50px;">${content }</div>
					</td>
				</tr>
			</table>
		</div>
	</div>
	<%@include file="/WEB-INF/common/foot.jsp" %>
</body>
</html>
