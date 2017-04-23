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

<title>音乐播放器</title>
<link rel="stylesheet" href="css/style_music.css" media="screen" type="text/css" />
<script type="text/javascript">
window.onload=function(){

   var canvas=document.getElementById('canvas');
   if(canvas.getContext){
		var ctx=canvas.getContext("2d");
		ctx.beginPath();
		ctx.strokeStyle='darkgreen';
		ctx.lineCap='round';
		ctx.lineWidth=6;
		ctx.arc(160,160,150,0,Math.PI,false);
		ctx.stroke();
   }
					   
}
</script>
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
	<div id="container">
		<canvas id="canvas" width="320" height="320">对不起，你的浏览器不支持Canvas标签！</canvas>
		<canvas id="progress" width="320" height="320"></canvas>
		<!-- progress bar -->
		<div id="player">
			<audio id="audio" controls> <source src="${url_transforms }"
				type="audio/mpeg" codecs="mp3"></source> </audio>
			<div class="cover">
				<div class="controls">
					<div class="play_pause" id="play" title="Play"
						onClick="togglePlay()">
						<i>&#xe600;</i>
					</div>
					<div class="play_pause" id="replay" onclick="replayAudio()">
						<i>&#xe607;</i>
					</div>
					<div class="voice">
						<i>&#xe608;</i><input id="volume" name="volume" min="0" max="1"
							step="0.1" type="range" onChange="setVolume()" />
					</div>
					<div id="times">00:00/00:00</div>
				</div>
				<!-- #controls -->
			</div>
			<!-- #cover -->
		</div>
		<!-- #player -->

	</div>
	<!-- #container -->

	<script src="js/index.js"></script>
</body>
</html>
