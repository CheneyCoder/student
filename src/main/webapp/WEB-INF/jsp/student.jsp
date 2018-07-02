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
	<title>学生管理</title>
	<!-- 引入css样式文件 -->
	<!-- Bootstrap Core CSS -->
	<link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet" />
	<!-- MetisMenu CSS -->
	<link href="<%=basePath%>css/metisMenu.min.css" rel="stylesheet" />
	<!-- DataTables CSS -->
	<link href="<%=basePath%>css/dataTables.bootstrap.css" rel="stylesheet" />
	<!-- stom CSS -->
	<link href="<%=basePath%>css/sb-admin-2.css" rel="stylesheet" />
	<!-- stom Fonts -->
	<link href="<%=basePath%>css/font-awesome.min.css" rel="stylesheet" type="text/css" />
	<link href="<%=basePath%>css/boot-crm.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="wrapper">
  <!-- 导航栏部分 -->
  <nav class="navbar navbar-default navbar-static-top" role="navigation"
		 style="margin-bottom: 0">
	<div class="navbar-header">
		<a class="navbar-brand" href="<%=basePath%>toMain.action">希望小学学生管理系统</a>
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
		<!-- 用户信息 结束 -->
	</ul>
	<!-- 左侧显示列表部分 start-->
	<div class="navbar-default sidebar" role="navigation">
		<div class="sidebar-nav navbar-collapse">
			<ul class="nav" id="side-menu">
				<li class="sidebar-search">
					<div class="input-group stom-search-form">
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
    <!-- 学生列表查询部分  start-->
	<div id="page-wrapper">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">学生管理</h1>
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<!-- /.row -->
		<div class="panel panel-default">
			<div class="panel-body">
				<form class="form-inline" method="post"
				      action="${pageContext.request.contextPath }/student/list.action">
					<div class="form-group">
						<label for="studentName">学生姓名</label>
						<input type="text" class="form-control" id="studentName" 
						                   value="${stName }" name="stName" />
					</div>
					<div class="form-group">
						<label for="studentSex">学生性别</label>
						<select	class="form-control" id="studentSex" name="stSex">
							<option value="">--请选择--</option>
							<c:forEach items="${SexType}" var="item">
								<option value="${item.dict_id}"
								       <c:if test="${item.dict_id == stSex}">selected</c:if>>
								    ${item.dict_item_name }
								</option>
							</c:forEach>
						</select>
					</div>
					<div class="form-group">
						<label for="stGrade">学生年级</label>
						<select	class="form-control" id="stGrade"  name="stGrade">
							<option value="">--请选择--</option>
							<c:forEach items="${GradeType}" var="item">
								<option value="${item.dict_id}"
								        <c:if test="${item.dict_id == stGrade}"> selected</c:if>>
								    ${item.dict_item_name }
								</option>
							</c:forEach>
						</select>
					</div>
					<div class="form-group">
						<label for="stClass">学生班级</label>
						<select	class="form-control" id="stClass" name="stClass">
							<option value="">--请选择--</option>
							<c:forEach items="${ClassType}" var="item">
								<option value="${item.dict_id}"
								        <c:if test="${item.dict_id == stClass}"> selected</c:if>>
								    ${item.dict_item_name }
								</option>
							</c:forEach>
						</select>
					</div>
					<button type="submit" class="btn btn-primary">查询</button>
				</form>
			</div>
		</div>
		<a href="#" class="btn btn-primary" data-toggle="modal" 
		           data-target="#newstudentDialog" onclick="clearstudent()">新建</a>
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">学生信息列表</div>
					<!-- /.panel-heading -->
					<table class="table table-bordered table-striped">
						<thead>
							<tr>
								<th>编号</th>
								<th>学生名称</th>
                                <th>学生性别</th>
								<th>学生年级</th>
								<th>学生班级</th>
								<th>出生日期</th>
								<th>联系方式</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${page.rows}" var="row">
								<tr>
									<td>${row.st_id}</td>
									<td>${row.st_name}</td>
									<td>${row.st_sex}</td>
									<td>${row.st_grade}</td>
									<td>${row.st_class}</td>
									<td>${row.st_birthday}</td>
								    <td>${row.st_mobile}</td>
									<td>
										<a href="#" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#studentEditDialog" onclick= "editstudent(${row.st_id})">修改</a>
										<a href="#" class="btn btn-danger btn-xs" onclick="deletestudent(${row.st_id})">删除</a>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="col-md-12 text-right">
						<itheima:page url="${pageContext.request.contextPath }/student/list.action" />
					</div>
					<!-- /.panel-body -->
				</div>
				<!-- /.panel -->
			</div>
			<!-- /.col-lg-12 -->
		</div>
	</div>
	<!-- 学生列表查询部分  end-->
</div>
<!-- 创建学生模态框 -->
<div class="modal fade" id="newstudentDialog" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">新建学生信息</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" id="new_student_form">
					<div class="form-group">
						<label for="new_studentName" class="col-sm-2 control-label">
						    学生名称
						</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="new_studentName" placeholder="学生名称" name="st_name" />
						</div>
					</div>
					<div class="form-group">
						<label for="new_studentSex" style="float:left;padding:7px 15px 0 27px;">学生性别</label> 
						<div class="col-sm-10">
							<select	class="form-control" id="new_studentSex" name="st_Sex">
								<option value="">--请选择--</option>
								<c:forEach items="${SexType}" var="item">
									<option value="${item.dict_id}"<c:if test="${item.dict_id == stSex}">selected</c:if>>
									${item.dict_item_name }									
									</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="new_stClass" style="float:left;padding:7px 15px 0 27px;">学生年级</label>
						<div class="col-sm-10"> 
							<select	class="form-control" id="new_stGrade"  name="st_Grade">
								<option value="">--请选择--</option>
								<c:forEach items="${GradeType}" var="item">
									<option value="${item.dict_id}"<c:if test="${item.dict_id == stGrade}"> selected</c:if>>
									${item.dict_item_name }
									</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="new_stClass" style="float:left;padding:7px 15px 0 27px;">学生班级</label>
						<div class="col-sm-10">
							<select	class="form-control" id="new_stClass" name="st_Class">
								<option value="">--请选择--</option>
								<c:forEach items="${ClassType}" var="item">
									<option value="${item.dict_id}"<c:if test="${item.dict_id == stClass}"> selected</c:if>>${item.dict_item_name }</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="new_birthday" class="col-sm-2 control-label">出生日期</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="new_birthday" placeholder="出生日期" name="st_birthday" />
						</div>
					</div>
					<div class="form-group">
						<label for="new_mobile" class="col-sm-2 control-label">联系方式</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="new_mobile" placeholder="家庭联系方式" name="st_mobile" />
						</div>
					</div>
					<div class="form-group">
						<label for="new_address" class="col-sm-2 control-label">家庭住址</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="new_address" placeholder="家庭联系地址" name="st_address" />
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary" onclick="createstudent()">创建学生</button>
			</div>
		</div>
	</div>
</div>
<!-- 修改学生模态框 -->
<div class="modal fade" id="studentEditDialog" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">修改学生信息</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" id="edit_student_form">
					<input type="hidden" id="edit_st_id" name="st_id"/>
					<div class="form-group">
						<label for="edit_studentName" class="col-sm-2 control-label">学生名称</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="edit_studentName" placeholder="学生名称" name="st_name" />
						</div>
					</div>
					<div class="form-group">
						<label for="edit_studentSex" style="float:left;padding:7px 15px 0 27px;">学生性别</label> 
						<div class="col-sm-10">
							<select	class="form-control" id="edit_studentSex" name="st_Sex">
								<option value="">--请选择--</option>
								<c:forEach items="${SexType}" var="item">
									<option value="${item.dict_id}"<c:if test="${item.dict_id == stSex}"> selected</c:if>>${item.dict_item_name }</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="edit_stGrade" style="float:left;padding:7px 15px 0 27px;">学生年级</label>
						<div class="col-sm-10"> 
							<select	class="form-control" id="edit_stGrade"  name="st_Grade">
								<option value="">--请选择--</option>
								<c:forEach items="${GradeType}" var="item">
									<option value="${item.dict_id}"<c:if test="${item.dict_id == stGrade}"> selected</c:if>>${item.dict_item_name }</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="edit_stClass" style="float:left;padding:7px 15px 0 27px;">学生班级</label>
						<div class="col-sm-10">
							<select	class="form-control" id="edit_stClass" name="st_Class">
								<option value="">--请选择--</option>
								<c:forEach items="${ClassType}" var="item">
									<option value="${item.dict_id}"<c:if test="${item.dict_id == stClass}"> selected</c:if>>${item.dict_item_name }</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="edit_birthday" class="col-sm-2 control-label">出生日期</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="edit_birthday" placeholder="出生日期" name="st_birthday" />
						</div>
					</div>
					<div class="form-group">
						<label for="edit_mobile" class="col-sm-2 control-label">联系方式</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="edit_mobile" placeholder="家庭联系方式" name="st_mobile" />
						</div>
					</div>
					<div class="form-group">
						<label for="edit_address" class="col-sm-2 control-label">家庭住址</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="edit_address" placeholder="家庭联系地址" name="st_address" />
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary" onclick="updatestudent()">保存修改</button>
			</div>
		</div>
	</div>
</div>
<!-- 引入js文件 -->
<!-- jQuery -->
<script src="<%=basePath%>js/jquery-1.11.3.min.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="<%=basePath%>js/bootstrap.min.js"></script>
<!-- Metis Menu Plugin JavaScript -->
<script src="<%=basePath%>js/metisMenu.min.js"></script>
<!-- DataTables JavaScript -->
<script src="<%=basePath%>js/jquery.dataTables.min.js"></script>
<script src="<%=basePath%>js/dataTables.bootstrap.min.js"></script>
<!-- stom Theme JavaScript -->
<script src="<%=basePath%>js/sb-admin-2.js"></script>
<!-- 编写js代码 -->
<script type="text/javascript">
//清空新建学生窗口中的数据
	function clearstudent() {
	    $("#new_studentName").val("");
	    $("#new_studentSex").val("")
	    $("#new_stGrade").val("")
	    $("#new_stClass").val("")
	    $("#new_birthday").val("");
	    $("#new_mobile").val("");
	    $("#new_address").val("");
	}
	// 创建学生
	function createstudent() {
	$.post("<%=basePath%>student/create.action",
	$("#new_student_form").serialize(),function(data){
	        if(data =="OK"){
	            alert("学生创建成功！");
	            window.location.reload();
	        }else{
	            alert("学生创建失败！");
	            window.location.reload();
	        }
	    });
	}
	// 通过id获取修改的学生信息
	function editstudent(id) {
	    $.ajax({
	        type:"get",
	        url:"<%=basePath%>student/getstudentById.action",
	        data:{"id":id},
	        success:function(data) {
	            $("#edit_st_id").val(data.st_id);
	            $("#edit_studentName").val(data.st_name);
	            $("#edit_studentSex").val(data.st_Sex)
	            $("#edit_stGrade").val(data.st_Grade)
	            $("#edit_stClass").val(data.st_Class)
	            $("#edit_birthday").val(data.st_birthday);
	            $("#edit_mobile").val(data.st_mobile);
	            $("#edit_address").val(data.st_address);
	            
	        }
	    });
	}
    // 执行修改学生操作
	function updatestudent() {
		$.post("<%=basePath%>student/update.action",$("#edit_student_form").serialize(),function(data){
			if(data =="OK"){
				alert("学生信息更新成功！");
				window.location.reload();
			}else{
				alert("学生信息更新失败！");
				window.location.reload();
			}
		});
	}
	// 删除学生
	function deletestudent(id) {
	    if(confirm('确实要删除该学生吗?')) {
	$.post("<%=basePath%>student/delete.action",{"id":id},
	function(data){
	            if(data =="OK"){
	                alert("学生删除成功！");
	                window.location.reload();
	            }else{
	                alert("删除学生失败！");
	                window.location.reload();
	            }
	        });
	    }
	}
</script>
</body>
</html>