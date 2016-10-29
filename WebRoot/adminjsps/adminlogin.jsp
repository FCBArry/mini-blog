<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<base href="<%=basePath%>">

<meta charset="UTF-8">
<link rel="icon" href="assets/img/favicon.ico">
<title>miniblog-adminlogin</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="assets/libs/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/login.css">
</head>

<body>

	<div class="container">

		<div class="header row">
			<div class="page-header">
				<h1>
					MINIBLOG <small>管理员登录</small>
				</h1>
			</div>
		</div>

		<div class="content row">
			<form class="form-signin" role="form"
				action="<c:url value='/adminuser_login.action'/>" method="post">

				<div class="panel panel-warning">
					<div class="panel-heading">提示信息！</div>
					<div class="panel-body">
						<p class="text-warning">#只有管理员才能登陆，去找CugLu吧</p>
						<p class="text-danger">${msg }</p>
					</div>
				</div>

				<div class="form-group">
					<div class="input-group">
						<span class="input-group-addon">管理员账号</span> <input type="text"
							class="form-control" value="${form.adminname }"
							placeholder="Username" id="adminname" name="adminname" autofocus />
					</div>
				</div>

				<div class="form-group">
					<div class="input-group">
						<span class="input-group-addon">管理员密码</span> <input type="password"
							class="form-control" value="${form.adminpwd }"
							placeholder="Password" id="adminpwd" name="adminpwd" />
					</div>
				</div>

				<div class="form-group">
					<button class="btn btn-lg btn-primary btn-block" type="submit">
						<span class="glyphicon glyphicon-log-in"></span> 登录
					</button>
				</div>

			</form>
		</div>

	</div>
	<!-- /container -->

	<script src="assets/libs/jquery/dist/jquery.min.js"></script>
	<script src="assets/libs/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
