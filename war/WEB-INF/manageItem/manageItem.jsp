<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<link rel="stylesheet" href="kindeditor4.1.7/themes/default/default.css" />
<script charset="utf-8" src="kindeditor4.1.7/kindeditor-min.js"></script>
<script charset="utf-8" src="kindeditor4.1.7/lang/zh_CN.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style>
	textarea {
		display: block;
	}
</style>
<script type="text/javascript">
	var editor;
	var editorEdit;
	var dialog;
	var editDialog;
	var currentPage;//当前页
	$(function($) {
		$("#menu").menu();
		$("button").button();
		//初始化添加窗口
		dialog = $("#dialog-form-add").dialog({
			autoOpen : false,
			height : 700,
			width : 835,
			buttons : {
				"添加文章" : function() {
					add();
				},
				"取消" : function() {
					$(this).dialog("close");
				}
			}
		});
		//初始化编辑窗口
		editDialog = $("#dialog-form-edit").dialog({
			autoOpen : false,
			height : 700,
			width : 835,
			buttons : {
				"确认修改" : function() {
					update();
				},
				"取消" : function() {
					$(this).dialog("close");
				}
			}
		});
		
		KindEditor.ready(function(K) {
			//初始化添加对话框中的在线编辑器
			editor = K.create('textarea[name="content"]', {
				uploadJson : '/uploadImg',
				fileManagerJson : '/getImage',
				allowFileManager : true
			});
			//初始化添加对话框中的在线编辑器
			editorEdit = K.create('textarea[name="content-edit"]', {
				uploadJson : '/uploadImg',
				fileManagerJson : '/getImage',
				allowFileManager : true
			});
		});
		currentPage = "decorationCase";
		refresh();
	});

	//按分类列表
	function sendMsg(type) {
		currentPage = type;
		$("#milist").empty();
		$.post("tolistByClassification",{"classification" : type},function(datas) {
							//data 已经可以返回
							var data = datas.writings;
							if (data) {
								for (var i = 0; i < data.length; i++) {
									var title = data[i].title;
									var creationTime = conversionTime(data[i].creationTime);
									var modifyTime = conversionTime(data[i].modifyTime);
									var id = data[i].id + "";
									var editHref = "<a onclick=\"openEditDialog('"+id+"')\" style=\"cursor: pointer;\">" + title + "</a>";
									;
									var delHref = "<a onclick=\"todelWritingsById('" + id
											+ "')\" style=\"cursor: pointer;\">删除</a>";
									var dom = "<tr><td width=\"300px;\">"
											+ editHref
											+ "</td><td  align=\"center\" width=\"120px;\">"
											+ creationTime
											+ "</td><td align=\"center\" width=\"120px;\">"
											+ modifyTime
											+ "</td><td align=\"center\" width=\"200px;\">"
											+ delHref + "</td></tr>";
									$("#milist").append(dom);
								}
							}
		});
	}
	
	//添加数据
	function add() {
		//获取数据
		//文章标题、分类、是否置顶、内容
		var title = $("#title").val();
		var classification = $("#classification").val();
		var top = $("#top").is(':checked');
		var content = editor.html();
		currentPage = classification;
		//发送请求
		$.post("toaddWritings",{"title":title,"classification":classification,"top":top,"content":content},function(flag){
			//获得响应
			if(flag){
				//处理结果
				dialog.dialog("close");
				refresh();
			}else{
				//处理结果
				alert("保存失败,请重试!");
			}
		});
	}
	//删除数据
	function todelWritingsById(id) {
		$.post("todelWritingsById", {
			"id" : id
		}, function(flag) {
			if (flag) {
				refresh();
			} else {
				alert("操作失败,请重试!");
			}
		});
	}
	//重置dialog框数值
	function resetDialog() {
		$("#title").val("");
		$("#classification").val("classification");
		$("#top").attr("checked", false);
		editor.html("");
	}
	//刷新方法(需要设置当前页,默认为'装修案例')
	function refresh() {
		sendMsg(currentPage);
	}
	//添加按钮绑定方法
	function addWritings() {
		//清空上一次填写的内容
		resetDialog();
		//打开dialog
		$("#dialog-form-add").dialog("open");
	}
	//时间转换
	function conversionTime(value) {
		if(value == 0){
			return "无";
		}else{
			var data = new Date();
			data.setTime(value);
			return data.getFullYear()+"-"+(data.getMonth()+1)+"-"+data.getDate();
		}
	}
	//打开编辑窗口并填充
	function openEditDialog(id) {
		//获取后台数据
		$.post("tosearchWritingsById",{"id":id},function(datas){
			var data = datas.writings;
			if(data){
				//打开窗口设置数值
				$("#id-edit").val(data.id);
				$("#title-edit").val(data.title);
				$("#classification-edit").val(data.classification);
				$("#top-edit").attr("checked",data.top);
				editorEdit.html(datas.content);
				$("#dialog-form-edit").dialog("open");
			}
			
		});
	}
	function update() {
		//修改数据点击保存,发送数据
		//文章标题、分类、是否置顶、内容
		var id = $("#id-edit").val();
		var title = $("#title-edit").val();
		var classification = $("#classification-edit").val();
		var top = $("#top-edit").is(':checked');
		var content = editorEdit.html();
		currentPage = classification; 
		$.post("toupdateWritingsById",{"id":id,"title":title,"classification":classification,"top":top,"content":content},function(flag){
			if(flag){
				editDialog.dialog("close");
				refresh();
			}else{
				alert("操作失败,请重试!");
			}
		});
		//处理响应结果
	}
	//步骤:
	//1:自动初始化页面(jquery插件)
	//2:绑定事件并搭建事件
</script>
<title>管理页面</title>
</head>
<body>
	<div>
		<button onclick="addWritings();" id="fffffffff">添加文章</button>
	</div>
	<div>
		<!-- 分类 -->
		<ul id="menu" style="width: 96px; float: left;">
			<li id="miDecorationCase" onclick="sendMsg('decorationCase')" style="cursor: pointer;"><a>装修案例</a></li>
			<li id="miEvents" onclick="sendMsg('events')" style="cursor: pointer;"><a>活动推广</a></li>
			<li id="miKnowledgeDecoration"
				onclick="sendMsg('knowledgeDecoration')" style="cursor: pointer;"><a>装修知识</a></li>
			<li id="miAboutUs" onclick="sendMsg('aboutUs')" style="cursor: pointer;"><a>公司概况</a></li>
			<li id="miDesignTeam" onclick="sendMsg('designTeam')" style="cursor: pointer;"><a>设计团队</a></li>
			<li id="miContact" onclick="sendMsg('contact')" style="cursor: pointer;"><a>联系方式</a></li>
		</ul>
		<!-- 列表 -->
		<table style="margin-left: 200px; width: 800px;" border="1">
			<thead align="center">
				<tr class="ui-widget-header ">
					<td width="300px;"><label>文章标题</label></td>
					<td width="120px;"><label>创建时间</label></td>
					<td width="120px;"><label>修改时间</label></td>
					<td width="200px;"><label>操作</label></td>
				</tr>
			</thead>
		</table>
		<table id="milist" style="margin-left: 200px; width: 800px;"></table>
	</div>
	<!-- 添加文章的dialog -->
	<div id="dialog-form-add" title="添加文章">
			<div>
				<span>文章标题:</span><input type="text" id="title" name="title"
					style="width: 300px;" /> <span>选择分类:</span> <select 
					name="classification" id="classification">
					<option value="decorationCase">装修案例</option>
					<option value="knowledgeDecoration">装修知识</option>
					<option value="aboutUs">公司概况</option>
					<option value="events">活动推广</option>
					<option value="designTeam">设计团队</option>
					<option value="contact">联系方式</option>
				</select><span>置顶:</span><input type="checkbox" name="top" id="top" />
			</div>
			<br />
			<div>
				<textarea name="content" id="content"
					style="width: 800px; height: 400px; visibility: hidden;"></textarea>
			</div>
	</div>
	<!-- 编辑文章的dialog -->
	<div id="dialog-form-edit" title="编辑文章">
			<div>
				<input type="text" style="display: none;" id="id-edit"/>
				<span>文章标题:</span><input type="text" id="title-edit" name="title-edit"
					style="width: 300px;" /> <span>选择分类:</span> <select 
					name="classification-edit" id="classification-edit">
					<option value="decorationCase">装修案例</option>
					<option value="knowledgeDecoration">装修知识</option>
					<option value="aboutUs">公司概况</option>
					<option value="events">活动推广</option>
					<option value="designTeam">设计团队</option>
					<option value="contact">联系方式</option>
				</select><span>置顶:</span><input type="checkbox" name="top-edit" id="top-edit" />
			</div>
			<br />
			<div>
				<textarea name="content-edit" id="content-edit"
					style="width: 800px; height: 400px; visibility: hidden;"></textarea>
			</div>
	</div>
</body>
</html>