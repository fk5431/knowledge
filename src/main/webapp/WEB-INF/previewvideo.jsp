<%--
  Created by IntelliJ IDEA.
  User: FK
  Date: 2017/6/10
  Time: 23:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

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
               value="vcastr22.swf?vcastr_file=${url} }">
        <param name="quality" value="high">
        <param name="allowFullScreen" value="true" />
        <!-- src里就是播放器的路径以及需要显示的flv文件的路径，路径一定要正确！ -->
        <embed src="vcastr22.swf?vcastr_file=${url}"
               quality="high"
               pluginspage="http://www.macromedia.com/go/getflashplayer"
               type="application/x-shockwave-flash" width="1000" height="700">
        </embed>
    </object>
</div>
</body>
</html>

