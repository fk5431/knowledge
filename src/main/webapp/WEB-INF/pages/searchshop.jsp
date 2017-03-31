<%@ page import="java.util.List" %>
<%@ page import="com.fk.bean.*" %>
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
    <link href="${pageContext.request.contextPath}/css/content_list_1.css"
          rel="stylesheet" type="text/css">

    <link href="${pageContext.request.contextPath}/css/content_list_2.css"
          rel="stylesheet" type="text/css">
    <script src="${pageContext.request.contextPath}/js/content_list_1.js"></script>
</head>
<body style="position: relative;">
<a name="top_top"id="top_top"></a>
<div id="header">
    <div class="mfw-header">
        <div class="header-wrap clearfix">
            <div class="head-logo"><a class="mfw-logo" title="蚂蜂窝自由行" href="${pageContext.request.contextPath}"></a>
            </div>
            <ul class="head-nav" data-cs-t="headnav" id="_j_head_nav">
                <li class="head-nav-index head-nav-active" id="head_1"><a
                        href="${pageContext.request.contextPath}/index">首页</a>
                </li>
                <li class="head-nav-place" id="head_2"><a href="${pageContext.request.contextPath}/mdd" title="目的地">目的地</a>
                </li>
                <li class="head-nav-gonglve" id="head_3"><a href="${pageContext.request.contextPath}/content_list"
                                                            title="旅游攻略">旅游攻略</a>
                </li>
                <li class="head-nav-place" id="_j_nav_sales" >
                    <a href="${pageContext.request.contextPath}/sales"
                       data-sales-nav="穷游商城">
                        <span>穷游商城<%--<i class="icon-caret-down"></i>--%></span>
                    </a>
                </li>
                <li class="head-nav-place" id="head_4"><a href="#"
                                                          title="论坛">论坛</a>
                </li>
                <li class="head-nav-place" id="_j_nav_community">
                    <a href="" title="留言薄">留言薄</a>
                </li>

            </ul>
            <div id="pagelet-block-abb1ca45f330cf8a24ad20466d690c67" class="pagelet-block">
                <div class="login-out">
                    <% String login = (String)request.getAttribute("login");
                        if(login == null || "".equals(login) || !"yes".equals(login)){ %>
                    <a id="_j_showlogin" title="登录" href="${pageContext.request.contextPath}/login"
                       rel="nofollow">登录</a>
                    <span class="split">|</span>
                    <a href="${pageContext.request.contextPath}/register" title="注册帐号"
                       rel="nofollow">注册</a>
                    <span class="split">|</span>
                    <a href="${pageContext.request.contextPath}/forget" title="找回密码"
                       rel="nofollow">找回密码</a>
                    <%}else{%>
                    <a id="_j_showlogin" title="我的" href="${pageContext.request.contextPath}/my"
                       rel="nofollow">我的</a>
                    <span class="split">|</span>
                    <a href="${pageContext.request.contextPath}/logout" title="注册帐号"
                       rel="nofollow">登出</a>
                    <%}%>
                </div>
            </div>
        </div>
        <div class="shadow"></div>
    </div>
</div>


<div class="wrapper">
    <div class="gonglve_wrap clearfix">
        <div class="cont-main _j_feed_list" >
            <div class="hd clearfix">
                <h3></h3>
            </div>
            <div class="gl-post">
                <div data-cs-t="gonglve_feed" class="_j_feed_data" >

                    <%
                        List<OrdersBean> travel = (List) request.getAttribute("travel");
                        for(int i=0;i<travel.size();i++){
                    %>


                    <div class="feed-item _j_feed_item">
                        <a href="${pageContext.request.contextPath}/shop?id=<%=travel.get(i).getId()%>" >
                            <div class="bar clearfix">
                                <span class="stat"><span class="num"><%=travel.get(i).getSellcount()%></span> 穷游客买过<i class="icon-hand"></i></span>
                            </div>
                            <div class="title">
                                <%=travel.get(i).getTitle()%>
                            </div>
                            <dl class="art clearfix">
                                <dt>
                                    <img src="<%=travel.get(i).getImage()%>" width="220" height="150">
                                </dt>
                                <dd>
                                    <div class="info">
                                        <%=travel.get(i).getCost()%>
                                    </div>
                                    <span class="art-tag"><%=travel.get(i).getSubject()%></span>
                                    <div class="ext-r"><span class="nums"><%=travel.get(i).getCount()%>浏览</span></div>
                                </dd>
                            </dl>
                        </a>
                    </div>
                    <div class="hr"></div>
                    <% } %>
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
                        <a class="pi _j_pageitem" href="${pageContext.request.contextPath}/search?page=<%=i%>&indexsearch=${indexsearch}&key=${key}"><%=i%></a>
                        <%
                                }
                            }
                        %>
                        <a class="pg-next _j_pageitem" href="${pageContext.request.contextPath}/search?page=${pageNow+1}&indexsearch=${indexsearch}&key=${key}">下一页 &gt;&gt;</a>
                    </div>

                </div>
            </div>
        </div>
        <div class="sidebar">
            <div class="side-hd">穷游游攻略导航</div>
            <div class="nav-drop">
                <div class="drop-item">
                    <div class="trigger"><i></i>国内</div>
                    <div class="drop-pop">
                        <div class="inner">
                            <ul>
                                <%
                                    List<ProvinceBean> list = (List) request.getAttribute("province");
                                    List<ContinentBean> list1 = (List) request.getAttribute("continent");
                                    List<TypeBean> type = (List) request.getAttribute("type");
                                    for (int i = 0; i <list.size(); i++) {
                                %>
                                <li><a href="${pageContext.request.contextPath}/search?indexsearch=pro&key=<%=list.get(i).getId()%>"><%=list.get(i).getProvince()%>(<%=list.get(i).getCount()%>)</a></li>
                                <% }%>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="drop-item">
                    <div class="trigger"><i></i>国外</div>
                    <div class="drop-pop">
                        <div class="inner">
                            <ul>
                                <%
                                    for (int i = 0; i <list1.size(); i++) {
                                %>
                                <li><a href="${pageContext.request.contextPath}/search?indexsearch=con&key=<%=list1.get(i).getId()%>"><%=list1.get(i).getContinent()%>(<%=list1.get(i).getCount()%>)</a></li>

                                <% } %>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="drop-item">
                    <div class="trigger"><i></i>主题</div>
                    <div class="drop-pop">
                        <div class="inner">
                            <ul>
                                <%
                                    for (int i = 0; i <type.size(); i++) {
                                %>
                                <li><a href="${pageContext.request.contextPath}/search?indexsearch=type&key=<%=type.get(i).getId()%>"><%=type.get(i).getType()%>(<%=type.get(i).getCount()%>)</a></li>
                               <%}%>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="rank">
                <ul>
                    <li class="gl_list">
                        <a href="${pageContext.request.contextPath}/searchtravelplace?place=普吉岛" title="普吉岛" target="_blank">
                            <img src="${pageContext.request.contextPath}/images/ttt.jpeg" alt="普吉岛">
                        </a>
                        <div class="down_cout">
                            <span></span>
                        </div>
                    </li>
                    <li>
                        <span class="num">2</span>
                        <a href="${pageContext.request.contextPath}/searchtravelplace?place=日本" title="日本" target="_blank">日本</a>
                    </li>
                    <li>
                        <span class="num">3</span>
                        <a href="${pageContext.request.contextPath}/searchtravelplace?place=泰国" title="泰国" target="_blank">泰国</a>
                    </li>
                    <li>
                        <span class="num">4</span>
                        <a href="${pageContext.request.contextPath}/searchtravelplace?place=京都" title="京都" target="_blank">京都</a>
                    </li>
                    <li>
                        <span class="num">5</span>
                        <a href="${pageContext.request.contextPath}/searchtravelplace?place=成都" title="成都" target="_blank">成都</a>
                    </li>
                    <li>
                        <span class="num">6</span>
                        <a href="${pageContext.request.contextPath}/searchtravelplace?place=东京" title="东京" target="_blank">东京</a>
                    </li>
                    <li>
                        <span class="num">7</span>
                        <a href="${pageContext.request.contextPath}/searchtravelplace?place=大阪" title="大阪" target="_blank">大阪</a>
                    </li>
                    <li>
                        <span class="num">8</span>
                        <a href="${pageContext.request.contextPath}/searchtravelplace?place=厦门" title="厦门" target="_blank">厦门</a>
                    </li>
                    <li>
                        <span class="num">9</span>
                        <a href="${pageContext.request.contextPath}/searchtravelplace?place=曼谷" title="曼谷" target="_blank">曼谷</a>
                    </li>
                    <li>
                        <span class="num">10</span>
                        <a href="${pageContext.request.contextPath}/searchtravelplace?place=大理" title="大理" target="_blank">大理</a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="clear"></div>

    </div>
</div>
<script language="javascript" type="text/javascript">
    $(function () {
        //攻略分类
        $('.drop-item').find('.trigger').click(function(){
            $(this).closest('.drop-item').toggleClass('drop-open').siblings('.drop-item').removeClass('drop-open');
        });
        //ie placeholder 兼容
        var doc=document,inputs=doc.getElementsByTagName('input'),supportPlaceholder='placeholder'in doc.createElement('input'),placeholder=function(input){
            var text=input.getAttribute('placeholder'),defaultValue=input.defaultValue;
            if(defaultValue==''){
                input.value=text
            }input.onfocus=function(){
                if(input.value===text){
                    this.value=''}
            };
            input.onblur=function(){
                if(input.value===''){
                    this.value=text
                }
            }
        };

        if(!supportPlaceholder){
            for(var i=0,len=inputs.length;i<len;i++){
                var input=inputs[i],text=input.getAttribute('placeholder');
                if(input.type==='text'&&text){
                    placeholder(input)
                }
            }
        }


        M.closure(function(require) {
            //搜索suggest
            var Suggestion = require('Suggestion')
            var SuggestionHandle = new Suggestion({
                'keyParamName': 'keyword',
                'url': '/gonglve/ajax_book_search.php?act=search',
                'input': $('#search_word'),
                'listContainer': $('#search_result'),
                'listFirstItemHover': true,
                'listItemSelector' : '.sr-item',
                'handleSuggest': function(res) {
                    var html = '';
                    if(res.ret==1 && res.msg && res.msg.length){
                        var keyword = $('#search_word').val();
                        this.listContainer.removeClass('no_gl').addClass('search_resu');
                        html = '<ul data-cs-t="攻略搜索" data-cs-p="p">';
                        for(var i in res.msg){
                            var item = res.msg[i];
                            item.value = item.value.replace(keyword,'<b class="highlight">'+keyword+'</b>');
                            html += '<li><em><a href="#'+item.type+'-'+item.id+'.html" style="color: #666" >'+item.value+'</a></em></li>'; //data-cs-l="/gonglve/'+item.type+'-'+item.id+'.html"
                        }
                        html += '<div class="clear"></div></ul>';

                    } else {
                        this.listContainer.addClass('no_gl').removeClass('search_resu');
                        html = '<strong>此攻略还没有上线，敬请期待</strong>';
                    }
                    return html;
                }
            });

            //banner滚动
            var Slider = require('Slider');
            var scrollTime = 500,
                stopTime = 3000,
                focus = false,
                topPicSlideCnt = $('#slide_box'),
                btnCnt = $('#thumb_box'),
                slideList = topPicSlideCnt.children('li'),
                listLength = slideList.length;

            var topPicSlider = new Slider({
                'slideCnt': topPicSlideCnt,
                'slideList': slideList,
                'slideTime': scrollTime,
                'indexer': btnCnt.children('li')
            });
            topPicSlideCnt.add(btnCnt)
                .bind('mouseenter', function() { focus = true; })
                .bind('mouseleave', function() { focus = false; })
                .bind('mouseover', function() { focus = true; });

            //自动播放
            setInterval(function() {
                if(!focus && M.windowFocused) {
                    if(topPicSlider.index < listLength) {
                        topPicSlider.toIndex(topPicSlider.index + 1);
                    } else {
                        topPicSlider.toIndex(1);
                    }
                }
            }, stopTime);

            //目的地菜单效果
            require('jq-menuAim');
            $('.gonglve-nav').menuAim({
                rowSelector: ' .nav-item',
                tolerance: 350,
                activate: function(row) {
                    $(row).addClass('hover');
                },
                deactivate: function(row) {
                    $(row).removeClass('hover');
                }
            });

            // add log && feed more
            var $gHeight = $('#slide_box').height() + $('.gonglve_wrap').height() + 60 - 550,
                firstAdd = true,
                $glpost = $('.gl-post'),
                readFid = [],
                clickFid = [],
                feedArray = $('._j_feed_data').eq(0).data('feed'),
                wHeight = $(window).height(),
                ids = $('._j_feed_list').data('ids'),
                rendTime;

            feedPosition();

            $(window).scroll(function() {
                // log
                if(rendTime){
                    clearInterval(rendTime);
                }
                var sTop = $(this).scrollTop();
                rendTime = setTimeout(function(){
                    getFidBySTop(sTop);
                },100);

                // more
                if(firstAdd && sTop >= $gHeight){
                    firstAdd = false;
                    addMore(true);
                }
            });

            // log
            $('._j_feed_list').delegate('._j_feed_item','click',function(ev){
                var fid = Number($(ev.currentTarget).data('fid')),
                    type = $(ev.currentTarget).data('type');
                if(fid){
                    if($.inArray(fid,readFid) === -1){
                        readFid.push(fid);
                        commitNewReadFid(fid,type,0);
                    }
                    if($.inArray(fid,clickFid) === -1){
                        clickFid.push(fid);
                        commitNewReadFid(fid,type,1);
                    }
                }
            });

            // more
            $glpost.delegate('._j_page_loader','click',function(){
                addMore(false);
            });

            function addMore(first){
                var $this=$('._j_page_loader');
                if (!$this.data('loading')) {
                    $this.addClass('loader');
                    $this.data('loading', 1).text('加载中. . .');
                    if(first){
                        setTimeout(function(){
                            ajaxMore($this);
                        },500);
                    }else{
                        ajaxMore($this);
                    }
                }
            }

            function ajaxMore($this){
                var page = $this.data('page');
                $.post('/gonglve/', {
                    'page': page,
                    'ids':ids
                }, function (ret) {
                    $this.removeClass('loader');
                    $this.remove();
                    $glpost.append('<div class="_j_add_chat" style="position: absolute;visibility: hidden;z-index: -1;">'+ret+'</div>');
                    var addFeedData = $('._j_feed_data').eq(page).data('feed');
                    if(addFeedData)
                        feedArray = feedArray.concat(addFeedData);
                    if(feedPosition()){
                        $('._j_add_chat').remove();
                        $glpost.append(ret);
                    }
                });
            }

            function feedPosition(){
                for(var i = 0; i < feedArray.length; i++){
                    feedArray[i]['height'] = $('._j_feed_item').eq(i).height() + 20;
                    feedArray[i]['top'] = $('._j_feed_item').eq(i).offset().top;
                }
                return true;
            }

            function getFidBySTop(sTop){
                wHeight = $(window).height();
                var fid,type;
                for(var i = 0; i < feedArray.length; i++){
                    var height = feedArray[i].height,
                        top = feedArray[i].top;
                    if((wHeight + sTop) > (height + top) &&  sTop < top){
                        fid = Number(feedArray[i].fid);
                        type = feedArray[i].type;
                        if(fid && $.inArray(fid,readFid) === -1){
                            readFid.push(fid);
                            commitNewReadFid(fid,type,0);
                        }
                    }
                }
            }

            function commitNewReadFid(fid,type,handleType){
                mfwPageEvent('mdd','gonglve_feed_show',{
                    'fid':fid,
                    'type':type,
                    'handle_type':handleType
                });
            }
        });

    });
</script>
<link href="${pageContext.request.contextPath}/css/content_list_3.css" rel="stylesheet" type="text/css"/>

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


<link href="${pageContext.request.contextPath}/css/content_3.css" rel="stylesheet" type="text/css"/>

<div class="mfw-toolbar" style="display: block;position: fixed;">
    <div class="toolbar-item-top" style="display: block;">
        <a href="#top_top" class="btn _j_gotop">
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
        M.loadResource("${pageContext.request.contextPath}/js/content_2.js");
    }
</script>

<script>
    var state = ${index};
    if (state == 0) {
        document.getElementById('head_1').className = 'head-nav-index';
        document.getElementById('head_2').className = 'head-nav-place';
        document.getElementById('head_3').className = 'head-nav-gonglve';
        document.getElementById('_j_nav_sales').className = 'head-nav-place ';
        document.getElementById('head_4').className = 'head-nav-hotel';
        document.getElementById('_j_nav_community').className = 'head-nav-place';
    }
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