<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="css/global.css" rel="stylesheet" media="all">
<link href="css/register.css" rel="stylesheet" media="all">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>菏泽和乐居装饰-客户登记-官方网站|菏泽装修|菏泽最好的装饰装修公司|菏泽装修公司|菏泽装修|菏泽家装|菏泽装修设计</title>
<meta
	content="菏泽和乐居装饰主要经营项目:房屋装修,家居装饰,室内设计,别墅装修,宾馆装修等.打造专业品质装修装饰,装修热线 184 5400 0379 "
	name="description">
<meta
	content="菏泽装修|菏泽家装|菏泽最好的装修公司|菏泽最好的装饰公司|菏泽装修|菏泽装饰|菏泽装修公司|菏泽装饰公司|菏泽房屋装修|菏泽二手房屋装修|菏泽装修设计|家居装饰|会所装修|宾馆装修"
	name="keywords">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script type="text/javascript">
!window.jQuery && document.write('<script src=http://lib.sinaapp.com/js/jquery/1.8.3/jquery.min.js><\/script>');
</script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<script type="text/javascript">
	var successDialog;
	var failDialog;
	$(function() {
		 $("#name,#telephone,#leaveMessage").tooltip(
			 { position: { my: "left+15 center", at: "right center" } }
		 );
		 successDialog = $("#dialog-success").dialog({
			 autoOpen : false,
			 height : 200,
			 width : 400,
			 modal : true,
			 buttons: {
			 	"确认": function() {
			 		$( this ).dialog( "close" );
			 		window.location.href='home';
			 	}
			 }
		});
		failDialog = $("#dialog-fail").dialog({
			 autoOpen : false,
			 height : 200,
			 width : 400,
			 modal : true,
			 buttons: {
			 	"确认": function() {
			 		$( this ).dialog( "close" );
			 	}
			 }
		});
	});
	
	function sendMsg(){
		//TODO 后期添加非法字符验证功能
		var name = $("#name").val();
		var telephone = $("#telephone").val();
		var idleTime = $("#idleTime").val();
		var qq = $("#qq").val();
		var microLetter = $("#microLetter").val();
		var mail = $("#mail").val();
		var leaveMessage = $("#leaveMessage").val();
		if(name == ""){
			 $("#name").tooltip("open");
		}
		if(telephone == ""){
			 $("#telephone").tooltip("open");
		}
		if(leaveMessage == ""){
			 $("#leaveMessage").tooltip("open");
		}
		//wantaddCustomer
		if(name != "" && telephone != "" && leaveMessage != ""){
			$.post("wantaddCustomer",{"name":name,"telephone":telephone,"idleTime":idleTime,"qq":qq,"microLetter":microLetter,"mail":mail,"leaveMessage":leaveMessage},function(flag){
				if(flag){
					successDialog.dialog("open");
				}else{
					failDialog.dialog("open");
				}
			});
		}
	}
</script>
</head>
<body class="mainBody">
	<%@include file="/WEB-INF/common/head.jsp"%>
	<div
		style="width: 960px; margin-bottom: 0px; margin-left: auto; margin-right: auto; margin-top: 18;">
		<div>
				<table class="customerRegister" align="center" cellpadding="10px">
					<tr>
						<td align="right" valign="bottom"><a class="requiredFields">*</a><label>姓名:</label></td>
						<td align="left" valign="middle"><input type="text" id="name" title="姓名为必填选项请认真输入."/></td>
					</tr>	
					<tr>
						<td align="right"><a class="requiredFields">*</a><label>手机:</label></td>
						<td align="left"><input type="text"  id="telephone"  title="请您留下联系方式."/></td>
					</tr>
					<tr>
						<td align="right"><label>空闲时间:</label></td>
						<td align="left">
							<select id="idleTime">
								<option value="0">请选择您方便的时间段</option>
								<option value="1">上午9:00-11:00</option>
								<option value="2">下午2:00-5:00</option>
								<option value="3">晚上7:00-8:00</option>
							</select>
						</td>
					</tr>	
					<tr>
						<td align="right"><label>QQ:</label></td>
						<td align="left"><input type="text" id="qq"/></td>
					</tr>
					<tr>
						<td align="right"><label>微信:</label></td>
						<td align="left"><input type="text" id="microLetter"/></td>
					</tr>
					<tr>
						<td align="right"><label>邮箱:</label></td>
						<td align="left"><input type="text" id="mail"/></td>
					</tr>
					<tr>
						<td align="right" valign="top"><a class="requiredFields">*</a><label>留言:</label></td>
						<td align="left"><textarea rows="8" cols="30" id="leaveMessage"  title="可以填写您房子的位置,或者您的喜好类型,以供设计师参考."></textarea></td>
					</tr>
					<tr>
						<td></td>
						<td><button onclick="sendMsg()">提交</button><input type="reset" value="重置"/></td>
					</tr>
				</table>
			
				<p class="explanation">
					*尊重个人隐私是我们的基本原则,您这里填写的信息不会暴露给任何我们公司以外的人员,不会暴露您的信息,
				</p>
				
			<div id="dialog-success" title="添加成功">
				<p>保存成功,我们会及时与您联系,点击确定返回首页!</p>
			</div>	
			<div id="dialog-fail" title="添加失败">
				<p align="center">你真的能看到我么?</p>
			</div>	
				
				
			
		</div>
	</div>
	<%@include file="/WEB-INF/common/foot.jsp"%>
</body>
</html>