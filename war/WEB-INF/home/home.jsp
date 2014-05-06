<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" import="java.util.*,com.helezs.pojo.Writings"%>
<%@ page import="com.helezs.pojo.Writings"%>
<%@ page import="java.util.List"%>
<%@ page import="java.text.SimpleDateFormat"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
<link href="css/global.css" rel="stylesheet" media="all">
<link href="css/home.css" rel="stylesheet" media="all">
<link href="js/bootstrap-3.0.3/css/bootstrap.min.css" rel="stylesheet">
<link href="js/bootstrap-3.0.3/css/bootstrap-theme.min.css"
	rel="stylesheet">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<title>菏泽和乐居装饰-首页-官方网站|菏泽装修|菏泽最好的装饰装修公司|菏泽装修公司|菏泽装修|菏泽家装|菏泽装修设计</title>
<meta
	content="菏泽和乐居装饰主要经营项目:房屋装修,家居装饰,室内设计,别墅装修,宾馆装修等.打造专业品质装修装饰,装修热线 184 5400 0379 "
	name="description">
<meta
	content="菏泽装修|菏泽家装|菏泽最好的装修公司|菏泽最好的装饰公司|菏泽装修|菏泽装饰|菏泽装修公司|菏泽装饰公司|菏泽房屋装修|菏泽二手房屋装修|菏泽装修设计|家居装饰|会所装修|宾馆装修"
	name="keywords">
</head>

<body class="mainBody">
	<%
		List<Writings> lw = (List<Writings>) request
				.getAttribute("allData");
	%>
	<%@include file="/WEB-INF/common/head.jsp"%>
	<!-- 轮播图片 -->
	<div class="container">
		<div class="row">
			<div class="col-md-10 col-md-offset-1 well">
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
							<img src="images/index01.jpg" style="width: 100%; height: 400px;">
						</div>
						<div class="item">
							<img src="images/index02.jpg"
								style="width: 100%;; height: 400px;">
						</div>
						<div class="item">
							<img src="images/index03.jpg"
								style="width: 100%;; height: 400px;">
						</div>
						<div class="item">
							<img src="images/index04.jpg"
								style="width: 100%;; height: 400px;">
						</div>
						<div class="item">
							<img src="images/index05.jpg"
								style="width: 100%;; height: 400px;">
						</div>
					</div>
					<a class="left carousel-control" href="#myCarousel"
						data-slide="prev"><span
						class="glyphicon glyphicon-chevron-left"></span></a> <a
						class="right carousel-control" href="#myCarousel"
						data-slide="next"><span
						class="glyphicon glyphicon-chevron-right"></span></a>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<!-- 公司简介 -->
			<div class="col-md-6 col-md-offset-1 col-sm-8 well" style="height: 330px;">
				<div style="height: 30px;" class="titlebackground">
					<img src="images/companyProfile.png" class="titleStyle" />
				</div>
				<div style="margin-top: 16px;" class="col-md-4">
					<img src="images/view/company.png" style="float: left;" />
				</div>
				<div style="margin-left: 20px; " class="col-md-7">
						<h3>选择和乐居的5大亮点</h3>
						1.工程不发包，工人统一由公司直接管理。<br/>
						2.施工过程中，公司自带监理，全程监督。<br/>
						3.全部材料由业主及专业人士检验后进场。<br/>
						4.设计师五年以上从业资格，全程跟踪。<br/>
						5.工程结束公司赠送隐蔽工程照片。<br/><br/>
						表面工程保2年，电路工程保10年，水路工程保50年。<br/>
				</div>
			</div>
			<!-- 活动新闻 -->
			<div class="col-md-4 well col-sm-4" style="height: 330px;">
				<div style="height: 30px;" class="titlebackground">
					<img src="images/eventsNews.png" class="titleStyle" /> <a
						href="events"><img src="images/more.png" class="moreStyle" /></a>
				</div>
				<%
					int count = 0;
					for (Writings w : lw) {
						if (w.getClassification().equals("events") && count < 7) {
							count++;
				%>
				<div class="row">
					<div class="col-md-10 col-md-offset-1">
						<h5>
							<a href="eventsText?id=<%=w.getId()%>"><%=w.getTitle()%></a> <small
								class="pull-right"><%=new SimpleDateFormat("yyyy-MM-dd").format(w
							.getCreationTimeD())%></small>
						</h5>
					</div>
				</div>
				<%
					}
					}
				%>
			</div>
		</div>
		<!-- 实景案例 -->
		<div class="row">
			<div class="col-md-10 col-md-offset-1 well" style="height: 230px;">
				<div style="height: 30px" class="titlebackground">
					<img src="images/virtualCase.png" class="titleStyle" />
				</div>
				<div style="margin-top: 12px;width: 100%" align="center">
					<marquee  onmouseover=stop() onmouseout=start()>
					<img src="images/view/view1.jpg" />
					<img src="images/view/view6.jpg" />
					<img src="images/view/view3.jpg" />
					<img src="images/view/view4.jpg" />
					<img src="images/view/view5.jpg" />
					</marquee>
				</div>
			</div>
		</div>
		
		<div class="row">
			<!-- 设计团队 -->
			<div class="col-md-6 col-md-offset-1 well" style="height: 300px;">
				<div style="height: 30px;" class="titlebackground">
					<img src="images/designTeam.png" class="titleStyle" /> <a
						href="designTeam"><img src="images/more.png" class="moreStyle" /></a>
				</div>
				<div style="margin-top: 20px;">
					<table align="center">
						<tr align="center">
							<td>
								<img src="images/designersPhoto/designDirector.jpg" style="width: 150px;height: 150px;" class="designerPic"><br/>
								<h4>设计总监:刘鹏</h4>
							</td>
							<td>
								<img src="images/designersPhoto/designersWeihao.jpg"  style="width: 150px;height: 150px;" class="designerPic">
								<h4>设计师:王威浩</h4>
							</td>
							<td>
								<img src="images/designersPhoto/designersWenjing.jpg" style="width: 150px;height: 150px;" class="designerPic">
								<h4>设计师:王文静</h4>
							</td>
						</tr>
					</table>
				</div>
			</div>
			<!-- 装修知识 -->
			<div class="col-md-4 well" style="height: 300px;">
				<div style="height: 30px;" class="titlebackground">
					<img src="images/knowledgeDecoration.png" class="titleStyle" /> <a
						href="knowledgeDecoration"><img src="images/more.png"
						class="moreStyle" /></a>
				</div>
				<div style="margin-left: 38px; margin-top: 5px;">
					<table cellspacing="12px">
						<%
							int count2 = 0;
							for (Writings w : lw) {
								if (w.getClassification().equals("knowledgeDecoration")
										&& count2 < 6) {
									count2++;
						%>
						<tr>
							<td><img src="images/marked.png" /></td>
							<td width="230px;"><a
								href="knowledgeDecorationText?id=<%=w.getId()%>"
								style="cursor: pointer;"><%=w.getTitle()%></a></td>
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
	<%@include file="/WEB-INF/common/foot.jsp"%>
</body>
</html>