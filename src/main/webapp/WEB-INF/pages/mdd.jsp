<%--
  Created by IntelliJ IDEA.
  User: fengkai
  Date: 17/03/17
  Time: 14:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>目的地旅游攻略 - 蚂蜂窝</title>
    <link href="${pageContext.request.contextPath}/css/mdd/index.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/css/mdd/index1.css" rel="stylesheet" type="text/css"/>
    <script language="javascript" src="${pageContext.request.contextPath}/js/mdd/mdd_1.js"
            type="text/javascript"></script>
</head>
<body>
<div id="header">
    <div class="mfw-header">
        <div class="header-wrap clearfix">
            <div class="head-logo"><a class="mfw-logo" title="蚂蜂窝自由行" href="${pageContext.request.contextPath}"></a>
            </div>
            <ul class="head-nav" data-cs-t="headnav" id="_j_head_nav">
                <li class="head-nav-index head-nav-active" id="head_1"><a
                        href="${pageContext.request.contextPath}/index">首页</a>
                </li>
                <li class="head-nav-place" id="head_2"><a href="${pageContext.request.contextPath}/mdd"
                                                          title="目的地">目的地</a>
                </li>
                <li class="head-nav-gonglve" id="head_3"><a href="${pageContext.request.contextPath}/content_list"
                                                            title="旅游攻略">旅游攻略</a>
                </li>
                <li class="head-nav-place" id="_j_nav_sales">
                    <a href="${pageContext.request.contextPath}/sales"
                       data-sales-nav="穷游商城">
                        <span>穷游商城<%--<i class="icon-caret-down"></i>--%></span>
                    </a>
                </li>
                <li class="head-nav-place" id="head_4"><a href="${pageContext.request.contextPath}/index"
                                                          title="论坛">论坛</a>
                </li>
                <li class="head-nav-place" id="_j_nav_community">
                    <a href="${pageContext.request.contextPath}/index" title="留言薄">留言薄</a>
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

<script type="text/javascript">
    $("#header >").addClass("header-place-default").hover(function (e) {
        e.stopPropagation();
        $(this).removeClass('header-place-default');
    }, function (e) {
        e.stopPropagation();
        $(this).stop().css({
            opacity: 0.1
        }).addClass('header-place-default').animate({
            opacity: 1
        }, 300).find('.dropdown-group >').hide();
    });
</script>
<div class="container" data-cs-t="目的地首页">
    <div class="place-focus" data-cs-p="头图">
        <div class="show-banner show-info-notes">
            <div class="cover">
                <a class="bigimg" href="${pageContext.request.contextPath}/article?id=${travel.id}" target="_blank" data-cs-l="图片">
                    <img src='${travel.image}'/>
                    <div class="shade"></div>
                </a>
            </div>
            <div class="show-info show-info-sm">
                <div class="owner">
                </div>
                <div class="show-name">
                    <a href="${pageContext.request.contextPath}/article?id=${travel.id}" target="_blank" data-t="目的地">
                        <h2>${travel.title}</h2><span></span>
                    </a>
                </div>
                <p class="location">${travel.summary}</p>
                <div class="show-links">
                    <a href="${pageContext.request.contextPath}/article?id=${travel.id}" target="_blank">阅读全文</a>
                </div>
            </div>
            <div class="show-shadow"></div>
            <div class="show-ft">
                <div class="show-ft-item pic-from">
                    <i></i>
                    <div class="pic-from-pop">
                            <span>
                                <a target="_blank" data-t="作者">${travel.author}</a>
                                的作品
                            </span>
                        <em></em>
                    </div>
                </div>
            </div>
            <a class="show-arrdown" href="#" data-cs-l="锚点下箭头"></a>
        </div>
        <div class="place-search-panel place-search-panel-sm">
            <h2>Don't fear the unknown</h2>
            <form name="mdd-search-form" action="${pageContext.request.contextPath}/search" method="get">
                <div class="searchbar">
                    <input autocomplete="off" class="search-input" type="text" name="key" placeholder="我想去..."/>
                    <input hidden type="text" name="indexsearch" value="travel"/>
                    <a class="search-button" href="#" data-cs-l="搜索" role="button"><i class="icon-search"></i></a>
                </div>
            </form>
            <div class="search-suggest-panel search-suggest-place hide">
                <ul class="suggest-list">

                </ul>
            </div>
            <div class="place-search-hot">

            </div>
        </div>
    </div>
    <script type="text/javascript">
        //图片处理
        function loadImg(src, load) {
            $(new Image()).load(load)[0].src = src;
        }
        function coverPicLoad(img, $con, fitType, cropData) {
            var $img = $(img = img || this);
            if (typeof $con == "string" || typeof $con == "number") {
                fitType = $con;
                $con = $img.parent();
            } else if ($.type($con) != "object" || $.isPlainObject($con)) {
                $con = $img.parent();
            }
            var imagew = (img = $img[0]).naturalWidth, imageh = img.naturalHeight,
                offsetw = $con.width(),
                offseth = $con.height(),
                css = {};
            if (!imagew) {
                if ($img.attr("data-ow")) {
                    imagew = $img.attr("data-ow");
                    imageh = $img.attr("data-oh");
                } else {
                    $img.attr("data-ow", imagew = img.width);
                    $img.attr("data-oh", imageh = img.height);
                }
            }
            if (imagew / imageh >= offsetw / offseth) {
                if (imageh >= offseth || fitType == "1") {
                    css = {
                        margin: "0 0 0 " + (offsetw - imagew / (imageh / offseth)) / 2 + "px",
                        height: fitType == "1" ? "100%" : offseth,
                        width: "auto"
                    };
                } else if (imageh / offseth >= 0.95) {
                    css = {
                        margin: "0 0 0 " + (offsetw - imagew) / 2 + "px",
                        width: imagew,
                        height: offseth
                    };
                } else {
                    css = {
                        margin: (offseth - imageh) / 2 + "px 0 0 " + (offsetw - imagew) / 2 + "px",
                        width: "auto",
                        height: "auto"
                    };
                }
            } else {
                if (imagew >= offsetw || fitType == "1") {
                    css = {
                        margin: (offseth - imageh / (imagew / offsetw)) / 2 + "px 0 0 0",
                        width: fitType == "1" ? "100%" : offsetw,
                        height: "auto"
                    };
                } else if (imagew / offsetw >= 0.95) {
                    css = {
                        margin: (offseth - imageh) / 2 + "px 0 0 0",
                        width: offsetw,
                        height: imageh
                    };
                } else {
                    css = {
                        margin: (offseth - imageh) / 2 + "px 0 0 " + (offsetw - imagew) / 2 + "px",
                        width: "auto",
                        height: "auto"
                    };
                }
            }
            $img.css(css).appendTo($con);
        }
        //头图处理
        (function () {
            var $window = $(window),
                $banner = $('.place-focus'),
                $cover = $banner.find('.show-banner >.cover'),
                $coverc = $cover.find('a.bigimg'),
                img = $coverc.find('img'),
                $info = $banner.find('.show-info'),
                $searchPanel = $('.place-search-panel'),
                _resizetimeout;

            function calHeight() {
                var wh = $window.height(), ww = Math.max($banner.width(), $window.width());
                if (wh > ww * .8) {
                    return img.data('oh') / img.data('ow') * ww;
                } else {
                    return Math.max(wh - Math.max(Math.min(wh - 550, 150), 100), 400);
                }
            }

            $cover.height(calHeight());
            if (img[0].complete) {
                $cover.height('auto');
            } else {
                img.load(function () {
                    $cover.height('auto');
                });
            }
            var winH, winW;
            $window.bind('resize.bannerimg', function (e, t) {
                var height = $window.height();
                var width = $window.width();
                if (winH != height || winW != width) {
                    winH = height;
                    winW = width;
                    $info[$window.width() <= 1440 ? 'addClass' : 'removeClass']('show-info-sm');
                    $searchPanel[$window.width() <= 1440 ? 'addClass' : 'removeClass']('place-search-panel-sm');
                    coverPicLoad(img, $coverc.height(calHeight()), 1);
                }
            }).trigger("resize.bannerimg");
        })();

        /*头图用户信息显示*/
        var $uFrom = $('.pic-from'),
            $uFromPop = $uFrom.find('.pic-from-pop'),
            _oUFromPopw = $uFromPop.width();
        $uFrom.hover(function () {
            $uFromPop.stop(true).width(0).css({
                visibility: 'visible'
            }).animate({
                width: _oUFromPopw
            });
        }, function () {
            $uFromPop.stop(true).animate({
                width: 0
            }, function () {
                $(this).css('visibility', 'hidden');
            });
        });

        //向下滚动
        $('.show-arrdown').click(function (e) {
            e.preventDefault();
            var top = $('.row:first').offset().top;
            $('html,body').stop().animate({
                'scrollTop': top
            }, 300);
        });
        $('.show-links').find('.icon-arr').eq(0).hide();
    </script>


    <div class="row row-hot">
        <div class="wrapper">
            <div class="r-title"><h2>热门目的地</h2></div>
            <div class="r-navbar">
                <a class="on" href="javascript:void(0)">国内</a><span class="divide">|</span><a href="javascript:void(0)">港澳台</a><span
                    class="divide">|</span><a href="javascript:void(0)">日韩</a><span class="divide">|</span><a
                    href="javascript:void(0)">东南亚</a><span class="divide">|</span><a href="javascript:void(0)">南亚 西亚</a><span
                    class="divide">|</span><a href="javascript:void(0)">欧洲 美洲</a><span class="divide">|</span><a
                    href="javascript:void(0)">澳洲 非洲</a>
            </div>
            <div>
                <div class="hot-list clearfix">
                    <div class="col">
                        <dl>
                            <dt>直辖市</dt>
                            <dd>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=北京" target="_blank">北京</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=上海" target="_blank">上海</a>

                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=重庆" target="_blank">重庆</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=天津" target="_blank">天津</a>
                            </dd>
                        </dl>
                        <dl>
                            <dt><a href="${pageContext.request.contextPath}/searchtravelplace?place=云南" target="_blank">云南</a></dt>
                            <dd>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=丽江" target="_blank">丽江</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=大理" target="_blank">大理</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=昆明" target="_blank">昆明</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=香格里拉" target="_blank">香格里拉</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=泸沽湖" target="_blank">泸沽湖</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=双廊" target="_blank">双廊</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=西双版纳" target="_blank">西双版纳</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=束河" target="_blank">束河</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=腾冲" target="_blank">腾冲</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=雨崩" target="_blank">雨崩</a>
                            </dd>
                        </dl>
                        <dl>
                            <dt><a href="${pageContext.request.contextPath}/searchtravelplace?place=四川" target="_blank">四川</a></dt>
                            <dd>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10035" target="_blank">成都</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10136" target="_blank">九寨沟</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10061" target="_blank">稻城</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10011" target="_blank">色达</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10564" target="_blank">若尔盖</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10163" target="_blank">都江堰</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10091" target="_blank">亚丁</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=11642" target="_blank">阿坝</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10143" target="_blank">峨眉山</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=17315" target="_blank">牛背山</a>
                            </dd>
                        </dl>
                        <dl>
                            <dt><a href="${pageContext.request.contextPath}/searchtravelplace?place=14575" target="_blank">浙江</a></dt>
                            <dd>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10156" target="_blank">杭州</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10434" target="_blank">乌镇</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10010" target="_blank">西塘</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10445" target="_blank">千岛湖</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=11534" target="_blank">普陀山</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10439" target="_blank">东极岛</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10089" target="_blank">南浔</a>
                            </dd>
                        </dl>
                        <dl>
                            <dt>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=12938" target="_blank">海南</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=12871" target="_blank">福建</a></dt>
                            <dd>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10030" target="_blank">三亚</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10132" target="_blank">厦门</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=12522" target="_blank">鼓浪屿</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10039" target="_blank">武夷山</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=12491" target="_blank">霞浦</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=11246" target="_blank">泉州</a>
                            </dd>
                        </dl>
                        <dl>
                            <dt>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=14387" target="_blank">江苏</a>
                            </dt>
                            <dd>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10684" target="_blank">南京</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10207" target="_blank">苏州</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10140" target="_blank">无锡</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10128" target="_blank">扬州</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=11729" target="_blank">周庄</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10802" target="_blank">常州</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10804" target="_blank">连云港</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10435" target="_blank">同里</a>
                            </dd>
                        </dl>
                        <dl>
                            <dt>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=14674" target="_blank">广东</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=12810" target="_blank">广西</a>
                            </dt>
                            <dd>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10088" target="_blank">广州</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10198" target="_blank">深圳</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10269" target="_blank">珠海</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=13063" target="_blank">汕头</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10095" target="_blank">桂林</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10027" target="_blank">阳朔</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10796" target="_blank">北海</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=11755" target="_blank">黄姚古镇</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10453" target="_blank">涠洲岛</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=18065" target="_blank">龙脊梯田</a>
                            </dd>
                        </dl>
                    </div>
                    <div class="col">
                        <dl>
                            <dt>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=12700" target="_blank">西藏</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=14103" target="_blank">贵州</a>
                            </dt>
                            <dd>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10442" target="_blank">拉萨</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10814" target="_blank">林芝</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10073" target="_blank">阿里</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10381" target="_blank">黔东南</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=11932" target="_blank">荔波</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=14753" target="_blank">镇远</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=14484" target="_blank">西江</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10085" target="_blank">黄果树</a>
                            </dd>
                        </dl>
                        <dl>
                            <dt>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=31808" target="_blank">西北</a>
                            </dt>
                            <dd>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10195" target="_blank">西安</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10799" target="_blank">青海湖</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10800" target="_blank">西宁</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=19603" target="_blank">祁连</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10240" target="_blank">敦煌</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10783" target="_blank">兰州</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10076" target="_blank">甘南</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=11340" target="_blank">张掖</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=11353" target="_blank">嘉峪关</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=13061" target="_blank">新疆</a>
                            </dd>
                        </dl>
                        <dl>
                            <dt>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=12976" target="_blank">山东</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=13033" target="_blank">山西</a>
                            </dt>
                            <dd>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10444" target="_blank">青岛</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10284" target="_blank">泰山</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10805" target="_blank">日照</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10256" target="_blank">威海</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=11243" target="_blank">烟台</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=11270" target="_blank">长岛</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10443" target="_blank">蓬莱</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10547" target="_blank">平遥</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=11241" target="_blank">大同</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10057" target="_blank">五台山</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10087" target="_blank">壶口瀑布</a>
                            </dd>
                        </dl>
                        <dl>
                            <dt>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=13732" target="_blank">湖南</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=14731" target="_blank">湖北</a>
                            </dt>
                            <dd>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10267" target="_blank">张家界</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10024" target="_blank">凤凰</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10792" target="_blank">郴州</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10133" target="_blank">武汉</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10521" target="_blank">恩施</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10489" target="_blank">神农架</a>
                            </dd>
                        </dl>
                        <dl>
                            <dt>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=12719" target="_blank">安徽</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=15508" target="_blank">江西</a>
                            </dt>
                            <dd>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10440" target="_blank">黄山</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10825" target="_blank">宏村</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10045" target="_blank">婺源</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10589" target="_blank">景德镇</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10244" target="_blank">庐山</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=11465" target="_blank">三清山</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=11754" target="_blank">南昌</a>
                            </dd>
                        </dl>
                        <dl>
                            <dt>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=14407" target="_blank">河北</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=12967" target="_blank">河南</a>
                            </dt>
                            <dd>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10209" target="_blank">北戴河</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=11499" target="_blank">秦皇岛</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10432" target="_blank">承德</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=11386" target="_blank">张北</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10449" target="_blank">少林寺</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10094" target="_blank">洛阳</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10632" target="_blank">龙门石窟</a>
                            </dd>
                        </dl>
                        <dl>
                            <dt>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=12720" target="_blank">内蒙古</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=16215" target="_blank">东北</a>
                            </dt>
                            <dd>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10774" target="_blank">呼伦贝尔</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=" target="_blank"></a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10390" target="_blank">阿尔山</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10414" target="_blank">海拉尔</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=" target="_blank"></a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10068" target="_blank">哈尔滨</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10427" target="_blank">漠河</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10127" target="_blank">雪乡</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10301" target="_blank">大连</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10584" target="_blank">丹东</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10728" target="_blank">盘锦</a>
                            </dd>
                        </dl>
                    </div>
                </div>
                <div class="hot-list clearfix hide">
                    <div class="col">
                        <dl>
                            <dt><a href="${pageContext.request.contextPath}/searchtravelplace?place=12684" target="_blank">台湾</a></dt>
                            <dd>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10819" target="_blank">台北</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=21434" target="_blank">垦丁</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=15325" target="_blank">花莲</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=11065" target="_blank">高雄</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=16405" target="_blank">台中</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=23039" target="_blank">九份</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=12594" target="_blank">南投</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10044" target="_blank">阿里山</a>
                            </dd>
                        </dl>
                    </div>
                    <div class="col">
                        <dl>
                            <dt>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10189" target="_blank">香港</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10206" target="_blank">澳门</a>
                            </dt>
                        </dl>
                    </div>
                </div>
                <div class="hot-list clearfix hide">
                    <div class="col">
                        <dl>
                            <dt><a href="${pageContext.request.contextPath}/searchtravelplace?place=10183" target="_blank">日本</a></dt>
                            <dd>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10222" target="_blank">东京</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10765" target="_blank">大阪</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=11042" target="_blank">京都</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=11041" target="_blank">冲绳</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10746" target="_blank">北海道</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10768" target="_blank">箱根</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10769" target="_blank">札幌</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=16283" target="_blank">奈良</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=11043" target="_blank">名古屋</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=15297" target="_blank">福冈</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=15298" target="_blank">神户</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=61629" target="_blank">那霸</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=59480" target="_blank">函馆</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=19816" target="_blank">小樽</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10766" target="_blank">镰仓</a>
                            </dd>
                        </dl>
                    </div>
                    <div class="col">
                        <dl>
                            <dt><a href="${pageContext.request.contextPath}/searchtravelplace?place=10184" target="_blank">韩国</a></dt>
                            <dd>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=11030" target="_blank">济州岛</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10130" target="_blank">首尔</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=11025" target="_blank">釜山</a>
                            </dd>
                        </dl>
                    </div>
                </div>
                <div class="hot-list clearfix hide">
                    <div class="col">
                        <dl>
                            <dt><a href="${pageContext.request.contextPath}/searchtravelplace?place=10083" target="_blank">泰国</a></dt>
                            <dd>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=11047" target="_blank">普吉岛</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=15284" target="_blank">清迈</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=11045" target="_blank">曼谷</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=14210" target="_blank">苏梅岛</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=16980" target="_blank">甲米</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=11046" target="_blank">芭提雅</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=16209" target="_blank">象岛</a>
                            </dd>
                        </dl>
                        <dl>
                            <dt>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10754" target="_blank">新加坡</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10181" target="_blank">印尼</a>
                            </dt>
                            <dd>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10754" target="_blank">新加坡</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10460" target="_blank">巴厘岛</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=13752" target="_blank">民丹岛</a>
                            </dd>
                        </dl>
                        <dl>
                            <dt>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10097" target="_blank">马来西亚</a>
                            </dt>
                            <dd>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10760" target="_blank">沙巴</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=28411" target="_blank">仙本那</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=11049" target="_blank">吉隆坡</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=11051" target="_blank">兰卡威</a>
                            </dd>
                        </dl>
                    </div>
                    <div class="col">
                        <dl>
                            <dt>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10180" target="_blank">越南</a>
                            </dt>
                            <dd>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=16102" target="_blank">芽庄</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=16315" target="_blank">岘港</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=16105" target="_blank">美奈</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=16359" target="_blank">大叻</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=11055" target="_blank">河内</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=11053" target="_blank">胡志明市</a>
                            </dd>
                        </dl>
                        <dl>
                            <dt>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10070" target="_blank">柬埔寨</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10179" target="_blank">缅甸</a>
                            </dt>
                            <dd>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10406" target="_blank">吴哥窟</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=15308" target="_blank">暹粒</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=15305" target="_blank">金边</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=16113" target="_blank">仰光</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=16112" target="_blank">蒲甘</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=16114" target="_blank">曼德勒</a>
                            </dd>
                        </dl>
                        <dl>
                            <dt>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10067" target="_blank">菲律宾</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10753" target="_blank">文莱</a>
                            </dt>
                            <dd>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10737" target="_blank">长滩岛</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=29500" target="_blank">杜马盖地</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=16115" target="_blank">薄荷岛</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=16117" target="_blank">宿雾</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10753" target="_blank">文莱</a>
                            </dd>
                        </dl>
                    </div>
                </div>
                <div class="hot-list clearfix hide">
                    <div class="col">
                        <dl>
                            <dt>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10101" target="_blank">马尔代夫</a>
                            </dt>
                            <dd>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=11068" target="_blank">马累</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=33109" target="_blank">阿雅达岛</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=17748" target="_blank">薇拉瓦鲁岛</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=17751" target="_blank">宁静岛</a>
                            </dd>
                        </dl>
                        <dl>
                            <dt>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=11213" target="_blank">阿联酋</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=11699" target="_blank">伊朗</a>
                            </dt>
                            <dd>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=11214" target="_blank">迪拜</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=11215" target="_blank">阿布扎比</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=47029" target="_blank">德黑兰</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=49450" target="_blank">伊斯法罕</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=49111" target="_blank">设拉子</a>
                            </dd>
                        </dl>
                    </div>
                    <div class="col">
                        <dl>
                            <dt><a href="${pageContext.request.contextPath}/searchtravelplace?place=11058" target="_blank">斯里兰卡</a></dt>
                            <dd>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=11059" target="_blank">科伦坡</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=11061" target="_blank">康提</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=11062" target="_blank">努沃勒埃利耶</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=63702" target="_blank">尼甘布</a>
                            </dd>
                        </dl>
                        <dl>
                            <dt><a href="${pageContext.request.contextPath}/searchtravelplace?place=10069" target="_blank">尼泊尔</a></dt>
                            <dd>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=11275" target="_blank">加德满都</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=16126" target="_blank">博卡拉</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=16127" target="_blank">巴德岗</a>
                            </dd>
                        </dl>
                        <dl>
                            <dt><a href="${pageContext.request.contextPath}/searchtravelplace?place=10182" target="_blank">印度</a></dt>
                            <dd>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=16120" target="_blank">新德里</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=16122" target="_blank">孟买</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=18034" target="_blank">阿格拉</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=16123" target="_blank">斋普尔</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=16125" target="_blank">瓦拉纳西</a>
                            </dd>
                        </dl>
                    </div>
                </div>
                <div class="hot-list clearfix hide">
                    <div class="col">
                        <dl>
                            <dt>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10062" target="_blank">美国</a>
                            </dt>
                            <dd>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10926" target="_blank">洛杉矶</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10742" target="_blank">旧金山</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10579" target="_blank">纽约</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10077" target="_blank">塞班岛</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10927" target="_blank">夏威夷</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=19016" target="_blank">关岛</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10929" target="_blank">西雅图</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10745" target="_blank">华盛顿</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10925" target="_blank">波士顿</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10917" target="_blank">奥兰多</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10916" target="_blank">迈阿密</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10928" target="_blank">芝加哥</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=11703" target="_blank">阿拉斯加</a>
                            </dd>
                        </dl>
                        <dl>
                            <dt>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10122" target="_blank">英国</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=11131" target="_blank">爱尔兰</a>
                            </dt>
                            <dd>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=11124" target="_blank">伦敦</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=11125" target="_blank">爱丁堡</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=14784" target="_blank">剑桥</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=16162" target="_blank">牛津</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=11129" target="_blank">约克</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=11132" target="_blank">都柏林</a>
                            </dd>
                        </dl>
                        <dl>
                            <dt><a href="${pageContext.request.contextPath}/searchtravelplace?place=10051" target="_blank">意大利</a></dt>
                            <dd>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10063" target="_blank">罗马</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=11083" target="_blank">威尼斯</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=11087" target="_blank">佛罗伦萨</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=11084" target="_blank">米兰</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=16428" target="_blank">五渔村</a>
                            </dd>
                        </dl>
                        <dl>
                            <dt>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10171" target="_blank">法国</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10169" target="_blank">瑞士</a>
                            </dt>
                            <dd>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10573" target="_blank">巴黎</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=11122" target="_blank">普罗旺斯</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=11109" target="_blank">卢塞恩</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=11110" target="_blank">苏黎世</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=11112" target="_blank">因特拉肯</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=11108" target="_blank">日内瓦</a>
                            </dd>
                        </dl>
                        <dl>
                            <dt>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10173" target="_blank">西班牙</a>
                            </dt>
                            <dd>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10102" target="_blank">巴塞罗那</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=11133" target="_blank">马德里</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=11135" target="_blank">塞维利亚</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=11138" target="_blank">格拉纳达</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=21366" target="_blank">托莱多</a>
                            </dd>
                        </dl>
                        <dl>
                            <dt>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10172" target="_blank">葡萄牙</a>
                            </dt>
                            <dd>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=11142" target="_blank">里斯本</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=11171" target="_blank">波尔图</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=63452" target="_blank">辛特拉</a>
                            </dd>
                        </dl>
                        <dl>
                            <dt>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10300" target="_blank">俄罗斯</a>
                            </dt>
                            <dd>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=11155" target="_blank">莫斯科</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=14635" target="_blank">贝加尔湖</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=15338" target="_blank">圣彼得堡</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=13006" target="_blank">海参崴</a>
                            </dd>
                        </dl>
                    </div>
                    <div class="col">
                        <dl>
                            <dt>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10176" target="_blank">德国</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10175" target="_blank">奥地利</a>
                            </dt>
                            <dd>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=11081" target="_blank">慕尼黑</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10958" target="_blank">法兰克福</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10755" target="_blank">柏林</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=11080" target="_blank">科隆</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=35987" target="_blank">福森</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=11091" target="_blank">维也纳</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=18705" target="_blank">哈尔施塔特</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=11167" target="_blank">萨尔茨堡</a>
                            </dd>
                        </dl>
                        <dl>
                            <dt>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10168" target="_blank">希腊</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10053" target="_blank">土耳其</a>
                            </dt>
                            <dd>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=16095" target="_blank">圣托里尼</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=11143" target="_blank">雅典</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=11228" target="_blank">伊斯坦布尔</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=16876" target="_blank">棉花堡</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=18041" target="_blank">卡帕多奇亚</a>
                            </dd>
                        </dl>
                        <dl>
                            <dt>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10174" target="_blank">捷克</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=11094" target="_blank">匈牙利</a>
                            </dt>
                            <dd>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10761" target="_blank">布拉格</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=11141" target="_blank">克鲁姆洛夫</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=22351" target="_blank">卡罗维发利</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=11095" target="_blank">布达佩斯</a>
                            </dd>
                        </dl>
                        <dl>
                            <dt>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=14431" target="_blank">冰岛</a>
                            </dt>
                            <dd>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=16084" target="_blank">雷克雅未克</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=62910" target="_blank">维克</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=62907" target="_blank">阿克雷里</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=105930" target="_blank">霍芬</a>
                            </dd>
                        </dl>
                        <dl>
                            <dt>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=11099" target="_blank">荷兰</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=11105" target="_blank">比利时</a>
                            </dt>
                            <dd>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=11100" target="_blank">阿姆斯特丹</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=11101" target="_blank">鹿特丹</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=16099" target="_blank">羊角村</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=11106" target="_blank">布鲁塞尔</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=16100" target="_blank">布鲁日</a>
                            </dd>
                        </dl>
                        <dl>
                            <dt>美洲其他</dt>
                            <dd>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10177" target="_blank">加拿大</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10160" target="_blank">巴西</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=11684" target="_blank">古巴</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=11656" target="_blank">墨西哥</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=11005" target="_blank">秘鲁</a>
                            </dd>
                        </dl>
                        <dl>
                            <dt>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=14431" target="_blank">欧洲其他</a>
                            </dt>
                            <dd>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10448" target="_blank">芬兰</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=11160" target="_blank">挪威</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=11157" target="_blank">丹麦</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10214" target="_blank">瑞典</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=26909" target="_blank">塞尔维亚</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=11853" target="_blank">克罗地亚</a>
                            </dd>
                        </dl>
                    </div>
                </div>
                <div class="hot-list clearfix hide">
                    <div class="col">
                        <dl>
                            <dt><a href="${pageContext.request.contextPath}/searchtravelplace?place=10202" target="_blank">澳大利亚</a></dt>
                            <dd>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10855" target="_blank">悉尼</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10856" target="_blank">墨尔本</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10858" target="_blank">凯恩斯</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=19036" target="_blank">大堡礁</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=17339" target="_blank">黄金海岸</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10857" target="_blank">布里斯班</a>
                            </dd>
                        </dl>
                        <dl>
                            <dt><a href="${pageContext.request.contextPath}/searchtravelplace?place=10544" target="_blank">新西兰</a></dt>
                            <dd>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10865" target="_blank">奥克兰</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10885" target="_blank">皇后镇</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=15920" target="_blank">基督城</a>
                            </dd>
                        </dl>
                        <dl>
                            <dt>澳洲其他</dt>
                            <dd>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=15911" target="_blank">帕劳</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=11044" target="_blank">斐济</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10344" target="_blank">大溪地</a>
                            </dd>
                        </dl>
                    </div>
                    <div class="col">
                        <dl>
                            <dt>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10178" target="_blank">埃及</a>
                            </dt>
                            <dd>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=11367" target="_blank">开罗</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=11185" target="_blank">卢克索</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=51454" target="_blank">阿斯旺</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=48718" target="_blank">红海</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=16708" target="_blank">亚历山大</a>
                            </dd>
                        </dl>
                        <dl>
                            <dt><a href="${pageContext.request.contextPath}/searchtravelplace?place=12033" target="_blank">摩洛哥</a></dt>
                            <dd>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=16077" target="_blank">马拉喀什</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=113734" target="_blank">卡萨布兰卡</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=16078" target="_blank">非斯</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=113733" target="_blank">舍夫沙万</a>
                            </dd>
                        </dl>
                        <dl>
                            <dt>非洲其他</dt>
                            <dd>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=11761" target="_blank">毛里求斯</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=16827" target="_blank">塞舌尔</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=10029" target="_blank">肯尼亚</a>
                                <a href="${pageContext.request.contextPath}/searchtravelplace?place=17439" target="_blank">马达加斯加</a>
                            </dd>
                        </dl>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row-line"></div>

    <div class="row">
        <div class="wrapper">
            <div class="row-list" data-cs-p="全球目的地">
                <h2 class="hd">全球目的地<span>（按拼音首字母排序）</span></h2>

                <div class="bd">
                    <dl class="item">
                        <dt class="sub-title">亚洲</dt>
                        <dd class="clearfix">
                            <ul class="col">
                                <li class="letter">A</li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=11698" target="_blank">阿富汗 <span
                                        class="en">Afghanistan</span></a></li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=11213" target="_blank">阿联酋 <span
                                        class="en">United Arab Emirates</span></a>
                                </li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=16674" target="_blank">阿曼 <span
                                        class="en">Sultanate of Oman</span></a></li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=31369" target="_blank">阿塞拜疆 <span
                                        class="en">Azerbaijan</span></a></li>
                                <li class="letter">B</li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=11697" target="_blank">巴基斯坦 <span
                                        class="en">Pakistan</span></a>
                                </li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=32105" target="_blank">巴勒斯坦 <span
                                        class="en">Palestine</span></a>
                                </li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=15519" target="_blank">巴林 <span
                                        class="en">Bahrain</span></a>
                                </li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=10711" target="_blank">不丹 <span
                                        class="en">Bhutan</span></a>
                                </li>
                                <li class="letter">C</li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=11780" target="_blank">朝鲜 <span
                                        class="en">North Korea</span></a>
                                </li>
                                <li class="letter">D</li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=29700" target="_blank">东帝汶 <span
                                        class="en">East Timor</span></a>
                                </li>
                                <li class="letter">F</li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=10067" target="_blank">菲律宾 <span
                                        class="en">Philippines</span></a><i class="icon-label"></i></li>
                                <li class="letter">G</li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=10234" target="_blank">格鲁吉亚 <span
                                        class="en">Georgia</span></a></li>
                                <li class="letter">H</li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=17393" target="_blank">哈萨克斯坦 <span
                                        class="en">The Republic of Kazakhstan</span></a>
                                </li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=10184" target="_blank">韩国 <span
                                        class="en">Korea</span></a><i
                                        class="icon-label"></i></li>
                                <li class="letter">J</li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=57194" target="_blank">吉尔吉斯斯坦 <span
                                        class="en">Kyrgyzstan</span></a></li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=10070" target="_blank">柬埔寨 <span
                                        class="en">Cambodia</span></a><i class="icon-label"></i></li>
                            </ul>
                            <ul class="col">
                                <li class="letter">K</li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=12035" target="_blank">卡塔尔 <span
                                        class="en">The State of Qatar</span></a>
                                </li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=21762" target="_blank">科威特 <span
                                        class="en">The State of Kuwait</span></a>
                                </li>
                                <li class="letter">L</li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=10820" target="_blank">老挝 <span
                                        class="en">Laos</span></a><i
                                        class="icon-label"></i></li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=12028" target="_blank">黎巴嫩 <span
                                        class="en">Lebanon</span></a></li>
                                <li class="letter">M</li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=10101" target="_blank">马尔代夫 <span
                                        class="en">Maldives</span></a><i
                                        class="icon-label"></i></li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=10097" target="_blank">马来西亚 <span
                                        class="en">Malaysia</span></a><i
                                        class="icon-label"></i></li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=14293" target="_blank">蒙古 <span
                                        class="en">Mongolia</span></a></li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=14783" target="_blank">孟加拉国 <span
                                        class="en">Bangladesh</span></a></li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=10179" target="_blank">缅甸 <span
                                        class="en">Myanmar</span></a><i
                                        class="icon-label"></i></li>
                                <li class="letter">N</li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=10069" target="_blank">尼泊尔 <span
                                        class="en">Nepal</span></a><i class="icon-label"></i></li>
                                <li class="letter">R</li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=10183" target="_blank">日本 <span
                                        class="en">Japan</span></a><i
                                        class="icon-label"></i></li>
                                <li class="letter">S</li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=11765" target="_blank">沙特阿拉伯 <span
                                        class="en">Saudi Arabia</span></a></li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=11058" target="_blank">斯里兰卡 <span
                                        class="en">Sri Lanka</span></a>
                                </li>
                                <li class="letter">T</li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=24254" target="_blank">塔吉克斯坦 <span
                                        class="en">Tajikistan</span></a></li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=10083" target="_blank">泰国 <span
                                        class="en">Thailand</span></a><i class="icon-label"></i></li>
                            </ul>
                            <ul class="col">
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=35250" target="_blank">土库曼斯坦 <span
                                        class="en">Turkmenistan</span></a></li>
                                <li class="letter">W</li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=10753" target="_blank">文莱 <span
                                        class="en">Brunei Darussalam</span></a></li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=48878" target="_blank">乌兹别克斯坦 <span
                                        class="en">The Republic of Uzbekistan</span></a>
                                </li>
                                <li class="letter">X</li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=10754" target="_blank">新加坡 <span
                                        class="en">Singapore</span></a><i
                                        class="icon-label"></i></li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=11217" target="_blank">叙利亚 <span
                                        class="en">The Syrian Arab Republic</span></a>
                                </li>
                                <li class="letter">Y</li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=32160" target="_blank">亚美尼亚 <span
                                        class="en">The Republic of Armenia</span></a>
                                </li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=21498" target="_blank">也门 <span
                                        class="en">The Republic of Yemen</span></a>
                                </li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=28466" target="_blank">伊拉克 <span
                                        class="en">Iraq</span></a>
                                </li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=11699" target="_blank">伊朗 <span
                                        class="en">Iran</span></a>
                                </li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=10605" target="_blank">以色列 <span
                                        class="en">Israel</span></a>
                                </li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=10182" target="_blank">印度 <span
                                        class="en">India</span></a><i
                                        class="icon-label"></i></li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=10181" target="_blank">印度尼西亚 <span
                                        class="en">Indonesia</span></a><i class="icon-label"></i></li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=11221" target="_blank">约旦 <span
                                        class="en">Jordan</span></a>
                                </li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=10180" target="_blank">越南 <span
                                        class="en">Vietnam</span></a><i
                                        class="icon-label"></i></li>
                                <li class="letter">Z</li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=21536" target="_blank">中国 <span
                                        class="en">China</span></a>
                                    <img class="domestic" style="width: 34px;margin-left: 20px;cursor: pointer"
                                         src="http://css.mafengwo.net/images/mdd/place/flag.jpg">
                                </li>
                            </ul>
                        </dd>
                    </dl>
                    <dl class="item">
                        <dt class="sub-title">北美洲</dt>
                        <dd class="clearfix">
                            <ul class="col">
                                <li class="letter">A</li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=57151" target="_blank">安提瓜和巴布达 <span
                                        class="en">Antigua and Barbuda</span></a>
                                </li>
                                <li class="letter">B</li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=57152" target="_blank">巴巴多斯 <span
                                        class="en">Barbados</span></a>
                                </li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=11943" target="_blank">巴哈马 <span
                                        class="en">Bahamas</span></a></li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=25229" target="_blank">巴拿马 <span
                                        class="en">Panama</span></a>
                                </li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=32796" target="_blank">伯利兹 <span
                                        class="en">Belize</span></a>
                                </li>
                                <li class="letter">D</li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=25756" target="_blank">多米尼加 <span
                                        class="en">Dominican Republic</span></a>
                                </li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=57153" target="_blank">多米尼克 <span
                                        class="en">Dominica</span></a>
                                </li>
                                <li class="letter">G</li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=24412" target="_blank">哥斯达黎加 <span
                                        class="en">Costa Rica</span></a></li>
                            </ul>
                            <ul class="col">
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=57154" target="_blank">格林纳达 <span
                                        class="en">Grenada</span></a></li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=11684" target="_blank">古巴 <span
                                        class="en">Cuba</span></a><i
                                        class="icon-label"></i></li>
                                <li class="letter">H</li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=12029" target="_blank">海地 <span
                                        class="en">Haiti</span></a>
                                </li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=30877" target="_blank">洪都拉斯 <span
                                        class="en">Republic of Honduras</span></a>
                                </li>
                                <li class="letter">J</li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=10177" target="_blank">加拿大 <span
                                        class="en">Canada</span></a><i
                                        class="icon-label"></i></li>
                                <li class="letter">M</li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=10062" target="_blank">美国 <span
                                        class="en">United States of America</span></a>


                                </li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=11656" target="_blank">墨西哥 <span
                                        class="en">The United Mexican States</span></a><i
                                        class="icon-label"></i></li>
                                <li class="letter">N</li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=57155" target="_blank">尼加拉瓜 <span
                                        class="en">Nicaragua</span></a>
                                </li>
                            </ul>
                            <ul class="col">
                                <li class="letter">S</li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=57156" target="_blank">萨尔瓦多 <span
                                        class="en">El Salvador</span></a></li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=57157" target="_blank">圣基茨和尼维斯 <span
                                        class="en">Saint Kitts and Nevis</span></a>
                                </li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=57158" target="_blank">圣卢西亚 <span
                                        class="en">Saint Lucia</span></a></li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=57159" target="_blank">圣文森特和格林纳丁斯 <span
                                        class="en">Saint Vincent and the Grenadines</span></a>
                                </li>
                                <li class="letter">T</li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=57160" target="_blank">特立尼达和多巴哥 <span
                                        class="en">Trinidad and Tobago</span></a>
                                </li>
                                <li class="letter">W</li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=17493" target="_blank">危地马拉 <span
                                        class="en">Guatemala</span></a>
                                </li>
                                <li class="letter">Y</li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=12030" target="_blank">牙买加 <span
                                        class="en">Jamaica</span></a></li>
                            </ul>
                        </dd>
                    </dl>
                    <dl class="item">
                        <dt class="sub-title">南美洲</dt>
                        <dd class="clearfix">
                            <ul class="col">
                                <li class="letter">A</li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=10159" target="_blank">阿根廷 <span
                                        class="en">Argentina</span></a><i
                                        class="icon-label"></i></li>
                                <li class="letter">B</li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=38471" target="_blank">巴拉圭 <span
                                        class="en">Paraguay</span></a></li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=10160" target="_blank">巴西 <span
                                        class="en">Brazil</span></a><i class="icon-label"></i></li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=11005" target="_blank">秘鲁 <span
                                        class="en">The Republic of Peru</span></a>
                                </li>
                            </ul>
                            <ul class="col">
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=13484" target="_blank">玻利维亚 <span
                                        class="en">Bolivia</span></a><i class="icon-label"></i></li>
                                <li class="letter">E</li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=18225" target="_blank">厄瓜多尔 <span
                                        class="en">Ecuador</span></a></li>
                                <li class="letter">G</li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=10955" target="_blank">哥伦比亚 <span
                                        class="en">Colombia</span></a><i
                                        class="icon-label"></i></li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=57187" target="_blank">圭亚那 <span
                                        class="en">Guyana</span></a>
                                </li>
                            </ul>
                            <ul class="col">
                                <li class="letter">S</li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=36914" target="_blank">苏里南 <span
                                        class="en">The Republic of Suriname</span></a>
                                </li>
                                <li class="letter">W</li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=15757" target="_blank">委内瑞拉 <span
                                        class="en">Bolivarian Republic of Venezuela</span></a>
                                </li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=12104" target="_blank">乌拉圭 <span
                                        class="en">The Oriental Republic of Uruguay</span></a>
                                </li>
                                <li class="letter">Z</li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=10992" target="_blank">智利 <span
                                        class="en">Republic of Chile</span></a><i class="icon-label"></i></li>
                            </ul>
                        </dd>
                    </dl>
                    <dl class="item">
                        <dt class="sub-title">欧洲</dt>
                        <dd class="clearfix">
                            <ul class="col">
                                <li class="letter">A</li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=24844" target="_blank">阿尔巴尼亚 <span
                                        class="en">The Republic of Albania</span></a>
                                </li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=11131" target="_blank">爱尔兰 <span
                                        class="en">Ireland</span></a><i class="icon-label"></i></li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=11631" target="_blank">爱沙尼亚 <span
                                        class="en">The Republic of Estonia</span></a>
                                </li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=19744" target="_blank">安道尔 <span
                                        class="en">Andorra</span></a></li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=10175" target="_blank">奥地利 <span
                                        class="en">Austria</span></a><i class="icon-label"></i></li>
                                <li class="letter">B</li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=28072" target="_blank">白俄罗斯 <span
                                        class="en">Belarus</span></a></li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=38605" target="_blank">保加利亚 <span
                                        class="en">The Republic of Bulgaria</span></a>
                                </li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=11105" target="_blank">比利时 <span
                                        class="en">Belgium</span></a><i class="icon-label"></i></li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=10549" target="_blank">冰岛 <span
                                        class="en">Iceland</span></a><i
                                        class="icon-label"></i></li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=11570" target="_blank">波黑 <span
                                        class="en">Bosnia and Herzegovina</span></a>
                                </li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=11147" target="_blank">波兰 <span
                                        class="en">Poland</span></a><i class="icon-label"></i></li>
                                <li class="letter">D</li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=11157" target="_blank">丹麦 <span
                                        class="en">Denmark</span></a><i
                                        class="icon-label"></i></li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=10176" target="_blank">德国 <span
                                        class="en">Germany</span></a><i
                                        class="icon-label"></i></li>
                                <li class="letter">E</li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=10300" target="_blank">俄罗斯 <span
                                        class="en">Russia</span></a><i
                                        class="icon-label"></i></li>
                                <li class="letter">F</li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=10171" target="_blank">法国 <span
                                        class="en">France</span></a><i class="icon-label"></i></li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=11614" target="_blank">梵蒂冈 <span
                                        class="en">Vatican City State</span></a>
                                </li>
                            </ul>
                            <ul class="col">
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=10448" target="_blank">芬兰 <span
                                        class="en">Finland</span></a><i
                                        class="icon-label"></i></li>
                                <li class="letter">H</li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=11099" target="_blank">荷兰 <span
                                        class="en">Holland</span></a><i
                                        class="icon-label"></i></li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=57192" target="_blank">黑山 <span
                                        class="en">Montenegro</span></a>
                                </li>
                                <li class="letter">J</li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=10174" target="_blank">捷克 <span
                                        class="en">Czech</span></a><i
                                        class="icon-label"></i></li>
                                <li class="letter">K</li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=57193" target="_blank">科索沃 <span
                                        class="en">The Republic of Kosovo</span></a>
                                </li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=11853" target="_blank">克罗地亚 <span
                                        class="en">Croatia</span></a></li>
                                <li class="letter">L</li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=18897" target="_blank">拉脱维亚 <span
                                        class="en">Latvia</span></a></li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=18942" target="_blank">立陶宛 <span
                                        class="en">Lithuania</span></a>
                                </li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=11097" target="_blank">列支敦士登 <span
                                        class="en">Liechtenstein</span></a></li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=11098" target="_blank">卢森堡 <span
                                        class="en">The Grand Duchy of Luxembourg</span></a>
                                </li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=30071" target="_blank">罗马尼亚 <span
                                        class="en">Romania</span></a></li>
                                <li class="letter">M</li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=16501" target="_blank">马耳他 <span
                                        class="en">Malta</span></a>
                                </li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=38921" target="_blank">马其顿 <span
                                        class="en">Macedonia</span></a>
                                </li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=24945" target="_blank">摩尔多瓦 <span
                                        class="en">The Republicof Moldova</span></a>
                                </li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=11140" target="_blank">摩纳哥 <span
                                        class="en">The Principality of Monaco</span></a>
                                </li>
                                <li class="letter">N</li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=11160" target="_blank">挪威 <span
                                        class="en">Norway</span></a><i class="icon-label"></i></li>
                            </ul>
                            <ul class="col">
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=10172" target="_blank">葡萄牙 <span
                                        class="en">Portugal</span></a><i class="icon-label"></i></li>
                                <li class="letter">R</li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=10214" target="_blank">瑞典 <span
                                        class="en">The Kingdom of Sweden</span></a><i
                                        class="icon-label"></i></li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=10169" target="_blank">瑞士 <span
                                        class="en">Switzerland</span></a><i
                                        class="icon-label"></i></li>
                                <li class="letter">S</li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=26909" target="_blank">塞尔维亚 <span
                                        class="en">The Republic of Serbia</span></a>
                                </li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=16648" target="_blank">塞浦路斯 <span
                                        class="en">Cyprus</span></a></li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=15077" target="_blank">圣马力诺 <span
                                        class="en">The Republic of San Marino</span></a>
                                </li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=11153" target="_blank">斯洛伐克 <span
                                        class="en">Slovakia</span></a>
                                </li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=11852" target="_blank">斯洛文尼亚 <span
                                        class="en">The Republic of Slovenia</span></a>
                                </li>
                                <li class="letter">T</li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=10053" target="_blank">土耳其 <span
                                        class="en">Turkey</span></a><i
                                        class="icon-label"></i></li>
                                <li class="letter">W</li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=15693" target="_blank">乌克兰 <span
                                        class="en">Ukraine</span></a></li>
                                <li class="letter">X</li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=10173" target="_blank">西班牙 <span
                                        class="en">Spain</span></a><i class="icon-label"></i></li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=10168" target="_blank">希腊 <span
                                        class="en">Greece</span></a><i class="icon-label"></i></li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=11094" target="_blank">匈牙利 <span
                                        class="en">Hungary</span></a><i class="icon-label"></i></li>
                                <li class="letter">Y</li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=10051" target="_blank">意大利 <span
                                        class="en">Italy</span></a><i class="icon-label"></i></li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=10122" target="_blank">英国 <span
                                        class="en">United Kingdom</span></a><i class="icon-label"></i></li>
                            </ul>
                        </dd>
                    </dl>
                    <dl class="item">
                        <dt class="sub-title">非洲</dt>
                        <dd class="clearfix">
                            <ul class="col">
                                <li class="letter">A</li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=12032" target="_blank">阿尔及利亚 <span
                                        class="en">People's Democratic Republic of Algeria</span></a>
                                </li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=10178" target="_blank">埃及 <span
                                        class="en">Egypt</span></a>
                                </li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=12858" target="_blank">埃塞俄比亚 <span
                                        class="en">Ethiopia</span></a>
                                </li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=22047" target="_blank">安哥拉 <span
                                        class="en">The Republic of Angola</span></a>
                                </li>
                                <li class="letter">B</li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=57170" target="_blank">贝宁 <span
                                        class="en">Benin</span></a>
                                </li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=15534" target="_blank">博茨瓦纳 <span
                                        class="en">Botswana</span></a>
                                </li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=56531" target="_blank">布基纳法索 <span
                                        class="en">Burkina Faso</span></a></li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=57171" target="_blank">布隆迪 <span
                                        class="en">Burundi</span></a></li>
                                <li class="letter">C</li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=57172" target="_blank">赤道几内亚 <span
                                        class="en">Equatorial Guinea</span></a>
                                </li>
                                <li class="letter">D</li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=17958" target="_blank">多哥 <span
                                        class="en">Togo</span></a>
                                </li>
                                <li class="letter">E</li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=19760" target="_blank">厄立特里亚 <span
                                        class="en">The State of Eritrea</span></a>
                                </li>
                                <li class="letter">F</li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=57173" target="_blank">佛得角 <span
                                        class="en">Cape Verde</span></a>
                                </li>
                                <li class="letter">G</li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=57174" target="_blank">冈比亚 <span
                                        class="en">Gambia</span></a>
                                </li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=12031" target="_blank">刚果 <span
                                        class="en">The Republic of Congo</span></a>
                                </li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=57175" target="_blank">刚果民主共和国 <span
                                        class="en">Democratic Republic of the Congo</span></a>
                                </li>
                                <li class="letter">J</li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=57176" target="_blank">吉布提 <span
                                        class="en">Djibouti</span></a></li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=32815" target="_blank">几内亚 <span
                                        class="en">The Republic of Guinea</span></a>
                                </li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=57177" target="_blank">几内亚比绍 <span
                                        class="en">Guinea-Bissau</span></a></li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=11706" target="_blank">加纳 <span
                                        class="en">Ghana</span></a>
                                </li>
                            </ul>
                            <ul class="col">
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=57178" target="_blank">加蓬 <span
                                        class="en">Gabon</span></a>
                                </li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=11752" target="_blank">津巴布韦 <span
                                        class="en">Zimbabwe</span></a>
                                </li>
                                <li class="letter">K</li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=27636" target="_blank">喀麦隆 <span
                                        class="en">Cameroon</span></a></li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=57179" target="_blank">科摩罗 <span
                                        class="en">Comoros</span></a></li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=13122" target="_blank">科特迪瓦 <span
                                        class="en">Ivory Coast</span></a></li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=10029" target="_blank">肯尼亚 <span
                                        class="en">Kenya</span></a><i class="icon-label"></i></li>
                                <li class="letter">L</li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=57180" target="_blank">莱索托 <span
                                        class="en">Lesotho</span></a></li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=57181" target="_blank">利比里亚 <span
                                        class="en">Liberia</span></a></li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=16746" target="_blank">利比亚 <span
                                        class="en">State of Libya</span></a></li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=22478" target="_blank">留尼旺 <span
                                        class="en">Réunion</span></a></li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=57182" target="_blank">卢旺达 <span
                                        class="en">Rwanda</span></a>
                                </li>
                                <li class="letter">M</li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=17439" target="_blank">马达加斯加 <span
                                        class="en">Madagascar</span></a><i class="icon-label"></i></li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=29615" target="_blank">马拉维 <span
                                        class="en">The Republic of Malawi</span></a>
                                </li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=12036" target="_blank">马里 <span
                                        class="en">The Republic of Mali</span></a>
                                </li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=11761" target="_blank">毛里求斯 <span
                                        class="en">Mauritius</span></a><i
                                        class="icon-label"></i></li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=18450" target="_blank">毛里塔尼亚 <span
                                        class="en">The Islamic Republic of Mauritania</span></a>
                                </li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=12033" target="_blank">摩洛哥 <span
                                        class="en">Morocco</span></a></li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=11753" target="_blank">莫桑比克 <span
                                        class="en">Mozambique</span></a></li>
                                <li class="letter">N</li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=10762" target="_blank">纳米比亚 <span
                                        class="en">Namibia</span></a></li>
                            </ul>
                            <ul class="col">
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=10455" target="_blank">南非 <span
                                        class="en">South Africa</span></a></li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=19955" target="_blank">南苏丹 <span
                                        class="en">Republic of South Sudan</span></a>
                                </li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=12027" target="_blank">尼日尔 <span
                                        class="en">Niger</span></a>
                                </li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=21111" target="_blank">尼日利亚 <span
                                        class="en">Federal Republic of Nigeria</span></a>
                                </li>
                                <li class="letter">S</li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=57183" target="_blank">塞拉利昂 <span
                                        class="en">Sierra leone</span></a></li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=12026" target="_blank">塞内加尔 <span
                                        class="en">Senegal</span></a></li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=16827" target="_blank">塞舌尔 <span
                                        class="en">Seychelles</span></a><i
                                        class="icon-label"></i></li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=32925" target="_blank">圣多美和普林西比 <span
                                        class="en">Sao Tome and Principe</span></a>
                                </li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=57184" target="_blank">斯威士兰 <span
                                        class="en">Swaziland</span></a>
                                </li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=15123" target="_blank">苏丹 <span
                                        class="en">Sudan</span></a>
                                </li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=57185" target="_blank">索马里 <span
                                        class="en">Somalia</span></a></li>
                                <li class="letter">T</li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=10818" target="_blank">坦桑尼亚 <span
                                        class="en">The United Republic of Tanzania</span></a>
                                </li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=11604" target="_blank">突尼斯 <span
                                        class="en">Tunisia</span></a></li>
                                <li class="letter">W</li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=12034" target="_blank">乌干达 <span
                                        class="en">Uganda</span></a>
                                </li>
                                <li class="letter">X</li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=57186" target="_blank">西撒哈拉 <span
                                        class="en">Western Sahara</span></a></li>
                                <li class="letter">Z</li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=11751" target="_blank">赞比亚 <span
                                        class="en">Zambia</span></a>
                                </li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=28359" target="_blank">乍得 <span
                                        class="en">Chad</span></a>
                                </li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=10689" target="_blank">中非 <span
                                        class="en">The Central African Republic</span></a>
                                </li>
                            </ul>
                        </dd>
                    </dl>
                    <dl class="item">
                        <dt class="sub-title">大洋洲</dt>
                        <dd class="clearfix">
                            <ul class="col">
                                <li class="letter">A</li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=10202" target="_blank">澳大利亚 <span
                                        class="en">Australia</span></a><i
                                        class="icon-label"></i></li>
                                <li class="letter">B</li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=12647" target="_blank">巴布亚新几内亚 <span
                                        class="en">Papua New Guinea</span></a>
                                </li>
                                <li class="letter">D</li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=10344" target="_blank">大溪地 <span
                                        class="en">Tahiti</span></a><i
                                        class="icon-label"></i></li>
                                <li class="letter">F</li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=11044" target="_blank">斐济 <span
                                        class="en">Fiji</span></a><i
                                        class="icon-label"></i></li>
                                <li class="letter">G</li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=19016" target="_blank">关岛 <span
                                        class="en">Guam</span></a>
                                </li>
                                <li class="letter">J</li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=57161" target="_blank">基里巴斯 <span
                                        class="en">Kiribati</span></a>
                                </li>
                            </ul>
                            <ul class="col">
                                <li class="letter">K</li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=57167" target="_blank">库克群岛 <span
                                        class="en">Cook Islands</span></a></li>
                                <li class="letter">M</li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=57162" target="_blank">马绍尔群岛 <span
                                        class="en">Marshall Islands</span></a>
                                </li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=57163" target="_blank">密克罗尼西亚联邦 <span
                                        class="en">Micronesia</span></a></li>
                                <!--li class="letter">N</li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=57166" target="_blank">瑙鲁 <span class="en">Nauru</span></a>
                                </li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=57168" target="_blank">纽埃 <span class="en">Niue</span></a>
                                </li-->
                                <li class="letter">P</li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=15911" target="_blank">帕劳 <span
                                        class="en">Palau</span></a><i
                                        class="icon-label"></i></li>
                            </ul>
                            <ul class="col">
                                <li class="letter">S</li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=54998" target="_blank">萨摩亚 <span
                                        class="en">Samoa</span></a>
                                </li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=24406" target="_blank">所罗门群岛 <span
                                        class="en">Solomon Islands</span></a></li>
                                <li class="letter">T</li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=17753" target="_blank">汤加 <span
                                        class="en">The Kingdom of Tonga</span></a>
                                </li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=57164" target="_blank">图瓦卢 <span
                                        class="en">Tuvalu</span></a>
                                </li>
                                <li class="letter">W</li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=52088" target="_blank">瓦努阿图 <span
                                        class="en">Republic of Vanuatu</span></a>
                                </li>
                                <li class="letter">X</li>
                                <li><a href="${pageContext.request.contextPath}/searchtravelplace?place=10544" target="_blank">新西兰 <span
                                        class="en">New Zealand</span></a><i class="icon-label"></i></li>
                            </ul>
                        </dd>
                    </dl>
                </div>
            </div>
            <div class="row-list" data-cs-p="国内目的地" id="domestic">
                <h2 class="hd" id="chinamdd">国内目的地</h2>

                <div class="bd bd-china">
                    <dl class="item">
                        <dt class="sub-title">都市</dt>
                        <dd>
                            <ul>
                                <li><a class="link-hot" target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10189">香港</a>
                                </li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10206">澳门</a></li>
                                <li><a class="link-hot" target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10065">北京</a>
                                </li>
                                <li><a class="link-hot" target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10099">上海</a>
                                </li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10320">天津</a></li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10208">重庆</a></li>
                            </ul>
                        </dd>
                    </dl>
                    <dl class="item">
                        <dt class="sub-title"><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=12684">台湾</a>
                        </dt>
                        <dd>
                            <ul>
                                <li><a class="link-hot" target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10819">台北</a>
                                </li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=15325">花莲</a></li>
                                <li><a class="link-hot" target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=21434">垦丁</a>
                                </li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=11065">高雄</a></li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=16405">台中</a></li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=12594">南投</a></li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=11064">台南</a></li>
                            </ul>
                        </dd>
                    </dl>
                    <dl class="item">
                        <dt class="sub-title"><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=12703">四川</a>
                        </dt>
                        <dd>
                            <ul>
                                <li><a class="link-hot" target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10035">成都</a>
                                </li>
                                <li><a class="link-hot" target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10136">九寨沟</a>
                                </li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10061">稻城</a></li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=11630">西昌</a></li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=18084">西岭雪山</a></li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10510">康定</a></li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10564">若尔盖</a></li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10011">色达</a></li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10143">峨眉山</a></li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=11327">海螺沟</a></li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=17315">牛背山</a></li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=14727">新都桥</a></li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10134">四姑娘山</a></li>
                            </ul>
                        </dd>
                    </dl>
                    <dl class="item">
                        <dt class="sub-title"><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=12700">西藏</a>
                        </dt>
                        <dd>
                            <ul>
                                <li><a class="link-hot" target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10442">拉萨</a>
                                </li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10814">林芝</a></li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10073">阿里</a></li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10079">墨脱</a></li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=11606">山南</a></li>
                                <li><a class="link-hot" target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10417">纳木错</a>
                                </li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=11474">日喀则</a></li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10811">珠穆朗玛峰</a></li>
                            </ul>
                        </dd>
                    </dl>
                    <dl class="item">
                        <dt class="sub-title"><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=12711">云南</a>
                        </dt>
                        <dd>
                            <ul>
                                <li><a class="link-hot" target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10487">大理</a>
                                </li>
                                <li><a class="link-hot" target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10186">丽江</a>
                                </li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10807">昆明</a></li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10809">西双版纳</a></li>
                                <li><a class="link-hot" target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10482">香格里拉</a>
                                </li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10018">束河</a></li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=15812">瑞丽</a></li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10650">东川</a></li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10121">泸沽湖</a></li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10651">腾冲</a></li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10808">罗平</a></li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=11660">元阳</a></li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=15950">双廊</a></li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=24185">保山</a></li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=12643">曲靖</a></li>
                            </ul>
                        </dd>
                    </dl>
                    <dl class="item">
                        <dt class="sub-title"><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=14575">浙江</a>
                        </dt>
                        <dd>
                            <ul>
                                <li><a class="link-hot" target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10156">杭州</a>
                                </li>
                                <li><a class="link-hot" target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10010">西塘</a>
                                </li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10155">绍兴</a></li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10129">宁波</a></li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10608">横店</a></li>
                                <li><a class="link-hot" target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10434">乌镇</a>
                                </li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=11505">舟山</a></li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10089">南浔</a></li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10445">千岛湖</a></li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=11534">普陀山</a></li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10439">东极岛</a></li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10117">南麂岛</a></li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10090">楠溪江</a></li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10124">丽水</a></li>
                            </ul>
                        </dd>
                    </dl>
                    <dl class="item">
                        <dt class="sub-title"><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=14387">江苏</a>
                        </dt>
                        <dd>
                            <ul>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10140">无锡</a></li>
                                <li><a class="link-hot" target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10684">南京</a>
                                </li>
                                <li><a class="link-hot" target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10207">苏州</a>
                                </li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10128">扬州</a></li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=11729">周庄</a></li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=12059">镇江</a></li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10802">常州</a></li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10435">同里</a></li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=14458">兴化</a></li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10804">连云港</a></li>
                            </ul>
                        </dd>
                    </dl>
                    <dl class="item">
                        <dt class="sub-title">
                            <a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=12871">福建</a>
                            <a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=12938">海南</a>
                        </dt>
                        <dd>
                            <ul>
                                <li><a class="link-hot" target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10132">厦门</a>
                                </li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10494">永定</a></li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=12491">霞浦</a></li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=11498">福州</a></li>
                                <li><a class="link-hot" target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=12522">鼓浪屿</a>
                                </li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10039">武夷山</a></li>
                                <li><a class="link-hot" target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10030">三亚</a>
                                </li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10513">海口</a></li>
                            </ul>
                        </dd>
                    </dl>
                    <dl class="item">
                        <dt class="sub-title"><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=12976">山东</a>
                        </dt>
                        <dd>
                            <ul>
                                <li><a class="link-hot" target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10444">青岛</a>
                                </li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10575">济南</a></li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=11243">烟台</a></li>
                                <li><a class="link-hot" target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10284">泰山</a>
                                </li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=11244">曲阜</a></li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10256">威海</a></li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=11270">长岛</a></li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10443">蓬莱</a></li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10805">日照</a></li>
                            </ul>
                        </dd>
                    </dl>
                    <dl class="item">
                        <dt class="sub-title"><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=12720">内蒙古</a>
                        </dt>
                        <dd>
                            <ul>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10763">额尔古纳</a></li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10390">阿尔山</a></li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10048">库布齐沙漠</a></li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10478">克什克腾旗</a></li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=11574">包头</a></li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10704">锡林郭勒</a></li>
                                <li><a class="link-hot" target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10774">呼伦贝尔</a>
                                </li>
                                <li><a class="link-hot" target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10456">额济纳旗</a>
                                </li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=14392">巴丹吉林</a></li>
                            </ul>
                        </dd>
                    </dl>
                    <dl class="item">
                        <dt class="sub-title"><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=12810">广西</a>
                        </dt>
                        <dd>
                            <ul>
                                <li><a class="link-hot" target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10095">桂林</a>
                                </li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10796">北海</a></li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10027">阳朔</a></li>
                                <li><a class="link-hot" target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10453">涠洲岛</a>
                                </li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10308">南宁</a></li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=18065">龙脊梯田</a></li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=12309">巴马</a></li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=13701">防城港</a></li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=11755">黄姚古镇</a></li>
                            </ul>
                        </dd>
                    </dl>
                    <dl class="item">
                        <dt class="sub-title"><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=14674">广东</a>
                        </dt>
                        <dd>
                            <ul>
                                <li><a class="link-hot" target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10088">广州</a>
                                </li>
                                <li><a class="link-hot" target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10198">深圳</a>
                                </li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10269">珠海</a></li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10779">韶关</a></li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=13394">佛山</a></li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=11475">惠州</a></li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=13063">汕头</a></li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=12475">湛江</a></li>
                                <li><a class="link-hot" target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10507">开平</a>
                                </li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=12691">江门</a></li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10778">肇庆</a></li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=11446">汕尾</a></li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=18381">巽寮湾</a></li>
                            </ul>
                        </dd>
                    </dl>
                    <dl class="item">
                        <dt class="sub-title">
                            <a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=12719">安徽</a>
                            <a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=15508">江西</a>
                        </dt>
                        <dd>
                            <ul>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10793">合肥</a></li>
                                <li><a class="link-hot" target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10440">黄山</a>
                                </li>
                                <li><a class="link-hot" target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10825">宏村</a>
                                </li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=11259">宣城</a></li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=11264">九华山</a></li>
                                <li><a class="link-hot" target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10045">婺源</a>
                                </li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=11754">南昌</a></li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10589">景德镇</a></li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10244">庐山</a></li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=11465">三清山</a></li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=11248">井冈山</a></li>
                            </ul>
                        </dd>
                    </dl>
                    <dl class="item">
                        <dt class="sub-title"><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=12788">青海</a>
                        </dt>
                        <dd>
                            <ul>
                                <li><a class="link-hot" target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10800">西宁</a>
                                </li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10602">同仁</a></li>
                                <li><a class="link-hot" target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10799">青海湖</a>
                                </li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=11294">玉树</a></li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=11343">玉珠峰</a></li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10817">年保玉则</a></li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10568">玛多</a></li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10055">可可西里</a></li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10581">坎布拉</a></li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10604">贵德</a></li>
                            </ul>
                        </dd>
                    </dl>
                    <dl class="item">
                        <dt class="sub-title">
                            <a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=13083">陕</a>
                            <a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=13295">甘</a>
                            <a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=12931">宁</a>
                        </dt>
                        <dd>
                            <ul>
                                <li><a class="link-hot" target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10195">西安</a>
                                </li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10577">华山</a></li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10531">太白山</a></li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=13366">汉中</a></li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=18372">咸阳</a></li>
                                <li><a class="link-hot" target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10240">敦煌</a>
                                </li>
                                <li><a class="link-hot" target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=11340">张掖</a>
                                </li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10076">甘南</a></li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10771">银川</a></li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10770">沙坡头</a></li>
                            </ul>
                        </dd>
                    </dl>
                    <dl class="item">
                        <dt class="sub-title"><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=14407">河北</a>
                        </dt>
                        <dd>
                            <ul>
                                <li><a class="link-hot" target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10209">北戴河</a>
                                </li>
                                <li><a class="link-hot" target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10432">承德</a>
                                </li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10219">塞罕坝</a></li>
                                <li><a class="link-hot" target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10034">木兰围场</a>
                                </li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10785">乐亭</a></li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10713">海陀山</a></li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10695">丰宁坝上</a></li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=11808">蔚县</a></li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10230">小五台</a></li>
                            </ul>
                        </dd>
                    </dl>
                    <dl class="item">
                        <dt class="sub-title"><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=12967">河南</a>
                        </dt>
                        <dd>
                            <ul>
                                <li><a class="link-hot" target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10094">洛阳</a>
                                </li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10794">郑州</a></li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=13805">安阳</a></li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=11242">开封</a></li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=11527">云台山</a></li>
                                <li><a class="link-hot" target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10449">少林寺</a>
                                </li>
                            </ul>
                        </dd>
                    </dl>
                    <dl class="item">
                        <dt class="sub-title">
                            <a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=14731">湖北</a>
                            <a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=13732">湖南</a>
                        </dt>
                        <dd>
                            <ul>
                                <li><a class="link-hot" target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10133">武汉</a>
                                </li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=11257">武当山</a></li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10489">神农架</a></li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10705">三峡</a></li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10521">恩施</a></li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10490">宜昌</a></li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10466">长沙</a></li>
                                <li><a class="link-hot" target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10267">张家界</a>
                                </li>
                                <li><a class="link-hot" target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10024">凤凰</a>
                                </li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=13287">湘西</a></li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=140544">靖州</a></li>
                            </ul>
                        </dd>
                    </dl>
                    <dl class="item">
                        <dt class="sub-title"><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=14103">贵州</a>
                        </dt>
                        <dd>
                            <ul>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=11239">贵阳</a></li>
                                <li><a class="link-hot" target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10381">黔东南</a>
                                </li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=11254">兴义</a></li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=11932">荔波</a></li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10046">赤水</a></li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10376">遵义</a></li>
                                <li><a class="link-hot" target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10085">黄果树</a>
                                </li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10275">梵净山</a></li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10014">青岩古镇</a></li>
                            </ul>
                        </dd>
                    </dl>
                    <dl class="item">
                        <dt class="sub-title"><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=13061">新疆</a>
                        </dt>
                        <dd>
                            <ul>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10218">乌鲁木齐</a></li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=11471">伊犁</a></li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10469">吐鲁番</a></li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10468">喀什</a></li>
                                <li><a class="link-hot" target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10732">喀纳斯</a>
                                </li>
                            </ul>
                        </dd>
                    </dl>
                    <dl class="item">
                        <dt class="sub-title">
                            <a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=16712">黑</a>
                            <a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=14871">吉</a>
                            <a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=15148">辽</a>
                        </dt>
                        <dd>
                            <ul>
                                <li><a class="link-hot" target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10068">哈尔滨</a>
                                </li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=11473">伊春</a></li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=11526">大兴安岭</a></li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10782">扎龙</a></li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10427">漠河</a></li>
                                <li><a class="link-hot" target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10127">雪乡</a>
                                </li>
                                <li><a class="link-hot" target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10072">长白山</a>
                                </li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=11247">长春</a></li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=11779">吉林市</a></li>
                                <li><a class="link-hot" target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10301">大连</a>
                                </li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10075">沈阳</a></li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10584">丹东</a></li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10728">盘锦</a></li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10290">兴城</a></li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10287">绥中</a></li>
                            </ul>
                        </dd>
                    </dl>
                    <dl class="item">
                        <dt class="sub-title"><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=13033">山西</a>
                        </dt>
                        <dd>
                            <ul>
                                <li><a class="link-hot" target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10547">平遥</a>
                                </li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=11240">太原</a></li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=11241">大同</a></li>
                                <li><a class="link-hot" target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10057">五台山</a>
                                </li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10047">云冈石窟</a></li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10087">壶口瀑布</a></li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=10192">碛口</a></li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=11258">绵山</a></li>
                                <li><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=25315">介休</a></li>
                            </ul>
                        </dd>
                    </dl>
                    <dl class="item">
                        <dt class="sub-title"><a target="_blank" href="${pageContext.request.contextPath}/searchtravelplace?place=undefined"></a>
                        </dt>
                        <dd>
                            <ul></ul>
                        </dd>
                    </dl>
                </div>
            </div>
            <litreal>
                <script>
                    $('.domestic').parent().click(function (e) {
                        e.preventDefault();
                        $('html,body').animate({scrollTop: $('#chinamdd').offset().top}, 800);
                    });
                </script>
            </litreal>

        </div>

    </div>
</div>
<script language="javascript" src="${pageContext.request.contextPath}/js/mdd/mdd_3.js"
        type="text/javascript"></script>

<link href="${pageContext.request.contextPath}/css/mdd/index3.css" rel="stylesheet" type="text/css"/>

<div id="footer">
    <div class="ft-content">

        <div class="ft-copyright">
            <a href="${pageContext.request.contextPath}"><i class="ft-mfw-logo"></i></a>
            <p>© 2017 Mafengwo.cn <a href="${pageContext.request.contextPath}" target="_blank"
                                     rel="nofollow">京ICP备******号</a> 京公网安备*******号 <a
                    href="${pageContext.request.contextPath}" target="_blank"
                    rel="nofollow">京ICP证*****号</a></p>
            <p><a href="${pageContext.request.contextPath}" target="_blank" rel="nofollow">营业执照</a>
                ********* 客服电话：<span class="highlight">*******</span>
            </p>
        </div>
    </div>
</div>

<link href="${pageContext.request.contextPath}/css/mdd/index2.css" rel="stylesheet" type="text/css"/>
<div class="mfw-toolbar" id="_j_mfwtoolbar">
    <div class="toolbar-item-top">
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
    <div class="toolbar-item-down">
        <a role="button" class="btn _j_gobottom">
            <i class="icon_down"></i>
            <em>页面底部</em>
        </a>
    </div>
</div>


<script language="javascript" type="text/javascript">
    if (typeof M !== "undefined" && typeof M.loadResource === "function") {
        M.loadResource("${pageContext.request.contextPath}/js/mdd/mdd_2.js");
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
