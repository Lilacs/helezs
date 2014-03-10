<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<link rel="stylesheet" href="kindeditor4.1.7/themes/default/default.css" />
<script charset="utf-8" src="kindeditor4.1.7/kindeditor-min.js"></script>
<script charset="utf-8" src="kindeditor4.1.7/lang/zh_CN.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
	$(function($) {
		KindEditor.ready(function(K) {
			//初始化添加对话框中的在线编辑器
			editor = K.create('textarea[name="content"]', {
				uploadJson : '/uploadImg',
				fileManagerJson : '/getImage',
				allowFileManager : true
			});
		});
	});
</script>
</head>
<body>
	<div>
		<textarea name="content" id="content"
			style="width: 800px; height: 400px; visibility: hidden;"></textarea>
	</div>
</body>
</html>