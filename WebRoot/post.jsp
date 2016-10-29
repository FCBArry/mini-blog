<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
    <link rel="stylesheet" href="assets/libs/bootstrap/css/bootstrap.min.css">
  	<link rel="stylesheet" href="assets/css/post.css">

  </head>
  
  <body>

    <div class="container up">

    	<div class="row header">
			<h3 class="lead">THE P O S T</h3>
			<a class="branding" href="https://github.com/CugLu"><img src="assets/img/basa.png" class="img-circle" alt="miniblog" /></a>	
		</div>

		<div class="row mynavbar">
			<nav class="navbar navbar-default">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="#"><span class="glyphicon glyphicon-tower"></span>MINIBLOG</a>
				</div>
				<div class="navbar-collapse collapse">
					<ul class="nav navbar-nav navbar-right">
						<li><a href="index.html"><span class="glyphicon glyphicon-qrcode"></span> 首页</a></li>
						<li class="active"><a href="#"><span class="glyphicon glyphicon-book"></span> 博客</a></li>
						<li><a href="friend.html"><span class="glyphicon glyphicon-eye-open"></span> 我的关注</a></li>
						<li><a href="myroom.html"><span class="glyphicon glyphicon-home"></span> 我的空间</a></li>
					</ul>
				</div><!--/.nav-collapse -->
			</nav>
		</div>
	</div>

	<div class="container middle">

		<div class="mainpostheader row">
			<div class="page-header">
				<h3 class="lead">Bootstrap的时代要来了<small>我是一个小尾巴~~~</small></h3>
				<span class="badge">赞233</span>
				<span class="badge">评论999+</span>
			</div>
		</div>

		<div class="content">
				<div class="row commentrow">
					<div class="col-sm-10 col-md-9">
						<div class="media">
							<a class="media-left" href="#">
								<img src="assets/img/icon.png" />
							 </a>
							 <div class="media-body">
								<h4 class="media-heading">博客标题</h4>
								<p>博客内容博客内容博客内容博客内容博客内容博客内容
								博客内容博客内容博客内容博客内容博客内容博客内容
								</p>
								<img src="assets/img/icon.png" class="img-responsive img-thumbnail" />
							 </div>
						</div>
					</div>
					<div class="col-sm-2 col-md-3">
						<span class="badge">#楼主</span>
					</div>
				</div>
				<div class="row commentrow">
					<div class="col-sm-10 col-md-9">
						<div class="media">
							<a class="media-left" href="#">
								<img src="assets/img/icon.png" />
							 </a>
							 <div class="media-body">
								<h4 class="media-heading">小航子</h4>
								<p>评论内容</p>
							 </div>
						</div>
					</div>
					<div class="col-sm-2 col-md-3">
						<span class="badge">#1楼</span>
					</div>
				</div>
				<div class="row commentrow">
					<div class="col-sm-10 col-md-9">
						<div class="media">
							<a class="media-left" href="#">
								<img src="assets/img/icon.png" />
							 </a>
							 <div class="media-body">
								<h4 class="media-heading">小航子</h4>
								<p>评论内容</p>
							 </div>
						</div>
					</div>
					<div class="col-sm-2 col-md-3">
						<span class="badge">#2楼</span>
					</div>
				</div>
				<div class="row commentrow">
					<div class="col-sm-10 col-md-9">
						<div class="media">
							<a class="media-left" href="#">
								<img src="assets/img/icon.png" />
							 </a>
							 <div class="media-body">
								<h4 class="media-heading">小航子</h4>
								<p>评论内容</p>
							 </div>
						</div>
					</div>
					<div class="col-sm-2 col-md-3">
						<span class="badge">#3楼</span>
					</div>
				</div>
		</div>
		
		<div class="page row">
			<nav>
				<ul class="pagination pagination-sm">
					<li class="disabled"><a href="#">&laquo;</a></li>
					<li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li>
					<li class="hidden-xs"><a href="#">2</a></li>
					<li class="hidden-xs"><a href="#">3</a></li>
					<li class="hidden-xs"><a href="#">4</a></li>
					<li class="hidden-xs"><a href="#">5</a></li>
					<li><a href="#">&raquo;</a></li>
				</ul>	
			</nav>
		</div>

	</div>

	<div class="container down">

		<div class="post row">
			<form role="form">
				 <div class="form-group">
				 	<p class="text-primary">#评论区#</p>
					<h3 class="lead  hidden-xs">
						<span class="label label-primary">发表一下感受吧！</span>
						<span class="label label-default">洪荒之力？</span>
						<span class="label label-success">php是最好的语言？</span>
						<span class="label label-info">王浩去哪了？</span>
						<span class="label label-warning">这波我必不可能死？</span>
						<span class="label label-danger">开黑吗？我玩压缩</span>
					</h3>
				 </div>
				  <div class="form-group">
				 	<textarea class="form-control" rows="6"></textarea>
				 </div>
				 <div class="form-group">
				 	<button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-hand-right"> 评论</span></button>
				 </div>
			</form>
		</div>
			
		<div class="foot row">
			<div>
				<p>author <a href="https://github.com/CugLu">@CugLu</a></p>
				<p class="pull-right"><a href="#"><span class="glyphicon glyphicon-chevron-up"></span>Back to top</a></p>
			</div>
		</div>

	</div>
    <script src="assets/libs/jquery/dist/jquery.min.js"></script>
  	<script src="assets/libs/bootstrap/js/bootstrap.min.js"></script>
  </body>
</html>
