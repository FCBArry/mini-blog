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
    <title>miniblog-posting</title>
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
  	<link rel="stylesheet" href="assets/css/posting.css">

  	<script type="text/javascript">
	        //图片上传预览    IE是用了滤镜。
	        function previewImage(file)
	        {
	          var MAXWIDTH  = 200; 
	          var MAXHEIGHT = 200;
	          var div = document.getElementById('preview');
	          if (file.files && file.files[0])
	          {
	              div.innerHTML ='<img id=imghead>';
	              var img = document.getElementById('imghead');
	              img.onload = function(){
	                var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
	                img.width  =  rect.width;
	                img.height =  rect.height;
	//                 img.style.marginLeft = rect.left+'px';
	                img.style.marginTop = rect.top+'px';
	              }
	              var reader = new FileReader();
	              reader.onload = function(evt){img.src = evt.target.result;}
	              reader.readAsDataURL(file.files[0]);
	          }
	          else //兼容IE
	          {
	            var sFilter='filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src="';
	            file.select();
	            var src = document.selection.createRange().text;
	            div.innerHTML = '<img id=imghead>';
	            var img = document.getElementById('imghead');
	            img.filters.item('DXImageTransform.Microsoft.AlphaImageLoader').src = src;
	            var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
	            status =('rect:'+rect.top+','+rect.left+','+rect.width+','+rect.height);
	            div.innerHTML = "<div id=divhead style='width:"+rect.width+"px;height:"+rect.height+"px;margin-top:"+rect.top+"px;"+sFilter+src+"\"'></div>";
	          }
	        }
	        function clacImgZoomParam( maxWidth, maxHeight, width, height ){
	            var param = {top:0, left:0, width:width, height:height};
	            if( width>maxWidth || height>maxHeight )
	            {
	                rateWidth = width / maxWidth;
	                rateHeight = height / maxHeight;
	                 
	                if( rateWidth > rateHeight )
	                {
	                    param.width =  maxWidth;
	                    param.height = Math.round(height / rateWidth);
	                }else
	                {
	                    param.width = Math.round(width / rateHeight);
	                    param.height = maxHeight;
	                }
	            }
	             
	            param.left = Math.round((maxWidth - param.width) / 2);
	            param.top = Math.round((maxHeight - param.height) / 2);
	            return param;
	        }
	</script>     
	
  </head>
  
  <body id="top">

    <div class="container">

		<div class="row headerimg">
			<h3 class="lead">P O S T I N G</h3>
			<h3><span class="glyphicon glyphicon-edit"></span><h3>
		</div>
		<div class="row mynavbar">
			<ol class="breadcrumb"> 
				<li><a href="<c:url value='/post_findByStatus.action'/>">主页</a></li> 
				<li class="active">发博客</li> 
			</ol> 
		</div>
		
			<form class="postform row" action="<c:url value='/post_add.action'/>" enctype="multipart/form-data" method="post">
			  <div class="form-group row">
				<div class="col-sm-9 col-md-8">
					<h3 class="lead"><span class="label label-primary">起个炫酷的标题吧</span></h3>
					<input type="text" id="ptitle" name="ptitle" class="form-control" placeholder="请输入博客标题">
				</div>
				<div class="col-sm-3 col-md-4">
					<h3 class="lead"><span class="label label-default">博客状态</span></h3>
					<select class="form-control"  id="pstatus" name="pstatus"> 
						<option value="1">公开</option> 
						<option value="0">私有</option> 
					 </select>
				</div>
			  </div>
			  <div class="form-group row">
				<div class="col-xs-12">
					<h3 class="lead"><span class="label label-warning">总得说点什么</span></h3>
					<textarea class="form-control"  id="pcontent" name="pcontent" rows="6"></textarea>
				</div>
			  </div>
			  <div class="form-group row">
			  	<div class="col-sm-6 col-md-5">
					<h3 class="lead"><span class="label label-info">预览图</span></h3>
					<div id="preview">
						<img id="imghead" class="" width=200 height=200 border=0 src="assets/img/lun.jpg">
					</div>
				</div>
				<div class="col-sm-6 col-md-7">
					<h3 class="lead"><span class="label label-danger">没图说个什么</span></h3>
					<input style="width: 200px; height: 20px;" type="file" name="pimg" id="pimg" onchange="previewImage(this)" /><br/>
					<span>${msg }</span>
				</div>
			  </div>
			  <div class="form-group row">
			  	<div class="col-xs-2">
			  		<button type="submit" class="btn btn-primary btn-md"><span class="glyphicon glyphicon-send"></span> 发布</button>
			  	</div>
			  </div>
			</form>
		
		<div class="foot row">
			<p>author <a href="https://github.com/CugLu">@CugLu</a></p>
			<p class="pull-right"><a href="javascript:void(0)" onclick="document.getElementById('top').scrollIntoView();">
				<span class="glyphicon glyphicon-chevron-up"></span>Back to top</a>
			</p>
		</div>
		
	</div>
	
    <script src="assets/libs/jquery/dist/jquery.min.js"></script>
  	<script src="assets/libs/bootstrap/js/bootstrap.min.js"></script>
  </body>
</html>
