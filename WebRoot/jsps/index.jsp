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
<title>miniblog-index</title>
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
<link rel="stylesheet" href="assets/css/index.css">
<script type="text/javascript" src="assets/js/index.js"></script>

</head>

<body id="top">

	<div class="container-fluid">
		<div class="row header">
			<h3 class="lead">M I N I B L O G</h3>
			<a class="branding" href="https://github.com/CugLu"><img
				src="assets/img/basa.png" alt="miniblog" /> </a>
			<h3 class="lead">barca</h3>
		</div>
	</div>

	<div class="main-navigation">
		<nav class="navbar navbar-default" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#example-navbar-collapse">
					<span class="sr-only">切换导航</span> <span class="icon-bar"></span> <span
						class="icon-bar"></span> <span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="https://github.com/CugLu"><span
					class="glyphicon glyphicon-tower"></span>MINIBLOG</a>
			</div>

			<div class="nav navbar-nav navbar-right">
				<li class="dropdown icon"><img class="img-circle"
					src="assets/img/icon.png" /> <a href="#" class="dropdown-toggle"
					data-toggle="dropdown"> <c:choose>
							<c:when test="${empty sessionScope.sessionUser }">
						   Admin	
					</c:when>
							<c:otherwise>
						   ${sessionScope.sessionUser.username }
					</c:otherwise>
						</c:choose> <b class="caret"></b> </a>
					<ul class="dropdown-menu">
						<li><a href="<c:url value='/info_init.action'/>"><span
								class="glyphicon glyphicon-user"></span> 个人资料</a></li>
						<li><a href="<c:url value='/info_myBlog.action?uid=${sessionScope.sessionUser.uid }'/>"><span
								class="glyphicon glyphicon-tower"></span> 我的空间</a></li>
						<li class="divider"></li>
						<li><a href="jsps/login.jsp"><span
								class="glyphicon glyphicon-log-in"></span> 登录</a></li>
						<li><a href="jsps/regist.jsp"><span
								class="glyphicon glyphicon-plus-sign"></span> 注册</a></li>
						<li><a href="<c:url value='/user_quit.action'/>"><span
								class="glyphicon glyphicon-log-out"></span> 注销</a></li>
					</ul>
				</li>
			</div>

			<div class="collapse navbar-collapse" id="example-navbar-collapse">
				<ul class="nav navbar-nav">
					<li class="active"><a href="javascript:void(0);">MINI首页</a></li>
					<li><a href="<c:url value='/post_findHot.action'/>">热门博客</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">我的空间<b class="caret"></b> </a>
						<ul class="dropdown-menu">
							<li><a href="<c:url value='/info_myBlog.action?uid=${sessionScope.sessionUser.uid }'/>"><span
									class="glyphicon glyphicon-book"></span> 我的博客</a></li>
							<li class="divider"></li>
							<li><a href="<c:url value='/info_myCollection.action'/>"><span
									class="glyphicon glyphicon-heart"></span> 我的收藏</a></li>
						</ul>
					</li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">朋友圈<b class="caret"></b> </a>
						<ul class="dropdown-menu">
							<li><a href="<c:url value='/fans_friend.action'/>"><span
									class="glyphicon glyphicon-record"></span> 我的关注</a></li>
							<li class="divider"></li>
							<li><a href="jsps/find.jsp"><span
									class="glyphicon glyphicon-zoom-in"></span> 添加朋友</a></li>
							<li class="divider"></li>
							<li><a href="javascript:void(0);"><span
									class="glyphicon glyphicon-eye-open"></span> 好友动态</a></li>
						</ul>
					</li>
				</ul>
			</div>

		</div>
		</nav>
	</div>

	<div class="container-fluid">

		<div class="col-sm-8 col-sm-offset-1 left">

			<div class="search row">
				<form role="search"
					action="<c:url value='/post_findByTitle.action'/>" method="post">
					<div class="form-group">
						<input type="text" class="form-control" name="title" id="title"
							value="${title }" placeholder="查找你喜爱的博客 ......">
					</div>
					<!--<button type="submit" class="btn btn-default">提交</button> -->
				</form>
			</div>
			<c:forEach items="${pb.beanList }" var="post">
				<div class="content row">
					<div class="col-xs-12">
						<div class="row">
							<div class="col-xs-6 col-sm-2">
								<h6>
									<span class="label label-info"><span
										class="glyphicon glyphicon-thumbs-up"></span>${post.pzan }+</span>
								</h6>
							</div>
							<div class="col-xs-12 col-sm-6">
								<a
									href="<c:url value='/post_findByPid.action?pid=${post.pid }'/>"><h6
										class="lead">${post.ptitle }</h6> </a>
							</div>
							<div class="col-xs-2 col-sm-1">
								<h6>
									<span class="label label-primary">${post.pcomment }+</span>
								</h6>
							</div>
							<div class="col-xs-10 col-sm-3">
								<h6>
									<span class="label label-success">${post.ptime }</span>
								</h6>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-2 col-xs-12">
								<h6>
									<span class="label label-warning"><span
										class="glyphicon glyphicon-user"></span>${post.user.username }</span>
								</h6>
							</div>
							<div class="col-sm-3 col-xs-12">
								<a
									href="<c:url value='/post_findByPid.action?pid=${post.pid }'/>"
									class="thumbnail"> <img
									src="<c:url value='/${post.pimg }'/>"> </a>
							</div>
							<div class="col-sm-3 col-xs-12">
								<p>${post.pcontent }</p>
							</div>

							<div id="changezan" class="col-sm-1 col-xs-6"
								onmouseover="statusZan('${post.pid }')"
								onclick="changezan('${post.pid }')">
								<h6>
									<span id="${post.pid }zan" class="label label-danger"> <span
										class="glyphicon glyphicon-thumbs-up"></span> </span>
								</h6>
							</div>

							<div id="changecol" class="col-sm-3 col-xs-6"
								onmouseover="statusCol('${post.pid }')"
								onclick="changecol('${post.pid }')">
								<h6>
									<span id="${post.pid }col" class="label label-danger"> <span
										class="glyphicon glyphicon-star-empty"></span> </span>
								</h6>
							</div>

						</div>
					</div>
				</div>
			</c:forEach>

			<div class="page row">
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

		<div class="col-sm-2 right">
			<div class="row right-1" align="center">
				<script charset="Shift_JIS"
					src="http://chabudai.sakura.ne.jp/blogparts/honehoneclock/honehone_clock_wh.js">
					
				</script>
			</div>

			<div class="row right-2">
				<p class="lead">体验MINI</p>
				<div class="list-group">
					<a href="jsps/posting.jsp"
						class="list-group-item list-group-item-success">发布博客<span
						class="badge">热</span> </a> <a href="<c:url value='/info_init.action'/>"
						class="list-group-item list-group-item-info">资料设置<span
						class="badge">热</span> </a> <a href="javascript:void(0);"
						class="list-group-item list-group-item-warning">联系我们:2237725844<span
						class="badge">qq</span> </a> <a href="https://github.com/CugLu/miniblog/archive/master.zip"
						class="list-group-item list-group-item-danger">下载资源<span
						class="badge">Git</span> </a> <a href="javascript:void(0);"
						class="list-group-item disabled">更多功能<span class="badge">More</span>
					</a>
				</div>
			</div>

			<div class="row right-3 table-responsive">
				<p class="lead">热门博客</p>
				<table class="table table-condensed table-striped">
					<thead>
						<tr class="success">
							<td>帖子</td>
							<td>用户</td>
							<td>赞</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${zanList }" var="zan">
							<tr class="warning">
								<td>${zan.ptitle }</td>
								<td>${zan.user.username }</td>
								<td>${zan.pzan }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

			<div class="row right-4 table-responsive">
				<table class="table table-condensed table-striped">
					<thead>
						<tr>
							<td>排名</td>
							<td>用户</td>
							<td>评论</td>
						</tr>
					</thead>
					<tbody>
						<%
							int i = 0;
						%>
						<c:forEach items="${commentList }" var="comment">
							<%
								i = i + 1;
							%>
							<tr>
								<td>#<%=i%></td>
								<td>${comment.user.username }</td>
								<td>${comment.pcomment }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

		</div>

	</div>

	<script src="assets/libs/jquery/dist/jquery.min.js"></script>
	<script src="assets/libs/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
