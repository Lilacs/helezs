<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="kindeditor4.1.7/themes/default/default.css" />
<script charset="utf-8" src="kindeditor4.1.7/kindeditor-min.js"></script>
<script charset="utf-8" src="kindeditor4.1.7/lang/zh_CN.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript">
	var editor;
	KindEditor.ready(function(K) {
		editor = K.create('textarea[name="content"]', {
			allowFileManager : true
		});
	});
</script>
<title>和乐居网站后台管理系统-编辑文章</title>
</head>
<body>
	<!-- 标题、选择分类、是否置顶、内容 -->
	<form action="toupdateById" method="post">
		<input type="text" id="id" name="id" value="${writings.id }" style="display: none;"/>
		<div>
			<span>标题:</span><input type="text" id="title" name="title" value="${writings.title }"/>
		</div>
		<div>
			<span>选择分类:</span>
			<s:select name="writings.classification" id="classification"  
				list="#{'decorationCase':'装修案例','events':'活动推广','knowledgeDecoration':'装修知识','designTeam':'设计团队','contact':'联系方式'}" >
			</s:select >
			<span>置顶:</span><input type="checkbox" name="top" id="top" checked="${writings.top }"/>
		</div>
		<div>
			<textarea name="content"
				style="width: 800px; height: 400px; visibility: hidden;">${writings.content }</textarea>
		</div>
		<input type="submit" value="提交"/>
	</form>
</body>
</html>