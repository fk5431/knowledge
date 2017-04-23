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
<meta charset="utf-8">
<title>个人中心</title>
<meta name="description" content="中国软件杯">
<meta name="author" content="fengkai">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<!-- CSS
  ================================================== -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="stylesheet" href="css1/kn_index.min.css">
<link href="css1/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="css1/zerogrid.css">


<link rel="stylesheet" href="css1/bootstrap.css">
<link rel="stylesheet" href="css1/common.css">
<link rel="stylesheet" href="css1/style.css">

<style type="text/css">
#div1 {
	position: relative;
	width: 350px;
	height: 350px;
	margin: 20px auto 0;
}

#div1 a {
	position: absolute;
	top: 0px;
	left: 0px;
	font-family: 黑体;
	color: #000;
	font-weight: bold;
	text-decoration: none;
	padding: 3px 6px;
}

#div1 a:hover {
	border: 1px solid #eee;
	background: #FFF;
}

#div1 .blue {
	color: blue;
}

#div1 .red {
	color: red;
}

#div1 .green {
	color: green;
}
</style>
<style type="text/css">
.menu_list {
	width: 190px;
}

.know li {
	list-style-type: none;
	float: left;
	font-weight: lighter;
	font-size: 14px;
	margin-left: 8px;
	color: #888;
	border-right: 1px solid #f0f0f0;
	padding-right: 8px;
	margin-top: 8px;
}

.kkk {
	width: 300px;
	float: left;
    margin-top: 12px;
    margin-left: 20px;
}

.know ul li a {
	color: #888;
}

.know ul li a:hover {
	color: #ba2636;
}

.menu_head {
	height: 47px;
	line-height: 47px;
	padding-left: 38px;
	font-size: 14px;
	color: #525252;
	cursor: pointer;
	border-left: 1px solid #e1e1e1;
	border-right: 1px solid #e1e1e1;
	border-bottom: 1px solid #e1e1e1;
	border-top: 1px solid #F1F1F1;
	position: relative;
	margin: 0px;
	font-weight: bold;
	background: #f1f1f1 url(images/pro_left.png) center right no-repeat;
}

.menu_list .current {
	background: #f1f1f1 url(images/pro_down.png) center right no-repeat;
}

.menu_body {
	line-height: 38px;
	border-left: 1px solid #e1e1e1;
	backguound: #fff;
	border-right: 1px solid #e1e1e1;
}

.menu_body a {
	display: block;
	height: 38px;
	line-height: 38px;
	padding-left: 38px;
	color: #777777;
	background: #fff;
	text-decoration: none;
	border-bottom: 1px solid #e1e1e1;
}

.menu_body a:hover {
	text-decoration: none;
}

body,div,dl,dt,dd,ul,ol,li,h1,h2,h3,h4,h5,h6,pre,code,form,fieldset,legend,input,button,textarea,p,blockquote,th,td
	{
	margin: 0;
	padding: 0
}

fieldset,img {
	border: 0;
}

:focus {
	outline: 0;
}

a {
	color: #333;
	text-decoration: none;
}

a:hover {
	color: #f60;
	text-decoration: underline;
}

a:hover em,a:hover i,a:hover span {
	cursor: pointer;
}

/*** guide ***/
.guide {
	width: 60px;
	margin-left: 600px;
	position: fixed;
	left: 50%;
	bottom: 40px;
	_position: absolute;
	_top: expression(documentElement.scrollTop + documentElement.clientHeight -  
		 this.clientHeight - 134 + 'px');
	display: block;
}

.guide a {
	display: block;
	width: 60px;
	height: 50px;
	background: url(images/sprite_v2.png) no-repeat;
	margin-top: 10px;
	text-decoration: none;
	font: 16px/50px "Microsoft YaHei";
	text-align: center;
	color: #fff;
	border-radius: 2px;
}

.guide a span {
	display: none;
	text-align: center;
}

.guide a:hover {
	text-decoration: none;
	background-color: #39F;
	color: #fff;
}

.guide a:hover span {
	display: block;
	width: 60px;
	background: #39F
}

.guide .find {
	background-position: -84px -236px;
}

.guide .report {
	background-position: -146px -236px;
}

.guide .edit {
	background-position: -83px -185px;
}

.guide .top {
	background-position: -145px -185px;
}
</style>
<style type="text/css">
.p_sty p {
	width: 600px;
	height: 57px;
	text-overflow: ellipsis;
	overflow: hidden;
	margin-top: 2px;
	margin-top: 5px;
}

.navfzq {
	padding-left: 0;
	margin-bottom: 0;
}

.fzq ul {
	height: 60px;
}

.navfzq>li {
	float: left;
}

.navfzq>a {
	border-radius: 4px;
}

.navfzq>li+li {
	margin-left: 2px;
}

.fzq ul li a:hover {
	background-color: rgb(246, 246, 246);
}
</style>
<style type="text/css">
.tab1 {
	width: 661px;
	border-top: #cccccc solid 1px;
	border-bottom: #cccccc solid 1px;
	margin: 50px auto 0 auto;
}

.menu {
	height: 28px;
	border-right: #cccccc solid 1px;
}

.menu li {
	float: left;
	width: 99px;
	text-align: center;
	line-height: 28px;
	height: 28px;
	cursor: pointer;
	border-left: #cccccc solid 1px;
	color: #666;
	font-size: 14px;
	overflow: hidden;
	background: #E0E2EB;
}

.off a:link {
	background-color: rgb(246, 246, 246);
}

.menudiv {
	height: 200px;
	border-left: #cccccc solid 1px;
	border-right: #cccccc solid 1px;
	border-top: 0;
	background: #fefefe
}

.menudiv div {
	padding: 15px;
	line-height: 28px;
}
</style>

<script type="text/javascript">
	function setTab(name, cursel) {
		cursel_0 = cursel;
		for (var i = 1; i <= links_len; i++) {
			var menu = document.getElementById(name + i);
			var menudiv = document.getElementById("con_" + name + "_" + i);
			if (i == cursel) {
				menu.className = "off";
				menudiv.style.display = "block";

			} else {
				menu.className = "";
				menudiv.style.display = "none";

			}
		}
	}

	var name_0 = 'one';
	var cursel_0 = 2;
	var links_len, iIntervalId;
	onload = function() {
		var links = document.getElementById("tab1").getElementsByTagName('li')
		links_len = links.length;
		for (var i = 0; i < links_len; i++) {
			links[i].onmouseover = function() {
				clearInterval(iIntervalId);
				this.onmouseout = function() {

				}
			}
		}
		document.getElementById("con_" + name_0 + "_" + links_len).parentNode.onmouseover = function() {
			clearInterval(iIntervalId);
			this.onmouseout = function() {

			}
		}
		setTab(name_0, 2);

	}
</script>

<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<!-- ?????做什么d -->
<script type="text/javascript" src="js/windstagball.js"></script>

<link rel="stylesheet" href="css/drop-down.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resource/searchActions.js"
	charset="utf-8"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resource/index.css"
	media="all" />
<script type="text/javascript" src="js/jquery-ui.min.js"></script>
<script type="text/javascript" src="js/select-widget-min.js"></script>
<script>
	$(document).ready(function() {
		$(".ui-select").selectWidget({
			change : function(changes) {
				return changes;
			},
			effect : "slide",
			keyControl : true,
			speed : 200,
			scrollHeight : 250
		});

	});
</script>
</head>

<body>

	<header style="background-color: #E2E2E2;">
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
				<div class="col-2-3" style="margin-top:3px;">
					<div class="wrap-col f-right">
						<div id="menu">
							<nav>
							<ul>
								<!-- 导航栏名称改-->
								<li><a href="main">首页</a></li>
								<li><a href="resources">资源中心</a></li>
								<li class="active"><a href="center">个人中心</a></li>
								<li><a href="index.jsp"><img src="img/default.jpg" style="width:35px;" title="注销"></a> </li>
							</ul>
							</nav>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div style="width: 1340px; margin-top:10px;margin:0 auto;">

		<tbody>
			<tr id="row_0" class="row">
				<td id="KB_search_top" colspan="1" rowspan="1" class="cell"
					align="center" valign="top">
					<div class="row-wrapper">
						<div id="KB_searchbar"
							style="width:1210px;height:90px;"
							class="wuid 9CCHnuD6 9CCHnuD6_0_search searchForm">
							<form class="selected" method="get" action="search_text_center">
								<table class="searchWidget" border="0" cellpadding="0"
									cellspacing="0">
									<tbody>
										<tr>
											<td>
												<div class="searchFormContent" style="display: table;">
													<div class="KB_searchInput_row" style="display: table-row;">
														<div style="display: table-cell;">
															<div class="KB_searchInput_wrapper" style="height:38px;">
																<input autocomplete="off" name="searchTextCenter"
																	placeholder="请输入关键词" value="" style="font-size:14px;"
																	class="searchInput" type="text" /> <span
																	style="display: none;" class="clearsearch"></span>
															</div>
														</div>
														<div style="display: table-cell;" class="searchButton">
															<input value="Search" type="submit" />
														</div>
													</div>
												</div>
											</td>
										</tr>
										<tr>
											<td style="padding:0px;">
												<div id="KB_toolbox">
													<div class="advancedsearch">
														<div>
															<a class="advancedSearchLink" style="width:150px;"><span style="font-size:20px;">高级搜索</span>
															</a>
														</div>
													</div>
												</div>
											</td>
										</tr>
									</tbody>
								</table>
							</form>
							<div class="advancedSearchFormContent"
								style="overflow-y:scroll; margin-top:-30px;width:1210px;"">
								<div style="margin-left:180px;">
									<iframe
										src="${pageContext.request.contextPath }/resource/index1.jsp"
										width="797" height="500" frameborder="0" scrolling="no">
									</iframe>
								</div>
							</div>
						</div>

					</div>
				</td>
			</tr>
		</tbody>
		<div class="kn_left w830px whitebk" id="tab1"
			style="margin: 10px 10px auto 65px; height: 900x;-moz-box-shadow: 0px 0px 10px #909090;
   -webkit-box-shadow: 0px 0px 10px #909090;
   box-shadow:0px 0px 10px #909090;">
			<div class="fzq">

				<ul class="navfzq tab_title">

					<li id="one1">
						<div class="tab_title">
							<a href="center" class="cur" style="line-height:3;">常用文档</a>
						</div>
					</li>
					<li id="one2">
						<div class="tab_title">
							<a href="center1" class="cur" style="line-height:3;">历史浏览</a>
						</div>
					</li>
					<li id="one3" class="off">
						<div class="tab_title">
							<a href="javascript:;" class="cur" style="line-height:3;">搜索结果</a>
						</div>
					</li>
					<li id="one4">
						<div class="tab_title">
							<a href="center3" class="cur" style="line-height:3;">我的上传</a>
						</div>
					</li>
				</ul>
			</div>

			<div id="con_one_3"  >
			<ul class="list02" id="feed_list">

			<c:forEach var="page" items="${page.userfile }">
					<li class="clearfix">
						<div class="ahover clearfix">
							<a href="search_ktypeid?ktypeid=${page.ktypeid }" class="firstdiv firstc13">
								<i class="fa fa-cubes"></i> <em>${page.ktypeid }</em>
							</a> <span class="twodiv"> <a contentId="9811" href="showfile?id=${page.fid }"
								class="title" target="_blank" title="LDAP的安装与redmine的融合">${page.title }
									<i class="iconfont icon-article" title="文章"></i>
							</a> <br />
								<div
									style="width:600px;height:64px;text-overflow:ellipsis;overflow: hidden;margin-top:2px;">
									<p>摘要：${page.abstracString}</p>
								</div> <span class="infors clearfix"> <span class="inforleft">标签：
										<em class="r"> ${page.tags}; </em>
								</span> <span class="inforright"> ${page.uploadtime}&nbsp;&nbsp; <em
										class="r">${page.uname }&nbsp;&nbsp;</em> <a>${page.ftypeid }</a>
								</span>
							</span>
							</span>
						</div>
					</li>
				</c:forEach>
				<div class="csdn-pagination hide-set page1">
					<span class="page-nav"> <b>共<i>${page.totalNum }条第${page.pageNO }页</i></b>
						<a href="${pageContext.request.contextPath }/paging_center2?n=1" data-page='1' class="btn btn-xs btn-default">首页</a>
						<a href="${pageContext.request.contextPath }/paging_center2?n=${page.pageNO-1 }" data-page='1' class="btn btn-xs btn-default">&lt</a>
					<c:forEach var="t" begin="${page.startPage }" end="${page.endPage }">	
						<c:if test="${t == page.pageNO }">
							<a href="${pageContext.request.contextPath }/paging_center2?n=${t}" data-page='1' class="btn btn-xs btn-default active cblue">${t }</a>
						</c:if>
						<c:if test="${t != page.pageNO }">
							<a href="${pageContext.request.contextPath }/paging_center2?n=${t}" data-page='1' class="btn btn-xs btn-default  cblue">${t }</a>
						</c:if>
					</c:forEach> 
						<a href="${pageContext.request.contextPath }/paging_center2?n=${page.pageNO+1 }" data-page='1' class="btn btn-xs btn-default">></a>
						<a href="${pageContext.request.contextPath }/paging_center2?n=${page.totalPage }" data-page="907" class="btn btn-xs btn-default">末页</a>
					</span>
				</div>

			</ul>
		</div>
		</div>

		<div style="float : right;width:300px;">
			<div
				style="height:300px;width: 350px; margin-right: 65px; float: right; margin-top: 15px;">
				<img
					style="-moz-box-shadow: 0px 0px 10px #909090;
   -webkit-box-shadow: 0px 0px 10px #909090;
   box-shadow:0px 0px 10px #909090;"
					alt="书本" src="images/center_p.jpg">
			</div>
			<div id="div1"
				style="height:350px;width: 350pxpx; margin-right: 65px; float: right;margin-top: -40px;margin-bottom: 10px;
		-moz-box-shadow: 0px 0px 10px #909090;
   -webkit-box-shadow: 0px 0px 10px #909090;
   box-shadow:0px 0px 10px #909090;
   padding-right:20px;
   padding-bottom:10px;
   background-color: white; ">
				<%
					int size = 40;
				%>
				<c:forEach var="t" items="${tag_list }">
					<a href="search_tag?tag=${t}" style="white-space:nowrap;"><div
							style="font-size: <%=size%>;">${t }</div></a>
					<%
						if (size > 20)
								if (size <= 24)
									size -= 6;
								else
									size = size - 8;
					%>
				</c:forEach>
			</div>
			<script type="text/javascript">
				$(document).ready(function() {
					$("#div1").windstagball({
						radius : 120,
						speed : 10
					});
				});
			</script>
			<div class="know"
				style="background-color: white; height:700px; width: 350px;float:right;margin-right: 63px;  
		margin-top:30px;
	-moz-box-shadow: 0px 0px 10px #909090;
   -webkit-box-shadow: 0px 0px 10px #909090;
   box-shadow:0px 0px 10px #909090;
   padding:5px 5px 5px 5px;">
				<h1 align="center">知识分类</h1>
				<div class="kkk">
					<h4>自然</h4>
					<ul>
						<li><a
							href="${pageContext.request.contextPath }/seacher_center?m=11">生物</a></li>
						<li><a
							href="${pageContext.request.contextPath }/seacher_center?m=12">资源</a></li>
						<li><a
							href="${pageContext.request.contextPath }/seacher_center?m=13">环境</a></li>
						<li><a
							href="${pageContext.request.contextPath }/seacher_center?m=14">现象</a></li>
						<li><a
							href="${pageContext.request.contextPath }/seacher_center?m=15">天文</a></li>
						<li><a
							href="${pageContext.request.contextPath }/seacher_center?m=16">地理</a></li>
					</ul>
				</div>
				<div class="kkk">
					<h4>人文</h4>
					<ul>

						<li><a
							href="${pageContext.request.contextPath }/seacher_center?m=21">语言</a></li>
						<li><a
							href="${pageContext.request.contextPath }/seacher_center?m=22">民族</a></li>
						<li><a
							href="${pageContext.request.contextPath }/seacher_center?m=23">宗教</a></li>
						<li><a
							href="${pageContext.request.contextPath }/seacher_center?m=24">国家历史</a></li>
						<li><a
							href="${pageContext.request.contextPath }/seacher_center?m=25">文学</a></li>
						<li><a
							href="${pageContext.request.contextPath }/seacher_center?m=26">哲学</a></li>

					</ul>
				</div>
				<div class="kkk">
					<h4>生活</h4>
					<ul>
						<li><a
							href="${pageContext.request.contextPath }/seacher_center?m=31">饮食</a></li>
						<li><a
							href="${pageContext.request.contextPath }/seacher_center?m=32">健康</a></li>
						<li><a
							href="${pageContext.request.contextPath }/seacher_center?m=33">情感</a></li>
						<li><a
							href="${pageContext.request.contextPath }/seacher_center?m=34">教育</a></li>
						<li><a
							href="${pageContext.request.contextPath }/seacher_center?m=35">就业</a></li>
						<li><a
							href="${pageContext.request.contextPath }/seacher_center?m=36">居家</a></li>

					</ul>
				</div>
				<div class="kkk">
					<h4>社会</h4>
					<ul>
						<li><a
							href="${pageContext.request.contextPath }/seacher_center?m=41">法律</a></li>
						<li><a
							href="${pageContext.request.contextPath }/seacher_center?m=42">公益</a></li>

					</ul>
				</div>
				<div class="kkk">
					<h4>科技</h4>
					<ul>
						<li><a
							href="${pageContext.request.contextPath }/seacher_center?m=51">心理学</a></li>
						<li><a
							href="${pageContext.request.contextPath }/seacher_center?m=52">数理科学和化学</a></li>
						<li><a
							href="${pageContext.request.contextPath }/seacher_center?m=53">天文学地球科学</a></li>
						<li><a
							href="${pageContext.request.contextPath }/seacher_center?m=54">农业</a></li>
						<li><a
							href="${pageContext.request.contextPath }/seacher_center?m=55">工业技术</a></li>
						<li><a
							href="${pageContext.request.contextPath }/seacher_center?m=56">医学</a></li>
						<li><a
							href="${pageContext.request.contextPath }/seacher_center?m=57">计算机</a></li>
						<li><a
							href="${pageContext.request.contextPath }/seacher_center?m=58">其他</a></li>
					</ul>
				</div>
				<div class="kkk">
					<h4>艺术</h4>
					<ul>
						<li><a
							href="${pageContext.request.contextPath }/seacher_center?m=61">绘画</a></li>
						<li><a
							href="${pageContext.request.contextPath }/seacher_center?m=62">书法</a></li>
						<li><a
							href="${pageContext.request.contextPath }/seacher_center?m=63">音乐</a></li>
						<li><a
							href="${pageContext.request.contextPath }/seacher_center?m=64">舞蹈</a></li>
						<li><a
							href="${pageContext.request.contextPath }/seacher_center?m=65">戏剧</a></li>
						<li><a
							href="${pageContext.request.contextPath }/seacher_center?m=66">建筑</a></li>
						<li><a
							href="${pageContext.request.contextPath }/seacher_center?m=67">影视</a></li>
					</ul>
				</div>
				<div class="kkk">
					<h4>体育</h4>
					<ul>
						<li><a
							href="${pageContext.request.contextPath }/seacher_center?m=71">田径</a></li>
						<li><a
							href="${pageContext.request.contextPath }/seacher_center?m=72">球类</a></li>
						<li><a
							href="${pageContext.request.contextPath }/seacher_center?m=73">体操</a></li>
						<li><a
							href="${pageContext.request.contextPath }/seacher_center?m=74">棋牌</a></li>
						<li><a
							href="${pageContext.request.contextPath }/seacher_center?m=75">武术</a></li>
						<li><a
							href="${pageContext.request.contextPath }/seacher_center?m=76">户外</a></li>
						<li><a
							href="${pageContext.request.contextPath }/seacher_center?m=77">电子竞技</a></li>
					</ul>
				</div>
				<div class="kkk">
					<h4>政治</h4>
					<ul>
						<li><a
							href="${pageContext.request.contextPath }/seacher_center?m=81">军事</a></li>
						<li><a
							href="${pageContext.request.contextPath }/seacher_center?m=82">外交</a></li>
					</ul>
				</div>
				<div class="kkk">
					<h4>财经</h4>
					<ul>
						<li><a
							href="${pageContext.request.contextPath }/seacher_center?m=91">金融</a></li>
						<li><a
							href="${pageContext.request.contextPath }/seacher_center?m=92">管理</a></li>
						<li><a
							href="${pageContext.request.contextPath }/seacher_center?m=93">投资</a></li>
						<li><a
							href="${pageContext.request.contextPath }/seacher_center?m=94">营销</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	</header>

	<div style="width: 1340px">
		<div class="guide">
			<div class="guide-wrap">
				<a href="upload.html" class="edit" title="普通上传" target="blank"> <span
					style="font-size:20.1px;width:60px;height:50px;">普通上传</span></a> <a href="uploadmore.html"
					class="find" title="批量上传" target="blank"><span
					style="font-size:20.1px;width:60px;height:50px;">批量上传</span></a> <a target="_self"
					href="tencent://message/?uin=3157624849&amp;Site=&amp;menu=yes"
					rel="external nofollow" class="report" title="反馈"> <span style="font-size:20.1px;width:60px;height:50px;">反馈</span>
				</a> <a href="javascript:window.scrollTo(0,0)" class="top" title="回顶部"><span style="font-size:20.1px;width:60px;height:50px;">回顶部</span></a>
			</div>
		</div>
		<script>
			$(document).ready(
					function() {
						$("#firstpane .menu_body:eq(0)").show();
						$("#firstpane h3.menu_head").click(
								function() {
									$(this).addClass("current").next(
											"div.menu_body").slideToggle(300)
											.siblings("div.menu_body").slideUp(
													"slow");
									$(this).siblings().removeClass("current");
								});
						$("#secondpane .menu_body:eq(0)").show();
						$("#secondpane h3.menu_head").mouseover(
								function() {
									$(this).addClass("current").next(
											"div.menu_body").slideDown(500)
											.siblings("div.menu_body").slideUp(
													"slow");
									$(this).siblings().removeClass("current");
								});
					});
		</script>
		<script type="text/javascript">
			/* <![CDATA[ */
			$(document)
					.ready(
							function() {
								var whatSection = [
										new AS.Item("Exact Wording",
												"eg: \"To be or not to be\"",
												"\"%@\"",
												"Enter your wording here", ""),
										new AS.Item("Excluded Words",
												"eg: New -york", "-%@",
												"Enter your word here", ""),
										new AS.Item("Optional Words",
												"eg: exalead OPT cloudview",
												"OPT (%@)",
												"Enter your word here", ""),
										new AS.Item("Proximity Search",
												"eg: (financial NEAR market)",
												"NEAR %@",
												"Enter your word here", ""),
										new AS.Item(
												"Logical Expression",
												"eg: ((fast OR quick) AND NOT lightning)",
												"(%@)", "Enter your word here",
												"") ];
								var approxSection = [
										new AS.Item("Words starting with",
												"eg: messag*", "%@*",
												"Enter your word here", ""),
										new AS.Item(
												"Approximate spelling Search",
												"eg: spellslike:exlaead",
												"spellslike:%@",
												"Enter your word here", "") ];
								var whereSection = [
										new AS.Item("Title Search",
												"eg: title:exalead",
												"title:(%@)",
												"Enter your word here", ""),
										new AS.Item(
												"Document Search",
												"eg: text:\"To be or not to be\"",
												"text:(%@)",
												"Enter your word here", "") ];

								context = new AS.Context("", [ whatSection,
										approxSection, whereSection ]);
								AS
										.initSingle(
												$('#KB_searchbar div.advancedSearchFormContent'),
												context);
								$(function() {
									KB_facetlist_collapse();
								});
								$('#KB_brand_facet h3').bind(
										'click',
										function() {
											//$(this).find('.collapsable').toggleClass('collapsed');
											//$('#KB_brand_facet_content').toggle();
											$(this).closest('.KB_facetlist')
													.toggleClass('collapsed');
										});
								var nbRefinements = $('#KB_brand_facet').find(
										'.refined,.excluded').length;
								if (nbRefinements > 0) {
									var infobox = $('#KB_brand_facet h3 > .infos');
									if (nbRefinements == 1) {
										infobox.text(nbRefinements
												+ ' refinement');
									} else {
										infobox.text(nbRefinements
												+ ' refinements');
									}
								}

							});
			/* ]]> */
		</script>
		<!-- 代码部分end -->
	</div>
</body>
</html>
	