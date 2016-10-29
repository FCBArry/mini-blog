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
    <title>miniblog-login</title>
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
    <link rel="stylesheet" href="assets/css/login.css">
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
                <li class="active"><a href="javascript:void(0);">登录</a></li>
                <li><a href="jsps/regist.jsp">注册</a></li>
                <li><a href="<c:url value='/post_findByStatus.action'/>">首页</a></li>
              </ul>
            </div><!--/.nav-collapse -->
        </nav>
      </div>

      <div class="content row">
        <form class="form-signin" role="form" action="<c:url value='/user_login.action'/>" method="post">

          <div class="panel panel-warning">
            <div class="panel-heading">
              提示信息！
            </div>
            <div class="panel-body">
              <p class="text-warning">#想改名？改名卡8折活动热销中</p>
              <p class="text-warning">#忘记密码？可以通过邮箱找回欧</p>
              <p class="text-danger">${msg }</p>
            </div>
          </div>

          <div class="form-group">
            <div class="input-group">
              <span class="input-group-addon">账号</span>
              <input type="text" class="form-control" value="${form.username }" placeholder="Username" id="username" name="username" autofocus />
            </div>
            <span>${errors.username }</span>
          </div>

          <div class="form-group">
            <div class="input-group">
              <span class="input-group-addon">密码</span>
              <input type="password" class="form-control" value="${form.password }" placeholder="Password" id="password" name="password" />
            </div>
            <span>${errors.password }</span>
          </div>

          <div class="form-group">
            <button class="btn btn-lg btn-primary btn-block" type="submit"><span class="glyphicon glyphicon-log-in"></span> 登录</button>
          </div>

          <div class="form-group">
            <a class="btn btn-lg btn-primary btn-block" href="jsps/regist.jsp" role="button">
            <span class="glyphicon glyphicon-info-sign"></span> 还没有账户？</a>
          </div>

        </form>
      </div>

    </div> <!-- /container -->

    <script src="assets/libs/jquery/dist/jquery.min.js"></script>
    <script src="assets/libs/bootstrap/js/bootstrap.min.js"></script>
  </body>
</html>
