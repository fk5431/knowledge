<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>管理中心</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<title>后台管理</title>
<link rel="stylesheet" type="text/css" href="css/common.css" />
<link rel="stylesheet" type="text/css" href="css/main.css" />
<script type="text/javascript" src="js/libs/modernizr.min.js"></script>
</head>

<body class=" theme-blue">

	<div class="topbar-wrap white">
		<div class="topbar-inner clearfix">
			<div class="topbar-logo-wrap clearfix">
				<h1 class="topbar-logo none">
					<a href="index.jsp" class="navbar-brand">后台管理</a>
				</h1>
				<ul class="navbar-list clearfix">
					<li><a class="on" href="index.jsp">首页</a></li>
					<li><a href="index.jsp" target="_blank">网站首页</a></li>
				</ul>
			</div>
			<div class="top-info-wrap">
				<ul class="top-info-list clearfix">
					<li><a>管理员</a></li>
					<li><a href="${pageContext.request.contextPath }/index.jsp">退出</a></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="container clearfix">
		<div class="sidebar-wrap">
			<div class="sidebar-title">
				<h1>菜单</h1>
			</div>
			<div class="sidebar-content">
				<ul class="sidebar-list">
					<li><a href="#"><i class="icon-font">&#xe018;</i>常用操作</a>
						<ul class="sub-menu">
							<li><a href="${pageContext.request.contextPath }/manageuser"><i class="icon-font">&#xe003;</i>用户管理</a></li>
							<li style="background-color:#f1f1f1;"><a href="${pageContext.request.contextPath }/managefile"><i
									class="icon-font">&#xe008;</i>知识管理</a></li>

						</ul></li>

				</ul>
			</div>
		</div>
		<!--/sidebar-->
		<div class="main-wrap">

			<div class="crumb-wrap">
				<div class="crumb-list">
					<i class="icon-font"></i><a href="${pageContext.request.contextPath }/manageuser">首页</a><span
						class="crumb-step">&gt;</span><span class="crumb-name">用户管理</span>
				</div>
			</div>
			<div class="search-wrap">
				<div class="search-content">
					<form action="search_user" method="get">
						<table class="search-tab">
							<tr>

								<th width="70">用户名:</th>
								<td><input class="common-text" placeholder="用户名"
									name="username" value="" id="" type="text"></td>
								<td><input class="btn btn-primary btn2" 
									value="查询" type="submit"></td>
							</tr>
						</table>
					</form>
				</div>
			</div>
			<div class="result-wrap">
				<form name="myform" id="myform" method="get" action="deletemoreuser">
					<div class="result-title">
						<div class="result-list">
						  <input class="btn btn-primary btn2" 
									value="批量删除" type="submit">  
						</div>
					</div>
					<div class="result-content">
						<table class="result-tab" width="100%">
							<tr>
								<th class="tc" width="5%"> </th>
								<th>用户唯一标识</th>
								<th>用户名称</th>
								<th>用户密码</th>
								<th>修改密码</th>
								<th>操作</th>
							</tr>
							<c:forEach var="user" items="${page.userlist }">
								<tr>
									<td class="tc"><input type="checkbox" name="uid" value="${user.uid}"></td>
									<td>${user.uid }</td>
									<td title="${user.uname }">${user.uname }</td>
									<td>${user.pwd }</td>
									 <td><input type="text" id="${user.uid }" name="${user.uid }"/></td>
									<td><a class="link-update" href="javascript:a(${user.uid})">修改</a> <a
										class="link-del"
										href="${pageContext.request.contextPath }/deleteuser?uid=${user.uid}">删除</a></td>
								</tr>
							</c:forEach>
						</table>
						<script>
						 function a(id){
							 var pw = document.getElementById(id).value;
							 location.href = "${pageContext.request.contextPath }/updateuser?uid="+id+"&newpassword="+pw;
						 }
						</script>
						<div class="list-page">
							<ul>
								<li style="display:inline;"><a
									href="${pageContext.request.contextPath }/paging?n=1">&laquo;</a></li>
								<c:forEach var="t" begin="1" end="${page.totalPage }" step="1">
									<li style="display:inline;"><a
										href="${pageContext.request.contextPath }/paging?n=${t}">${t }</a></li>
								</c:forEach>
								<li style="display:inline;"><a
									href="${pageContext.request.contextPath }/paging?n=${page.totalPage }">&raquo;</a></li>
							</ul>
						</div>
					</div>
				</form>
			</div>
		</div>
</body>
</html>
