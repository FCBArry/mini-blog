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
<title>miniblog-admincomment</title>
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
			<nav class="navbar navbar-default" role="navigation">
			<div class="navbar-header">
				<a class="navbar-brand" href="https://github.com/CugLu"><span
					class="glyphicon glyphicon-tower"></span>MINIBLOG</a>
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>

			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav navbar-right">
					<li class="active"><a href="javascript:void(0);">评论管理</a>
					</li>
					<li><a href="<c:url value='/adminuser_findAll.action'/>">用户管理</a>
					</li>
					<li><a href="<c:url value='/adminpost_findAll.action'/>">帖子管理</a>
					</li>
					<li><a href="<c:url value='/adminuser_quit.action'/>"> <c:choose>
								<c:when test="${empty sessionScope.admin }">
						   Admin	
					</c:when>
								<c:otherwise>
						   ${sessionScope.admin.adminname }
					</c:otherwise>
							</c:choose> | 登出</a></li>
				</ul>
			</div>
			<!--/.nav-collapse --> </nav>
		</div>

		<div class="content row">
			<div class="panel panel-primary">
				<div class="panel-heading">评论信息！</div>
				<div class="panel-body table-responsive">
					<table class="table table-condensed table-striped">
						<thead>
							<tr>
								<td>文章</td>
								<td>用户</td>
								<td>评论</td>
								<td>操作</td>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${pb.beanList }" var="comment">
								<tr>
									<td>${comment.post.ptitle }</td>
									<td>${comment.user.username }</td>
									<td>${comment.ccontent }</td>
									<td><a
										href="<c:url value='/admincomment_delete.action?cid=${comment.cid }'/>"><span
											class="glyphicon glyphicon-remove"></span> 删除</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<nav>
					<ul class="pagination pagination-sm">
						<c:choose>
							<c:when test="${pb.pc eq 1 }">
								<li class="disabled"><a href="javascript:void(0);">&laquo;</a>
								</li>
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
									<li class="active"><a href="javascript:void(0);">${i }
											<span class="sr-only">(current)</span> </a></li>
								</c:when>
								<c:otherwise>
									<li><a href="${pb.url }&pc=${i}">${i }</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:choose>
							<c:when test="${pb.pc eq pb.tp }">
								<li class="disabled"><a href="javascript:void(0);">&raquo;</a>
								</li>
							</c:when>
							<c:otherwise>
								<li><a href="${pb.url }&pc=${pb.pc+1}">&raquo;</a></li>
							</c:otherwise>
						</c:choose>
					</ul>
					</nav>
				</div>
			</div>
		</div>

	</div>
	<!-- /container -->

	<script src="assets/libs/jquery/dist/jquery.min.js"></script>
	<script src="assets/libs/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
