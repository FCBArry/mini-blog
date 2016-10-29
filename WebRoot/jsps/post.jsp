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
<title>miniblog-post</title>
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
<link rel="stylesheet" href="assets/css/post.css">

</head>

<body id="top">

	<div class="container up">

		<div class="row header">
			<h3 class="lead">THE P O S T</h3>
			<a class="branding" href="https://github.com/CugLu"><img
				src="assets/img/basa.png" class="img-circle" alt="miniblog" /> </a>
		</div>

		<div class="row mynavbar">
			<nav class="navbar navbar-default">
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
					<li><a href="<c:url value='/post_findByStatus.action'/>"><span
							class="glyphicon glyphicon-qrcode"></span> 首页</a></li>
					<li class="active"><a href="javascript:void(0);"><span
							class="glyphicon glyphicon-book"></span> 博客</a></li>
					<li><a href="<c:url value='/fans_friend.action'/>"><span
							class="glyphicon glyphicon-eye-open"></span> 我的关注</a></li>
					<li><a href="<c:url value='/info_myBlog.action?uid=${sessionScope.sessionUser.uid }'/>"><span
							class="glyphicon glyphicon-home"></span> 我的空间</a></li>
				</ul>
			</div>
			<!--/.nav-collapse --> </nav>
		</div>
	</div>

	<div class="container middle">

		<div class="mainpostheader row">
			<div class="page-header">
				<h3 class="lead">
					${post.ptitle }<small>我是一个小尾巴~~~</small>
				</h3>
				<span class="badge">赞${post.pzan }+</span> <span class="badge">评论${post.pcomment
					}+</span> <span class="badge">${post.user.username }+</span>
			</div>
		</div>

		<div class="content">
			<div class="row commentrow">
				<div class="col-sm-10 col-md-9">
					<div class="media">
						<a class="media-left" href="<c:url value='/info_myBlog.action?uid=${post.user.uid }'/>"> <img src="assets/img/icon.png" />
						</a>
						<div class="media-body">
							<p>${post.pcontent }</p>
							<img src="<c:url value='/${post.pimg }'/>"
								class="img-responsive img-thumbnail" />
						</div>
					</div>
				</div>
				<div class="col-sm-2 col-md-3">
					<span class="badge">#楼主</span>
				</div>
			</div>
			<%
				int i = 0;
			%>
			<c:forEach items="${pb.beanList }" var="comment">
				<%
					i = i + 1;
				%>
				<div class="row commentrow">
					<div class="col-sm-10 col-md-9">
						<div class="media">
							<a class="media-left" href="<c:url value='/info_myBlog.action?uid=${comment.user.uid }'/>"> <img
								src="assets/img/icon.png" /> </a>
							<div class="media-body">
								<h4 class="media-heading">${comment.user.username }</h4>
								<p>${comment.ccontent }</p>
							</div>
						</div>
					</div>
					<div class="col-sm-2 col-md-3">
						<span class="badge">#<%=i%>楼</span>
					</div>
				</div>
			</c:forEach>
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
							<li><a href="${pb.url }&pc=${i}">${i }</a></li>
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

	</div>

	<div class="container down">

		<div class="post row">
			<form role="form"
				action="<c:url value='/comment_add.action?pid=${post.pid }'/>"
				method="post">
				<div class="form-group">
					<p class="text-primary">#评论区#</p>
					<h3 class="lead  hidden-xs">
						<span class="label label-primary">发表一下感受吧！</span> <span
							class="label label-default">洪荒之力？</span> <span
							class="label label-success">php是最好的语言？</span> <span
							class="label label-info">王浩去哪了？</span> <span
							class="label label-warning">这波我必不可能死？</span> <span
							class="label label-danger">开黑吗？我玩压缩</span>
					</h3>
				</div>
				<div class="form-group">
					<textarea class="form-control" rows="6" name="ccontent"
						id="ccontent"></textarea>
				</div>
				<div class="form-group">
					<button type="submit" class="btn btn-primary">
						<span class="glyphicon glyphicon-hand-right"> 评论</span>
					</button>
				</div>
			</form>
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
