<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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
			<table cellspacing="12px" style="margin-left: 50px;">
				<thead>
					<tr>
						<td></td>
						<td>文章标题</td>
						<td>时间</td>
						<td></td>
					</tr>
				</thead>
				<%-- <s:iterator value="decorationCaseWritings" var="writings">
					<tr height="20px;">
						<td><img src="images/marked.png"/></td>
						<td width="400px;"><a style="cursor: pointer;!color: black;" href="casesText?id=${writings.id }"><s:property value="#writings.title"/></a></td>
						<td width="70px;"><span style="color: gray;font-size: 10;cursor: default;"><s:date name="#writings.creationTimeD" format="yyyy-MM-dd"/></span></td>
						<td><s:if test="#writings.top == true"><img src="images/news.png"/></s:if></td>
					</tr>
				</s:iterator> --%>
			</table>
		</div>
	</div>
	
	<%@include file="/WEB-INF/common/foot.jsp" %>
</body>
</html>
