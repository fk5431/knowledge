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
    <link href="${pageContext.request.contextPath}/css/content_1.css"
          rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/css/content_2.css"
          rel="stylesheet" type="text/css">
    <script language="javascript"
            src="${pageContext.request.contextPath}/js/content_1.js"
            type="text/javascript"></script>
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
                <li class="head-nav-place" id="head_2"><a href="http://www.mafengwo.cn/mdd/"
                                                          title="目的地">目的地</a>
                </li>
                <li class="head-nav-gonglve" id="head_3"><a href="${pageContext.request.contextPath}/context"
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

<%--begin--%>
<div class="container clearfix">
    <div class="col-main">
        <div class="crumb"><a href="/gonglve/">旅游攻略首页</a> > ${travel.title}</div>
        <h1 class="art-title">${travel.title}</h1>
        <div class="art-meta">
            <span>${travel.time}</span>
        </div>
        <div class="art-content">
            ${travel.context}

            <a href="http://m.mafengwo.cn/nb/public/sharejump.php?type=3&amp;id=14865528&amp;poi_type_id=1" class="poi" target="_blank">
                <dl>
                    <dt><img src="http://n4-s.mafengwo.net/c_lfill,w_220,h_150,q_100/s9/M00/81/86/wKgBs1e5geeAIwoHAAEgMK80Lls57.jpeg" width="220" height="150"></dt>
                    <dd>
                        <p class="t1">一幸庵</p>
                        <p class="t2"></p>
                        <div class="t3"></div>
                        <div class="t4">
                            <span>面包甜品</span>
                            东京
                        </div>
                    </dd>
                </dl>
                <div class="desc">
                    <strong>美食介绍</strong>他家的羊羹等在和果子界占有一席之地</div>
            </a>
            <a href="http://m.mafengwo.cn/nb/public/sharejump.php?type=3&amp;id=14878603&amp;poi_type_id=1" class="poi" target="_blank">
                <dl>
                    <dt><img src="http://a2-q.mafengwo.net/s9/M00/6F/EA/wKgBs1cxk-qADjm2AAUTgSgpUPo59.jpeg?imageMogr2%2Fthumbnail%2F%21220x150r%2Fgravity%2FCenter%2Fcrop%2F%21220x150%2Fquality%2F100" width="220" height="150"></dt>
                    <dd>
                        <p class="t1">大角玉屋</p>
                        <p class="t2"></p>
                        <div class="t3"></div>
                        <div class="t4">
                            <span>面包甜品</span>
                            东京
                        </div>
                    </dd>
                </dl>
                <div class="desc">
                    <strong>美食介绍</strong>人气和果子草莓大福的创始店</div>
            </a>
            <a href="http://m.mafengwo.cn/nb/public/sharejump.php?type=3&amp;id=5880250&amp;poi_type_id=1" class="poi" target="_blank">
                <dl>
                    <dt><img src="http://b4-q.mafengwo.net/s5/M00/6B/42/wKgB3FGv9q6Adnw7AALpR7n7cJs83.jpeg?imageMogr2%2Fthumbnail%2F%21220x150r%2Fgravity%2FCenter%2Fcrop%2F%21220x150%2Fquality%2F100" width="220" height="150"></dt>
                    <dd>
                        <p class="t1">老松(岚山店)</p>
                        <p class="t2"></p>
                        <div class="t3">
                            <strong>31</strong>蜂评/<strong>18</strong>游记提及</div>
                        <div class="t4">
                            <span>日本料理</span>
                            <span>小吃</span>
                            <span>连锁/加盟</span>
                            嵯峨野/岚山
                        </div>
                        <div class="price">￥48</div>
                    </dd>
                </dl>
                <div class="desc">
                    <strong>美食介绍</strong>特色京都老牌甜品店</div>
            </a>
            <a href="http://m.mafengwo.cn/nb/public/sharejump.php?type=3&amp;id=7346202&amp;poi_type_id=1" class="poi" target="_blank">
                <dl>
                    <dt><img src="http://n1-q.mafengwo.net/s6/M00/59/65/wKgB4lMW0KaAFF2TAABUnz6e56o20.jpeg?imageMogr2%2Fthumbnail%2F%21220x150r%2Fgravity%2FCenter%2Fcrop%2F%21220x150%2Fquality%2F100" width="220" height="150"></dt>
                    <dd>
                        <p class="t1">甘春堂(东店)</p>
                        <p class="t2">Kanshundo</p>
                        <div class="t3">
                            <strong>1</strong>蜂评/<strong>1</strong>游记提及</div>
                        <div class="t4">
                            <span>面包甜品</span>
                            东山
                        </div>
                    </dd>
                </dl>
                <div class="desc">
                    <strong>美食介绍</strong>历史悠久的和果子老店，可以学习亲手制作和果子</div>
            </a>
            <a href="http://m.mafengwo.cn/nb/public/sharejump.php?type=3&amp;id=6407130&amp;poi_type_id=1" class="poi" target="_blank">
                <dl>
                    <dt><img src="http://c3-q.mafengwo.net/s5/M00/20/B3/wKgB3FF18haAX3HoAA8723L4Fng37.jpeg?imageMogr2%2Fthumbnail%2F%21220x150r%2Fgravity%2FCenter%2Fcrop%2F%21220x150%2Fquality%2F100" width="220" height="150"></dt>
                    <dd>
                        <p class="t1">中村藤吉(本店)</p>
                        <p class="t2"></p>
                        <div class="t3">
                            <strong>62</strong>蜂评/<strong>23</strong>游记提及</div>
                        <div class="t4">
                            <span>特色饮品</span>
                            <span>日本料理</span>
                            <span>连锁/加盟</span>
                            <span>冰淇淋</span>
                            宇治
                        </div>
                        <div class="price">￥112</div>
                    </dd>
                </dl>
                <div class="desc">
                    <strong>美食介绍</strong>超人气的抹茶甜品店</div>
            </a>
            <a href="http://m.mafengwo.cn/nb/public/sharejump.php?type=3&amp;id=7346041&amp;poi_type_id=1" class="poi" target="_blank">
                <dl>
                    <dt><img src="http://a2-q.mafengwo.net/s6/M00/58/7A/wKgB4lMW0CGAHY3NAADWd_SbrMQ32.jpeg?imageMogr2%2Fthumbnail%2F%21220x150r%2Fgravity%2FCenter%2Fcrop%2F%21220x150%2Fquality%2F100" width="220" height="150"></dt>
                    <dd>
                        <p class="t1">键善良房本店</p>
                        <p class="t2">KAGIZEN</p>
                        <div class="t3">
                            <strong>1</strong>蜂评</div>
                        <div class="t4">
                            <span>面包甜品</span>

                        </div>
                    </dd>
                </dl>
                <div class="desc">
                    <strong>美食介绍</strong>味蕾与感官的双重体验 ，京都必吃和果子</div>
            </a>
            <a href="http://m.mafengwo.cn/nb/public/sharejump.php?type=3&amp;id=7896684&amp;poi_type_id=1" class="poi" target="_blank">
                <dl>
                    <dt><img src="http://b1-q.mafengwo.net/s6/M00/63/6A/wKgB4lMJqHiATh0nAAlRqnWGd5A25.jpeg?imageMogr2%2Fthumbnail%2F%21220x150r%2Fgravity%2FCenter%2Fcrop%2F%21220x150%2Fquality%2F100" width="220" height="150"></dt>
                    <dd>
                        <p class="t1">御菓子御殿(国際通りむつみ橋店)</p>
                        <p class="t2"></p>
                        <div class="t3">
                            <strong>70</strong>蜂评/<strong>9</strong>游记提及</div>
                        <div class="t4">
                            <span>小吃</span>
                            <span>连锁/加盟</span>
                            那霸
                        </div>
                    </dd>
                </dl></a>

            <h5>更多日本美食请戳《日本》攻略&gt;&gt;&gt;</h5>
            <div id="4" style=""></div>
            <h3 class="h2">说出你最爱的和果子</h3>

            <p>和果子这么多，那一款最戳中你的心呢？不妨留言说出来，看看有没有与你喜好相同的有缘人吧~</p>

        </div>
    </div>
    <div class="col-side">
    <div style="width:240px;position: fixed;">
        <div class="bar_share clearfix">
            <div class="bs_share">
                <a class="bs_btn" href="#">
                    <i></i><strong>分享</strong>
                </a>
                <div class="bs_pop">
                    <a title="分享到新浪微博" rel="nofollow" role="button" class="sina" data-japp="sns_share" data-jappfedata="" data-key="wb" data-title="只看一部纪录片，就知道去日本吃什么和果子啦！" data-content="
图：中村藤吉的抹茶蕨饼。 by kartzk
    如果让蚂小蜂列出日本旅行的必体验，“品尝和果子”一定是蚂小" data-pic="https://a2-q.mafengwo.net/s9/M00/F8/8F/wKgBs1eXFuiAcnU1AAGCyc0DbRI62.jpeg?imageView2%2F2%2Fw%2F900%2Fq%2F90%2Fformat%2Fjpeg" data-url="${pageContext.request.contextPath}"></a>
                    <a title="分享到QQ空间" rel="nofollow" role="button" class="zone" data-japp="sns_share" data-jappfedata="" data-key="qz" data-title="只看一部纪录片，就知道去日本吃什么和果子啦！" data-content="
图：中村藤吉的抹茶蕨饼。 by kartzk
    如果让蚂小蜂列出日本旅行的必体验，“品尝和果子”一定是蚂小" data-pic="https://a2-q.mafengwo.net/s9/M00/F8/8F/wKgBs1eXFuiAcnU1AAGCyc0DbRI62.jpeg?imageView2%2F2%2Fw%2F900%2Fq%2F90%2Fformat%2Fjpeg" data-url="${pageContext.request.contextPath}"></a>
                    <a title="分享到微信" rel="nofollow" role="button" class="weixin" data-japp="weixin_dialog_share" data-jappfedata="" data-wx_qr="http://www.mafengwo.cn/qrcode.php?text=http%3A%2F%2Fwww.mafengwo.cn%2Fweixin%2Farticle-567.html&size=150&eclevel=H&logo=&__stk__=070c07fd7cc4da080626f179b860bfa5_37363e8ffa4895701f34b9e0a4a54590"></a>
                </div>
            </div>
            <div class="bs_collect">
                <a class="bs_btn" href="${pageContext.request.contextPath}/count_context?id=${travel.id}">
                    <a href="${pageContext.request.contextPath}/count_context?id=${travel.id}"><i></i></a><span>${travel.count}</span><strong>喜欢</strong>
                </a>
            </div>
        </div>
        <div class="art-code"><img src="http://images.mafengwo.net/images/qrcode-weixin.gif"></div>
    </div>
    </div>
</div>

<script>
    M.closure(function(require) {
        $('.bs_share').on('mouseenter',function(){
            $('.bs_pop').css('display','block');
        }).on('mouseleave',function(){
            $('.bs_pop').css('display','none');
        });
        $('.bs_collect .bs_btn').on('click',function(event){
            event.preventDefault();
            var obj = $('.bs_collect');
            if (obj.hasClass('collected')){
                return false;
            }
            var id = obj.data('id');
            $.post("/weixin/article/like",{
                'id' : id
            },function(d){
                if(d.data.ret == -1){
                    window.location.href = '${pageContext.request.contextPath}';
                }
                else{
                    obj.addClass('collected');
                }
            },"json");
        });

        String.prototype.NoSpace = function()
        {
            return this.replace(/\s+/g, "");
        }

        var poiNum = $('.desc').length;
        if(poiNum){
            for(var i = 0; i < poiNum; i++){
                var descDiv = $('.desc').eq(i);
                descDiv.prev().append(descDiv.html());
                descDiv.hide();
                if(descDiv.prev().find('.t4')){
                    var html = descDiv.prev().find('.t4').text(),
                        childHtml = descDiv.prev().find('.t4').children('span').eq(0).text() + descDiv.prev().find('.t4').children('span').eq(1).text();
                    if(html.NoSpace() != childHtml.NoSpace()){
                        descDiv.prev().find('.t4').children('span').last().after('<i class="i-location"></i>');
                    }
                }
            }
        }
    });
</script>
<link href="${pageContext.request.contextPath}/css/content_4.css" rel="stylesheet" type="text/css"/>
<%--end--%>

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

<div class="mfw-toolbar" style="display: block; position: fixed;">
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