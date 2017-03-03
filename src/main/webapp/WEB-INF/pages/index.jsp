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
                <li class="head-nav-gonglve" id="head_3"><a href="http://www.mafengwo.cn/gonglve/"
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
    <div class="show-slider" id="_j_top_pic_container" style="height: 586px;">
        <ul class="show-image">
            <%
                List<TravelBean> list = (List) request.getAttribute("list");
                for (int i = 0; i <list.size(); i++) {
            %>
                <li class="first" style="<% if(i != 0) out.print("display: none;"); %>">
                    <a href="/i/6625412.html" target="_blank" class="show-pic"><img
                            src="<%=list.get(i).getImage() %>"></a>
                    <a href="/i/6625412.html" target="_blank" class="show-title dark">
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

                    <li class="active _j_gs_tab"><a href="javascript:void(0);" rel="nofollow" data-type="0"
                                                    data-objid="0">热门攻略</a></li>
                    <li class="_j_gs_tab"><a href="javascript:void(0);" rel="nofollow" data-type="3">最新发表</a></li>
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
                                <a href="/i/6525065.html" target="_blank">
                                    <img class=""
                                         src="<%=travelList.get(i).getImage()%>"
                                         style="display: inline;">
                                </a>
                            </div>
                            <div class="tn-wrapper">
                                <dl>
                                    <dt>
                                        <a href="/i/6525065.html" target="_blank"><%=travelList.get(i).getTitle()%></a>
                                    </dt>
                                    <dd>
                                        <a href="/i/6525065.html" target="_blank"> <%=travelList.get(i).getContext()%></a>
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
                       <%-- <div class="tn-item clearfix">
                            <div class="tn-image">
                                <a href="/i/6556907.html" target="_blank">
                                    <img class=""
                                         data-src="http://c3-q.mafengwo.net/s10/M00/D9/B7/wKgBZ1hy5B6AdytWAAbhoQKaFW040.jpeg?imageMogr2%2Fthumbnail%2F%21220x150r%2Fgravity%2FCenter%2Fcrop%2F%21220x150%2Fquality%2F90"
                                         data-rt-src="http://c3-q.mafengwo.net/s10/M00/D9/B7/wKgBZ1hy5B6AdytWAAbhoQKaFW040.jpeg?imageMogr2%2Fthumbnail%2F%21440x300r%2Fgravity%2FCenter%2Fcrop%2F%21440x300%2Fquality%2F90"
                                         src="http://c3-q.mafengwo.net/s10/M00/D9/B7/wKgBZ1hy5B6AdytWAAbhoQKaFW040.jpeg?imageMogr2%2Fthumbnail%2F%21220x150r%2Fgravity%2FCenter%2Fcrop%2F%21220x150%2Fquality%2F90"
                                         style="display: inline;">


                                </a>
                            </div>
                            <div class="tn-wrapper">
                                <dl>
                                    <dt>
                                        <a class="tn-from-app" href="javascript:void(0);"><i></i>APP<img
                                                src="http://images.mafengwo.net/images/mfwapp-notes.png"></a>
                                        <a href="/i/6556907.html" target="_blank">七色海之塞班蓝 圆梦北纬15度（附有塞班旅游攻略哦）</a>
                                    </dt>
                                    <dd>
                                        <a href="/i/6556907.html" target="_blank">人的一生就像一场旅行，不必在乎目的地，在乎的是沿途的风景以及看风景的心情。
                                            我和老婆是2016年10月中旬来塞班，当时考虑10月初国庆假期，人可能会多，所以我们选择10月中旬休年假来塞班，...</a>
                                    </dd>
                                </dl>
                                <div class="tn-extra">
                    <span class="tn-ding">
                        <a class="btn-ding" href="javascript:;" data-japp="articleding" data-iid="6556907"
                           data-vote="173660" rel="nofollow"></a>
                        <em id="topvote6556907">173660</em>
                    </span>
                                    <span class="tn-place"><i></i><a href="javascript:void(0);" class="_j_gs_item"
                                                                     rel="nofollow" data-name="塞班岛" data-objid="10077"
                                                                     data-type="2">塞班岛</a>，by</span>
                                    <span class="tn-user">
                        <a href="/u/34109149.html" target="_blank" rel="nofollow">
                            <img src="http://b1-q.mafengwo.net/s10/M00/D7/68/wKgBZ1hy2gOABXxDAAW1Z1JNbpQ09.jpeg?imageMogr2%2Fthumbnail%2F%2116x16r%2Fgravity%2FCenter%2Fcrop%2F%2116x16%2Fquality%2F90">
                            还俗一休哥
                        </a>
                    </span>
                                    <span class="tn-nums"><i></i>123369/158</span>
                                </div>
                            </div>
                        </div>
                        <div class="tn-item clearfix">
                            <div class="tn-image">
                                <a href="/i/864261.html" target="_blank">
                                    <img class=""
                                         data-src="http://n2-q.mafengwo.net/s3/M00/70/61/wKgBt0-OQDCRaTBJAANax7uf2Hs70.jpeg?imageMogr2%2Fthumbnail%2F%21220x150r%2Fgravity%2FCenter%2Fcrop%2F%21220x150%2Fquality%2F90"
                                         data-rt-src="http://n2-q.mafengwo.net/s3/M00/70/61/wKgBt0-OQDCRaTBJAANax7uf2Hs70.jpeg?imageMogr2%2Fthumbnail%2F%21440x300r%2Fgravity%2FCenter%2Fcrop%2F%21440x300%2Fquality%2F90"
                                         src="http://n2-q.mafengwo.net/s3/M00/70/61/wKgBt0-OQDCRaTBJAANax7uf2Hs70.jpeg?imageMogr2%2Fthumbnail%2F%21220x150r%2Fgravity%2FCenter%2Fcrop%2F%21220x150%2Fquality%2F90"
                                         style="display: inline;">


                                </a>
                            </div>
                            <div class="tn-wrapper">
                                <dl>
                                    <dt>
                                        <a href="/i/864261.html" target="_blank">那些天我们一起去吴哥（记录蚂蜂窝上海舵首次组团出境游）</a>
                                    </dt>
                                    <dd>
                                        <a href="/i/864261.html" target="_blank"> Photo by tsian_21percent.
                                            很多朋友问背景音乐，音乐叫《雨林深处》 Tsian（瓜拖）： http://www.21percent.com.cn/ ：
                                            http://weibo.com/tsian21percent 未出镜人物cnn（常恩恩、南大婶、...</a>
                                    </dd>
                                </dl>
                                <div class="tn-extra">
                    <span class="tn-ding">
                        <a class="btn-ding" href="javascript:;" data-japp="articleding" data-iid="864261"
                           data-vote="21140" rel="nofollow"></a>
                        <em id="topvote864261">21140</em>
                    </span>
                                    <span class="tn-place"><i></i><a href="javascript:void(0);" class="_j_gs_item"
                                                                     rel="nofollow" data-name="暹粒" data-objid="15308"
                                                                     data-type="2">暹粒</a>，by</span>
                                    <span class="tn-user">
                        <a href="/u/156326.html" target="_blank" rel="nofollow">
                            <img src="http://b2-q.mafengwo.net/s5/M00/E7/0D/wKgB21AiMRjDyYbAAAHGHiJxkeg40.jpeg?imageMogr2%2Fthumbnail%2F%2116x16r%2Fgravity%2FCenter%2Fcrop%2F%2116x16%2Fquality%2F90">
                            小皮
                        </a>
                    </span>
                                    <span class="tn-nums"><i></i>48124/668</span>
                                </div>
                            </div>
                        </div>
                        <div class="tn-item clearfix">
                            <div class="tn-image">
                                <a href="/i/5453920.html" target="_blank">
                                    <img class=""
                                         data-src="http://a2-q.mafengwo.net/s9/M00/95/45/wKgBs1cFJ1yAP5ysAD5TVt6epG001.jpeg?imageMogr2%2Fthumbnail%2F%21220x150r%2Fgravity%2FCenter%2Fcrop%2F%21220x150%2Fquality%2F90"
                                         data-rt-src="http://a2-q.mafengwo.net/s9/M00/95/45/wKgBs1cFJ1yAP5ysAD5TVt6epG001.jpeg?imageMogr2%2Fthumbnail%2F%21440x300r%2Fgravity%2FCenter%2Fcrop%2F%21440x300%2Fquality%2F90"
                                         src="http://a2-q.mafengwo.net/s9/M00/95/45/wKgBs1cFJ1yAP5ysAD5TVt6epG001.jpeg?imageMogr2%2Fthumbnail%2F%21220x150r%2Fgravity%2FCenter%2Fcrop%2F%21220x150%2Fquality%2F90"
                                         style="display: inline;">


                                </a>
                            </div>
                            <div class="tn-wrapper">
                                <dl>
                                    <dt>
                                        <a href="/i/5453920.html" target="_blank">【蜂首纪念】深深陷入Tiffany蓝——塞舌尔的那片海</a>
                                    </dt>
                                    <dd>
                                        <a href="/i/5453920.html" target="_blank">
                                            关于我，一个普普通通的80后上班族，朝九晚六的打拼在魔都，跟好多人一样，选择在人生低谷期来了第一次说走就走的旅行。写游...</a>
                                    </dd>
                                    <dd class="tn-tags">
                                        <a class="tn-tag _j_gs_item" href="javascript:void(0);" data-name="姑娘漂亮"
                                           data-objid="427" data-type="1" rel="nofollow">姑娘漂亮</a>
                                    </dd>
                                </dl>
                                <div class="tn-extra">
                    <span class="tn-ding">
                        <a class="btn-ding" href="javascript:;" data-japp="articleding" data-iid="5453920"
                           data-vote="7949" rel="nofollow"></a>
                        <em id="topvote5453920">7949</em>
                    </span>
                                    <span class="tn-place"><i></i><a href="javascript:void(0);" class="_j_gs_item"
                                                                     rel="nofollow" data-name="塞舌尔" data-objid="16827"
                                                                     data-type="2">塞舌尔</a>，by</span>
                                    <span class="tn-user">
                        <a href="/u/5394477.html" target="_blank" rel="nofollow">
                            <img src="http://b1-q.mafengwo.net/s9/M00/0B/9B/wKgBs1cD8XiAYuwgAAB2dY229ac80.jpeg?imageMogr2%2Fthumbnail%2F%2116x16r%2Fgravity%2FCenter%2Fcrop%2F%2116x16%2Fquality%2F90">
                            Q蜜思杨小妞Q
                        </a>
                    </span>
                                    <span class="tn-nums"><i></i>222285/1007</span>
                                </div>
                            </div>
                        </div>
                        <div class="tn-item clearfix">
                            <div class="tn-image">
                                <a href="/i/6644483.html" target="_blank">
                                    <img class=""
                                         data-src="http://n2-q.mafengwo.net/s10/M00/A2/B4/wKgBZ1ia2GmAIuAIAAXV2-exTC837.jpeg?imageMogr2%2Fthumbnail%2F%21220x150r%2Fgravity%2FCenter%2Fcrop%2F%21220x150%2Fquality%2F90"
                                         data-rt-src="http://n2-q.mafengwo.net/s10/M00/A2/B4/wKgBZ1ia2GmAIuAIAAXV2-exTC837.jpeg?imageMogr2%2Fthumbnail%2F%21440x300r%2Fgravity%2FCenter%2Fcrop%2F%21440x300%2Fquality%2F90"
                                         src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAANwAAACWBAMAAABHt/u4AAAAElBMVEX88tz8+uz89uz8/vz88uT8+vT1Qw6wAAABEUlEQVR4nO3YXa6CMBRF4crRETgR9OgInACJ85+LYJGfUogP3SSa9T2Y3JJ0edTbBEIAAAAAAAAAgP/j7os1c69ltUXPujVJ7+mZrT23WETceT6eyXL9zvOtPfceiniXbL51/FMyXgy1r9dhqYqhgybX7WnTUR79rLpcmHxTQ1qYm4w3lIW5MTKGlbnKFx+rMvc+XUIcrtkh1/+f+XRBmbP0LNHmPkdXnbmkyFlyUIpzITmr1bnkVJbnvr5Ejhw5cuTIkdvMrV4yQe60seW9eA0/7Ljxy7yVz60/z1A9ecgFj6LnOJ+7LL+Ma2dPb4aKGe7qcorX2mNl11pYHbDR1Dp7TTayXeYCAAAAAAAAAPyPF3yhZETFwUH1AAAAAElFTkSuQmCC">


                                </a>
                            </div>
                            <div class="tn-wrapper">
                                <dl>
                                    <dt>
                                        <a class="tn-from-app" href="javascript:void(0);"><i></i>APP<img
                                                src="http://images.mafengwo.net/images/mfwapp-notes.png"></a>
                                        <a href="/i/6644483.html" target="_blank">巴厘岛🌊澳洲旅行结婚🎎</a>
                                    </dt>
                                    <dd>
                                        <a href="/i/6644483.html" target="_blank">我们是2016年1月29日领的证，但是并不想传统的摆桌宴，和双方父母商量后决定抛开传统思想
                                            出去走一圈 行程定在五一劳动节前后，加上预定的旅拍婚纱时间共13天 巴厘岛 是落地签 只要带好护照...</a>
                                    </dd>
                                </dl>
                                <div class="tn-extra">
                    <span class="tn-ding">
                        <a class="btn-ding" href="javascript:;" data-japp="articleding" data-iid="6644483"
                           data-vote="51" rel="nofollow"></a>
                        <em id="topvote6644483">51</em>
                    </span>
                                    <span class="tn-place"><i></i><a href="javascript:void(0);" class="_j_gs_item"
                                                                     rel="nofollow" data-name="巴厘岛" data-objid="10460"
                                                                     data-type="2">巴厘岛</a>，by</span>
                                    <span class="tn-user">
                        <a href="/u/35075590.html" target="_blank" rel="nofollow">
                            <img src="http://a4-q.mafengwo.net/s10/M00/25/2E/wKgBZ1iYTe2ARZmxAABo0bb-eLY90.jpeg?imageMogr2%2Fthumbnail%2F%2116x16r%2Fgravity%2FCenter%2Fcrop%2F%2116x16%2Fquality%2F90">
                            肥果果不肥
                        </a>
                    </span>
                                    <span class="tn-nums"><i></i>811/14</span>
                                </div>
                            </div>
                        </div>
                        <div class="tn-item clearfix">
                            <div class="tn-image">
                                <a href="/i/5628803.html" target="_blank">
                                    <img class=""
                                         data-src="http://c2-q.mafengwo.net/s9/M00/FE/43/wKgBs1e-5uOAFzE7AAFSp-rTuzs26.jpeg?imageMogr2%2Fthumbnail%2F%21220x150r%2Fgravity%2FCenter%2Fcrop%2F%21220x150%2Fquality%2F90"
                                         data-rt-src="http://c2-q.mafengwo.net/s9/M00/FE/43/wKgBs1e-5uOAFzE7AAFSp-rTuzs26.jpeg?imageMogr2%2Fthumbnail%2F%21440x300r%2Fgravity%2FCenter%2Fcrop%2F%21440x300%2Fquality%2F90"
                                         src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAANwAAACWBAMAAABHt/u4AAAAElBMVEX88tz8+uz89uz8/vz88uT8+vT1Qw6wAAABEUlEQVR4nO3YXa6CMBRF4crRETgR9OgInACJ85+LYJGfUogP3SSa9T2Y3JJ0edTbBEIAAAAAAAAAgP/j7os1c69ltUXPujVJ7+mZrT23WETceT6eyXL9zvOtPfceiniXbL51/FMyXgy1r9dhqYqhgybX7WnTUR79rLpcmHxTQ1qYm4w3lIW5MTKGlbnKFx+rMvc+XUIcrtkh1/+f+XRBmbP0LNHmPkdXnbmkyFlyUIpzITmr1bnkVJbnvr5Ejhw5cuTIkdvMrV4yQe60seW9eA0/7Ljxy7yVz60/z1A9ecgFj6LnOJ+7LL+Ma2dPb4aKGe7qcorX2mNl11pYHbDR1Dp7TTayXeYCAAAAAAAAAPyPF3yhZETFwUH1AAAAAElFTkSuQmCC">


                                    <i class="ico"></i>

                                </a>
                            </div>
                            <div class="tn-wrapper">
                                <dl>
                                    <dt>
                                        <a href="/i/5628803.html" target="_blank">【❀ Asuka 】 冲绳の夏 —— 1个人去看世界</a>
                                    </dt>
                                    <dd>
                                        <a href="/i/5628803.html" target="_blank">第一篇游记，手动撒花 不知道是不是有很多朋友和我一样： -
                                            有着四分之一人生的尴尬 - 有着探索世界的美好想法 - 有着难以存金的羞涩锦囊 也许你的朋友也一样奔波于职场，预算与时间成为你们...</a>
                                    </dd>
                                </dl>
                                <div class="tn-extra">
                    <span class="tn-ding">
                        <a class="btn-ding" href="javascript:;" data-japp="articleding" data-iid="5628803"
                           data-vote="471" rel="nofollow"></a>
                        <em id="topvote5628803">471</em>
                    </span>
                                    <span class="tn-place"><i></i><a href="javascript:void(0);" class="_j_gs_item"
                                                                     rel="nofollow" data-name="冲绳" data-objid="11041"
                                                                     data-type="2">冲绳</a>，by</span>
                                    <span class="tn-user">
                        <a href="/u/36880750.html" target="_blank" rel="nofollow">
                            <img src="http://c4-q.mafengwo.net/s10/M00/1C/D3/wKgBZ1hw2FuAaCKZAAC2-t7hD6o89.jpeg?imageMogr2%2Fthumbnail%2F%2116x16r%2Fgravity%2FCenter%2Fcrop%2F%2116x16%2Fquality%2F90">
                            Asuka.金
                        </a>
                    </span>
                                    <span class="tn-nums"><i></i>18281/81</span>
                                </div>
                            </div>
                        </div>
                        <div class="tn-item clearfix">
                            <div class="tn-image">
                                <a href="/i/6614153.html" target="_blank">
                                    <img class=""
                                         data-src="http://c3-q.mafengwo.net/s8/M00/62/7F/wKgBpVhuCzeATOgAABHRdTmLL8s13.jpeg?imageMogr2%2Fthumbnail%2F%21220x150r%2Fgravity%2FCenter%2Fcrop%2F%21220x150%2Fquality%2F90"
                                         data-rt-src="http://c3-q.mafengwo.net/s8/M00/62/7F/wKgBpVhuCzeATOgAABHRdTmLL8s13.jpeg?imageMogr2%2Fthumbnail%2F%21440x300r%2Fgravity%2FCenter%2Fcrop%2F%21440x300%2Fquality%2F90"
                                         src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAANwAAACWBAMAAABHt/u4AAAAElBMVEX88tz8+uz89uz8/vz88uT8+vT1Qw6wAAABEUlEQVR4nO3YXa6CMBRF4crRETgR9OgInACJ85+LYJGfUogP3SSa9T2Y3JJ0edTbBEIAAAAAAAAAgP/j7os1c69ltUXPujVJ7+mZrT23WETceT6eyXL9zvOtPfceiniXbL51/FMyXgy1r9dhqYqhgybX7WnTUR79rLpcmHxTQ1qYm4w3lIW5MTKGlbnKFx+rMvc+XUIcrtkh1/+f+XRBmbP0LNHmPkdXnbmkyFlyUIpzITmr1bnkVJbnvr5Ejhw5cuTIkdvMrV4yQe60seW9eA0/7Ljxy7yVz60/z1A9ecgFj6LnOJ+7LL+Ma2dPb4aKGe7qcorX2mNl11pYHbDR1Dp7TTayXeYCAAAAAAAAAPyPF3yhZETFwUH1AAAAAElFTkSuQmCC">


                                </a>
                            </div>
                            <div class="tn-wrapper">
                                <dl>
                                    <dt>
                                        <a href="/i/6614153.html" target="_blank">Here We Are — 多彩的蓝 毛里求斯7天5晚蜜月之旅</a>
                                    </dt>
                                    <dd>
                                        <a href="/i/6614153.html" target="_blank">2016年12月18日我们结婚了，完成了人生中的一件大事，感恩所有祝福我们的朋友，谢谢了
                                            ，在18号办完婚礼，19号就开启了我们的蜜月之旅-- 毛里求斯 ，Here we are 我，主要负责挑选目的地，做...</a>
                                    </dd>
                                </dl>
                                <div class="tn-extra">
                    <span class="tn-ding">
                        <a class="btn-ding" href="javascript:;" data-japp="articleding" data-iid="6614153"
                           data-vote="123" rel="nofollow"></a>
                        <em id="topvote6614153">123</em>
                    </span>
                                    <span class="tn-place"><i></i><a href="javascript:void(0);" class="_j_gs_item"
                                                                     rel="nofollow" data-name="毛里求斯" data-objid="11761"
                                                                     data-type="2">毛里求斯</a>，by</span>
                                    <span class="tn-user">
                        <a href="/u/93830163.html" target="_blank" rel="nofollow">
                            <img src="http://c1-q.mafengwo.net/s9/M00/6A/76/wKgBs1hBKdWAW5H_AAFZEQZD66A95.jpeg?imageMogr2%2Fthumbnail%2F%2116x16r%2Fgravity%2FCenter%2Fcrop%2F%2116x16%2Fquality%2F90">
                            ༺ཉི༒Silent
                        </a>
                    </span>
                                    <span class="tn-nums"><i></i>5157/40</span>
                                </div>
                            </div>
                        </div>
                        <div class="tn-item clearfix">
                            <div class="tn-image">
                                <a href="/i/1040889.html" target="_blank">
                                    <img class=""
                                         data-src="http://b4-q.mafengwo.net/s5/M00/7B/B1/wKgB3FCKXOWANBs1AAch_2J_ejA26.jpeg?imageMogr2%2Fthumbnail%2F%21220x150r%2Fgravity%2FCenter%2Fcrop%2F%21220x150%2Fquality%2F90"
                                         data-rt-src="http://b4-q.mafengwo.net/s5/M00/7B/B1/wKgB3FCKXOWANBs1AAch_2J_ejA26.jpeg?imageMogr2%2Fthumbnail%2F%21440x300r%2Fgravity%2FCenter%2Fcrop%2F%21440x300%2Fquality%2F90"
                                         src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAANwAAACWBAMAAABHt/u4AAAAElBMVEX88tz8+uz89uz8/vz88uT8+vT1Qw6wAAABEUlEQVR4nO3YXa6CMBRF4crRETgR9OgInACJ85+LYJGfUogP3SSa9T2Y3JJ0edTbBEIAAAAAAAAAgP/j7os1c69ltUXPujVJ7+mZrT23WETceT6eyXL9zvOtPfceiniXbL51/FMyXgy1r9dhqYqhgybX7WnTUR79rLpcmHxTQ1qYm4w3lIW5MTKGlbnKFx+rMvc+XUIcrtkh1/+f+XRBmbP0LNHmPkdXnbmkyFlyUIpzITmr1bnkVJbnvr5Ejhw5cuTIkdvMrV4yQe60seW9eA0/7Ljxy7yVz60/z1A9ecgFj6LnOJ+7LL+Ma2dPb4aKGe7qcorX2mNl11pYHbDR1Dp7TTayXeYCAAAAAAAAAPyPF3yhZETFwUH1AAAAAElFTkSuQmCC">


                                </a>
                            </div>
                            <div class="tn-wrapper">
                                <dl>
                                    <dt>
                                        <a href="/i/1040889.html" target="_blank">心到达的地方，脚有一天也能到达——大理行 之 双廊古渔村</a>
                                    </dt>
                                    <dd>
                                        <a href="/i/1040889.html" target="_blank">心到达的地方，脚有一天也能到达——不能不去的 喜洲 古镇篇
                                            http://www.mafengwo.cn/i/1040416.html 站在 喜洲 镇口等去 双廊
                                            的车，一辆微型面包车停了下来，叫价15元/人，觉得还能接受便...</a>
                                    </dd>
                                </dl>
                                <div class="tn-extra">
                    <span class="tn-ding">
                        <a class="btn-ding" href="javascript:;" data-japp="articleding" data-iid="1040889"
                           data-vote="22407" rel="nofollow"></a>
                        <em id="topvote1040889">22407</em>
                    </span>
                                    <span class="tn-place"><i></i><a href="javascript:void(0);" class="_j_gs_item"
                                                                     rel="nofollow" data-name="双廊" data-objid="15950"
                                                                     data-type="2">双廊</a>，by</span>
                                    <span class="tn-user">
                        <a href="/u/5270797.html" target="_blank" rel="nofollow">
                            <img src="http://b4-q.mafengwo.net/s5/M00/7E/E6/wKgB3FDn3myAAQZeAAD15vEGH4009.jpeg?imageMogr2%2Fthumbnail%2F%2116x16r%2Fgravity%2FCenter%2Fcrop%2F%2116x16%2Fquality%2F90">
                            Jasmine妍
                        </a>
                    </span>
                                    <span class="tn-nums"><i></i>119334/382</span>
                                </div>
                            </div>
                        </div>
                        <div class="tn-item clearfix">
                            <div class="tn-image">
                                <a href="/i/6677546.html" target="_blank">
                                    <img class=""
                                         data-src="http://c4-q.mafengwo.net/s10/M00/75/54/wKgBZ1inM0qAPWFKAAtQNSvuPok37.jpeg?imageMogr2%2Fthumbnail%2F%21220x150r%2Fgravity%2FCenter%2Fcrop%2F%21220x150%2Fquality%2F90"
                                         data-rt-src="http://c4-q.mafengwo.net/s10/M00/75/54/wKgBZ1inM0qAPWFKAAtQNSvuPok37.jpeg?imageMogr2%2Fthumbnail%2F%21440x300r%2Fgravity%2FCenter%2Fcrop%2F%21440x300%2Fquality%2F90"
                                         src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAANwAAACWBAMAAABHt/u4AAAAElBMVEX88tz8+uz89uz8/vz88uT8+vT1Qw6wAAABEUlEQVR4nO3YXa6CMBRF4crRETgR9OgInACJ85+LYJGfUogP3SSa9T2Y3JJ0edTbBEIAAAAAAAAAgP/j7os1c69ltUXPujVJ7+mZrT23WETceT6eyXL9zvOtPfceiniXbL51/FMyXgy1r9dhqYqhgybX7WnTUR79rLpcmHxTQ1qYm4w3lIW5MTKGlbnKFx+rMvc+XUIcrtkh1/+f+XRBmbP0LNHmPkdXnbmkyFlyUIpzITmr1bnkVJbnvr5Ejhw5cuTIkdvMrV4yQe60seW9eA0/7Ljxy7yVz60/z1A9ecgFj6LnOJ+7LL+Ma2dPb4aKGe7qcorX2mNl11pYHbDR1Dp7TTayXeYCAAAAAAAAAPyPF3yhZETFwUH1AAAAAElFTkSuQmCC">


                                </a>
                            </div>
                            <div class="tn-wrapper">
                                <dl>
                                    <dt>
                                        <a href="/i/6677546.html" target="_blank">【我的赤足旅行】加拿大——自然与城市完美融合的国度</a>
                                    </dt>
                                    <dd>
                                        <a href="/i/6677546.html" target="_blank"> 先放几张加拿大之行的照片给大家一个感性的印象。
                                            ---------------------------------------------------------------------------------------------------------
                                            久违了，蚂蜂窝。 2015年...</a>
                                    </dd>
                                </dl>
                                <div class="tn-extra">
                    <span class="tn-ding">
                        <a class="btn-ding" href="javascript:;" data-japp="articleding" data-iid="6677546"
                           data-vote="123" rel="nofollow"></a>
                        <em id="topvote6677546">123</em>
                    </span>
                                    <span class="tn-place"><i></i><a href="javascript:void(0);" class="_j_gs_item"
                                                                     rel="nofollow" data-name="加拿大" data-objid="10177"
                                                                     data-type="2">加拿大</a>，by</span>
                                    <span class="tn-user">
                        <a href="/u/5532583.html" target="_blank" rel="nofollow">
                            <img src="http://b2-q.mafengwo.net/s5/M00/3A/1F/wKgB3FE3bMeAAivJAALPo41GMi030.jpeg?imageMogr2%2Fthumbnail%2F%2116x16r%2Fgravity%2FCenter%2Fcrop%2F%2116x16%2Fquality%2F90">
                            宁乐熙
                        </a>
                    </span>
                                    <span class="tn-nums"><i></i>3239/186</span>
                                </div>
                            </div>
                        </div>
                        <div class="tn-item clearfix">
                            <div class="tn-image">
                                <a href="/i/6513014.html" target="_blank">
                                    <img class=""
                                         data-src="http://n1-q.mafengwo.net/s9/M00/F8/37/wKgBs1gIzcmARoBTAAv41g6ucGU82.jpeg?imageMogr2%2Fthumbnail%2F%21220x150r%2Fgravity%2FCenter%2Fcrop%2F%21220x150%2Fquality%2F90"
                                         data-rt-src="http://n1-q.mafengwo.net/s9/M00/F8/37/wKgBs1gIzcmARoBTAAv41g6ucGU82.jpeg?imageMogr2%2Fthumbnail%2F%21440x300r%2Fgravity%2FCenter%2Fcrop%2F%21440x300%2Fquality%2F90"
                                         src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAANwAAACWBAMAAABHt/u4AAAAElBMVEX88tz8+uz89uz8/vz88uT8+vT1Qw6wAAABEUlEQVR4nO3YXa6CMBRF4crRETgR9OgInACJ85+LYJGfUogP3SSa9T2Y3JJ0edTbBEIAAAAAAAAAgP/j7os1c69ltUXPujVJ7+mZrT23WETceT6eyXL9zvOtPfceiniXbL51/FMyXgy1r9dhqYqhgybX7WnTUR79rLpcmHxTQ1qYm4w3lIW5MTKGlbnKFx+rMvc+XUIcrtkh1/+f+XRBmbP0LNHmPkdXnbmkyFlyUIpzITmr1bnkVJbnvr5Ejhw5cuTIkdvMrV4yQe60seW9eA0/7Ljxy7yVz60/z1A9ecgFj6LnOJ+7LL+Ma2dPb4aKGe7qcorX2mNl11pYHbDR1Dp7TTayXeYCAAAAAAAAAPyPF3yhZETFwUH1AAAAAElFTkSuQmCC">


                                </a>
                            </div>
                            <div class="tn-wrapper">
                                <dl>
                                    <dt>
                                        <a href="/i/6513014.html" target="_blank">【釜山-大邱 5日“台风”之旅】明知山有釜，偏向釜山行</a>
                                    </dt>
                                    <dd>
                                        <a href="/i/6513014.html" target="_blank">每到逢年过节，网络上有这样一种调侃，是这样滴： “月薪3~5万高端大气 欧洲
                                            游您敞开了去 月薪2~3万低端 欧洲 游您随便 月薪1万 东南亚 各国您瞅准了再去 月薪5000~1万请选择国内游 月薪低...</a>
                                    </dd>
                                </dl>
                                <div class="tn-extra">
                    <span class="tn-ding">
                        <a class="btn-ding" href="javascript:;" data-japp="articleding" data-iid="6513014"
                           data-vote="2090" rel="nofollow"></a>
                        <em id="topvote6513014">2090</em>
                    </span>
                                    <span class="tn-place"><i></i><a href="javascript:void(0);" class="_j_gs_item"
                                                                     rel="nofollow" data-name="釜山" data-objid="11025"
                                                                     data-type="2">釜山</a>，by</span>
                                    <span class="tn-user">
                        <a href="/u/5673085.html" target="_blank" rel="nofollow">
                            <img src="http://n1-q.mafengwo.net/s8/M00/2A/59/wKgBpVWmO0qAepZJAAYo31vN3rA72.jpeg?imageMogr2%2Fthumbnail%2F%2116x16r%2Fgravity%2FCenter%2Fcrop%2F%2116x16%2Fquality%2F90">
                            约约皮
                        </a>
                    </span>
                                    <span class="tn-nums"><i></i>38278/277</span>
                                </div>
                            </div>
                        </div>
                        <div class="tn-item clearfix">
                            <div class="tn-image">
                                <a href="/i/5391237.html" target="_blank">
                                    <img class=""
                                         data-src="http://n2-q.mafengwo.net/s9/M00/AC/F1/wKgBs1a-mkeAd5o4AAbpsS5uSFw82.jpeg?imageMogr2%2Fthumbnail%2F%21220x150r%2Fgravity%2FCenter%2Fcrop%2F%21220x150%2Fquality%2F90"
                                         data-rt-src="http://n2-q.mafengwo.net/s9/M00/AC/F1/wKgBs1a-mkeAd5o4AAbpsS5uSFw82.jpeg?imageMogr2%2Fthumbnail%2F%21440x300r%2Fgravity%2FCenter%2Fcrop%2F%21440x300%2Fquality%2F90"
                                         src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAANwAAACWBAMAAABHt/u4AAAAElBMVEX88tz8+uz89uz8/vz88uT8+vT1Qw6wAAABEUlEQVR4nO3YXa6CMBRF4crRETgR9OgInACJ85+LYJGfUogP3SSa9T2Y3JJ0edTbBEIAAAAAAAAAgP/j7os1c69ltUXPujVJ7+mZrT23WETceT6eyXL9zvOtPfceiniXbL51/FMyXgy1r9dhqYqhgybX7WnTUR79rLpcmHxTQ1qYm4w3lIW5MTKGlbnKFx+rMvc+XUIcrtkh1/+f+XRBmbP0LNHmPkdXnbmkyFlyUIpzITmr1bnkVJbnvr5Ejhw5cuTIkdvMrV4yQe60seW9eA0/7Ljxy7yVz60/z1A9ecgFj6LnOJ+7LL+Ma2dPb4aKGe7qcorX2mNl11pYHbDR1Dp7TTayXeYCAAAAAAAAAPyPF3yhZETFwUH1AAAAAElFTkSuQmCC">


                                </a>
                            </div>
                            <div class="tn-wrapper">
                                <dl>
                                    <dt>
                                        <a href="/i/5391237.html" target="_blank">两小乐高迷玩转马来西亚新山乐高乐园（最全介绍）</a>
                                    </dt>
                                    <dd>
                                        <a href="/i/5391237.html" target="_blank"> 杰宝自从知道了自己最喜欢心仪的LEGO玩具在 马来西亚
                                            有乐园，整天就开始在我面前念叨，如同唐僧一般。可是作为老妈的我，一直没有勇气带他到 马来西亚 来，为啥，大家都懂的。 在带着杰宝...</a>
                                    </dd>
                                </dl>
                                <div class="tn-extra">
                    <span class="tn-ding">
                        <a class="btn-ding" href="javascript:;" data-japp="articleding" data-iid="5391237"
                           data-vote="136" rel="nofollow"></a>
                        <em id="topvote5391237">136</em>
                    </span>
                                    <span class="tn-place"><i></i><a href="javascript:void(0);" class="_j_gs_item"
                                                                     rel="nofollow" data-name="马来西亚" data-objid="10097"
                                                                     data-type="2">马来西亚</a>，by</span>
                                    <span class="tn-user">
                        <a href="/u/19853559.html" target="_blank" rel="nofollow">
                            <img src="http://b4-q.mafengwo.net/s9/M00/98/CF/wKgBs1fJMUCAGcHiAAd9P5TgwbM17.jpeg?imageMogr2%2Fthumbnail%2F%2116x16r%2Fgravity%2FCenter%2Fcrop%2F%2116x16%2Fquality%2F90">
                            思量
                        </a>
                    </span>
                                    <span class="tn-nums"><i></i>8671/18</span>
                                </div>
                            </div>
                        </div>
                        <div class="tn-item clearfix">
                            <div class="tn-image">
                                <a href="/i/1098999.html" target="_blank">
                                    <img class=""
                                         data-src="http://b3-q.mafengwo.net/s5/M00/6F/9D/wKgB3FDsQmSAAjvJAAIfz06_q2s66.jpeg?imageMogr2%2Fthumbnail%2F%21220x150r%2Fgravity%2FCenter%2Fcrop%2F%21220x150%2Fquality%2F90"
                                         data-rt-src="http://b3-q.mafengwo.net/s5/M00/6F/9D/wKgB3FDsQmSAAjvJAAIfz06_q2s66.jpeg?imageMogr2%2Fthumbnail%2F%21440x300r%2Fgravity%2FCenter%2Fcrop%2F%21440x300%2Fquality%2F90"
                                         src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAANwAAACWBAMAAABHt/u4AAAAElBMVEX88tz8+uz89uz8/vz88uT8+vT1Qw6wAAABEUlEQVR4nO3YXa6CMBRF4crRETgR9OgInACJ85+LYJGfUogP3SSa9T2Y3JJ0edTbBEIAAAAAAAAAgP/j7os1c69ltUXPujVJ7+mZrT23WETceT6eyXL9zvOtPfceiniXbL51/FMyXgy1r9dhqYqhgybX7WnTUR79rLpcmHxTQ1qYm4w3lIW5MTKGlbnKFx+rMvc+XUIcrtkh1/+f+XRBmbP0LNHmPkdXnbmkyFlyUIpzITmr1bnkVJbnvr5Ejhw5cuTIkdvMrV4yQe60seW9eA0/7Ljxy7yVz60/z1A9ecgFj6LnOJ+7LL+Ma2dPb4aKGe7qcorX2mNl11pYHbDR1Dp7TTayXeYCAAAAAAAAAPyPF3yhZETFwUH1AAAAAElFTkSuQmCC">


                                </a>
                            </div>
                            <div class="tn-wrapper">
                                <dl>
                                    <dt>
                                        <a href="/i/1098999.html" target="_blank">一页凤凰——我和疯子的小镇行摄（张家界更新完毕）</a>
                                    </dt>
                                    <dd>
                                        <a href="/i/1098999.html" target="_blank"> 阔别八年，她早已不是当年的模样。 只因为一句志同道合的邀约，
                                            于是背上行囊，和疯子一起出发。 去看看冬日的凤凰是什么模样。 我发现，真的是如此， 很多在我们生命中出现过的人， 渐渐地...</a>
                                    </dd>
                                </dl>
                                <div class="tn-extra">
                    <span class="tn-ding">
                        <a class="btn-ding" href="javascript:;" data-japp="articleding" data-iid="1098999"
                           data-vote="23848" rel="nofollow"></a>
                        <em id="topvote1098999">23848</em>
                    </span>
                                    <span class="tn-place"><i></i><a href="javascript:void(0);" class="_j_gs_item"
                                                                     rel="nofollow" data-name="凤凰" data-objid="10024"
                                                                     data-type="2">凤凰</a>，by</span>
                                    <span class="tn-user">
                        <a href="/u/5242253.html" target="_blank" rel="nofollow">
                            <img src="http://b3-q.mafengwo.net/s4/M00/B1/61/wKgByU_Cycv3IeRQAAB7JaGPKgc67.jpeg?imageMogr2%2Fthumbnail%2F%2116x16r%2Fgravity%2FCenter%2Fcrop%2F%2116x16%2Fquality%2F90">
                            爱旅行的Y小姐
                        </a>
                    </span>
                                    <span class="tn-nums"><i></i>242746/1779</span>
                                </div>
                            </div>
                        </div>--%>

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

<div class="mfw-toolbar" id="_j_mfwtoolbar" style="display: block;">
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