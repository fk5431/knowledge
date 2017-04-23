<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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

<title>视频播放</title>

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
	<div style="margin:0 auto;width:1000px;">
		<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
			codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0"
			height="120" width="190">
			<param name="movie"
				value="vcastr22.swf?vcastr_file=${url_transforms} }">
			<param name="quality" value="high">
			<param name="allowFullScreen" value="true" />
			<!-- src里就是播放器的路径以及需要显示的flv文件的路径，路径一定要正确！ -->
			<embed src="vcastr22.swf?vcastr_file=${url_transforms}"
				quality="high"
				pluginspage="http://www.macromedia.com/go/getflashplayer"
				type="application/x-shockwave-flash" width="1000" height="700">
			</embed>
		</object>
	</div>
</body>
</html>
