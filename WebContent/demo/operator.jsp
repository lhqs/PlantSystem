<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="cn.lhqs.serviceImpl.OperatorLogService"%>
<%-- <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> --%>
<%
	OperatorLogService opeatorLog = new OperatorLogService();
	pageContext.setAttribute("opeatorLog", opeatorLog.getLogger());
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理员操作记录</title>
</head>
<body>
	<%@include file="/demo/header.jsp"%>
	<div class="jumbotron">
		<div class="container">
			<h1>管理员操作记录：</h1>
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
								<th>操作人</th>
								<th>操作内容</th>
								<th>操作时间</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${opeatorLog}" var="item">
								<tr>
									<th scope="row">${item.uid}</th>
									<td id="username">${item.operatorUser}</td>
									<td>${item.content}</td>
									<td>${item.operatorTime}</td>
<%-- 									<td><fmt:formatDate pattern="yyyy年MM月dd天 HH:mm:ss" value="${item.operatorTime}"/></td> --%>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</body>
</html>