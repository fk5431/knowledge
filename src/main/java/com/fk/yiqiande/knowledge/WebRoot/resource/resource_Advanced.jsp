<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<title>资源中心</title>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resource/jquery-1.7.2.min.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resource/buildUrl.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resource/oop.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resource/KB_overlay.js"
	charset="utf-8"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resource/index.css"
	media="all" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resource/page.css"
	media="all" />
</head>

<body id="body"
	class="mashup mashup-style web modern gecko firefox theme_enterprise">
	<script>
		function copyText1() {
			//$(this).find('.collapsable').toggleClass('collapsed');
			//$('#w1airkp8ac_content').toggle();
			$('.popping1').closest('.KB_facetlist')
					.toggleClass('collapsed');
		}
		function copyText2() {
			//$(this).find('.collapsable').toggleClass('collapsed');
			//$('#w1airkp8ac_content').toggle();
			$('.popping2').closest('.KB_facetlist')
					.toggleClass('collapsed');
		}
		function copyText3() {
			//$(this).find('.collapsable').toggleClass('collapsed');
			//$('#w1airkp8ac_content').toggle();
			$('.popping3').closest('.KB_facetlist')
					.toggleClass('collapsed');
		}
		function copyText4() {
			//$(this).find('.collapsable').toggleClass('collapsed');
			//$('#w1airkp8ac_content').toggle();
			$('.popping4').closest('.KB_facetlist')
					.toggleClass('collapsed');
		}
		function copyText5() {
			//$(this).find('.collapsable').toggleClass('collapsed');
			//$('#w1airkp8ac_content').toggle();
			$('.popping5').closest('.KB_facetlist')
					.toggleClass('collapsed');
		}
		function copyText6() {
			//$(this).find('.collapsable').toggleClass('collapsed');
			//$('#w1airkp8ac_content').toggle();
			$('.popping6').closest('.KB_facetlist')
					.toggleClass('collapsed');
		}
		function copyText7() {
			//$(this).find('.collapsable').toggleClass('collapsed');
			//$('#w1airkp8ac_content').toggle();
			$('.popping7').closest('.KB_facetlist')
					.toggleClass('collapsed');
		}
		function copyText8() {
			//$(this).find('.collapsable').toggleClass('collapsed');
			//$('#w1airkp8ac_content').toggle();
			$('.popping8').closest('.KB_facetlist')
					.toggleClass('collapsed');
		}
		function copyText9() {
			//$(this).find('.collapsable').toggleClass('collapsed');
			//$('#w1airkp8ac_content').toggle();
			$('.popping9').closest('.KB_facetlist')
					.toggleClass('collapsed');
		}
	</script>
	<header>
	<div class="nav-bar">
		<div class="wrap-nav zerogrid">
			<div class="row">
				<div class="col-1-3">
					<div class="wrap-col">
						<div class="logo">
							<a href="main.jsp">
							<img src="${pageContext.request.contextPath }/resource/logo.png"></a>
						</div>
					</div>
				</div>
				<div class="col-2-3" style="margin-top:20px;">
					<div class="wrap-col f-right">
						<div id="menu">
							<nav>
							<ul>
								<!-- 导航栏名称改-->
								<li><a href="main">首页</a></li>
								<li class="active"><a href="resources" style="color:#FE9B13;">资源中心</a></li>
								<li><a href="center">个人中心</a></li>
								<li><a href="index.jsp"><img src="img/default.jpg" style="width:35px;" title="注销"></a> </li>
							</ul>
							</nav>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</header>
	<div id="mainWrapper" style="width: 100%;">
		<div class="table-layout-wrapper pageLayout">
			<table class="table-layout" style="width: 100%;">
				<colgroup>
					<col width="100%" />
				</colgroup>
				<tbody>
					<tr id="row_0" class="row">
						<td id="KB_search_top" colspan="1" rowspan="1" class="cell"
							align="center" valign="top">
							<div class="row-wrapper">
								<div id="KB_header" class="wuid WTCjTYJa WTCjTYJa_0_search">
									<h1>资源中心 resource center</h1>
								</div>
								<div id="KB_searchbar"
									class="wuid 9CCHnuD6 9CCHnuD6_0_search searchForm">
									<form class="selected" method="get"
										action="search_text">
										<table class="searchWidget" border="0" cellpadding="0"
											cellspacing="0">
											<tbody>
												<tr>
													<td>
														<div id="KB_pleaselogin">
															<span style="font-family: 楷体;">搜索关键字</span> <br />
															search with keyword
														</div>
														<div class="searchFormContent" style="display: table;">
															<div class="KB_searchInput_row"
																style="display: table-row;">
																<div style="display: table-cell; vertical-align: top;">
																	<div class="KB_searchInput_wrapper">
																		<input autocomplete="off" name="searchText" value=""
																			class="searchInput" placeholder="请输入查询内容" type="text" />
																		<span style="display: none;" class="clearsearch"></span>
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
													<td>
														<div id="KB_toolbox">
															<div class="advancedsearch">
																<div  style="margin-top:8px;"><a class="advancedSearchLink">高级搜索 </a></div>
															</div>
														</div>
													</td>
												</tr>
											</tbody>
										</table>
									</form>
									<div class="advancedSearchFormContent">
										<div style="margin-left:180px;">
											<iframe src="${pageContext.request.contextPath }/resource/index.html" width="797" height="500"
												frameborder="0" scrolling="no"> </iframe>
										</div>
										<div>
											<c:forEach items="${sql }" var="s" >
												<p><a href="${pageContext.request.contextPath }/search_save?search=${s.id}">${s.sql }</a><p>
											</c:forEach>
										</div>
									</div>
								</div>
								<script type="text/javascript">
									/* 阴影 */
									$('.searchInput')
											.focus(
													function() {
														$(this)
																.parent(
																		'.KB_searchInput_wrapper')
																.addClass(
																		'focused');
													});
									$('.searchInput')
											.blur(
													function() {
														$(this)
																.parent(
																		'.KB_searchInput_wrapper')
																.removeClass(
																		'focused');
													});
									/* CAP 80 clear search */
									// Initial load
									$('.KB_searchInput_wrapper').ready(
											function() {
												$('.searchInput').trigger(
														'keyup');
											});
									var toggleClearSearchTimeout; // timeout for paste (cannot get content length)
									$('.searchInput')
											.on(
													'keyup paste',
													function() {
														if (toggleClearSearchTimeout)
															clearTimeout(toggleClearSearchTimeout);
														toggleClearSearchTimeout = setTimeout(
																function() {
																	if ($(
																			'.searchInput')
																			.val().length > 0) {
																		$(
																				'.clearsearch')
																				.show();
																	} else {
																		$(
																				'.clearsearch')
																				.hide();
																	}
																}, 50);
													});
									$('.clearsearch').click(function() {
										$('.searchInput').val('').focus();
										$(this).hide();
									});
									/* CAP 80 Keep refinement by default*/
									/*$(document).ready(function() {
									 // Because keep-refinements is get from cookie value
									 $('#KB_searchbar form').submit(function() {
									 $('#KB_opt_keepRefinements').prop('checked', 'checked');
									 $('#KB_opt_keepRefinements').change();
									 });
									 });*/
									/* /CAP 80 */
									$('.mashup-suggest-container li').live(
											'click', function() {
												$('.searchInput').focus();
											});
									$('.advancedsearch')
											.click(
													function() {
														$(this).toggleClass(
																'expanded');
														if ($('div.advancedSearchFormContent:visible').length)
															KB_overlay_show();
														else
															KB_overlay_hide();
													});
								</script>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
			<table class="table-layout" style="width: 100%;">

				<tbody>
					<tr id="KB_search_wrapper" class="row">
						<td id="KB_search_left" colspan="1" rowspan="1" class="cell"
							align="left" valign="top">
							<div class="row-wrapper">
								<div id="KB_refinesum"
									class="wuid ORaw9pWO ORaw9pWO_0_search searchWidget">
									<h2 class="widgetHeader">
										Filter by <span id="KB_refinesum_tooltip"
											title="Sub-filters may not represent the whole set of parent filter">?</span>
									</h2>
									<div id="KB_refinesum_list"></div>
								</div>
								<div id="KB_brand_facet"
									class="wuid v0MHg0vD v0MHg0vD_0_search KB_facetlist_wrapper">
									<div class="KB_facetlist">
										<h3 class="popping1" onclick="copyText1()">
											<span class="icon"></span> 自然 <span class="infos"></span>
										</h3>
										<div class="KB_facetlist_content">
											<ul>
												<li class="category"><span class="count">${count[0]}</span><a
													title="生物" href="search_resources?m=11">生物</a></li>
												<li class="category"><span class="count">${count[1]}</span><a
													title="资源" href="search_resources?m=12">资源</a></li>
												<li class="category"><span class="count">${count[2]}</span><a
													title="环境" href="search_resources?m=13">环境</a></li>
												<li class="category"><span class="count">${count[3]}</span><a
													title="现象" href="search_resources?m=14">现象</a></li>
												<li class="category"><span class="count">${count[4]}</span><a
													title="天文" href="search_resources?m=15">天文</a></li>
												<li class="category"><span class="count">${count[5]}</span><a
													title="地理" href="search_resources?m=16">地理</a></li>
											</ul>
										</div>
									</div>
								</div>
								<div id="w1airkp8ab"
									class="wuid zUVShK89 zUVShK89_0_search KB_facetlist_wrapper">
									<div class="KB_facetlist collapsed">
										<h3 class="popping2" onclick="copyText2()">
											<span class="icon"></span> 人文 <span class="infos"></span>
										</h3>
										<div class="KB_facetlist_content">
											<ul style="right: -17px;" tabindex="0" class="nano-content">
												<li class="category"><span class="count">${count[6]}</span><a
													title="语言"
													href="search_resources?m=21">语言</a></li>
												<li class="category"><span class="count">${count[7]}</span><a
													title="民族"
													href="search_resources?m=22">民族</a></li>
												<li class="category"><span class="count">${count[8]}</span><a
													title="宗教"
													href="search_resources?m=23">宗教</a></li>
												<li class="category"><span class="count">${count[9]}</span><a
													title="国家历史"
													href="search_resources?m=24">国家历史</a></li>
												<li class="category"><span class="count">${count[10]}</span><a
													title="文学"
													href="search_resources?m=25">文学</a></li>
												<li class="category"><span class="count">${count[11]}</span><a
													title="哲学"
													href="search_resources?m=26">哲学</a></li>
											</ul>
										</div>
									</div>
								</div>
								<div id="w1airkp8ac"
									class="wuid GeGUe9R8 GeGUe9R8_0_search KB_facetlist_wrapper">
									<div class="KB_facetlist collapsed">
										<h3 class="popping3" onclick="copyText3()">
											<span class="icon"></span> 生活 <span class="infos"></span>
										</h3>
										<div class="KB_facetlist_content">
											<ul style="right: -17px;" tabindex="0" class="nano-content">
												<li class="category"><span class="count">${count[12]}</span><a
													title="饮食" style="padding-left: 0px;"
													href="search_resources?m=31">饮食</a></li>
												<li class="category"><span class="count">${count[13]}</span><a
													title="健康" style="padding-left: 0px;"
													href="search_resources?m=32">健康</a></li>
												<li class="category"><span class="count">${count[14]}</span><a
													title="情感" style="padding-left: 0px;"
													href="search_resources?m=33">情感</a></li>
												<li class="category"><span class="count">${count[15]}</span><a
													title="教育" style="padding-left: 0px;"
													href="search_resources?m=34">教育</a></li>
												<li class="category"><span class="count">${count[16]}</span><a
													title="就业" style="padding-left: 0px;"
													href="search_resources?m=35">就业</a></li>
												<li class="category"><span class="count">${count[17]}</span><a
													title="居家"
													style="padding-left: 0px;"
													href="search_resources?m=36">居家</a></li>
											</ul>
										</div>
									</div>
								</div>
								<div id="w1airkp8ad"
									class="wuid ZKXUxHXY ZKXUxHXY_0_search KB_facetlist_wrapper">
									<div class="KB_facetlist collapsed">
										<h3 class="popping4" onclick="copyText4()">
											<span class="icon"></span> 社会 <span class="infos"></span>
										</h3>
										<div class="KB_facetlist_content">
											<ul>
												<li class="category"><span class="count">${count[18]}</span><a
													title="法律" style="padding-left: 0px;"
													href="search_resources?m=41">法律</a></li>
												<li class="category"><span class="count">${count[19]}</span><a
													title="公益" style="padding-left: 0px;"
													href="search_resources?m=42">公益</a></li>
											</ul>
										</div>
									</div>
								</div>
								<div id="w1airkp8ae"
									class="wuid H3ZRuQMj H3ZRuQMj_0_search KB_facetlist_wrapper">
									<div class="KB_facetlist collapsed">
										<h3 class="popping5" onclick="copyText5()">
											<span class="icon"></span> 科技 <span class="infos"></span>
										</h3>
										<div class="KB_facetlist_content" id="w1airkp8ae_content">

											<ul style="right: -17px;" tabindex="0" class="nano-content">
												<li class="category"><span class="count">${count[20]}</span><a
													title="心理学" style="padding-left: 0px;"
													href="search_resources?m=51">心理学</a></li>
												<li class="category"><span class="count">${count[21]}</span><a
													title="理" style="padding-left: 0px;"
													href="search_resources?m=52">数理科学和化学</a></li>
												<li class="category"><span class="count">${count[22]}</span><a
													title="天文学地球科学" style="padding-left: 0px;"
													href="search_resources?m=53">天文学地球科学</a></li>
												<li class="category"><span class="count">${count[23]}</span><a
													title="农业" style="padding-left: 0px;"
													href="search_resources?m=54">农业</a></li>
												<li class="category"><span class="count">${count[24]}</span><a
													title="工业技术" style="padding-left: 0px;"
													href="search_resources?m=55">工业技术</a></li>
												<li class="category"><span class="count">${count[25]}</span><a
													title="医学" style="padding-left: 0px;"
													href="search_resources?m=56">医学</a></li>
												<li class="category"><span class="count">${count[26]}</span><a
													title="计算机" style="padding-left: 0px;"
													href="search_resources?m=57">计算机</a></li>
												<li class="category"><span class="count">${count[27]}</span><a
													title="其他" style="padding-left: 0px;"
													href="search_resources?m=58">其他</a></li>
											</ul>
										</div>
									</div>
								</div>
								<div id="w1airkp8af"
									class="wuid O5c9NXn4 O5c9NXn4_0_search KB_facetlist_wrapper">
									<div class="KB_facetlist collapsed">
										<h3 class="popping6" onclick="copyText6()">
											<span class="icon"></span> 艺术 <span class="infos"></span>
										</h3>
										<div class="KB_facetlist_content">
											<ul style="right: -17px;" tabindex="0" class="nano-content">
												<li class="category"><span class="count">${count[28]}</span><a
													title="绘画" style="padding-left: 0px;"
													href="search_resources?m=61">绘画</a></li>
												<li class="category"><span class="count">${count[29]}</span><a
													title="书法" style="padding-left: 0px;"
													href="search_resources?m=62">书法</a></li>
												<li class="category"><span class="count">${count[30]}</span><a
													title="音乐" style="padding-left: 0px;"
													href="search_resources?m=63">音乐</a></li>
												<li class="category"><span class="count">${count[31]}</span><a
													title="舞蹈" style="padding-left: 0px;"
													href="search_resources?m=64">舞蹈</a></li>
												<li class="category"><span class="count">${count[32]}</span><a
													title="戏剧" style="padding-left: 0px;"
													href="search_resources?m=65">戏剧</a></li>
												<li class="category"><span class="count">${count[33]}</span><a
													title="建筑" style="padding-left: 0px;"
													href="search_resources?m=66">建筑</a></li>
												<li class="category"><span class="count">${count[34]}</span><a
													title="影视" style="padding-left: 0px;"
													href="search_resources?m=67">影视</a></li>
											</ul>
										</div>
									</div>
								</div>
								<div id="w1airkp8ag"
									class="wuid oE1PbGQn oE1PbGQn_0_search KB_facetlist_wrapper">
									<div class="KB_facetlist collapsed">
										<h3 class="popping7" onclick="copyText7()">
											<span class="icon"></span> 体育 <span class="infos"></span>
										</h3>
										<div class="KB_facetlist_content">
											<ul>
												<li class="category"><span class="count">${count[35]}</span><a
													title="田径" style="padding-left: 0px;"
													href="search_resources?m=71">田径</a></li>
												<li class="category"><span class="count">${count[36]}</span><a
													title="球类" style="padding-left: 0px;"
													href="search_resources?m=72">球类</a></li>
												<li class="category"><span class="count">${count[37]}</span><a
													title="体操" style="padding-left: 0px;"
													href="search_resources?m=73">体操</a></li>
												<li class="category"><span class="count">${count[38]}</span><a
													title="棋牌" style="padding-left: 0px;"
													href="search_resources?m=74">棋牌</a></li>
												<li class="category"><span class="count">${count[39]}</span><a
													title="武术" style="padding-left: 0px;"
													href="search_resources?m=75">武术</a></li>
												<li class="category"><span class="count">${count[40]}</span><a
													title="户外" style="padding-left: 0px;"
													href="search_resources?m=76">户外</a></li>
												<li class="category"><span class="count">${count[41]}</span><a
													title="电子竞技" style="padding-left: 0px;"
													href="search_resources?m=77">电子竞技</a></li>
											</ul>
										</div>
									</div>
								</div>
								<div id="w1airkp8ah"
									class="wuid Zfn6rbOx Zfn6rbOx_0_search KB_facetlist_wrapper">
									<div class="KB_facetlist collapsed">
										<h3 class="popping8" onclick="copyText8()">
											<span class="icon"></span> 政治 <span class="infos"></span>
										</h3>
										<div class="KB_facetlist_content">
											<ul>
												<li class="category"><span class="count">${count[42]}</span><a
													title="政治" style="padding-left: 0px;"
													href="search_resources?m=81">政治</a></li>
												<li class="category"><span class="count">${count[43]}</span><a
													title="军事" style="padding-left: 0px;"
													href="search_resources?m=82">军事</a></li>
											</ul>
										</div>
									</div>
								</div>
								<div id="w1airkp8ai"
									class="wuid Zfn6rbOx Zfn6rbOx_0_search KB_facetlist_wrapper">
									<div class="KB_facetlist collapsed">
										<h3 class="popping9" onclick="copyText9()">
											<span class="icon"></span> 财经 <span class="infos"></span>
										</h3>
										<div class="KB_facetlist_content">
											<ul>
												<li class="category"><span class="count">${count[44]}</span><a
													title="经融" style="padding-left: 0px;"
													href="search_resources?m=91">经融</a></li>
												<li class="category"><span class="count">${count[45]}</span><a
													title="管理" style="padding-left: 0px;"
													href="search_resources?m=92">管理</a></li>
												<li class="category"><span class="count">${count[46]}</span><a
													title="投资" style="padding-left: 0px;"
													href="search_resources?m=93">投资</a></li>
												<li class="category"><span class="count">${count[47]}</span><a
													title="营销" style="padding-left: 0px;"
													href="search_resources?m=94">营销</a></li>
											</ul>
										</div>
									</div>
								</div>

							</div>
						</td>
						<td id="KB_search_right" colspan="1" rowspan="1" class="cell"
							align="left" valign="top">
							<div class="row-wrapper">

								<div id="KB_displayHits"
									class="wuid J5jOfsgj J5jOfsgj_0_search searchWidget displayHits">
									<ul class="hits">
								<c:forEach var="p" items="${page.userfile}">
										<li class="KB_hit dsnews">
											<h3 class="KB_hit_title">
												<a href="showfile?id=${p.fid }" target="_blank"> <span
													title="${p.title }">${p.title }</span>
												</a>
											</h3>
											<p class="KB_question">
												<span class="KB_label">摘要: </span> ${p.abstracString}
											</p>
											<p class="KB_hitinfo">
												<span class="KB_articleid">上传者：</span>
												<span class="KB_updatedate">${p.uname} </span>
												 <span class="KB_ratingbox" style="float:right;">${p.uploadtime}</span>
												<span class="KB_articleid" style="float:right;">时间：</span>
												<span class="KB_updatedate" style="float:right;">${p.ftypeid }&nbsp&nbsp&nbsp	</span>
												<span class="KB_articleid" style="float:right;">类型：</span>
											</p>
											<p class="KB_hitinfo">标签：${p.tags};</p>
										</li>
									</c:forEach>
									</ul>
								</div>
								<div class="csdn-pagination hide-set page1">
									<span class="page-nav"> <b>共<i>${page.totalNum }条第${page.pageNO }页</i></b>
									<a href="${pageContext.request.contextPath }/paging_resourcesofsearch?n=1&totalnum=${page.totalNum }" data-page="1" class="btn btn-xs btn-default">首页</a>
									<a href="${pageContext.request.contextPath }/paging_resourcesofsearch?n=${page.pageNO-1 }&totalnum=${page.totalNum }" data-page="1" class="btn btn-xs btn-default">&lt;</a> 
								<c:forEach var="t" begin="${page.startPage }" end="${page.endPage }">	
									<c:if test="${t == page.pageNO }">
										<a href="${pageContext.request.contextPath }/paging_resourcesofsearch?n=${t}&totalnum=${page.totalNum }" data-page="1" class="btn btn-xs btn-default active cblue">${t }</a>
									</c:if>
									<c:if test="${t != page.pageNO }">
										<a href="${pageContext.request.contextPath }/paging_resourcesofsearch?n=${t}&totalnum=${page.totalNum }" data-page="1" class="btn btn-xs btn-default cblue">${t }</a>
									</c:if>
								</c:forEach> 
						
						
									<a href="${pageContext.request.contextPath }/paging_resourcesofsearch?n=${page.pageNO+1 }&totalnum=${page.totalNum }" data-page="907" class="btn btn-xs btn-default">&gt;</a>
									<a href="${pageContext.request.contextPath }/paging_resourcesofsearch?n=${page.totalPage }&totalnum=${page.totalNum }" data-page="907" class="btn btn-xs btn-default">末页</a>
									</span>
								</div>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>

	</div>
	<script type="text/javascript" src="${pageContext.request.contextPath }/resource/core.js" charset="utf-8"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/resource/io.js" charset="utf-8"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/resource/searchActions.js" charset="utf-8"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/resource/jquery.cookie.js" charset="utf-8"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/resource/jquery.json-2.2.js" charset="utf-8"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/resource/jquery.suggest.js" charset="utf-8"></script>
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
											"OPT (%@)", "Enter your word here",
											""),
									new AS.Item("Proximity Search",
											"eg: (financial NEAR market)",
											"NEAR %@", "Enter your word here",
											""),
									new AS.Item(
											"Logical Expression",
											"eg: ((fast OR quick) AND NOT lightning)",
											"(%@)", "Enter your word here", "") ];
							var approxSection = [
									new AS.Item("Words starting with",
											"eg: messag*", "%@*",
											"Enter your word here", ""),
									new AS.Item("Approximate spelling Search",
											"eg: spellslike:exlaead",
											"spellslike:%@",
											"Enter your word here", "") ];
							var whereSection = [
									new AS.Item("Title Search",
											"eg: title:exalead", "title:(%@)",
											"Enter your word here", ""),
									new AS.Item("Document Search",
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
									infobox.text(nbRefinements + ' refinement');
								} else {
									infobox
											.text(nbRefinements
													+ ' refinements');
								}
							}
						
							
							
					 
									
 
						 
						});
		/* ]]> */
	</script>
</body>
</html>
