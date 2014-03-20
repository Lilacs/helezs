<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" import="java.util.*,com.helezs.pojo.Writings"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
<link href="css/global.css" rel="stylesheet" media="all">
<link href="css/login.css" rel="stylesheet" media="all">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script type="text/javascript">
!window.jQuery && document.write('<script src=http://lib.sinaapp.com/js/jquery/1.8.3/jquery.min.js><\/script>');
</script>
<script type="text/javascript">
	function login(){
		$("#errorMsg").text("");
		var user = $("#user").val();
		var pwd = $("#pwd").val();
		if(user && pwd){
			$.post("checkUser",{"user":user,"pwd":pwd},function(flag){
				if(flag){
					window.location.href = "/manageIndex";
				}else{
					$("#errorMsg").text("您的账户或者密码输入错误,请检查!");
				}
			})
		}else{
			$("#errorMsg").text("请输入账户与密码!");
		}
	}
</script>
<title>菏泽和乐居装饰-后台管理-官方网站|菏泽装修|菏泽最好的装饰装修公司|菏泽装修公司|菏泽装修|菏泽家装|菏泽装修设计</title>
<meta content="菏泽和乐居装饰主要经营项目:房屋装修,家居装饰,室内设计,别墅装修,宾馆装修等.打造专业品质装修装饰,装修热线 184 5400 0379 " name="description">
<meta content="菏泽装修|菏泽家装|菏泽最好的装修公司|菏泽最好的装饰公司|菏泽装修|菏泽装饰|菏泽装修公司|菏泽装饰公司|菏泽房屋装修|菏泽二手房屋装修|菏泽装修设计|家居装饰|会所装修|宾馆装修" name="keywords">
</head>

<body class="mainBody">
	<%@include file="/WEB-INF/common/head.jsp" %>
	<div  class="contentArea" align="center">
			<table  style="font-size: 3em;padding-top: 100px;color: green;">
				<tr>
					<td align="right"><label>账户:</label></td>
					<td><input type="text" id="user" name="user" class="text" tabindex="1"/></td>
					<td rowspan="2"><button style="height: 100px;width: 80px;" onclick="login()" tabindex="3">登陆</button></td>
				</tr>
				<tr>
					<td align="right"><label>密码:</label></td>
					<td><input type="password" id="pwd" name="pwd" class="text" tabindex="2"/></td>
				</tr>
			</table>
			<span id="errorMsg" style="color: red;font-size: large;"></span>
	</div>
	<%@include file="/WEB-INF/common/foot.jsp" %>
</body>
</html>