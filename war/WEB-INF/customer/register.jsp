<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="css/global.css" rel="stylesheet" media="all">
<link href="css/register.css" rel="stylesheet" media="all">
<link href="js/bootstrap-3.0.3/css/bootstrap.min.css" rel="stylesheet">
<link href="js/bootstrap-3.0.3/css/bootstrap-theme.min.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>菏泽和乐居装饰-客户登记-官方网站|菏泽装修|菏泽最好的装饰装修公司|菏泽装修公司|菏泽装修|菏泽家装|菏泽装修设计</title>
<meta
	content="菏泽和乐居装饰主要经营项目:房屋装修,家居装饰,室内设计,别墅装修,宾馆装修等.打造专业品质装修装饰,装修热线 184 5400 0379 "
	name="description">
<meta
	content="菏泽装修|菏泽家装|菏泽最好的装修公司|菏泽最好的装饰公司|菏泽装修|菏泽装饰|菏泽装修公司|菏泽装饰公司|菏泽房屋装修|菏泽二手房屋装修|菏泽装修设计|家居装饰|会所装修|宾馆装修"
	name="keywords">
</head>
<body class="mainBody">
	<%@include file="/WEB-INF/common/head.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-3 col-md-offset-1"></div>
			<div class="col-md-5">
				<div style="position: absolute;z-index: 99;top:200px;" class="col-md-12">
					<!-- 成功提示 -->
					<div id="TipForSuccess" class="alert alert-success text-center hidden">保存成功,我们会及时与您联系,5秒后返回首页!</div>
					<!-- 失败提示 -->
					<div id="TipForFail" class="alert alert-danger alert-dismissable hidden col-md-8">
					  <button onclick="showTip.hideFail()" type="button" class="close" aria-hidden="true">&times;</button>
					  <strong>Warning!</strong>保存失败,请检查网络后重试一下.
					</div>
				</div>
				<div class="page-header">
				  <h1>我要装修 <small>轻轻松松</small></h1>
				</div>
				<div class="form-horizontal" role="form" action="wantaddCustomer">
				  <div id="incompleteName" class="form-group">
				    <label for="name" class="col-sm-2 control-label">姓名</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" id="name" placeholder="" onblur="check.checkName(this)">
				    </div>
				  </div>
				  <div id="incompleteTelephone" class="form-group">
				    <label for="telephone" class="col-sm-2 control-label">电话</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" id="telephone" placeholder="" onblur="check.checkTelephone(this)">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="idleTime" class="col-sm-2 control-label">时间</label>
				    <div class="col-sm-10">
				      <select class="form-control" id="idleTime">
						  <option value="0">请选择您方便的时间段</option>
						  <option value="1">上午9:00-11:00</option>
						  <option value="2">下午2:00-5:00</option>
						  <option value="3">晚上7:00-8:00</option>
						  <option value="4">双休日联系我</option>
					  </select>
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="qq" class="col-sm-2 control-label">QQ</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" id="qq" placeholder="">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="microLetter" class="col-sm-2 control-label">微信</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" id="microLetter" placeholder="">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="mail" class="col-sm-2 control-label">邮箱</label>
				    <div class="col-sm-10">
				      <input type="email" class="form-control" id="mail" placeholder="">
				    </div>
				  </div>
				  <div id="incompleteLeaveMessage" class="form-group">
				    <label for="leaveMessage" class="col-sm-2 control-label">留言</label>
				    <div class="col-sm-10">
				      <textarea class="form-control" rows="3" id="leaveMessage" onblur="check.checkLeaveMessage(this)"></textarea>
				    </div>
				  </div>
				  <div class="form-group">
				    <div class="col-sm-offset-2 col-sm-10">
				      <button type="button" class="btn btn-primary" onclick="sendMsg()">提交</button>
				    </div>
				  </div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="/WEB-INF/common/foot.jsp"%>
	<script type="text/javascript" src="js/register/register.js"></script>
</body>
</html>