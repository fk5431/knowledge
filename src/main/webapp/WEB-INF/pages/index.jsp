<%@ page import="java.util.List" %>
<%@ page import="com.fk.bean.TravelBean" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>大学生穷游网</title>
    <script type="text/javascript" charset="utf-8"
            src="${pageContext.request.contextPath}/js/index_1.js"></script>
    <script type="text/javascript" async="" charset="utf-8"
            src="${pageContext.request.contextPath}/js/index_2.js"></script>

    <link href="${pageContext.request.contextPath}/css/index_1.css"
          rel="stylesheet" type="text/css">

    <link href="${pageContext.request.contextPath}/css/index_2.css"
          rel="stylesheet" type="text/css">

    <script language="javascript"
            src="${pageContext.request.contextPath}/js/index_3.js"
            type="text/javascript"></script>

    <script src="${pageContext.request.contextPath}/js/index_4.js"></script>
    <script src="${pageContext.request.contextPath}/js/index_4.js"></script>
</head>
<body style="position: relative;">

<div id="header">
    <div class="mfw-header">
        <div class="header-wrap clearfix">
            <div class="head-logo"><a class="mfw-logo" title="蚂蜂窝自由行" href="${pageContext.request.contextPath}"></a>
            </div>
            <ul class="head-nav" data-cs-t="headnav" id="_j_head_nav">
                <li class="head-nav-index head-nav-active" id="head_1"><a
                        href="${pageContext.request.contextPath}/index">首页</a>
                </li>
                <li class="head-nav-place" id="head_2"><a href="http://www.mafengwo.cn/mdd/"
                                                                          title="目的地">目的地</a>
                </li>
                <li class="head-nav-gonglve" id="head_3"><a href="${pageContext.request.contextPath}/content_list"
                                                                                title="旅游攻略">旅游攻略</a>
                </li>
                <li class="head-nav-place" id="_j_nav_sales" >
                    <a href="http://www.mafengwo.cn/sales/"
                        data-sales-nav="自由行商城">
                        <span>自由行商城<%--<i class="icon-caret-down"></i>--%></span>
                    </a>
                </li>
                <li class="head-nav-place" id="head_4"><a href="http://www.mafengwo.cn/hotel/"
                                                                            title="论坛">论坛</a>
                </li>
                <li class="head-nav-place" id="_j_nav_community">
                    <a href="" title="留言薄">留言薄</a>
                </li>

            </ul>
            <div id="pagelet-block-abb1ca45f330cf8a24ad20466d690c67" class="pagelet-block">
                <div class="login-out">
                    <a id="_j_showlogin" title="登录" href="${pageContext.request.contextPath}/login"
                       rel="nofollow">登录</a>
                    <span class="split">|</span>
                    <a href="${pageContext.request.contextPath}/login" title="注册帐号"
                                                 rel="nofollow">注册</a>
                    <span class="split">|</span>
                    <a href="${pageContext.request.contextPath}/forget" title="找回密码"
                       rel="nofollow">找回密码</a>
                </div>
            </div>
        </div>
        <div class="shadow"></div>
    </div>
</div>


<div class="mfw-focus" id="_j_mfw_focus">
<div class="mfw-focus" id="_j_mfw_focus">
    <div class="show-slider" id="_j_top_pic_container" style="height: 586px;">
        <ul class="show-image">
            <%
                List<TravelBean> list = (List) request.getAttribute("list");
                for (int i = 0; i <list.size(); i++) {
            %>
                <li class="first" style="<% if(i != 0) out.print("display: none;"); %>">
                    <a href="${pageContext.request.contextPath}/article?id=${list.get(i).id}" target="_blank" class="show-pic"><img
                            src="<%=list.get(i).getImage() %>"></a>
                    <a href="${pageContext.request.contextPath}/article?id=${list.get(i).id}" target="_blank" class="show-title dark">
                        <div class="date">
                            <span class="day"><%=list.get(i).getTime()%>
                        </div>
                        <h3><%=list.get(i).getTitle()%></h3>
                    </a>
                    <p class="show-info">图片来自于<font color="#FF9900"><a href="/travel-scenic-spot/mafengwo/12033.html"
                                                                       target="_blank"><%=list.get(i).getPlace()%></a></font>，此目的地共收藏了<font
                            color="#FF9900"><a href="http://www.mafengwo.cn/photo/mdd/12033.html" target="_blank"
                                               rel="nofollow">22473</a></font>张<a
                            href="/travel-scenic-spot/mafengwo/12033.html" target="_blank"><%=list.get(i).getPlace()%></a>图片。本片由<font
                            color="#FF9900"><a href="http://www.mafengwo.cn/u/10569551.html" target="_blank"><%=list.get(i).getAuthor()%></a></font>荣誉出品！
                    </p>
                </li>
            <% } %>
        </ul>
        <%--缩略图--%>
        <ul class="show-nav">
            <%
                for (int i = 0; i <list.size(); i++) {
            %>
            <li class=""><a href="javascript:"><img
                    src="<%=list.get(i).getImage() %>"
                    width="110" height="62"><span></span></a></li>
            <% } %>

        </ul>
    </div>
    <div class="search-container" id="_j_index_search">
        <div class="search-group">
            <div class="searchtab" id="_j_index_search_tab">
                <ul class="clearfix">
                    <li class="tab-selected" data-index="0"><i></i>全部</li>
                    <li data-index="1"><i></i>酒店</li>
                    <li data-index="2"><i></i>目的地</li>
                    <li data-index="3"><i></i>自由行商城</li>
                </ul>
            </div>
            <%--检索--%>
            <!-- 全部 begin -->
            <div class="searchbar" id="_j_index_search_bar_all">
                <div class="search-wrapper">
                    <div class="search-input">
                        <input name="q" placeholder="搜目的地/攻略/酒店/旅行特价" id="_j_index_search_input_all" autocomplete="off"
                               type="text">
                    </div>
                </div>
                <div class="search-button" id="_j_index_search_btn_all">
                    <a role="button" href="javascript:"><i class="icon-search"></i></a>
                </div>
            </div>
            <!-- 全部 end -->
            <!-- 酒店 begin -->
            <div class="searchbar searchbar-hotel hide" id="_j_index_search_bar_hotel">
                <div class="search-wrapper">
                    <form action="/hotel/s.php" method="get">
                        <div class="search-input">
                            <input name="keyword" placeholder="请输入国家、地区、城市名称" id="_j_index_search_input_hotel"
                                   autocomplete="off" type="text">
                        </div>
                    </form>
                    <div class="search-date" id="_j_check_in">
                        <input readonly="readonly" id="dp1487740596228" class="hasDatepicker" type="text">
                        <span></span>
                        <i class="icon-cal"></i>
                    </div>
                    <div class="search-date" id="_j_check_out">
                        <input readonly="readonly" id="dp1487740596229" class="hasDatepicker" type="text">
                        <span></span>
                        <i class="icon-cal"></i>
                    </div>
                </div>
                <div class="search-button" id="_j_index_search_btn_hotel">
                    <a role="button" href="javascript:"><i class="icon-search"></i></a>
                </div>
            </div>
            <!-- 酒店 end -->
            <!-- 目的地 begin -->
            <div class="searchbar hide" id="_j_index_search_bar_mdd">
                <form action="/search/s.php" method="get">
                    <div class="search-wrapper">
                        <div class="search-input">
                            <input name="q" placeholder="我要去..." id="_j_index_search_input_mdd" autocomplete="off"
                                   type="text">
                        </div>
                    </div>
                    <div class="search-button" id="_j_index_search_btn_mdd">
                        <a role="button" href="javascript:"><i class="icon-search"></i></a>
                    </div>
                </form>
            </div>
            <!-- 目的地 end -->
            <!-- 出行服务 begin -->
            <div class="searchbar hide" id="_j_index_search_bar_sales">
                <div class="search-wrapper">
                    <div class="search-input">
                        <input placeholder="产品名称/目的地/优惠" id="_j_index_search_input_sales" autocomplete="off"
                               type="text">
                    </div>
                </div>
                <div class="search-button" id="_j_index_search_btn_sales">
                    <a role="button" href="javascript:"><i class="icon-search"></i></a>
                </div>
            </div>
            <!-- 出行服务 end -->
            <!-- 目的地suggest begin -->
            <div class="search-suggest-panel search-suggest-place hide" id="_j_index_suggest_list_mdd">
                <ul class="suggest-list"></ul>
            </div>
            <!-- 目的地suggest end -->
            <!-- 酒店suggest begin -->
            <div class="search-suggest-panel search-suggest-hotel hide" id="_j_index_suggest_list_hotel">
            </div>
            <!-- 酒店suggest end -->
        </div>
    </div>
</div>


<div class="mfw-container clearfix" id="_j_mfw_container">
    <div class="mfw-wrapper">
        <div class="da-banner"></div>
        <div class="mfw-sales" id="_j_sales">
            <div class="hd">爆款热卖</div>
            <div class="bd">
                <ul class="clearfix">
                    <li class="item ">
                        <a href="#" target="_blank">
                            <div class="image">
                                <img src="${pageContext.request.contextPath}/images/shop_1.jpeg"
                                     width="220" height="135">
                            </div>
                            <h3>北京直飞东京4-14天往返含税机票（含行李托运/机票）</h3>
                            <div class="price">￥<strong>1799</strong><em>起/人</em></div>
                        </a>
                    </li>
                    <li class="item ">
                        <a href="#" target="_blank">
                            <div class="image">
                                <img src="${pageContext.request.contextPath}/images/shop_2.jpeg"
                                     width="220" height="135">
                            </div>
                            <h3>【大学生穷游网推荐 北京送签】韩国单次旅游签证（北京户籍可简化材料办理/可加急/拒签退全款/包回邮）</h3>
                            <div class="price">￥<strong>245</strong><em>起/本</em></div>
                        </a>
                    </li>
                    <li class="item ">
                        <a href="#" target="_blank">
                            <div class="image">
                                <img src="${pageContext.request.contextPath}/images/shop_3.jpeg"
                                     width="220" height="135">
                            </div>
                            <h3>【清明/五一假期】广州往返泰国曼谷5/6日含税机票（可搭配首晚酒店）赠目的地管家服务+电子地图</h3>
                            <div class="price">￥<strong>1099</strong><em>起/人</em></div>
                        </a>
                    </li>
                </ul>
            </div>
        </div>


        <div class="mfw-travelnotes" id="_j_tn">
            <div class="navbar clearfix">
                <ul class="tn-nav" id="_j_tn_nav">

                    <li class="active _j_gs_tab"><a href="javascript:void(0);"
                                                    data-objid="0">热门攻略</a></li>
                    <li class="_j_gs_tab"><a href="javascript:void(0);" >最新发表</a></li>
                </ul>
                <div class="tn-write"><a class="btn-add" href="/note/create_index.php" target="_blank"
                                         rel="nofollow"><i></i>写攻略</a></div>
                <a class="tn-tips" href="/i/5500499.html" target="_blank"><i></i>我要上首页</a>
            </div>
            <div class="tn-selected _j_tag_choose_container">

            </div>

            <div id="pagelet-block-d373e99b975b2c008689531b496d25bc" class="pagelet-block"
                 data-api=":mfw:pagelet:recommendGinfoApi" data-params="{&quot;type&quot;:&quot;0&quot;}" data-async="1"
                 data-controller="/js/index/ControllerRecommend">
                <div id="_j_tn_content">
                    <div class="tn-list">
                        <% List<TravelBean> travelList = (List) request.getAttribute("travelList");
                        for (int i = 0; i <travelList.size(); i++) { %>
                        <div class="tn-item clearfix">
                            <div class="tn-image">
                                <a href="${pageContext.request.contextPath}/article?id=<%=travelList.get(i).getId()%>" target="_blank">
                                    <img class=""
                                         src="<%=travelList.get(i).getImage()%>"
                                         style="display: inline;">
                                </a>
                            </div>
                            <div class="tn-wrapper">
                                <dl>
                                    <dt>
                                        <a href="${pageContext.request.contextPath}/article?id=<%=travelList.get(i).getId()%>" target="_blank"><%=travelList.get(i).getTitle()%></a>
                                    </dt>
                                    <dd>
                                        <a href="${pageContext.request.contextPath}/article?id=<%=travelList.get(i).getId()%>" target="_blank"> <%=travelList.get(i).getSummary()%></a>
                                    </dd>
                                </dl>
                                <div class="tn-extra">
                    <span class="tn-ding">
                        <a class="btn-ding" href="${pageContext.request.contextPath}/count?id=<%=travelList.get(i).getId()%>" data-japp="articleding" data-iid="6525065"
                           data-vote="97" rel="nofollow"></a>
                        <em id="topvote6525065"><%=travelList.get(i).getCount()%></em>
                    </span>
                                    <span class="tn-place"><i></i><a href="javascript:void(0);" class="_j_gs_item" ><%=travelList.get(i).getPlace()%></a>，by</span>
                                    <span class="tn-user">
                        <a  rel="nofollow">
                            <img src="${pageContext.request.contextPath}/images/index_context_1.jpeg">
                            <%=travelList.get(i).getAuthor()%>
                        </a>
                    </span>
                                    <span class="tn-nums"><i></i><%=travelList.get(i).getLookcount()%></span>
                                </div>
                            </div>
                        </div>

                        <% } %>

                    </div>
                    <div class="m-pagination" id="_j_tn_pagination" data-type="0" data-objid="0" align="right">
                        <span class="count">共${page}页 / ${count}条</span>
                        <%
                            Integer pageAll = (Integer)request.getAttribute("page");
                            Integer pageNow = (Integer)request.getAttribute("pageNow");

                            for(int i=1;i<= pageAll.intValue() - pageNow.intValue() + 1;i++){
                                if(i == pageNow.intValue()){
                        %>
                        <span class="pg-current"><%=i %></span>
                        <%
                            }else{
                        %>
                        <a class="pi _j_pageitem" href="${pageContext.request.contextPath}/index?page=<%=i%>"><%=i %></a>
                        <%
                            }
                            }
                        %>
                        <a class="pg-next _j_pageitem" href="${pageContext.request.contextPath}/index?page=${pageNow+1}">下一页 &gt;&gt;</a>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <div class="mfw-aside">


        <div class="asidebox box-gonglve">
            <div class="asidebox-hd">
                <h2 class="hd-title">旅游攻略推荐</h2>
                <a class="hd-right" href="/gonglve/">更多</a>
            </div>
            <div class="asidebox-bd">
                <dl class="clearfix">
                    <dt>
                        <a href="#" target="_blank">
                            <img src="${pageContext.request.contextPath}/images/shop_4.jpeg"
                                 alt="大阪旅游攻略" width="110" height="155">
                        </a>
                    </dt>
                    <dd>
                        <h3>
                            <a href="#" target="_blank" title="大阪">大阪</a>
                        </h3>
                        <p>详细的吃、住、行、景点、线路、实用信息</p>
                    </dd>
                </dl>
            </div>
        </div>
        <div class="asidebox box-gowild">
        </div>
    </div>
    <div class="da-banner da-banner-row"></div>
</div>
<div id="pagelet-block-41d777138af86fb7bccab28eb1875a52" class="pagelet-block" data-api=":activity:pagelet:halloweenApi"
     data-params="{&quot;type&quot;:1}" data-async="1" data-controller=""></div>


<script type="text/javascript">

    var $topPicContainer = $('#_j_top_pic_container'),
        topPicSlideCnt = $topPicContainer.find('.show-image');

    function respondTopPicSize(ev) {
        var clientWidth = $(window).width(),
            picHeight = Math.round(clientWidth / 3);
        $topPicContainer.height(picHeight);
        topPicSlideCnt.find('img').each(function (idx, ele) {
            var $img = $(ele),
                imgHeight = parseInt($img.css('height'), 10);
            if (imgHeight > picHeight) {
                $img.css('marginTop', -Math.round((imgHeight - picHeight) / 2));
            }
        });
    }
    $(window).on('resize', respondTopPicSize).trigger('resize');
</script>


<link href="${pageContext.request.contextPath}/css/index_4.css" rel="stylesheet" type="text/css">

<div id="footer">
    <div class="ft-content">

        <div class="ft-copyright">
            <a href="${pageContext.request.contextPath}"><i class="ft-mfw-logo"></i></a>
            <p>© 2017 Mafengwo.cn <a href="${pageContext.request.contextPath}" target="_blank"
                                     rel="nofollow">京ICP备******号</a> 京公网安备*******号 <a
                    href="${pageContext.request.contextPath}" target="_blank"
                    rel="nofollow">京ICP证*****号</a></p>
            <p><a href="${pageContext.request.contextPath}" target="_blank" rel="nofollow">营业执照</a>
                *********  客服电话：<span class="highlight">*******</span>
            </p>
        </div>
    </div>
</div>


<link href="${pageContext.request.contextPath}/css/index_3.css" rel="stylesheet" type="text/css">

<div class="mfw-toolbar " id="_j_mfwtoolbar" style="display: block;">
    <div class="toolbar-item-top" style="display: none;">
        <a role="button" class="btn _j_gotop">
            <i class="icon_top"></i>
            <em>返回顶部</em>
        </a>
    </div>
    <div class="toolbar-item-feedback">
        <a role="button" data-japp="feedback" class="btn">
            <i class="icon_feedback"></i>
            <em>意见反馈</em>
        </a>
    </div>
</div>


<script language="javascript" type="text/javascript">
    if (typeof M !== "undefined" && typeof M.loadResource === "function") {
        M.loadResource("${pageContext.request.contextPath}/js/index_6.js");
    }
</script>

<script>
    var state = ${index};
    if (state == 1) {
        document.getElementById('head_1').className = 'head-nav-index head-nav-active';
        document.getElementById('head_2').className = 'head-nav-place';
        document.getElementById('head_3').className = 'head-nav-gonglve';
        document.getElementById('_j_nav_sales').className = 'head-nav-place ';
        document.getElementById('head_4').className = 'head-nav-hotel';
        document.getElementById('_j_nav_community').className = 'head-nav-place';
    }
    if (state == 2) {
        document.getElementById('head_1').className = 'head-nav-index';
        document.getElementById('head_2').className = 'head-nav-place head-nav-active';
        document.getElementById('head_3').className = 'head-nav-gonglve';
        document.getElementById('_j_nav_sales').className = 'head-nav-place ';
        document.getElementById('head_4').className = 'head-nav-hotel';
        document.getElementById('_j_nav_community').className = 'head-nav-place';
    }
    if (state == 3) {
        document.getElementById('head_1').className = 'head-nav-index';
        document.getElementById('head_2').className = 'head-nav-place';
        document.getElementById('head_3').className = 'head-nav-gonglve head-nav-active';
        document.getElementById('_j_nav_sales').className = 'head-nav-place';
        document.getElementById('head_4').className = 'head-nav-hotel';
        document.getElementById('_j_nav_community').className = 'head-nav-place';
    }
    if (state == 4) {
        document.getElementById('head_1').className = 'head-nav-index';
        document.getElementById('head_2').className = 'head-nav-place';
        document.getElementById('head_3').className = 'head-nav-gonglve';
        document.getElementById('_j_nav_sales').className = 'head-nav-place head-nav-active';
        document.getElementById('head_4').className = 'head-nav-hotel';
        document.getElementById('_j_nav_community').className = 'head-nav-place';
    }
    if (state == 5) {
        document.getElementById('head_1').className = 'head-nav-index';
        document.getElementById('head_2').className = 'head-nav-place';
        document.getElementById('head_3').className = 'head-nav-gonglve';
        document.getElementById('_j_nav_sales').className = 'head-nav-place ';
        document.getElementById('head_4').className = 'head-nav-hotel head-nav-active';
        document.getElementById('_j_nav_community').className = 'head-nav-place';
    }
    if (state == 6) {
        document.getElementById('head_1').className = 'head-nav-index';
        document.getElementById('head_2').className = 'head-nav-place';
        document.getElementById('head_3').className = 'head-nav-gonglve';
        document.getElementById('_j_nav_sales').className = 'head-nav-place ';
        document.getElementById('head_4').className = 'head-nav-hotel';
        document.getElementById('_j_nav_community').className = 'head-nav-place head-nav-active';
    }
</script>
</body>
</html>