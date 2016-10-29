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
<title>miniblog-myroom</title>
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
<link rel="stylesheet" href="assets/css/myroom.css">
<script type="text/javascript">
	$(function() {
		$('#collapseTwo').collapse('show')
	});
</script>
</head>

<body id="top">

	<div class="container">

		<div class="header row">
			<h3 class="lead">${user.username }</h3>
			<img class="img-circle" src="assets/img/icon.png" />
			<h3 class="lead headerbottom">${info.ime }</h3>
		</div>

		<div class="mynav row">
			<nav class="navbar navbar-default" role="navigation">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#example-navbar-collapse">
					<span class="sr-only">切换导航</span> <span class="icon-bar"></span> <span
						class="icon-bar"></span> <span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="https://github.com/CugLu"><span
					class="glyphicon glyphicon-tower"></span>MINIBLOG</a>
			</div>
			<div class="collapse navbar-collapse" id="example-navbar-collapse">
				<ul class="nav navbar-nav navbar-right">
					<li class="active"><a
						href="<c:url value='/info_myBlog.action?uid=${sessionScope.sessionUser.uid }'/>"><span
							class="glyphicon glyphicon-book"></span> 博客</a></li>
					<li><a href="<c:url value='/info_myCollection.action'/>"><span
							class="glyphicon glyphicon-heart"></span> 收藏</a></li>
				</ul>
			</div>
			</nav>
		</div>

		<div class="row main">
			<div class="col-sm-3 left">

				<div class="list-group">
					<li class="list-group-item list-group-item-success">关注<span
						class="badge">${numMTO }+</span></li>
					<li class="list-group-item list-group-item-info">粉丝<span
						class="badge">${numOTM }+</span></li>
					<li class="list-group-item list-group-item-warning">博客<span
						class="badge">${numPost }+</span></li>
				</div>

				<div class="info">
					<div class="panel-group" id="accordion">
						<div class="panel panel-info">
							<div class="panel-heading">
								<h4 class="panel-title">基本信息</h4>
							</div>
							<div class="panel-body table-responsive">
								<table class="table table-condensed table-striped">
									<tbody>
										<tr>
											<td><span class="glyphicon glyphicon-user"></span></td>
											<td>${info.iname }</td>
										</tr>
										<tr>
											<td><span class="glyphicon glyphicon-map-marker"></span>
											</td>
											<td>${info.iaddress }</td>
										</tr>
										<tr>
											<td><span class="glyphicon glyphicon-eye-open"></span></td>
											<c:choose>
												<c:when test="${info.isex eq 1 }">
													<td>男</td>
												</c:when>
												<c:otherwise>
													<td>女</td>
												</c:otherwise>
											</c:choose>
										</tr>
										<tr>
											<td><span class="glyphicon glyphicon-heart"></span></td>
											<c:choose>
												<c:when test="${info.iemotion eq 1 }">
													<td>单身狗</td>
												</c:when>
												<c:otherwise>
													<td>恋爱中</td>
												</c:otherwise>
											</c:choose>
										</tr>
										<tr>
											<td><span class="glyphicon glyphicon-send"></span></td>
											<td>${info.ime }</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<div class="panel panel-warning">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a data-toggle="collapse" data-parent="#accordion"
										href="#collapseTwo"> 更多信息 </a>
								</h4>
							</div>
							<div id="collapseTwo" class="panel-collapse collapse">
								<div class="panel-body table-responsive">
									<table class="table table-condensed table-striped">
										<tbody>
											<tr>
												<td><span class="glyphicon glyphicon-paperclip"></span>
												</td>
												<td>${info.iblog }</td>
											</tr>
											<tr>
												<td><span class="glyphicon glyphicon-qrcode"></span></td>
												<td>${info.iqq }</td>
											</tr>
											<tr>
												<td><span class="glyphicon glyphicon-envelope"></span>
												</td>
												<td>${info.iemail }</td>
											</tr>
											<tr>
												<td><span class="glyphicon glyphicon-phone"></span></td>
												<td>${info.iphone }</td>
											</tr>
											<tr>
												<td><span class="glyphicon glyphicon-home"></span></td>
												<td>${info.ischool }</td>
											</tr>
											<tr>
												<td><span class="glyphicon glyphicon-tower"></span></td>
												<td>${info.icompany }</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>

			<div class="col-sm-9 right">

				<c:forEach items="${pb.beanList }" var="post">
					<div class="content col-sm-12">
						<div class="row">
							<div class="col-sm-2">
								<h6>
									<span class="label label-info"><span
										class="glyphicon glyphicon-thumbs-up"></span>${post.pzan }+</span>
								</h6>
							</div>
							<div class="col-sm-6">
								<a
									href="<c:url value='/post_findByPid.action?pid=${post.pid }'/>"><h6
										class="lead">${post.ptitle }</h6> </a>
							</div>
							<div class="col-sm-2">
								<h6>
									<span class="label label-primary">${post.pcomment }+</span>
								</h6>
							</div>
							<div class="col-sm-2">
								<h6>
									<span class="label label-success"><span
										class="glyphicon glyphicon-user"></span>${post.user.username }</span>
								</h6>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-6 col-sm-offset-2">
								<p>${post.pcontent }</p>
							</div>
							<div class="col-sm-4">
								<a
									href="<c:url value='/post_findByPid.action?pid=${post.pid }'/>">
									<p>精彩弹幕...</p> </a>
							</div>
						</div>
					</div>
				</c:forEach>

				<div class="page row">
					<nav>
					<ul class="pagination pagination-md">
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
									<li class="hidden-xs"><a href="${pb.url }&pc=${i}">${i
											}</a></li>
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

				<div class="foot row">
					<div class="col-sm-12">
						<p>
							author <a href="https://github.com/CugLu">@CugLu</a>
						</p>
						<p class="pull-right">
							<a href="javascript:void(0)"
								onclick="document.getElementById('top').scrollIntoView();">
								<span class="glyphicon glyphicon-chevron-up"></span>Back to top</a>
						</p>
					</div>
				</div>

			</div>
		</div>

	</div>

	<script src="assets/libs/jquery/dist/jquery.min.js"></script>
	<script src="assets/libs/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
