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
    <title>miniblog-regist</title>
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
  	<link rel="stylesheet" href="assets/css/regist.css">
  </head>
  
  <body>

    <div class="container">

      <div class="header row">
        <nav class="navbar navbar-default" role="navigation">
            <div class="navbar-header">
            <a class="navbar-brand" href="https://github.com/CugLu"><span class="glyphicon glyphicon-tower"></span>MINIBLOG</a>
              <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>
              
            </div>
            <div id="navbar" class="navbar-collapse collapse">
              <ul class="nav navbar-nav navbar-right">
                <li><a href="jsps/login.jsp">登录</a></li>
                <li class="active"><a href="javascript:void(0);">注册</a></li>
                <li><a href="<c:url value='/post_findByStatus.action'/>">首页</a></li>
              </ul>
            </div><!--/.nav-collapse -->
        </nav>
      </div>

      <div class="content row">
        <form class="form-signin" role="form" action="<c:url value='/user_regist.action'/>" method="post">

          <div class="panel panel-warning">
            <div class="panel-heading">
              提示信息！
            </div>
            <div class="panel-body">
              <p class="text-warning">#账号至少6位，只能是汉字，数字或英文字母</p>
              <p class="text-warning">#为了您的安全，密码至少6位，数字或英文字母</p>
              <p class="text-warning">#我们需要一个正确的邮箱，以发送激活邮件</p>
              <p class="text-danger">${msg }</p>
            </div>
          </div>

          <div class="form-group">
            <div class="input-group">
              <span class="input-group-addon">账号</span>
              <input type="text" name="username" id="username" value="${form.username }" class="form-control" placeholder="Username" autofocus />
            </div>
            <span>${errors.username }</span>
          </div>

          <div class="form-group">
            <div class="input-group">
              <span class="input-group-addon">密码</span>
              <input type="password" name="password" id="password" value="${form.password }" class="form-control" placeholder="Password" />
            </div>
            <span>${errors.password }</span>
          </div>

          <div class="form-group">
            <div class="input-group">
              <span class="input-group-addon">邮箱</span>
              <input type="email" name="email" id="email" value="${form.email }" class="form-control" placeholder="Email" />
            </div>
            <span>${errors.email }</span>
          </div>

          <div class="form-group">
            <button class="btn btn-lg btn-primary btn-block" type="submit"><span class="glyphicon glyphicon-log-in"></span> 注册</button>
          </div>

          <div class="form-group">
            <a class="btn btn-lg btn-primary btn-block" href="jsps/login.jsp" role="button">
            <span class="glyphicon glyphicon-info-sign"></span> 已有账户？</a>
          </div>

        </form>
      </div>

    </div> <!-- /container -->

    <script src="assets/libs/jquery/dist/jquery.min.js"></script>
  	<script src="assets/libs/bootstrap/js/bootstrap.min.js"></script>
  </body>
</html>
