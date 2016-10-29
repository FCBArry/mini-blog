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
<title>miniblog-find</title>
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
<link rel="stylesheet" href="assets/css/find.css">
<script type="text/javascript" src="assets/js/find.js"></script>

</head>

<body id="top">

	<div class="container">

		<div class="header row">
			<nav class="navbar navbar-inverse">
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
					<li><a href="<c:url value='/fans_friend.action'/>">我的关注</a></li>
					<li class="active"><a href="javascript:void(0);">添加朋友</a></li>
					<li><a href="<c:url value='/info_myBlog.action?uid=${sessionScope.sessionUser.uid }'/>">我的空间</a></li>
				</ul>
			</div>
			<!--/.nav-collapse --> </nav>
		</div>

		<form class="row" action="<c:url value='/info_findFriend.action'/>"
			method="post">

			<div class="row form-group">
				<div class="col-sm-6 col-md-4">
					<input type="text" class="form-control" name="iname"
						id="iname" placeholder="用户名">
				</div>
				<div class="col-sm-6 col-md-4">
					<input type="text" class="form-control" name="iemail" id="iemail"
						placeholder="邮箱">
				</div>
			</div>

			<div class="row form-group">
				<div class="col-sm-3 col-md-2">
					<select class="form-control" name="isex" id="isex">
						<option value="1">男</option>
						<option value="0">女</option>
					</select>
				</div>
				<div class="col-sm-3 col-md-2">
					<select class="form-control" name="iemotion" id="iemotion">
						<option value="1">单身狗</option>
						<option value="0">恋爱中</option>
					</select>
				</div>
				<div class="col-sm-3 col-md-2">
					<input type="text" class="form-control" name="iphone" id="iphone"
						placeholder="手机">
				</div>
				<div class="col-sm-3 col-md-2">
					<input type="text" class="form-control" name="iqq" id="iqq"
						placeholder="qq">
				</div>
			</div>
			<div class="row form-group">
				<div class="col-sm-3 col-md-2">
					<button type="submit" class="btn btn-success">
						<span class="glyphicon glyphicon-globe"></span> 查找全部朋友
					</button>
				</div>
			</div>

		</form>

		<div class="content">
			<div class="page-header row">
				<h3 class="text-primary">
					已找到朋友 <small class="text-primary">不感兴趣？重新输入条件</small>
				</h3>
			</div>
			<div class="row content_in">
				<c:forEach items="${pb.beanList }" var="info">
					<div class="col-xs-6 col-sm-3 col-md-2">
						<a href="<c:url value='/info_myBlog.action?uid=${info.user.uid }'/>">
							<img class="img-circle" src="assets/img/icon.png" /> </a>
						<p class="lead">${info.iname }</p>
						<div id="changefan" onmouseover="statusFan('${info.user.uid }')"
							onclick="changefan('${info.user.uid }')">
							<h6>
								<span id="${info.user.uid }fan" class="label label-default"> <span
									class="glyphicon glyphicon-plus"></span> 关注Ta吧</span>
							</h6>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>

		<div class="page row">
			<nav>
			<ul class="pagination pagination-sm">
				<c:choose>
					<c:when test="${pb.pc eq 1 }">
						<li class="disabled"><a href="javascript:void(0);">&laquo;</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="${pb.url }&pc=${pb.pc-1}">&laquo;</a></li>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${pb.tp <= 5 }">
						<c:set var="begin" value="1" />
						<c:set var="end" value="${pb.tp }" />
					</c:when>
					<c:otherwise>
						<c:set var="begin" value="${pb.pc-2 }" />
						<c:set var="end" value="${pb.pc + 2}" />
						<c:if test="${begin < 1 }">
							<c:set var="begin" value="1" />
							<c:set var="end" value="5" />
						</c:if>
						<c:if test="${end > pb.tp }">
							<c:set var="begin" value="${pb.tp-4 }" />
							<c:set var="end" value="${pb.tp }" />
						</c:if>
					</c:otherwise>
				</c:choose>
				<c:forEach begin="${begin }" end="${end }" var="i">
					<c:choose>
						<c:when test="${i eq pb.pc }">
							<li class="active"><a href="javascript:void(0);">${i } <span
									class="sr-only">(current)</span> </a></li>
						</c:when>
						<c:otherwise>
							<li class="hidden-xs"><a href="${pb.url }&pc=${i}">${i }</a>
							</li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:choose>
					<c:when test="${pb.pc eq pb.tp }">
						<li class="disabled"><a href="javascript:void(0);">&raquo;</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="${pb.url }&pc=${pb.pc+1}">&raquo;</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
			</nav>
		</div>

		<div class="foot row">
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

	<script src="assets/libs/jquery/dist/jquery.min.js"></script>
	<script src="assets/libs/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
