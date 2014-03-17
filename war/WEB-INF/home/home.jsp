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
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<title>菏泽和乐居装饰-首页-官方网站|菏泽装修|菏泽最好的装饰装修公司|菏泽装修公司|菏泽装修|菏泽家装|菏泽装修设计</title>
<meta content="菏泽和乐居装饰主要经营项目:房屋装修,家居装饰,室内设计,别墅装修,宾馆装修等.打造专业品质装修装饰,装修热线 184 5400 0379 " name="description">
<meta content="菏泽装修|菏泽家装|菏泽最好的装修公司|菏泽最好的装饰公司|菏泽装修|菏泽装饰|菏泽装修公司|菏泽装饰公司|菏泽房屋装修|菏泽二手房屋装修|菏泽装修设计|家居装饰|会所装修|宾馆装修" name="keywords">
<style type="text/css">
.slides_container {
	width: 960px;
	height: 500px;
}

.slides_container div {
	width: 960px;
	height: 500px;
	display: block;
}
</style>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script type="text/javascript">
!window.jQuery && document.write('<script src=http://lib.sinaapp.com/js/jquery/1.8.3/jquery.min.js><\/script>');
</script>
<script src="js/slides.min.jquery.js"></script>
<script>
	$(function() {
		//启动图片展示栏
		$("#slides").slides({
			bigTarget : true,
			preload : true,
			preloadImage: '/images/loading.gif',
			generatePagination : false,
			play : 4000,
			pause : 4000,
			hoverPause : true
		});
	});
</script>
</head>

<body class="mainBody">
	<% 
		List<Writings> lw = (List<Writings>)request.getAttribute("allData");
	%>
	<%@include file="/WEB-INF/common/head.jsp" %>
	<div style="width: 960px; margin-bottom: 0px; margin-left: auto; margin-right: auto; margin-top: 10;border-radius:3em;overflow:hidden;">
		<div id="slides">
			<div class="slides_container">
				<div>
					<img src="images/index01.jpg" style="width: 960px;height: 500px;border-radius:3em;">
				</div>
				<div>
					<img src="images/index02.jpg" style="width: 960px;height: 500px;border-radius:3em;">
				</div>
				<div>
					<img src="images/index03.jpg" style="width: 960px;height: 500px;border-radius:3em;">
				</div>
				<div>
					<img src="images/index04.jpg" style="width: 960px;height: 500px;border-radius:3em;">
				</div>
				<div>
					<img src="images/index05.jpg" style="width: 960px;height: 500px;border-radius:3em;">
				</div>
			</div>
		</div>
	</div>
	<div
		style="width: 960px; margin-bottom: 0px; margin-left: auto; margin-right: auto; margin-top: 18;">
		<table width="960px;" style="" frame="void">
			<tr>
				<!-- 公司简介 -->
				<td width="550px;" height="300px;" valign="top" class="modulebackground">
					<div style="height: 30px;" class="titlebackground">
						<img src="images/companyProfile.png" class="titleStyle" />
					</div>
					<div style="margin-left: 20px;margin-top: 16px;">
							<img src="images/view/company.png" style="float: left;"/>
							<table style="font-size: 14px;float: right;margin-right: 15px;width:320px;">
								<tr valign="top">
									<td width="60px;">亮点一：</td>
									<td>工程不发包，工人统一由公司直接管理 </td>
								</tr>
								<tr valign="top">
									<td>亮点二：</td>
									<td>施工过程中，公司自带监理，全程监督</td>
								</tr>
								<tr valign="top">
									<td>亮点三：</td>
									<td>全部材料进场之前，业主及公司相关专</td>
								</tr>
								<tr valign="top">
									<td>亮点四：</td>
									<td>设计师五年以上从业资格，全程跟踪</td>
								</tr>
								<tr valign="top">
									<td>亮点五：</td>
									<td>工程结束公司赠送隐蔽工程照片，表面工程两年，电路工程10年，水路工程50年</td>
								</tr>
								<!-- <tr>
									<td colspan="2">
										<br />
										<br />
										<br />
										<div style="float: right;">设计是一种追求完美的生活态度,<br/>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;设计是一种追求品味的生活概念.</div>
									</td>
								</tr> -->
							</table>
					</div>
				</td>
				<!-- 活动新闻 -->
				<!-- 首页显示7条活动新闻的数据 -->
				<td valign="top"  class="modulebackground">
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
				</td>
			</tr>
			<tr>
				<!-- 实景案例 -->
				<td colspan="2" height="200px;" valign="top" class="virtualCasebackground">
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
				</td>
			</tr>
			<tr>
				<!-- 设计团队 -->
				<td height="230px;" valign="top"  class="modulebackground">
					<div style="height: 30px;" class="titlebackground">
						<img src="images/designTeam.png" class="titleStyle" />
						<a href="designTeam"><img src="images/more.png" class="moreStyle" /></a>
					</div>
					
				</td>
				<!-- 装修知识 -->
				<!-- 首页显示6条装修知识的数据 -->
				<td  valign="top"  class="modulebackground">
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
				</td>
			</tr>
		</table>
	</div>
	<%@include file="/WEB-INF/common/foot.jsp" %>
</body>
</html>
