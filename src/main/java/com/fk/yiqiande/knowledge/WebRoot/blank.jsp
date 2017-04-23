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

<title>提示</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>

<body>
	<c:set var="n" value='${typeerror}' scope="page"></c:set>
	<%
		Object o = pageContext.getAttribute("n");
		if (o != null) {
			int s = (Integer) o;
			if (s == 10) {
	%>
	<script>
		alert("您上传文件的类型不符，请重新上传！");
	</script>
	<script language='javascript'>
		document.location = 'upload.html';
	</script>
	<%
		}
		}
	%>
	
	<%
		if (o != null) {
			int s = (Integer) o;
			if (s == 5) {
	%>
	<script>
		alert("您还没有选择文件，请重新上传！");
	</script>
	<script language='javascript'>
		document.location = 'upload.html';
	</script>
	<%
		}
		}
	%>
	
	<%
		if (o != null) {
			int s = (Integer) o;
			if (s == 20) {
	%>
	<script>
		alert("您的登录信息过期，请重新登录！");
	</script>
	<script language='javascript'>
		document.location = 'index.jsp';
	</script>
	<%
		}
		}
	%>
	<%
		if (o != null) {
			int s = (Integer) o;
			if (s == 30) {
	%>
	<script>
		alert("请您输入搜索条件！");
	</script>
	<script language='javascript'>
		document.location = 'center.jsp';
	</script>
	<%
		}
		}
	%>
	
	<%
		if (o != null) {
			int s = (Integer) o;
			if (s == 50) {
	%>
	<script>
		alert("该用户名已被注册，请重新注册！");
	</script>
	<script language='javascript'>
		document.location = 'index.jsp';
	</script>
	<%
		}
		}
	%>
	
	<%
		if (o != null) {
			int s = (Integer) o;
			if (s == 100) {
	%>
	<script>
		alert("发送成功！");
	</script>
	<script language='javascript'>
		history.go(-1);
	</script>
	<%
		}
		}
	%>
	
	<%
		if (o != null) {
			int s = (Integer) o;
			if (s == 200) {
	%>
	<script>
		alert("该文件不支持预览！");
	</script>
	<script language='javascript'>
		history.go(-1);
	</script>
	<%
		}
		}
	%>
</body>
</html>
