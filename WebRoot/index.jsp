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
    <link rel="stylesheet" href="assets/libs/bootstrap/css/bootstrap.min.css">
  	<link rel="stylesheet" href="assets/css/index.css">

  </head>
  
  <body>

    <div class="container-fluid">
      <div class="row header">
        <h3 class="lead">M I N I B L O G</h3>
        <a class="branding" href="https://github.com/CugLu"><img src="assets/img/basa.png" alt="miniblog" /></a>
        <h3 class="lead">barca</h3>
      </div>
    </div>

    <div class="main-navigation">
      <nav class="navbar navbar-default" role="navigation"> 
        <div class="container-fluid">
          <div class="navbar-header"> 
            <button type="button" class="navbar-toggle" data-toggle="collapse" 
                  data-target="#example-navbar-collapse"> 
              <span class="sr-only">切换导航</span> 
              <span class="icon-bar"></span> 
              <span class="icon-bar"></span> 
              <span class="icon-bar"></span> 
            </button> 
            <a class="navbar-brand" href="#"><span class="glyphicon glyphicon-tower"></span>MINIBLOG</a> 
          </div>

          <div class="nav navbar-nav navbar-right"> 
            <li class="dropdown icon">
              <img class="img-circle" src="assets/img/icon.png"/>
              <a href="#" class="dropdown-toggle" data-toggle="dropdown"> 
                  <c:choose>
					<c:when test="${empty sessionScope.sessionUser }">
						   Admin	
					</c:when>
					<c:otherwise>
						   ${username }
					</c:otherwise>
				</c:choose>
                  <b class="caret"></b> 
              </a> 
              <ul class="dropdown-menu"> 
                <li><a href="#"><span class="glyphicon glyphicon-user"></span> 个人资料</a></li>
                <li><a href="#"><span class="glyphicon glyphicon-tower"></span> 我的空间</a></li>
                <li class="divider"></li> 
                <li><a href="login.jsp"><span class="glyphicon glyphicon-log-in"></span> 登录</a></li>
                <li><a href="regist.jsp"><span class="glyphicon glyphicon-plus-sign"></span> 注册</a></li> 
                <li><a href="<c:url value='/user_quit.action'/>"><span class="glyphicon glyphicon-log-out"></span> 注销</a></li>         
              </ul> 
            </li>
          </div> 

          <div class="collapse navbar-collapse" id="example-navbar-collapse"> 
            <ul class="nav navbar-nav"> 
              <li class="active"><a href="#">MINI首页</a></li> 
              <li><a href="#">热门博客</a></li> 
              <li class="dropdown"> 
                 <a href="#" class="dropdown-toggle" data-toggle="dropdown">我的空间<b class="caret"></b> 
                 </a> 
                <ul class="dropdown-menu"> 
                  <li><a href="#"><span class="glyphicon glyphicon-book"></span> 我的博客</a></li> 
                  <li class="divider"></li> 
                  <li><a href="#"><span class="glyphicon glyphicon-heart"></span> 我的收藏</a></li> 
                </ul> 
              </li> 
              <li class="dropdown"> 
                 <a href="#" class="dropdown-toggle" data-toggle="dropdown">朋友圈<b class="caret"></b> 
                 </a> 
                <ul class="dropdown-menu"> 
                  <li><a href="#"><span class="glyphicon glyphicon-record"></span> 我的关注</a></li> 
                  <li class="divider"></li> 
                  <li><a href="#"><span class="glyphicon glyphicon-zoom-in"></span> 添加朋友</a></li> 
                  <li class="divider"></li> 
                  <li><a href="#"><span class="glyphicon glyphicon-eye-open"></span> 好友动态</a></li> 
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
            <form role="search"> 
              <div class="form-group"> 
                <input type="text" class="form-control" placeholder="查找你喜爱的博客 ......"> 
              </div> 
              <!--<button type="submit" class="btn btn-default">提交</button> -->
            </form> 
        </div> 

        <div class="content row">
          <div class="col-xs-12">
            <div class="row">
              <div class="col-xs-6 col-sm-2">
                <h6><span class="label label-info"><span class="glyphicon glyphicon-thumbs-up"></span>999+</span></h6></div>
              <div class="col-xs-6 col-sm-6"><a href=""><h6 class="lead">博客标题</h6></a></div>
              <div class="col-xs-6 col-sm-2"><h6><span class="label label-primary">9999+</span></h6></div>
              <div class="col-xs-6 col-sm-2"><h6><span class="label label-success">07-28</span></h6></div>
            </div>
            <div class="row">
              <div class="col-sm-2 col-xs-12">
                <h6><span class="label label-warning"><span class="glyphicon glyphicon-user"></span>肖航仔</span></h6></div>
               <div class="col-sm-3 col-xs-12">
                  <a href="#" class="thumbnail">
                    <img src="assets/img/icon.png">
                  </a>
                </div>
                <div class="col-sm-3 col-xs-12"><p>内容截取内容截取内容截取内容截取</p></div>
                <div class="col-sm-2 col-xs-6"><h6><span class="label label-danger">
                <span class="glyphicon glyphicon-thumbs-up"></span></span></h6></div>
                <div class="col-sm-2 col-xs-6"><h6><span class="label label-danger">
                <span class="glyphicon glyphicon-star-empty"></span></span></h6></div>
            </div>
          </div>
        </div>

        <div class="content row">
          <div class="col-sm-12">
            <div class="row">
              <div class="col-sm-2">
                <h6><span class="label label-info"><span class="glyphicon glyphicon-thumbs-up"></span>999+</span></h6></div>
              <div class="col-sm-6"><a href=""><h6 class="lead">博客标题</h6></a></div>
              <div class="col-sm-2"><h6><span class="label label-primary">9999+</span></h6></div>
              <div class="col-sm-2"><h6><span class="label label-success">07-28</span></h6></div>
            </div>
            <div class="row">
              <div class="col-sm-2">
                <h6><span class="label label-warning"><span class="glyphicon glyphicon-user"></span>肖航仔</span></h6></div>
               <div class="col-sm-3">
                  <a href="#" class="thumbnail">
                    <img src="assets/img/icon.png">
                  </a>
                </div>
                <div class="col-sm-3"><p>内容截取内容截取内容截取内容截取</p></div>
                <div class="col-sm-2"><h6><span class="label label-danger">
                <span class="glyphicon glyphicon-thumbs-up"></span></span></h6></div>
                <div class="col-sm-2"><h6><span class="label label-danger">
                <span class="glyphicon glyphicon-star-empty"></span></span></h6></div>
            </div>
          </div>
        </div>

        <div class="content row">
          <div class="col-sm-12">
            <div class="row">
              <div class="col-sm-2">
                <h6><span class="label label-info"><span class="glyphicon glyphicon-thumbs-up"></span>999+</span></h6></div>
              <div class="col-sm-6"><a href=""><h6 class="lead">博客标题</h6></a></div>
              <div class="col-sm-2"><h6><span class="label label-primary">9999+</span></h6></div>
              <div class="col-sm-2"><h6><span class="label label-success">07-28</span></h6></div>
            </div>
            <div class="row">
              <div class="col-sm-2">
                <h6><span class="label label-warning"><span class="glyphicon glyphicon-user"></span>肖航仔</span></h6></div>
               <div class="col-sm-3">
                  <a href="#" class="thumbnail">
                    <img src="assets/img/icon.png">
                  </a>
                </div>
                <div class="col-sm-3"><p>内容截取内容截取内容截取内容截取</p></div>
                <div class="col-sm-2"><h6><span class="label label-danger">
                <span class="glyphicon glyphicon-thumbs-up"></span></span></h6></div>
                <div class="col-sm-2"><h6><span class="label label-danger">
                <span class="glyphicon glyphicon-star-empty"></span></span></h6></div>
            </div>
          </div>
        </div>

        <div class="page row">
            <nav>
              <ul class="pagination pagination-sm">
              <li class="disabled"><a href="#">&laquo;</a></li>
              <li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li>
              <li><a href="#">2</a></li>
              <li><a href="#">3</a></li>
              <li><a href="#">4</a></li>
              <li><a href="#">5</a></li>
              <li><a href="#">&raquo;</a></li>
              </ul>
            </nav>
          </div>
          
          <div class="foot row">
            <div>
              <p>author <a href="https://github.com/CugLu">@CugLu</a></p>
              <p class="pull-right"><a href="#"><span class="glyphicon glyphicon-chevron-up"></span>Back to top</a></p>
            </div>
          </div>

      </div>

      <div class="col-sm-2 right">
        <div class="row right-1">
          <p class="lead">博客美图</p>
            <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
              <ol class="carousel-indicators">
                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                <li data-target="#carousel-example-generic" data-slide-to="2"></li>
              </ol>
              <div class="carousel-inner" role="listbox">
                <div class="item active">
                <img src="assets/img/lun.jpg" alt="First slide">
                
                </div>
                <div class="item">
                <img src="assets/img/lun.jpg" alt="Second slide">
                
                </div>
                <div class="item">
                <img src="assets/img/lun.jpg" alt="Third slide">
                
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

          <div class="row right-2">
            <p class="lead">体验MINI</p>
            <div class="list-group">
              <a href="posting.html" class="list-group-item list-group-item-success">发布博客<span class="badge">热</span></a>
              <a href="myinfo.html" class="list-group-item list-group-item-info">资料设置<span class="badge">热</span></a>
              <a href="#" class="list-group-item list-group-item-warning">联系我们<span class="badge">qq</span></a>
              <a href="https://github.com/CugLu" class="list-group-item list-group-item-danger">下载资源<span class="badge">Git</span></a>
              <a href="#" class="list-group-item disabled">更多功能<span class="badge">More</span></a>
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
               <tr class="info"> 
                  <td>盗墓笔记</td> 
                  <td>cailu</td>
                  <td>1999</td> 
                </tr> 
                <tr class="warning"> 
                  <td>实习</td> 
                  <td>lulu</td> 
                  <td>999</td> 
                </tr> 
                <tr class="danger"> 
                  <td>开学了</td> 
                  <td>蔡路</td> 
                  <td>99</td> 
                </tr> 
              </tbody> 
            </table>
          </div>

          <div class="row right-4 table-responsive">
            <table class="table table-condensed table-striped"> 
              <thead>
                <tr> 
                  <td>排名</td> 
                  <td>用户</td> 
                  <td>粉丝</td> 
                </tr>
              </thead>
              <tbody> 
                <tr> 
                  <td>#1</td> 
                  <td>cailu</td>
                  <td>1999</td> 
                </tr> 
                <tr> 
                  <td>#2</td> 
                  <td>lulu</td> 
                  <td>999</td> 
                </tr> 
                <tr> 
                  <td>#3</td> 
                  <td>蔡路</td> 
                  <td>99</td> 
                </tr> 
              </tbody> 
            </table>
          </div>

      </div>

    </div>
	
    <script src="assets/libs/jquery/dist/jquery.min.js"></script>
  	<script src="assets/libs/bootstrap/js/bootstrap.min.js"></script>
  </body>
</html>
