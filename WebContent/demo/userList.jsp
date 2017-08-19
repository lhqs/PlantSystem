<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="cn.lhqs.serviceImpl.UserListServiceImpl"%>

<%
	UserListServiceImpl userlist = new UserListServiceImpl();
	pageContext.setAttribute("userList", userlist.getUserTable());
	pageContext.setAttribute("con", request.getContextPath());
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>动态数据展示区</title>
</head>
<body>
	<!-- 时间允许，后续完成界面交互响应 -->
	<%@include file="/demo/header.jsp"%>
	<div class="jumbotron">
		<div class="container">
			<h1>管理员列表管理：</h1>
			<div></div>
			<hr>
			<c:choose>
				<c:when test="${empty sessionScope.username}">
					<script type="text/javascript">
						alert("提示：此页面需有管理员权限方可查看！")
					</script>
				</c:when>
				<c:otherwise>
					<table class="table">
						<thead class="thead-inverse">
							<tr>
								<th>序号</th>
								<th>用户名</th>
								<th>添加时间</th>
								<th>编辑</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${userList}" var="item">
								<tr>
									<th scope="row">${item.uid}</th>
									<td id="username1">${item.username}</td>
									<td>${item.loginTime}</td>
									<td><button id="delete">
											<a href="<c:url value='/UserServlet?method=delete&username=${item.username }'/>">删除</a>
										</button>&nbsp;&nbsp;&nbsp;&nbsp;
										<%-- <button id="update">
											<a href="<c:url value='/UserServlet?method=update&username=${item.username }'/>">修改</a>
										</button> --%>
										<%-- <button onclick="update_info(${item.username })"
											data-toggle="modal" data-target="#myModal"><a>编辑</a></button>&nbsp;&nbsp;&nbsp;&nbsp; --%>
										<button data-toggle="modal" data-target="#myModal">
											<a>添加</a>
										</button></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</c:otherwise>
			</c:choose>
		</div>
	</div>

	

	<script>
		// update表单
		function update_info(name) {
			var name = name;
			// $('input[name=username]').removeAttr("readonly");//去除input元素的readonly属性
			//var obj2 = eval(value2);
			// alert(obj2);
			// 赋值
			$("#username").val(name);
			$("#password").val(name);
			//$("#act").val("edit");
			// 将input元素设置为readonly
			//$('#user_id').attr("readonly", "readonly")
		}

		// 添加入库操作
		function add_info() {
			var form_data = $("#form_data").serialize();
			//alert(form_data);
			$("#form_data").submit();

		}
	</script>
	<!-- （Modal）当前界面弹出界面  -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
			    <div class="modal-dialog">
			        <div class="modal-content">
			            <div class="modal-header">
			                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
			                    &times;
			                </button>
			                <h4 class="modal-title" id="myModalLabel">用户管理</h4>
			            </div>
			            <form id="form_data" action="${con }/UserServlet?method=add" method="post">
			            <div class="modal-body">
			          		      登录用户: <input type="text" id="username" name="username" />
			          		      登录密码: <input type="text" id="password" name="password" />
			            </div>
			            <div class="modal-footer">
			                <button type="button" class="btn btn-default" data-dismiss="modal">关闭 </button>
			                <button type="button" onclick="add_info()" class="btn btn-primary">提交更改</button>
			            </div>
			            </form>
			        </div>
			    </div>
			</div>
		
	
	<script type="text/javascript">

		/* $(document).ready(function(){ */
		/* 	  $("#delete").click(function(){
		 //var username = $("#username1").text();
		 var username = "1234"; */
		/* $.ajax({
			type:"post",
			url :"<c:url value='/UserServlet?method=delete'/>",
			data : username,
			success: function(msg) {
				if(msg){
					alert("删除成功");
				}
			},
			error : function(msg) {
				alert("删除失败");
			}
		}); */
		/* 	  $.ajax({
		 type: "POST",
		 url: "<c:url value='/UserServlet?method=delete'/>",
		 data: {"username":username},
		 success: function(msg){
		 alert( "Data Saved: " + msg );
		 }
		 });
		 });
		 }); */

		//};
	</script>
</body>
</html>