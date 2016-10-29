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
    <title>miniblog-myinfo</title>
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
  	<link rel="stylesheet" href="assets/css/myinfo.css">
  	
  </head>
  
  <body>

  	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="https://github.com/CugLu"><span class="glyphicon glyphicon-tower"></span>MINIBLOG</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
            <li><a href="<c:url value='/post_findByStatus.action'/>">首页</a></li>
            <li class="active"><a href="javascript:void(0);">我的资料</a></li>
            <li><a href="<c:url value='/info_myBlog.action?uid=${sessionScope.sessionUser.uid }'/>">我的空间</a></li>
            <li><a href="<c:url value='/fans_friend.action'/>">朋友圈</a></li>
          </ul>
        </div>
      </div>
    </nav>

    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
          <ul class="nav nav-sidebar">
            <li class="active"><a href="javascript:void(0)" onclick="document.getElementById('baseinfo').scrollIntoView();"><span class="glyphicon glyphicon-user"></span> 基本信息</a></li>
            <li><a href="javascript:void(0)" onclick="document.getElementById('contactinfo').scrollIntoView();"><span class="glyphicon glyphicon-phone-alt"></span> 联系信息</a></li>
            <li><a href="javascript:void(0)" onclick="document.getElementById('jobinfo').scrollIntoView();"><span class="glyphicon glyphicon-credit-card"></span> 职业信息</a></li>
            <li><a href="javascript:void(0)" onclick="document.getElementById('eduinfo').scrollIntoView();"><span class="glyphicon glyphicon-bell"></span> 教育信息</a></li>
          </ul>
          <ul class="nav nav-sidebar">
            <li><a href="javascript:void(0)" onclick="document.getElementById('blogcount').scrollIntoView();"><span class="glyphicon glyphicon-pushpin"></span> 博客数据</a></li>
			<li><a href="javascript:void(0)" onclick="document.getElementById('moreinfo').scrollIntoView();"><span class="glyphicon glyphicon-cloud-download"></span> 更多数据</a></li>
            <li><a href="javascript:void(0)" onclick="document.getElementById('qrcode').scrollIntoView();"><span class="glyphicon glyphicon-qrcode"></span> 二维码</a></li>
          </ul>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
		  <div class="progress progress-striped active">
			<div class="progress-bar progress-bar-success" role="progressbar"
				 aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"
				 style="width: 88%;">
				<span>88% 完成（成功）</span>
			</div>
		  </div>
          <div class="page-header">
			<h3 class="lead" id="baseinfo">基本信息</h3>
			<button class="btn btn-primary btn-sm" onclick="base()"><span class="glyphicon glyphicon-edit"> 编辑</span></button>
		  </div>
		  <form class="form-horizontal" name="myformbase" action="<c:url value='/info_base.action'/>" method="post">
			  <div class="form-group">
				<label for="firstname" class="col-sm-1 control-label">真实姓名</label>
				<div class="col-sm-5">
				  <input type="text" class="form-control base" name="iname" id="iname" value="${info.iname }">
				</div>
			  </div>
			  <div class="form-group">
				<label for="firstname" class="col-sm-1 control-label">所在地</label>
				<div class="col-sm-5">
				  <input type="text" name="iaddress" id="iaddress" class="base form-control" value="${info.iaddress }">
				</div>
			  </div>
			  <div class="form-group">
				<label for="firstname" class="col-sm-1 control-label">性别</label>
				<div class="col-sm-5">
				  <select class="base form-control" name="isex" id="isex">
				  	<c:choose>
					  	<c:when test="${info.isex eq 1 }">
						  	<option selected="selected" value="1">男</option>
						  	<option value="0">女</option>
					  	</c:when>
						<c:otherwise>
							<option value="1">男</option>
							<option selected="selected" value="0">女</option>
						</c:otherwise>
					</c:choose>
				  </select>
				</div>
			  </div>
			  <div class="form-group">
				<label for="firstname" class="col-sm-1 control-label">感情状况</label>
				<div class="col-sm-5">
				  <select class="base form-control" name="iemotion" id="iemotion">
				  	<c:choose>
					  	<c:when test="${info.iemotion eq 1 }">
					  	<option selected="selected" value="1">单身狗</option>
					  	<option value="0">恋爱中</option>
					  	</c:when>
						<c:otherwise>
						<option value="1">单身狗</option>
						<option selected="selected" value="0">恋爱中</option>
						</c:otherwise>
					</c:choose>
				  </select>
				</div>
			  </div>
			  <div class="form-group">
				<label for="firstname" class="col-sm-1 control-label">博客地址</label>
				<div class="col-sm-5">
				  <input type="text" class="base form-control" name="iblog" id="iblog" value="${info.iblog }">
				</div>
			  </div>
			  <div class="form-group">
				<label for="firstname" class="col-sm-1 control-label">简介</label>
				<div class="col-sm-5">
				  <textarea class="base form-control" rows="3" name="ime" id="ime">${info.ime }</textarea>
				</div>
			  </div>
			  <div class="form-group">
				<div class="col-sm-12 col-sm-offset-1">
				  <button type="button" onclick="baseback()" class="base btndisabled btn btn-success btn-sm"><span class="glyphicon glyphicon-bookmark"> 保存</span></button>
				</div>
			  </div>
		  </form>
		  <div class="page-header">
			<h3 class="lead" id="contactinfo">联系信息</h3>
			<button class="btn btn-primary btn-sm" onclick="con()"><span class="glyphicon glyphicon-edit"> 编辑</span></button>
		  </div>
		  <form class="form-horizontal" name="myformcon" action="<c:url value='/info_connection.action'/>" method="post">
			  <div class="form-group">
				<label for="firstname" class="col-sm-1 control-label">QQ</label>
				<div class="col-sm-5">
				  <input type="text" class="con form-control" name="iqq" id="iqq" value="${info.iqq }">
				</div>
			  </div>
			  <div class="form-group">
				<label for="firstname" class="col-sm-1 control-label">邮箱</label>
				<div class="col-sm-5">
				  <input type="text" class="con form-control" name="iemail" id="iemail" value="${info.iemail }">
				</div>
			  </div>
			  <div class="form-group">
				<label for="firstname" class="col-sm-1 control-label">电话</label>
				<div class="col-sm-5">
				  <input type="text" class="con form-control" name="iphone" id="iphone" value="${info.iphone }">
				</div>
			  </div>
			  <div class="form-group">
				<div class="col-sm-12 col-sm-offset-1">
				  <button type="button" onclick="conback()" class="con btndisabled btn btn-success btn-sm"><span class="glyphicon glyphicon-bookmark"> 保存</span></button>
				</div>
			  </div>
		  </form>
		  <div class="page-header">
			<h3 class="lead" id="jobinfo">职业信息</h3>
			<button class="btn btn-primary btn-sm" onclick="com()"><span class="glyphicon glyphicon-edit"> 编辑</span></button>
		  </div>
		  <form class="form-horizontal" name="myformcom" action="<c:url value='/info_work.action'/>" method="post">
			  <div class="form-group">
				<label for="firstname" class="col-sm-1 control-label">公司</label>
				<div class="col-sm-5">
				  <input type="text" class="com form-control" name="icompany" id="icompany" value="${info.icompany }">
				</div>
			  </div>
			  <div class="form-group">
				<label for="firstname" class="col-sm-1 control-label">地址</label>
				<div class="col-sm-5">
				  <input type="text" class="com form-control" name="icomaddress" id="icomaddress" value="${info.icomaddress }">
				</div>
			  </div>
			  <div class="form-group">
				<label for="firstname" class="col-sm-1 control-label">职位</label>
				<div class="col-sm-5">
				  <input type="text" class="com form-control" name="ijob" id="ijob" value="${info.ijob }">
				</div>
			  </div>
			  <div class="form-group">
				<div class="col-sm-12 col-sm-offset-1">
				  <button type="button" onclick="comback()" class="com btndisabled btn btn-success btn-sm"><span class="glyphicon glyphicon-bookmark"> 保存</span></button>
				</div>
			  </div>
		  </form>
		  <div class="page-header">
			<h3 class="lead" id="eduinfo">教育信息</h3>
			<button class="btn btn-primary btn-sm" onclick="sch()"><span class="glyphicon glyphicon-edit"> 编辑</span></button>
		  </div>
		  <form class="form-horizontal" name="myformsch" action="<c:url value='/info_education.action'/>" method="post">
			  <div class="form-group">
				<label for="firstname" class="col-sm-1 control-label">学校</label>
				<div class="col-sm-5">
				  <input type="text" class="sch form-control" name="ischool" id="ischool" value="${info.ischool }">
				</div>
			  </div>
			  <div class="form-group">
				<label for="firstname" class="col-sm-1 control-label">地址</label>
				<div class="col-sm-5">
				  <input type="text" class="sch form-control" name="ischaddress" id="ischaddress" value="${info.ischaddress }">
				</div>
			  </div>
			  <div class="form-group">
				<label for="firstname" class="col-sm-1 control-label">学历</label>
				<div class="col-sm-5">
				  <input type="text" class="sch form-control" name="idegree" id="idegree" value="${info.idegree }">
				</div>
			  </div>
			  <div class="form-group">
				<div class="col-sm-12 col-sm-offset-1">
				  <button type="button" onclick="schback()" class="sch btndisabled btn btn-success btn-sm"><span class="glyphicon glyphicon-bookmark"> 保存</span></button>
				</div>
			  </div>
		  </form>
		  
		  <h3 class="sub-header lead" id="blogcount">博客数据</h3>
		  <div class="table-responsive">
			<table class="table table-hover table-bordered">
			  <caption>基本博客数据</caption>
			  <thead>
				<tr>
				  <th>统计项目</th>
				  <th>统计结果</th>
				</tr>
			  </thead>
			  <tbody>
				<tr>
				  <td>博文数</td>
				  <td>${numPost }</td>
				</tr>
				<tr>
				  <td>评论过</td>
				  <td>${numComment }</td>
				</tr>
				<tr>
				  <td>赞过</td>
				  <td>${numFavour }</td>
				</tr>
				<tr>
				  <td>我的关注</td>
				  <td>${numMTO }</td>
				</tr>
				<tr>
				  <td>我的粉丝</td>
				  <td>${numOTM }</td>
				</tr>
				<tr>
				  <td>资料完整度</td>
				  <td>99%</td>
				</tr>
			  </tbody>
			</table>
		  </div>
		  
		  <h3 class="sub-header lead" id="moreinfo">更多数据</h3>
		  <div class="alert alert-warning alert-dismissible" role="alert">
			<button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
			<h3 class="lead"><strong>提示！</strong> 蓝钻2元/月，赶快充值 <span class="glyphicon glyphicon-hand-down"></span></h3>
		  </div>
		  
		  <h3 class="sub-header lead" id="qrcode">扫一扫，进入我的主页</h3>
		  <img src="assets/img/ma.jpg" class="img-responsive img-thumbnail" alt="Responsive image">
        </div>
      </div>
    </div>

    <script src="assets/libs/jquery/dist/jquery.min.js"></script>
    <script type="text/javascript">
		$(document).ready(function(){
			var eles = document.getElementsByClassName("form-control");
			var i;
		    for (i = 0; i < eles.length; i++) {
		    	var att=document.createAttribute("disabled");
		    	att.value="disabled";
		    	eles[i].setAttributeNode(att);
		    }
		    
		    var btns = document.getElementsByClassName("btndisabled");
			var j;
		    for (j = 0; j < btns.length; j++) {
		    	var att=document.createAttribute("disabled");
		    	att.value="disabled";
		    	btns[j].setAttributeNode(att);
		    }
		});
		
		function base() {
			var eles = document.getElementsByClassName("base");
			var i;
		    for (i = 0; i < eles.length; i++) {
		    	eles[i].disabled = false;
		    }
		    
		}
		function baseback() {
			document.myformbase.submit();
			var eles = document.getElementsByClassName("base");
			var i;
		    for (i = 0; i < eles.length; i++) {
		    	eles[i].disabled = true;
		    }
		}
		
		function con() {
			var eles = document.getElementsByClassName("con");
			var i;
		    for (i = 0; i < eles.length; i++) {
		    	eles[i].disabled = false;
		    }
		}
		function conback() {
			document.myformcon.submit();
			var eles = document.getElementsByClassName("con");
			var i;
		    for (i = 0; i < eles.length; i++) {
		    	eles[i].disabled = true;
		    }
		}
		
		function com() {
			var eles = document.getElementsByClassName("com");
			var i;
		    for (i = 0; i < eles.length; i++) {
		    	eles[i].disabled = false;
		    }
		}
		
		function comback() {
			document.myformcom.submit();
			var eles = document.getElementsByClassName("com");
			var i;
		    for (i = 0; i < eles.length; i++) {
		    	eles[i].disabled = true;
		    }
		}
		
		function sch() {
			var eles = document.getElementsByClassName("sch");
			var i;
		    for (i = 0; i < eles.length; i++) {
		    	eles[i].disabled = false;
		    }
		}
		function schback() {
			document.myformsch.submit();
			var eles = document.getElementsByClassName("sch");
			var i;
		    for (i = 0; i < eles.length; i++) {
		    	eles[i].disabled = true;
		    }
		}
	</script>
  	<script src="assets/libs/bootstrap/js/bootstrap.min.js"></script>
  </body>
</html>
