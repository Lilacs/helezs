<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" import="java.util.*,com.helezs.pojo.Writings"%>
<%@ page import="com.helezs.pojo.Writings" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
<link href="css/global.css" rel="stylesheet" media="all">
<link href="css/home.css" rel="stylesheet" media="all">
<link href="js/bootstrap-3.0.3/css/bootstrap.min.css" rel="stylesheet">
<link href="js/bootstrap-3.0.3/css/bootstrap-theme.min.css" rel="stylesheet">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<title>菏泽和乐居装饰-首页-官方网站|菏泽装修|菏泽最好的装饰装修公司|菏泽装修公司|菏泽装修|菏泽家装|菏泽装修设计</title>
<meta content="菏泽和乐居装饰主要经营项目:房屋装修,家居装饰,室内设计,别墅装修,宾馆装修等.打造专业品质装修装饰,装修热线 184 5400 0379 " name="description">
<meta content="菏泽装修|菏泽家装|菏泽最好的装修公司|菏泽最好的装饰公司|菏泽装修|菏泽装饰|菏泽装修公司|菏泽装饰公司|菏泽房屋装修|菏泽二手房屋装修|菏泽装修设计|家居装饰|会所装修|宾馆装修" name="keywords">
</head>

<body class="mainBody">
	<% 
		List<Writings> lw = (List<Writings>)request.getAttribute("allData");
	%>
	<%@include file="/WEB-INF/common/head.jsp" %>
	<div class="container">
		<div class="row">
			<div class="col-md-12 well">
				<div id="myCarousel" class="carousel slide" data-ride="carousel">
			      <!-- Indicators -->
			      <ol class="carousel-indicators">
			        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			        <li data-target="#myCarousel" data-slide-to="1"></li>
			        <li data-target="#myCarousel" data-slide-to="2"></li>
			        <li data-target="#myCarousel" data-slide-to="3"></li>
			        <li data-target="#myCarousel" data-slide-to="4"></li>
			      </ol>
      			<div class="carousel-inner">
			        <div class="item active">
			          <img src="images/index01.jpg" style="width: 100%;height: 400px;">
			        </div>
			        <div class="item">
			          <img src="images/index02.jpg" style="width: 100%;;height: 400px;">
			        </div>
			        <div class="item">
			          <img src="images/index03.jpg" style="width: 100%;;height: 400px;">
			        </div>
			        <div class="item">
			          <img src="images/index04.jpg" style="width: 100%;;height: 400px;">
			        </div>
			        <div class="item">
			          <img src="images/index05.jpg" style="width: 100%;;height: 400px;">
			        </div>
      			</div>
			      <a class="left carousel-control" href="#myCarousel" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a>
			      <a class="right carousel-control" href="#myCarousel" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
    			</div>
			</div>
		</div>
	</div>
		<div>
			<div class="container">
				<div class="row">
					<div class="col-md-7 well" style="height: 330px;">
						<div style="height: 30px;" class="titlebackground">
							<img src="images/companyProfile.png" class="titleStyle" />
						</div>
						<div style="margin-left: 20px;margin-top: 16px;">
							<img src="images/view/company.png" style="float: left;"/>
						</div>
					</div>
					<div class="col-md-5 well" style="height: 330px;">
						<div style="height: 30px;"  class="titlebackground">
							<img src="images/eventsNews.png" class="titleStyle" />
							<a href="events"><img src="images/more.png" class="moreStyle" /></a>
						</div>
						<div style="margin-left: 8px;margin-top: 10px;">
							<table cellspacing="12px">
								<!-- 最多可放置7行 -->
									<%
										int count = 0;
										for(Writings w : lw){
											if(w.getClassification().equals("events") && count < 7){
												count++;
									%>
										<tr height="20px;">
											<td><img src="images/marked.png"/></td>
											<td width="210px;"><a href="eventsText?id=<%=w.getId() %>" style="cursor: pointer;color: black;"><%=w.getTitle() %></a></td>
											<td width="70px;"><span style="color: gray;font-size: 10;cursor: default;"><%=new SimpleDateFormat("yyyy-MM-dd").format(w.getCreationTimeD()) %></span></td>
											<td>
												<%
													if(w.isTop() == true){
												%>
													<img src="images/news.png"/>
												<%
													}
												%>	
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
				<div class="row">
					<div class="col-md-12 well" style="height: 230px;">
						<div style="height: 30px"  class="titlebackground">
							<img src="images/virtualCase.png" class="titleStyle" />
						</div>
						<div style="margin-top: 12px;" align="center">
							<!-- <marquee  onmouseover=stop() onmouseout=start()> -->
							<img src="images/view/view1.jpg"/>
							<img src="images/view/view1.jpg"/>
							<img src="images/view/view1.jpg"/>
							<img src="images/view/view1.jpg"/>
							<img src="images/view/view1.jpg"/>
						 	<!-- </marquee> -->
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-7 well" style="height: 300px;">
						<div style="height: 30px;" class="titlebackground">
							<img src="images/designTeam.png" class="titleStyle" />
							<a href="designTeam"><img src="images/more.png" class="moreStyle" /></a>
						</div>
					</div>
					<div class="col-md-5 well" style="height: 300px;">
						<div style="height: 30px;" class="titlebackground">
							<img src="images/knowledgeDecoration.png" class="titleStyle" />
							<a href="knowledgeDecoration"><img src="images/more.png" class="moreStyle"  /></a>
						</div>
						<div style="margin-left: 38px;margin-top: 5px;">
							<table cellspacing="12px">
								<%
									int count2 = 0;
									for(Writings w : lw){
										if(w.getClassification().equals("knowledgeDecoration") && count2 < 6){
											count2++;
								%>
									<tr>
										<td><img src="images/marked.png"/></td>
										<td width="230px;"><a href="knowledgeDecorationText?id=<%=w.getId() %>" style="cursor: pointer;"><%=w.getTitle() %></a></td>
									</tr>
								<%		
										}
									}
								%>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	<%@include file="/WEB-INF/common/foot.jsp" %>
	<script src="http://cdn.bootcss.com/jquery/1.10.2/jquery.min.js"></script>
    <script src="/js/bootstrap-3.0.3/js/bootstrap.min.js"></script>
</body>
</html>
