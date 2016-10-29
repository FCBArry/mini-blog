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
    <title>miniblog-welcome</title>
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
  	<link rel="stylesheet" href="assets/css/welcome.css">
  </head>
  
  <body>

	<div class="container">
		
      <!--navbar -->
      <div class="row">
	      <nav class="navbar navbar-inverse" role="navigation">
	          <div class="navbar-header">
	          <a class="navbar-brand" href="index.html"><span class="glyphicon glyphicon-tower"></span>MINIBLOG</a>
	            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
	              <span class="sr-only">Toggle navigation</span>
	              <span class="icon-bar"></span>
	              <span class="icon-bar"></span>
	              <span class="icon-bar"></span>
	            </button>
	            
	          </div>
	          <div id="navbar" class="navbar-collapse collapse">
	            <ul class="nav navbar-nav navbar-right">
	              <li class="active"><a href="#">开始</a></li>
	              <li><a href="index.jsp">首页</a></li>
	              <li><a href="login.jsp">登录</a></li>
				  <li><a href="regist.jsp">注册</a></li>
	            </ul>
	          </div><!--/.nav-collapse -->
	      </nav>
      </div>
	  
	  <div class="row">
		  <div class="page-header">
			<h3 class="text-primary">MINIBLOG</h3>
		  </div>
	  </div>

	  <div class="row hidden-xs">
	      <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
	        <ol class="carousel-indicators">
	          <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
	          <li data-target="#carousel-example-generic" data-slide-to="1"></li>
	          <li data-target="#carousel-example-generic" data-slide-to="2"></li>
	        </ol>
	        <div class="carousel-inner" role="listbox">
	          <div class="item active">
	            <img src="assets/img/lun.jpg" alt="First slide">
				<div class="carousel-caption lead">新鲜热点</div> 
	          </div>
	          <div class="item">
	            <img src="assets/img/lun.jpg" alt="Second slide">
				<div class="carousel-caption lead">生活趣事</div> 
	          </div>
	          <div class="item">
	            <img src="assets/img/lun.jpg" alt="Third slide">
				<div class="carousel-caption lead">朋友动态</div> 
	          </div>
	        </div>
	        <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
	          <span class="glyphicon glyphicon-chevron-left"></span>
	          <span class="sr-only">Previous</span>
	        </a>
	        <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
	          <span class="glyphicon glyphicon-chevron-right"></span>
	          <span class="sr-only">Next</span>
	        </a>
	      </div>
	  </div>

	  <div class="row">
	      <div class="jumbotron">
			  <h1 class="lead">迷你博客</h1>
			  <p class="lead"> －　－　－　－　ＭＩＮＩ　－　－　－　－</p>
	          <p class="lead">发现身边的新鲜事，随时随地查看动态，</p>
	          <p class="lead">认识更多的朋友，打造属于自己的空间。</p>
	          <p class="lead"> －　－　－　－　ＢＬＯＧ　－　－　－　－</p>
	          <p class="lead">迷你博客，发现好时光！</p>
	          <a class="btn btn-lg btn-primary" href="login.html" role="button">加入我们 &raquo;</a>
	        </p>
	      </div>
	  </div>

	  <div class="row">
		  <div class="foot">
			<p>author <a href="https://github.com/CugLu" data-toggle="tooltip" title="访问我的github">@CugLu</a></p>
			<p class="pull-right"><a href="#"><span class="glyphicon glyphicon-chevron-up"></span>Back to top</a></p>
	      </div>
	  </div>

    </div> <!-- /container -->
	
    <script src="assets/libs/jquery/dist/jquery.min.js"></script>
  	<script src="assets/libs/bootstrap/js/bootstrap.min.js"></script>
  </body>
</html>
