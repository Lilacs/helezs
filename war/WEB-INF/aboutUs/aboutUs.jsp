<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" import="java.util.*,com.helezs.pojo.Writings"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
<link href="css/global.css" rel="stylesheet" media="all">
<link href="css/aboutUs.css" rel="stylesheet" media="all">
<link href="js/bootstrap-3.0.3/css/bootstrap.min.css" rel="stylesheet">
<link href="js/bootstrap-3.0.3/css/bootstrap-theme.min.css" rel="stylesheet">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<title>菏泽和乐居装饰-公司概况-官方网站|菏泽装修|菏泽最好的装饰装修公司|菏泽装修公司|菏泽装修|菏泽家装|菏泽装修设计</title>
<meta content="菏泽和乐居装饰主要经营项目:房屋装修,家居装饰,室内设计,别墅装修,宾馆装修等.打造专业品质装修装饰,装修热线 184 5400 0379 " name="description">
<meta content="菏泽装修|菏泽家装|菏泽最好的装修公司|菏泽最好的装饰公司|菏泽装修|菏泽装饰|菏泽装修公司|菏泽装饰公司|菏泽房屋装修|菏泽二手房屋装修|菏泽装修设计|家居装饰|会所装修|宾馆装修" name="keywords">
</head>

<body class="mainBody">
	<%@include file="/WEB-INF/common/head.jsp" %>
	<div  class="contentArea">
		<%
			Writings writings = (Writings)request.getAttribute("aboutUs");
			String content = (String)request.getAttribute("content");
			if(content != null){
		%>
			<%=content %>
		<%
			}
		%>
	</div>
	<%@include file="/WEB-INF/common/foot.jsp" %>
</body>
</html>
