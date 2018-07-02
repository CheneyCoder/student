<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="itheima" uri="http://itheima.com/common/"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() 
	                   + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE HTML>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>系统主页</title>
	<!-- 引入css样式文件 -->
	<!-- Bootstrap Core CSS -->
	<link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet" />
	<!-- MetisMenu CSS -->
	<link href="<%=basePath%>css/metisMenu.min.css" rel="stylesheet" />
	<!-- DataTables CSS -->
	<link href="<%=basePath%>css/dataTables.bootstrap.css" rel="stylesheet" />
	<!-- Custom CSS -->
	<link href="<%=basePath%>css/sb-admin-2.css" rel="stylesheet" />
	<!-- Custom Fonts -->
	<link href="<%=basePath%>css/font-awesome.min.css" rel="stylesheet" type="text/css" />
	<link href="<%=basePath%>css/boot-crm.css" rel="stylesheet" type="text/css" />
	<style>
		#page-wrapper{
			position: absolute;
			width: 675px;
			height: 450px;
			left: 200px;
			top: 150px;
		}
	</style>
</head>
<body>
<div id="wrapper">
  <!-- 导航栏部分 -->
  <nav class="navbar navbar-default navbar-static-top" role="navigation"
		 style="margin-bottom: 0">
	<div class="navbar-header">
		<a class="navbar-brand" href="<%=basePath%>/toMain.action">希望小学学生管理系统</a>
	</div>
	<!-- 导航栏右侧图标部分 -->
	<ul class="nav navbar-top-links navbar-right">
	    <!-- 邮件通知 start -->
		<li class="dropdown">
			<a class="dropdown-toggle" data-toggle="dropdown" href="#"> 
				<i class="fa fa-envelope fa-fw"></i>
				<i class="fa fa-caret-down"></i>
			</a>
			<ul class="dropdown-menu dropdown-messages">
				<li>
				    <a href="#">
						<div>
							<strong>罗校长</strong> <span class="pull-right text-muted">
								<em>昨天</em>
							</span>
						</div>
						<div>明天上午九点，讨论一下下周新生入学仪式的安排...</div>
				    </a>
				</li>
				<li class="divider"></li>
				<li>
				    <a class="text-center" href="#">
				        <strong>查看全部消息</strong>
						<i class="fa fa-angle-right"></i>
				    </a>
				</li>
			</ul>
		</li>
		<!-- 邮件通知 end -->
		<!-- 用户信息 start -->
		<li class="dropdown">
			<a class="dropdown-toggle" data-toggle="dropdown" href="#"> 
				<i class="fa fa-user fa-fw"></i>
				<i class="fa fa-caret-down"></i>
			</a>
			<ul class="dropdown-menu dropdown-user">
				<li><a href="#"><i class="fa fa-user fa-fw"></i>
				               用户：${USER_SESSION.user_name}
				    </a>
				</li>
				<li class="divider"></li>
				<li>
					<a href="${pageContext.request.contextPath }/logout.action">
					<i class="fa fa-sign-out fa-fw"></i>退出登录
					</a>
				</li>
			</ul> 
		</li>
		<!-- 用户信息结束 -->
	</ul>
	<!-- 左侧显示列表部分 start-->
	<div class="navbar-default sidebar" role="navigation">
		<div class="sidebar-nav navbar-collapse">
			<ul class="nav" id="side-menu">
				<li class="sidebar-search">
					<div class="input-group custom-search-form">
						<input type="text" class="form-control" placeholder="查询内容...">
						<span class="input-group-btn">
							<button class="btn btn-default" type="button">
								<i class="fa fa-search" style="padding: 3px 0 3px 0;"></i>
							</button>
						</span>
					</div> 
				</li>
				<li>
				    <a href="${pageContext.request.contextPath }/student/list.action" class="active">
				      <i class="fa fa-edit fa-fw"></i> 学生管理
				    </a>
				</li>
				<li>
				    <a href="#">
				      <i class="fa fa-dashboard fa-fw" ></i> 家长拜访
				    </a>
				</li>
			</ul>
		</div>
	</div>
	<!-- 左侧显示列表部分 end--> 
  </nav>
    <!-- 客户列表查询部分  start-->
	<div id="page-wrapper">
			<div id="slidershow" class="carousel slide">
				<!-- 设置图片轮播的顺序 -->
				<ol class="carousel-indicators">
					<li class="active" data-target="#slidershow" data-slide-to="0"></li>
					<li data-target="#slidershow" data-slide-to="1"></li>
					<li data-target="#slidershow" data-slide-to="2"></li>
				</ol>
				<!-- 设置轮播图片 -->
				<div class="carousel-inner">
					<div class="item active">
						<a href="##"><img src="images/1.jpg" alt=""></a>
						<div class="carousel-caption">
							<h3>欢迎登陆</h3>
							<p>希望小学学生管理系统！</p>
						</div>
					</div>
					<div class="item">
						<a href="##"><img src="images/2.jpg" alt=""></a>
						<div class="carousel-caption">
							<h3>让我们一起</h3>
							<p>为梦想播撒希望！</p>
						</div>
					</div>
					<div class="item">
						<a href="##"><img src="images/3.jpg" alt=""></a>
						<div class="carousel-caption">
							<h3>感谢各位</h3>
							<p>对孩子们的付出和关爱！</p>
						</div>
					</div>
				</div>
				<a class="left carousel-control" href="#slidershow" role="button">
					<span class="glyphicon glyphicon-chevron-left"></span>
				</a>
				<a class="right carousel-control" href="#slidershow" role="button">
					<span class="glyphicon glyphicon-chevron-right"></span>
				</a>
			</div>

			<script src="<%=basePath%>js/jquery-2.2.2.js"></script>
			<script src="<%=basePath%>js/bootstrap.min.js"></script>
			<script>
                $(function(){
                    $(".carousel").carousel({
                        interval:2500
                    });
                    $("#slidershow a.left").click(function(){
                        $(".carousel").carousel("prev");
                        $("#slidershow a.right").click(function(){
                            $(".carousel").carousel("next");
                        })
                    });
                });
			</script>
		</div>
</div>
</body>
</html>