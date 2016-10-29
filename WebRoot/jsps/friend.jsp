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
<title>miniblog-friend</title>
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
<link rel="stylesheet" href="assets/css/friend.css">

</head>

<body id="top">

	<div class="container">

		<div class="header row">
			<nav class="navbar navbar-default navbar-inverse">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="https://github.com/CugLu"><span
					class="glyphicon glyphicon-tower"></span>MINIBLOG</a>
			</div>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="<c:url value='/post_findByStatus.action'/>">首页</a>
					</li>
					<li class="active"><a href="javascript:void(0);">我的关注</a>
					</li>
					<li><a href="jsps/find.jsp">添加朋友</a>
					</li>
					<li><a
						href="<c:url value='/info_myBlog.action?uid=${sessionScope.sessionUser.uid }'/>">我的空间</a>
					</li>
				</ul>
			</div>
			<!--/.nav-collapse --> </nav>
		</div>

		<div class="mycons row">
			<div class="panel panel-info">
				<div class="panel-heading">我的关注</div>
				<div class="panel-body">
					<c:forEach items="${focus }" var="foc">
						<div class="col-md-2 col-sm-3 col-xs-6">
							<a
								href="<c:url value='/info_myBlog.action?uid=${foc.userOther.uid }'/>">
								<img class="img-circle" src="assets/img/icon.png" /> </a>
							<p class="lead">${foc.userOther.username }</p>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>

		<div class="myfans row">
			<div class="panel panel-warning">
				<div class="panel-heading">我的粉丝</div>
				<div class="panel-body">
					<c:forEach items="${fans }" var="fan">
						<div class="col-md-2 col-sm-3 col-xs-6">
							<a
								href="<c:url value='/info_myBlog.action?uid=${fan.userMe.uid }'/>">
								<img class="img-circle" src="assets/img/icon.png" /> </a>
							<p class="lead">${fan.userMe.username }</p>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>

		<div class="foot row">
			<div>
				<p>
					author <a href="https://github.com/CugLu">@CugLu</a>
				</p>
				<p class="pull-right">
					<a href="javascript:void(0)"
						onclick="document.getElementById('top').scrollIntoView();"> <span
						class="glyphicon glyphicon-chevron-up"></span>Back to top</a>
				</p>
			</div>
		</div>

	</div>

	<script src="assets/libs/jquery/dist/jquery.min.js"></script>
	<script src="assets/libs/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
