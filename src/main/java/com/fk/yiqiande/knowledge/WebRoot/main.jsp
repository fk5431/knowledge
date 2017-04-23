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
<meta charset="utf-8">
<title>知识库管理系统</title>
<meta name="description" content="中国软件杯">
<meta name="author" content="fengkai">

<!-- Mobile Specific Metas
  ================================================== -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">

<!-- CSS
  ================================================== -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link href="css/web.css" rel="stylesheet">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="css/zerogrid.css">
<link rel="stylesheet" href="css/style.css">
<style type="text/css">
/* search */
.search {
	border: 2px solid #f58400;
	height: 38px;
	margin: 40px auto 0 auto;
	width: 529px;
	background: rgba(0, 0, 0, 0.5);
}

.search select {
	display: none;
}

.search .select_box {
	font-size: 12px;
	color: #999999;
	width: 90px;
	line-height: 35px;
	float: left;
	position: relative;
}

.search .select_showbox {
	height: 35px;
	background: url(images/search_ico.png) no-repeat 80px center;
	text-indent: 1.5em;
	padding-right: 12px;
	margin-top: -25px;
}

.search .select_showbox.active {
	background: url(images/search_ico_hover.png) no-repeat 80px center;
}

.search .select_option {
	border: 2px solid #f58400;
	border-top: none;
	display: none;
	width: 94px;
	left: -2px;
	top: 35px;
	position: absolute;
	z-index: 99;
	background: none;
	margin-top: -25px;
}

.search .select_option li {
	text-indent: 1.5em;
	width: 90px;
	cursor: pointer;
	display: block;
	padding-right: 15px;
	background: rgba(255, 255, 255, 0.5);
}

.search .select_option li.hover {
	color: #fff;
}

.search input.inp_srh,.search input.btn_srh {
	border: none;
	background: none;
	height: 35px;
	line-height: 35px;
	float: left;
	margin-top: -25px;
}

.search input.inp_srh {
	margin-left: 10px;
	font-size: 12px;
	color: #FFF;
	outline: none;
	width: 365px;
}

.search input.btn_srh {
	background: #f58400;
	color: #FFF;
	font-family: "微软雅黑";
	font-size: 15px;
	width: 60px;
}
 
 
#searchForm{
	/* The search form. */
 

	-moz-border-radius:16px;
	-webkit-border-radius:16px;
	border-radius:16px;
}

fieldset{
	border:none;
}

 

#s{
	/* The search text box. */
	
	border:none;
	color:#888888;
	background:url("img/searchBox.png")  ;
	float:left;
	font-family:Arial,Helvetica,sans-serif;
	font-size:15px;
	height:36px;
	line-height:36px;
	outline:medium none;
	padding:0 0 0 35px;
	text-shadow:1px 1px 0 white;
	width:385px;
}

/* The UL that contains the search type icons */
 
 

/* The submit button */


#submitButton{
	background:url('img/buttons.png') no-repeat;
	width:83px;
	height:36px;
	text-indent:-9999px;
	overflow:hidden;
	text-transform:uppercase;
	border:none;
	cursor:pointer;
}

#submitButton:hover{
	background-position:left bottom;
}


/* The Search tutorialzine.com / Search the Web radio buttons */


#searchInContainer{
	float:left;
	margin-top:12px;
	width:330px;
}

label{
	color:#DDDDDD;
	cursor:pointer;
	font-size:11px;
	position:relative;
	right:-2px;
	top:-2px;
	margin-right:10px;
	white-space:nowrap;
	/*float:left;*/
}

input[type=radio]{
	cursor:pointer;
	/*float:left;*/
}

 
</style>
</head>

<body>
	<div class="wrap-body">

		<!--////////////////////////////////////Header-->
		<header>
		<div class="nav-bar">
			<div class="wrap-nav zerogrid">
				<div class="row">
					<div class="col-1-3">
						<div class="wrap-col">
							<div class="logo">
								<a href="main.jsp"><img src="images/logo.png" /></a>
							</div>
						</div>
					</div>
					<div class="col-2-3">
						<div class="wrap-col f-right">
							<div id="menu" style="margin-left:2px;margin-top:1px;">
								<nav>
								<ul>
									<!-- 导航栏名称改-->
									<li class="active"><a href="main">首页</a></li>
									<li><a href="resources">资源中心</a></li>
									<li><a href="center">个人中心</a></li>
									<li><a href="index.jsp"><img src="img/default.jpg"
											style="width:35px;margin-top:2px;" title="注销"></a></li>
								</ul>
								</nav>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="wrap-header" style="margin-top: 70px;">
			<h1></h1>
			<div style="margin:0 auto;">
				<div style="margin:0 auto;padding:0;">
					<form id="searchForm" method="post" action="search_text" style="width:468px;margin:0 auto;">
						<input id="s" type="text" name="searchText"/> <input type="submit" value="Submit"
							id="submitButton" />
					</form>
					<!-- <form method="post" action="search_text">
						<input class="inp_srh" name="searchText" placeholder="请输入您要搜索的作品" />
						<input class="btn_srh" type="submit" name="submit" value="搜索" />
					</form> -->
				</div>
			</div>
			<br>
			<div id="top-destination" style="margin-top: -20px;">
				<!--组合查询动态产生-->
				<nav>
				<ul>
					<li class="first"><p>Top Destination :</p></li>
					<li><a href="#">太极拳</a></li>
					<li><a href="#">运动</a></li>
					<li><a href="#">《神偷奶爸》</a></li>
					<li><a href="#">小黄人</a></li>
					<li><a href="#">手机铃声</a></li>
				</ul>
				</nav>
			</div>
		</div>
		</header>

		<!--////////////////////////////////////Container-->
		<section id="container">
		<div class="wrap-container">
			<!-----------------导航栏第一行-------------------->
			<section class="content-box boxstyle-1 box-1">
			<div class="zerogrid">
				<div class="row wrap-box">
					<!--Start Box-->
		<c:forEach var="page" items="${userfile }" begin="0" end="2">
					<div class="col-1-3" style="float:left;">
						<div class="wrap-col">
							<div class="post">
								<img src="images/${page.ktypeid }.jpg">
								<h3>
									<a href="showfile?id=${page.fid }" target="_blank"><span style="color:#000000;line-height: 150%;">${page.title}</a></span>
								</h3>
								<div class="upload">
									<p>${page.uploadtime}</p>
									<p>
										${page.tags}<a href="search_ktypeid?ktypeid=${page.ktypeid }"> ${page.ktypeid }</a>
									</p>
								</div>
							</div>
						</div>
					</div>
		</c:forEach>
				</div>
			</div>
			</section>
			<!-- 第二行 -->
			<section class="content-box boxstyle-1 box-1">
			<div class="zerogrid">
				<div class="row wrap-box">
					<!--Start Box-->
		<c:forEach var="page" items="${userfile }" begin="3" end="5">
					<div class="col-1-3" style="float:left;">
						<div class="wrap-col">
							<div class="post">
								<img src="images/${page.ktypeid }.jpg">
								<h3>
									<a href="showfile?id=${page.fid }" target="_blank"><span style="color:#000000;line-height: 150%;">${page.title}</a></span>
								</h3>
								<div class="upload">
									<p>${page.uploadtime}</p>
									<p>
										${page.tags}<a href="search_ktypeid?ktypeid=${page.ktypeid }"> ${page.ktypeid }</a>
									</p>
								</div>
							</div>
						</div>
					</div>
		</c:forEach>
				</div>
			</div>
			</section>
		</div>
		</section>
		<div class="containerbox">
			<div class="container">

				<div class="row">
					<div class="col-sm-9">
						<div class="widget-box shadow-box">
							<div class="title">
								<h3>
									<i class="glyphicon glyphicon-tree-conifer"></i> 知识分类
								</h3>
							</div>
							<div class="stream-list p-stream">
								<div class="col-sm-3 docTypeBox">
									<h1>
										<a> 自然 <span style="color: #D9534F; font-weight: bold;"></span>
										</a>
									</h1>
									<ul>
										<li><a href="search_resources?m=11">生物</a></li>
										<li><a href="search_resources?m=12">资源</a></li>
										<li><a href="search_resources?m=13">环境</a></li>
										<li><a href="search_resources?m=14">现象</a></li>
										<li><a href="search_resources?m=15">天文</a></li>
										<li><a href="search_resources?m=16">地理</a></li>
									</ul>
								</div>
								<div class="col-sm-3 docTypeBox">
									<h1>
										<a>人文 <span style="color: #D9534F; font-weight: bold;"></span>

										</a>
									</h1>
									<ul>

										<li><a href="search_resources?m=21">语言</a></li>
										<li><a href="search_resources?m=22">民族</a></li>
										<li><a href="search_resources?m=23">宗教</a></li>
										<li><a href="search_resources?m=24">国家历史</a></li>
										<li><a href="search_resources?m=25">文学</a></li>
										<li><a href="search_resources?m=26">哲学</a></li>

									</ul>
								</div>
								<div class="col-sm-3 docTypeBox">
									<h1>
										<a> 生活 <span style="color: #D9534F; font-weight: bold;"></span>
										</a>
									</h1>
									<ul>
										<li><a href="search_resources?m=31">饮食</a></li>
										<li><a href="search_resources?m=32">健康</a></li>
										<li><a href="search_resources?m=33">情感</a></li>
										<li><a href="search_resources?m=34">教育</a></li>
										<li><a href="search_resources?m=35">就业</a></li>
										<li><a href="search_resources?m=36">居家</a></li>

									</ul>
								</div>
								<div class="col-sm-3 docTypeBox">
									<h1>
										<a> 社会 <span style="color: #D9534F; font-weight: bold;"></span>
										</a>
									</h1>
									<ul>
										<li><a href="search_resources?m=41">法律</a></li>
										<li><a href="search_resources?m=42">公益</a></li>

									</ul>
								</div>
								<div class="col-sm-3 docTypeBox">
									<h1>
										<a> 科技 <span style="color: #D9534F; font-weight: bold;"></span>
										</a>
									</h1>
									<ul>
										<li><a href="search_resources?m=51">心理学</a></li>
										<li><a href="search_resources?m=52">数理科学和化学</a></li>
										<li><a href="search_resources?m=53">天文学地球科学</a></li>
										<li><a href="search_resources?m=54">农业</a></li>
										<li><a href="search_resources?m=55">工业技术</a></li>
										<li><a href="search_resources?m=56">医学</a></li>
										<li><a href="search_resources?m=57">计算机</a></li>
										<li><a href="search_resources?m=58">其他</a></li>
									</ul>
								</div>
								<div class="col-sm-3 docTypeBox">
									<h1>
										<a> 艺术 <span style="color: #D9534F; font-weight: bold;"></span>
										</a>
									</h1>
									<ul>
										<li><a href="search_resources?m=61">绘画</a></li>
										<li><a href="search_resources?m=62">书法</a></li>
										<li><a href="search_resources?m=63">音乐</a></li>
										<li><a href="search_resources?m=64">舞蹈</a></li>
										<li><a href="search_resources?m=65">戏剧</a></li>
										<li><a href="search_resources?m=66">建筑</a></li>
										<li><a href="search_resources?m=67">影视</a></li>
									</ul>
								</div>
								<div class="col-sm-3 docTypeBox">
									<h1>
										<a> 体育 <span style="color: #D9534F; font-weight: bold;"></span>
										</a>
									</h1>
									<ul>
										<li><a href="search_resources?m=71">田径</a></li>
										<li><a href="search_resources?m=72">球类</a></li>
										<li><a href="search_resources?m=73">体操</a></li>
										<li><a href="search_resources?m=74">棋牌</a></li>
										<li><a href="search_resources?m=75">武术</a></li>
										<li><a href="search_resources?m=76">户外</a></li>
										<li><a href="search_resources?m=77">电子竞技</a></li>
									</ul>
								</div>
								<div class="col-sm-3 docTypeBox">
									<h1>
										<a> 政治 <span style="color: #D9534F; font-weight: bold;"></span>
										</a>
									</h1>
									<ul>
										<li><a href="search_resources?m=81">军事</a></li>
										<li><a href="search_resources?m=82">外交</a></li>
									</ul>
								</div>
								<div class="col-sm-3 docTypeBox">
									<h1>
										<a> 财经 <span style="color: #D9534F; font-weight: bold;"></span>
										</a>
									</h1>
									<ul>
										<li><a href="search_resources?m=91">金融</a></li>
										<li><a href="search_resources?m=92">管理</a></li>
										<li><a href="search_resources?m=93">投资</a></li>
										<li><a href="search_resources?m=94">营销</a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xs-12 col-md-3 side-right hidden-xs hidden-sm">



						<div class="widget-box">
							<div class="title">
								<h3>
									<i class="glyphicon glyphicon-fire"></i> 常用目录
								</h3>
							</div>
							<ul class="box-list" id="hots">
								<c:forEach var="f" items="${directory }">
									<li>
										<div class="li-out">
											<span class="last"> </span><span class="name"> <i
												class="glyphicon glyphicon-file"></i> <a
												href="showfile?id=${f.fid }" target="_blank">${ f.fname}</a></span>
										</div>
									</li>
								</c:forEach>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
</body>
</html>
