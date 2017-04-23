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

								<th width="70">文件信息:</th>
								<td><input class="common-text" placeholder="关键词"
									name="username" value="" id="" type="text"></td>
								<td><input class="btn btn-primary btn2" 
									value="查询" type="submit"></td>
							</tr>
						</table>
					</form>
				</div>
			</div>
			<div class="result-wrap">
				<form name="myform" id="myform" method="post" action="${pageContext.request.contextPath }/deletemorefile">
					<div class="result-title">
						<div class="result-list">
							<a id="batchDel" href="javascript:void(0)"><i
								class="icon-font"></i>批量删除</a>
						</div>
					</div>
					<div class="result-content">
						<table class="result-tab" width="100%">
							<tr>
								<th class="tc" width="5%"><input class="allChoose" name=""
									type="checkbox"></th>
								<th>文件唯一标识</th>
								<th>标题</th>
								<th>分类</th>
								<th>类型</th>
								<th>发布人</th>
								<th>上传时间</th>
								<th>操作</th>
							</tr>
							<c:forEach var="file" items="${page.userfile }">
								<tr>
									 <td class="tc"><input name="fid" value="${file.fid }"
									type="checkbox"></td>
								<td>${file.fid }</td>

								<td title="${file.title }"><a target="_blank" href="showfile?id=${file.fid }" title="${file.title }">${file.title }</a></td>
								<td>${file.ktypeid }</td>
								<td>${file.ftypeid }</td>
								<td>${file.uname }</td>
								<td>${file.uploadtime }</td>

								<td>
								<a class="link-del" href="deletefile?fid=${file.fid }">删除</a></td>
								</tr>
							</c:forEach>
						</table>
						<div class="list-page">
							<ul>
								<li style="display:inline;"><b>共<i>${page.totalNum }条/第${page.pageNO }页</i></b></li>
								<li style="display:inline;"><a
									href="${pageContext.request.contextPath }/paging_file?n=1">&laquo;</a></li>
								<li style="display:inline;"><a
									href="${pageContext.request.contextPath }/paging_file?n=${page.pageNO-1 }">&lt;</a></li>
								<c:forEach var="t"  begin="${page.startPage }" end="${page.endPage }" step="1">
									<li style="display:inline;"><a
										href="${pageContext.request.contextPath }/paging_file?n=${t}">${t }</a></li>
								</c:forEach>
								<li style="display:inline;"><a
									href="${pageContext.request.contextPath }/paging_file?n=${page.pageNO+11 }">&gt;</a></li>
								<li style="display:inline;"><a
									href="${pageContext.request.contextPath }/paging_file?n=${page.totalPage }">&raquo;</a></li>
							</ul>
						</div>
					</div>
				</form>
			</div>
		</div>
</body>
</html>
