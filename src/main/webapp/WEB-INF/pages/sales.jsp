<%@ page import="java.util.List" %>
<%@ page import="com.fk.bean.PromoReturnBean" %>
<%@ page import="com.fk.bean.OrdersBean" %><%--
  Created by IntelliJ IDEA.
  User: fengkai
  Date: 13/03/17
  Time: 14:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>穷游商城的交易平台 - 大学生穷游网</title>
    <link href="${pageContext.request.contextPath}/css/sales/sales2.css" rel="stylesheet" type="text/css"/>
    <script language="javascript" src="${pageContext.request.contextPath}/js/sales/sales.js" type="text/javascript"></script>
    <script language="javascript" src="${pageContext.request.contextPath}/js/sales/sales1.js" type="text/javascript"></script>
    <link href="${pageContext.request.contextPath}/css/sales/sales3.css" rel="stylesheet" type="text/css"/>
    <script language="javascript" src="${pageContext.request.contextPath}/js/sales/sales2.js" type="text/javascript"></script>

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
                <li class="head-nav-place" id="head_2"><a href="${pageContext.request.contextPath}/mdd" title="目的地">目的地</a>
                </li>
                <li class="head-nav-gonglve" id="head_3"><a href="${pageContext.request.contextPath}/content_list" title="旅游攻略">旅游攻略</a>
                </li>
                <li class="head-nav-place" id="_j_nav_sales" >
                    <a href="${pageContext.request.contextPath}/sales"
                       data-sales-nav="穷游商城">
                        <span>穷游商城<%--<i class="icon-caret-down"></i>--%></span>
                    </a>
                </li>
                <li class="head-nav-place" id="head_4"><a href="${pageContext.request.contextPath}/my"
                                                          title="个人中心">个人中心</a>
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


<div class="container">

    <!-- 新增 -->
    <div class="brand-bar clearfix">
        <div class="bb-hd">
            <div class="bb-title"><i class="icon-fh"></i>机票+酒店</div>
            <div class="depart" data-depart="1">
            </div>
        </div>
        <div class="bb-bd">
            <div class="sales-search">
                <input id="ipt_keyword" class="search-input" type="text" placeholder="请输入目的地 / 产品名称">
                <a id="btn_keyword"  data-mes-t="按钮" class="search-button" href="javascript:;"><i></i></a>
            </div>
        </div>
    </div>
    <!-- end-->
    <div class="sales-top clearfix">
        <div class="category" data-entire-nav="1">

            <div class="category-nav" data-mes-g="0-0" data-mes-t="热门区域" data-view-group="relatedMdd">
                <div data-mes-g="0-0-0" data-mes-t="国内旅游" class="item"
                     data-type="left-nav" data-nav-target="国内旅游">
                    <h3>国内旅游</h3>
                    <i class="icon-category1"></i>
                    <div>
                        <a data-mes-g="0-0-0-0" data-mes-t="三亚" target="_blank"
                           href="${pageContext.request.contextPath}/search?indexsearch=shop&key=三亚">三亚</a>
                        <a data-mes-g="0-0-0-1" data-mes-t="丽江" target="_blank"
                           href="${pageContext.request.contextPath}/search?indexsearch=shop&key=丽江">丽江</a>
                        <a data-mes-g="0-0-0-2" data-mes-t="厦门" target="_blank"
                           href="${pageContext.request.contextPath}/search?indexsearch=shop&key=厦门">厦门</a>
                        <a data-mes-g="0-0-0-3" data-mes-t="成都" target="_blank"
                           href="${pageContext.request.contextPath}/search?indexsearch=shop&key=成都">成都</a>
                        <a data-mes-g="0-0-0-4" data-mes-t="西安" target="_blank"
                           href="${pageContext.request.contextPath}/search?indexsearch=shop&key=西安">西安</a>
                    </div>
                    <i class="icon-arrMore"></i>
                </div>
                <div data-mes-g="0-0-1" data-mes-t="日本" class="item"
                     data-type="left-nav" data-nav-target="日本">
                    <h3>日本</h3>
                    <i class="icon-category2"></i>
                    <div>
                        <a data-mes-g="0-0-1-0" data-mes-t="东京" target="_blank"
                           href="${pageContext.request.contextPath}/search?indexsearch=shop&key=东京">东京</a>
                        <a data-mes-g="0-0-1-1" data-mes-t="大阪" target="_blank"
                           href="${pageContext.request.contextPath}/search?indexsearch=shop&key=大阪">大阪</a>
                        <a data-mes-g="0-0-1-2" data-mes-t="冲绳" target="_blank"
                           href="${pageContext.request.contextPath}/search?indexsearch=shop&key=冲绳">冲绳</a>
                        <a data-mes-g="0-0-1-3" data-mes-t="北海道" target="_blank"
                           href="${pageContext.request.contextPath}/search?indexsearch=shop&key=北海道">北海道</a>
                    </div>
                    <i class="icon-arrMore"></i>
                </div>
                <div data-mes-g="0-0-2" data-mes-t="东南亚 南亚 泰国" class="item"
                     data-type="left-nav" data-nav-target="东南亚 南亚 泰国">
                    <h3>东南亚 南亚 泰国</h3>
                    <i class="icon-category3"></i>
                    <div>
                        <a data-mes-g="0-0-2-0" data-mes-t="普吉岛" target="_blank"
                           href="${pageContext.request.contextPath}/search?indexsearch=shop&key=普吉岛">普吉岛</a>
                        <a data-mes-g="0-0-2-1" data-mes-t="清迈" target="_blank"
                           href="${pageContext.request.contextPath}/search?indexsearch=shop&key=巴厘岛">清迈</a>
                        <a data-mes-g="0-0-2-2" data-mes-t="巴厘岛" target="_blank"
                           href="${pageContext.request.contextPath}/search?indexsearch=shop&key=巴厘岛">巴厘岛</a>
                        <a data-mes-g="0-0-2-3" data-mes-t="马尔代夫" target="_blank"
                           href="${pageContext.request.contextPath}/search?indexsearch=shop&key=马尔代夫">马尔代夫</a>
                    </div>
                    <i class="icon-arrMore"></i>
                </div>
                <div data-mes-g="0-0-3" data-mes-t="香港 澳门 台湾" class="item"
                     data-type="left-nav" data-nav-target="香港 澳门 台湾">
                    <h3>香港 澳门 台湾</h3>
                    <i class="icon-category4"></i>
                    <div>
                        <a data-mes-g="0-0-3-0" data-mes-t="台北" target="_blank"
                           href="${pageContext.request.contextPath}/search?indexsearch=shop&key=台北">台北</a>
                        <a data-mes-g="0-0-3-1" data-mes-t="垦丁" target="_blank"
                           href="${pageContext.request.contextPath}/search?indexsearch=shop&key=垦丁">垦丁</a>
                        <a data-mes-g="0-0-3-2" data-mes-t="高雄" target="_blank"
                           href="${pageContext.request.contextPath}/search?indexsearch=shop&key=高雄">高雄</a>
                        <a data-mes-g="0-0-3-3" data-mes-t="香港" target="_blank"
                           href="${pageContext.request.contextPath}/search?indexsearch=shop&key=香港">香港</a>
                        <a data-mes-g="0-0-3-4" data-mes-t="迪士尼" target="_blank"
                           href="${pageContext.request.contextPath}/search?indexsearch=shop&key=迪士尼">迪士尼</a>
                    </div>
                    <i class="icon-arrMore"></i>
                </div>
                <div data-mes-g="0-0-4" data-mes-t="欧洲 美洲" class="item"
                     data-type="left-nav" data-nav-target="欧洲 美洲">
                    <h3>欧洲 美洲</h3>
                    <i class="icon-category5"></i>
                    <div>
                        <a data-mes-g="0-0-4-0" data-mes-t="美国" target="_blank"
                           href="${pageContext.request.contextPath}/search?indexsearch=shop&key=美国">美国</a>
                        <a data-mes-g="0-0-4-1" data-mes-t="英国" target="_blank"
                           href="${pageContext.request.contextPath}/search?indexsearch=shop&key=英国">英国</a>
                        <a data-mes-g="0-0-4-2" data-mes-t="法国" target="_blank"
                           href="${pageContext.request.contextPath}/search?indexsearch=shop&key=法国">法国</a>
                        <a data-mes-g="0-0-4-3" data-mes-t="意大利" target="_blank"
                           href="${pageContext.request.contextPath}/search?indexsearch=shop&key=意大利">意大利</a>
                        <a data-mes-g="0-0-4-4" data-mes-t="德国" target="_blank"
                           href="${pageContext.request.contextPath}/search?indexsearch=shop&key=德国">德国</a>
                    </div>
                    <i class="icon-arrMore"></i>
                </div>
                <div data-mes-g="0-0-5" data-mes-t="澳洲 中东 非洲" class="item"
                     data-type="left-nav" data-nav-target="澳洲 中东 非洲">
                    <h3>澳洲 中东 非洲</h3>
                    <i class="icon-category6"></i>
                    <div>
                        <a data-mes-g="0-0-5-0" data-mes-t="澳大利亚" target="_blank"
                           href="${pageContext.request.contextPath}/search?indexsearch=shop&key=澳大利亚">澳大利亚</a>
                        <a data-mes-g="0-0-5-1" data-mes-t="毛里求斯" target="_blank"
                           href="${pageContext.request.contextPath}/search?indexsearch=shop&key=毛里求斯">毛里求斯</a>
                        <a data-mes-g="0-0-5-2" data-mes-t="帕劳" target="_blank"
                           href="${pageContext.request.contextPath}/search?indexsearch=shop&key=帕劳">帕劳</a>
                    </div>
                    <i class="icon-arrMore"></i>
                </div>
                <div data-mes-g="0-0-6" data-mes-t="热门海岛" class="item item-last"
                     data-type="left-nav" data-nav-target="热门海岛">
                    <h3>热门海岛</h3>
                    <i class="icon-category7"></i>
                    <div>
                        <a data-mes-g="0-0-6-0" data-mes-t="巴厘岛" target="_blank"
                           href="${pageContext.request.contextPath}/search?indexsearch=shop&key=巴厘岛">巴厘岛</a>
                        <a data-mes-g="0-0-6-1" data-mes-t="马尔代夫" target="_blank"
                           href="${pageContext.request.contextPath}/search?indexsearch=shop&key=马尔代夫">马尔代夫</a>
                        <a data-mes-g="0-0-6-2" data-mes-t="塞班" target="_blank"
                           href="${pageContext.request.contextPath}/search?indexsearch=shop&key=塞班">塞班</a>
                        <a data-mes-g="0-0-6-3" data-mes-t="斐济" target="_blank"
                           href="${pageContext.request.contextPath}/search?indexsearch=shop&key=斐济">斐济</a>
                    </div>
                    <i class="icon-arrMore"></i>
                </div>
            </div>
            <div data-panel="1" data-mes-g="0-1" data-mes-t="展开区域" data-view-group="relatedMdd">
                <div class="category-panel hide" data-panel-target="国内旅游"
                     data-mes-g="0-1-0" data-mes-t="国内旅游">
                    <div class="bd bd-china clearfix">
                        <div class="col-left" data-mes-g="0-1-0-0" data-mes-t="左侧区域">
                            <dl class="dl-china">
                                <dt>
                                    <a>热门</a>
                                </dt>
                                <dd>
                                    <div class="place-nav">
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=三亚">三亚</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=丽江">丽江</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=厦门">厦门</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=成都">成都</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=西安">西安</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=北京">北京</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=九寨沟">九寨沟</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=青海">青海</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=青岛">青岛</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=大理">大理</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=呼伦贝尔">呼伦贝尔</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=桂林">桂林</a><span class="split"></span></span>
                                    </div>
                                </dd>
                            </dl>
                            <dl class="dl-china">
                                <dt>
                                    <a target="_blank" data-mes-g="0-1-0-0-1" data-mes-t="Array"
                                       href="/sales/search/海南">海南</a>
                                </dt>
                                <dd>
                                    <div class="place-nav">
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=三亚">三亚</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=海口">海口</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=蜈支洲岛">蜈支洲岛</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=三亚湾">三亚湾</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=西沙">西沙</a><span class="split"></span></span>
                                    </div>
                                </dd>
                            </dl>
                            <dl class="dl-china">
                                <dt>
                                    <a target="_blank" data-mes-g="0-1-0-0-2" data-mes-t="Array"
                                       href="${pageContext.request.contextPath}/search?indexsearch=shop&key=云南">云南</a>
                                </dt>
                                <dd>
                                    <div class="place-nav">
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=丽江">丽江</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=大理">大理</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=昆明">昆明</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=西双版纳">西双版纳</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=腾冲">腾冲</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=香格里拉">香格里拉</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=西沙">西沙</a><span class="split"></span></span>
                                    </div>
                                </dd>
                            </dl>
                            <dl class="dl-china">
                                <dt>
                                    <a target="_blank" data-mes-g="0-1-0-0-3" data-mes-t="Array"
                                       href="${pageContext.request.contextPath}/search?indexsearch=shop&key=四川">四川</a>
                                </dt>
                                <dd>
                                    <div class="place-nav">
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=成都">成都</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=九寨沟">九寨沟</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=稻城">稻城</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=西岭雪山">西岭雪山</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=峨眉山">峨眉山</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=亚丁">亚丁</a><span class="split"></span></span>
                                    </div>
                                </dd>
                            </dl>
                            <dl class="dl-china">
                                <dt>
                                    <a target="_blank" data-mes-g="0-1-0-0-4" data-mes-t="Array"
                                       href="${pageContext.request.contextPath}/search?indexsearch=shop&key=西南">西南</a>
                                </dt>
                                <dd>
                                    <div class="place-nav">
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=西藏">西藏</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=拉萨">拉萨</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=林芝">林芝</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=重庆">重庆</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=贵州">贵州</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=贵阳">贵阳</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=黄果树">黄果树</a><span class="split"></span></span>
                                    </div>
                                </dd>
                            </dl>
                            <dl class="dl-china">
                                <dt>
                                    <a target="_blank" data-mes-g="0-1-0-0-5" data-mes-t="Array"
                                       href="${pageContext.request.contextPath}/search?indexsearch=shop&key=西北">西北</a>
                                </dt>
                                <dd>
                                    <div class="place-nav">
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=西安">西安</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=青海湖">青海湖</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=西宁">西宁</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=新疆">新疆</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=敦煌">敦煌</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=乌鲁木齐">乌鲁木齐</a><span class="split"></span></span>
                                    </div>
                                </dd>
                            </dl>
                            <dl class="dl-china">
                                <dt>
                                    <a target="_blank" data-mes-g="0-1-0-0-6" data-mes-t="Array"
                                       href="${pageContext.request.contextPath}/search?indexsearch=shop&key=东北">东北</a>
                                </dt>
                                <dd>
                                    <div class="place-nav">
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=长白山">长白山</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=大连">大连</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=哈尔滨">哈尔滨</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=长春">长春</a><span class="split"></span></span>
                                    </div>
                                </dd>
                            </dl>
                            <dl class="dl-china">
                                <dt>
                                    <a target="_blank" data-mes-g="0-1-0-0-7" data-mes-t="Array"
                                       href="${pageContext.request.contextPath}/search?indexsearch=shop&key=江浙沪">江浙沪</a>
                                </dt>
                                <dd>
                                    <div class="place-nav">
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=杭州">杭州</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=上海">上海</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=南京">南京</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=苏州">苏州</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=乌镇">乌镇</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=千岛湖">千岛湖</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=西塘">西塘</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=横店">横店</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=无锡">无锡</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=上海迪士尼">上海迪士尼</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=舟山">舟山</a><span class="split"></span></span>
                                    </div>
                                </dd>
                            </dl>
                            <dl class="dl-china">
                                <dt>
                                    <a target="_blank" data-mes-g="0-1-0-0-8" data-mes-t="Array"
                                       href="${pageContext.request.contextPath}/search?indexsearch=shop&key=山东">山东</a>
                                </dt>
                                <dd>
                                    <div class="place-nav">

                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=烟台">烟台</a><span class="split"></span></span>
                                    </div>
                                </dd>
                            </dl>
                            <dl class="dl-china">
                                <dt>
                                    <a target="_blank" data-mes-g="0-1-0-0-9" data-mes-t="Array"
                                       href="${pageContext.request.contextPath}/search?indexsearch=shop&key=广西">广西</a>
                                </dt>
                                <dd>
                                    <div class="place-nav">
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=桂林">桂林</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=北海">北海</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=阳朔">阳朔</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=涠洲岛">涠洲岛</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=龙脊梯田">龙脊梯田</a><span class="split"></span></span>
                                    </div>
                                </dd>
                            </dl>
                            <dl class="dl-china">
                                <dt>
                                    <a target="_blank" data-mes-g="0-1-0-0-10" data-mes-t="Array"
                                       href="${pageContext.request.contextPath}/search?indexsearch=shop&key=湖北!=end=!湖南">湖北/湖南</a>
                                </dt>
                                <dd>
                                    <div class="place-nav">
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=张家界">张家界</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=长沙">长沙</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=武汉">武汉</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=三峡">三峡</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=神农架">神农架</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=宜昌">宜昌</a><span class="split"></span></span>
                                    </div>
                                </dd>
                            </dl>
                        </div>
                        <div class="col-right" data-mes-g="0-1-0-1" data-mes-t="右侧区域">
                            <dl class="dl-china">
                                <dt><a target="_blank" data-mes-g="0-1-0-1-11" data-mes-t="Array"
                                       data-v="M12871P%E7%A6%8F%E5%BB%BA" rel="nofollow"
                                       href="/sales/0-0-M12871P%E7%A6%8F%E5%BB%BA-0-0-0-0-0.html">福建</a>
                                </dt>
                                <dd>
                                    <div class="place-nav">
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=厦门">厦门</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=鼓浪屿">鼓浪屿</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=武夷山">武夷山</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=福州">福州</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=西藏">西藏</a><span class="split"></span></span>
                                    </div>
                                </dd>
                            </dl>
                            <dl class="dl-china">
                                <dt><a target="_blank" data-mes-g="0-1-0-1-12" data-mes-t="Array"
                                       href="${pageContext.request.contextPath}/search?indexsearch=shop&key=广东">广东</a>
                                </dt>
                                <dd>
                                    <div class="place-nav">
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=广州">广州</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=珠海">珠海</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=深圳">深圳</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=长隆">长隆</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=佛山">佛山</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=惠州">惠州</a><span class="split"></span></span>
                                    </div>
                                </dd>
                            </dl>
                            <dl class="dl-china">
                                <dt><a target="_blank" data-mes-g="0-1-0-1-13" data-mes-t="Array"
                                       href="${pageContext.request.contextPath}/search?indexsearch=shop&key=内蒙古">内蒙古</a>
                                </dt>
                                <dd>
                                    <div class="place-nav">
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=呼伦贝尔">呼伦贝尔</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=海拉尔">海拉尔</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=满洲里">满洲里</a><span class="split"></span></span>
                                    </div>
                                </dd>
                            </dl>
                            <dl class="dl-china">
                                <dt><a target="_blank" data-mes-g="0-1-0-1-14" data-mes-t="Array"
                                       href="${pageContext.request.contextPath}/search?indexsearch=shop&key=安徽!=end=!江西">安徽/江西</a>
                                </dt>
                                <dd>
                                    <div class="place-nav">
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=黄山">黄山</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=婺源">婺源</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=庐山">庐山</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=三清山">三清山</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=南昌">南昌</a><span class="split"></span></span>
                                    </div>
                                </dd>
                            </dl>
                            <dl class="dl-china">
                                <dt><a target="_blank" data-mes-g="0-1-0-1-15" data-mes-t="Array"
                                       href="${pageContext.request.contextPath}/search?indexsearch=shop&key=河北">河北</a>
                                </dt>
                                <dd>
                                    <div class="place-nav">
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=北戴河">北戴河</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=秦皇岛">秦皇岛</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=石家庄">石家庄</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=承德">承德</a><span class="split"></span></span>
                                    </div>
                                </dd>
                            </dl>
                            <dl class="dl-china">
                                <dt><a target="_blank" data-mes-g="0-1-0-1-16" data-mes-t="Array"
                                       href="${pageContext.request.contextPath}/search?indexsearch=shop&key=山西">山西</a>
                                </dt>
                                <dd>
                                    <div class="place-nav">
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=太原">太原</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=平遥">平遥</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=五台山">五台山</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=壶口瀑布">壶口瀑布</a><span class="split"></span></span>
                                    </div>
                                </dd>
                            </dl>
                            <dl class="dl-china">
                                <dt><a target="_blank" data-mes-g="0-1-0-1-17" data-mes-t="Array"
                                       href="${pageContext.request.contextPath}/search?indexsearch=shop&key=河南">河南</a>
                                </dt>
                                <dd>
                                    <div class="place-nav">
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=郑州">郑州</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=开封">开封</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=洛阳">洛阳</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=龙门石窟">龙门石窟</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=少林寺">少林寺</a><span class="split"></span></span>
                                    </div>
                                </dd>
                            </dl>
                        </div>
                    </div>
                </div>
                <div class="category-panel hide" data-panel-target="日本"
                     data-mes-g="0-1-1" data-mes-t="日本">
                    <div class="bd bd-country clearfix">
                        <div class="col-left" data-mes-g="0-1-1-0" data-mes-t="左侧区域">
                            <dl class="dl-country" data-mes-g="0-1-1-0-0"
                                data-mes-t="日本">
                                <dt><a target="_blank" data-v="M10183P%E6%97%A5%E6%9C%AC"
                                       data-mes-g="0-1-1-0-0" data-mes-t="日本"
                                       href="${pageContext.request.contextPath}/search?indexsearch=shop&key=日本">日本</a>
                                </dt>
                                <dd>
                                    <div class="place-nav" data-mes-g="0-1-1-0-0-0" data-mes-t="目的地">
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=日本">日本</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=东京">东京</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=大阪">大阪</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=冲绳">冲绳</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=北海道">北海道</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=京都">京都</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=名古屋">名古屋</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=箱根">箱根</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=奈良">奈良</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=福冈">福冈</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=九州">九州</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=香川">香川</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=高松">高松</a><span class="split"></span></span>
                                    </div>
                                </dd>
                            </dl>
                        </div>
                    </div>
                </div>
                <div class="category-panel hide" data-panel-target="东南亚 南亚 泰国"
                     data-mes-g="0-1-2" data-mes-t="东南亚 南亚 泰国">
                    <div class="bd bd-country clearfix">
                        <div class="row" data-mes-g="0-1-2-0" data-mes-t="上方区域">
                            <dl class="dl-country" data-mes-g="0-1-2-0-0"
                                data-mes-t="泰国">
                                <dt><a target="_blank" data-v="M10083P%E6%B3%B0%E5%9B%BD"
                                       data-mes-g="0-1-2-0-0" data-mes-t="泰国"
                                       rel="nofollow"
                                       href="${pageContext.request.contextPath}/search?indexsearch=shop&key=泰国">泰国</a>
                                </dt>
                                <dd>
                                    <div class="place-nav" data-mes-g="0-1-2-0-0-0" data-mes-t="目的地">
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=普吉岛">普吉岛</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=清迈">清迈</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=苏梅岛">苏梅岛</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=曼谷">曼谷</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=甲米">甲米</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=芭提雅">芭提雅</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=象岛">象岛</a><span class="split"></span></span>
                                    </div>
                                </dd>
                            </dl>
                            <dl class="dl-country" data-mes-g="0-1-2-0-1"
                                data-mes-t="南亚">
                                <dt><a target="_blank" data-v="M10101'M11058'M10069'M10182P%E5%8D%97%E4%BA%9A"
                                       data-mes-g="0-1-2-0-1" data-mes-t="南亚"
                                       rel="nofollow"
                                       href="${pageContext.request.contextPath}/search?indexsearch=shop&key=南亚">南亚</a>
                                </dt>
                                <dd>
                                    <div class="place-nav" data-mes-g="0-1-2-0-1-0" data-mes-t="目的地">
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=马尔代夫">马尔代夫</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=斯里兰卡">斯里兰卡</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=尼泊尔">尼泊尔</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=印度">印度</a><span class="split"></span></span>
                                    </div>
                                </dd>
                            </dl>
                            <dl class="dl-country" data-mes-g="0-1-2-0-2"
                                data-mes-t="越柬老缅">
                                <dt><a target="_blank" data-v="M10180'M10070'M10820'M10179P%E8%B6%8A%E6%9F%AC%E8%80%81%E7%BC%85"
                                       data-mes-g="0-1-2-0-2" data-mes-t="越柬老缅"
                                       rel="nofollow"
                                       href="${pageContext.request.contextPath}/search?indexsearch=shop&key=越柬老缅">越柬老缅</a>
                                </dt>
                                <dd>
                                    <div class="place-nav" data-mes-g="0-1-2-0-2-0" data-mes-t="目的地">
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=越南">越南</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=芽庄">芽庄</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=柬埔寨">柬埔寨</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=岘港">岘港</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=吴哥窟">吴哥窟</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=缅甸">缅甸</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=老挝">老挝</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=胡志明">胡志明</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=美奈">美奈</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=大叻">大叻</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=河内">河内</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=暹粒">暹粒</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=金边">金边</a><span class="split"></span></span>
                                    </div>
                                </dd>
                            </dl>
                            <dl class="dl-country" data-mes-g="0-1-2-0-3"
                                data-mes-t="菲律宾|文莱">
                                <dt><a target="_blank" data-v="M10067'M10753P%E8%8F%B2%E5%BE%8B%E5%AE%BE%7C%E6%96%87%E8%8E%B1"
                                       data-mes-g="0-1-2-0-3" data-mes-t="菲律宾|文莱"
                                       rel="nofollow"
                                       href="${pageContext.request.contextPath}/search?indexsearch=shop&key=菲律宾!=end=!文莱">菲律宾|文莱</a>
                                </dt>
                                <dd>
                                    <div class="place-nav" data-mes-g="0-1-2-0-3-0" data-mes-t="目的地">
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=菲律宾">菲律宾</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=长滩岛">长滩岛</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=杜马盖地">杜马盖地</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=薄荷岛">薄荷岛</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=宿雾">宿雾</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=文莱">文莱</a><span class="split"></span></span>
                                    </div>
                                </dd>
                            </dl>
                            <dl class="dl-country" data-mes-g="0-1-2-0-4"
                                data-mes-t="印尼|马来|新加坡">
                                <dt><a target="_blank" data-v="M10181'M10097'M10754P%E5%8D%B0%E5%B0%BC%7C%E9%A9%AC%E6%9D%A5%7C%E6%96%B0%E5%8A%A0%E5%9D%A1"
                                       data-mes-g="0-1-2-0-4" data-mes-t="印尼|马来|新加坡"
                                       rel="nofollow"
                                       href="${pageContext.request.contextPath}/search?indexsearch=shop&key=印尼!=end=!马来!=end=!新加坡">印尼|马来|新加坡</a>
                                </dt>
                                <dd>
                                    <div class="place-nav" data-mes-g="0-1-2-0-4-0" data-mes-t="目的地">
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=巴厘岛">巴厘岛</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=马来西亚">马来西亚</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=沙巴">沙巴</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=仙本那">仙本那</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=兰卡威">兰卡威</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=印度尼西亚">印度尼西亚</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=美娜多">美娜多</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=吉隆坡">吉隆坡</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=新加坡">新加坡</a><span class="split"></span></span>
                                    </div>
                                </dd>
                            </dl>
                        </div>
                    </div>
                </div>
                <div class="category-panel hide" data-panel-target="香港 澳门 台湾"
                     data-mes-g="0-1-3" data-mes-t="香港 澳门 台湾">
                    <div class="bd bd-country clearfix">
                        <div class="col-left" data-mes-g="0-1-3-0" data-mes-t="左侧区域">
                            <dl class="dl-country" data-mes-g="0-1-3-0-0"
                                data-mes-t="香港 澳门">
                                <dt><a target="_blank" data-v="M10189'M10206P%E9%A6%99%E6%B8%AF+%E6%BE%B3%E9%97%A8"
                                       data-mes-g="0-1-3-0-0" data-mes-t="香港 澳门"
                                       rel="nofollow"
                                       href="${pageContext.request.contextPath}/search?indexsearch=shop&key香港!=end=!澳门">香港 澳门</a>
                                </dt>
                                <dd>
                                    <div class="place-nav" data-mes-g="0-1-3-0-0-0" data-mes-t="目的地">
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=香港">香港</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=澳门">澳门</a><span class="split"></span></span>
                                    </div>
                                </dd>
                            </dl>
                            <dl class="dl-country" data-mes-g="0-1-3-0-1"
                                data-mes-t="台湾">
                                <dt><a target="_blank" data-v="M12684P%E5%8F%B0%E6%B9%BE"
                                       data-mes-g="0-1-3-0-1" data-mes-t="台湾"
                                       rel="nofollow"
                                       href="${pageContext.request.contextPath}/search?indexsearch=shop&key=台湾">台湾</a>
                                </dt>
                                <dd>
                                    <div class="place-nav" data-mes-g="0-1-3-0-1-0" data-mes-t="目的地">
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=台北">台北</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=垦丁">垦丁</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=高雄">高雄</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=花莲">花莲</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=南投">南投</a><span class="split"></span></span>
                                    </div>
                                </dd>
                            </dl>
                        </div>
                    </div>
                </div>
                <div class="category-panel hide" data-panel-target="欧洲 美洲"
                     data-mes-g="0-1-4" data-mes-t="欧洲 美洲">
                    <div class="bd bd-country clearfix">
                        <div class="col-left" data-mes-g="0-1-4-0" data-mes-t="左侧区域">
                            <dl class="dl-country" data-mes-g="0-1-4-0-0"
                                data-mes-t="欧洲">
                                <dt><a target="_blank" data-v="M14383P%E6%AC%A7%E6%B4%B2"
                                       data-mes-g="0-1-4-0-0" data-mes-t="欧洲"
                                       rel="nofollow"
                                       href="${pageContext.request.contextPath}/search?indexsearch=shop&key=欧洲">欧洲</a>
                                </dt>
                                <dd>
                                    <div class="place-nav" data-mes-g="0-1-4-0-0-0" data-mes-t="目的地">
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=英国">英国</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=法国">法国</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=意大利">意大利</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=芬兰">芬兰</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=德国">德国</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=俄罗斯">俄罗斯</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=土耳其">土耳其</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=希腊">希腊</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=冰岛">冰岛</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=瑞士">瑞士</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=西班牙">西班牙</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=伦敦">伦敦</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=巴黎">巴黎</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=圣托里尼">圣托里尼</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=罗马">罗马</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=捷克">捷克</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=奥地利">奥地利</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=丹麦">丹麦</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=匈牙利">匈牙利</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=荷兰">荷兰</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=普罗旺斯">普罗旺斯</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=比利时">比利时</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=巴塞罗那">巴塞罗那</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=南投">南投</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=贝加尔湖">贝加尔湖</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=马德里">马德里</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=葡萄牙">葡萄牙</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=波兰">波兰</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=梵蒂冈">梵蒂冈</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=爱尔兰">爱尔兰</a><span class="split"></span></span>
                                    </div>
                                </dd>
                            </dl>
                            <dl class="dl-country" data-mes-g="0-1-4-0-1"
                                data-mes-t="美洲">
                                <dt><a target="_blank" data-v="M10062'M10177P%E7%BE%8E%E6%B4%B2"
                                       data-mes-g="0-1-4-0-1" data-mes-t="美洲"
                                       rel="nofollow"
                                       href="${pageContext.request.contextPath}/search?indexsearch=shop&key=美洲">美洲</a>
                                </dt>
                                <dd>
                                    <div class="place-nav" data-mes-g="0-1-4-0-1-0" data-mes-t="目的地">
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=美国">美国</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=加拿大">加拿大</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=洛杉矶">洛杉矶</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=旧金山">纽约</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=纽约">纽约</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=塞班岛">塞班岛</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=关岛">关岛</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=夏威夷">夏威夷</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=黄石公园">黄石公园</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=阿根廷">阿根廷</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=西雅图">西雅图</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=华盛顿">华盛顿</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=波士顿">波士顿</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=迈阿密">迈阿密</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=古巴">古巴</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=墨西哥">墨西哥</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=拉斯维加斯">拉斯维加斯</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=芝加哥">芝加哥</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=秘鲁">秘鲁</a><span class="split"></span></span>
                                    </div>
                                </dd>
                            </dl>
                        </div>
                    </div>
                </div>
                <div class="category-panel hide" data-panel-target="澳洲 中东 非洲"
                     data-mes-g="0-1-5" data-mes-t="澳洲 中东 非洲">
                    <div class="bd bd-country clearfix">
                        <div class="col-left" data-mes-g="0-1-5-0" data-mes-t="左侧区域">
                            <dl class="dl-country" data-mes-g="0-1-5-0-0"
                                data-mes-t="澳洲">
                                <dt><a target="_blank" data-v="M14701P%E6%BE%B3%E6%B4%B2"
                                       data-mes-g="0-1-5-0-0" data-mes-t="澳洲"
                                       rel="nofollow"
                                       href="${pageContext.request.contextPath}/search?indexsearch=shop&key=澳洲">澳洲</a>
                                </dt>
                                <dd>
                                    <div class="place-nav" data-mes-g="0-1-5-0-0-0" data-mes-t="目的地">
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=澳大利亚">澳大利亚</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=新西兰">新西兰</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=墨尔本">墨尔本</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=悉尼">悉尼</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=奥克兰">奥克兰</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=悉尼歌剧院">悉尼歌剧院</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=皇后镇">皇后镇</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=大堡礁">大堡礁</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=帕劳">帕劳</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=斐济">斐济</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=里斯本">里斯本</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=凯恩斯">凯恩斯</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=大溪地">大溪地</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=珀斯">珀斯</a><span class="split"></span></span>
                                    </div>
                                </dd>
                            </dl>
                            <dl class="dl-country" data-mes-g="0-1-5-0-1"
                                data-mes-t="中东">
                                <dt><a target="_blank" data-v="M10053'M11213P%E4%B8%AD%E4%B8%9C"
                                       data-mes-g="0-1-5-0-1" data-mes-t="中东"
                                       rel="nofollow"
                                       href="${pageContext.request.contextPath}/search?indexsearch=shop&key=中东">中东</a>
                                </dt>
                                <dd>
                                    <div class="place-nav" data-mes-g="0-1-5-0-1-0" data-mes-t="目的地">
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=土耳其">土耳其</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=迪拜">迪拜</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=阿布扎比">阿布扎比</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=阿联酋">阿联酋</a><span class="split"></span></span>
                                    </div>
                                </dd>
                            </dl>
                            <dl class="dl-country" data-mes-g="0-1-5-0-2"
                                data-mes-t="非洲">
                                <dt><a target="_blank" data-v="M14517P%E9%9D%9E%E6%B4%B2"
                                       data-mes-g="0-1-5-0-2" data-mes-t="非洲"
                                       rel="nofollow"
                                       href="${pageContext.request.contextPath}/search?indexsearch=shop&key=非洲">非洲</a>
                                </dt>
                                <dd>
                                    <div class="place-nav" data-mes-g="0-1-5-0-2-0" data-mes-t="目的地">
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=毛里求斯">毛里求斯</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=塞舌尔">塞舌尔</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=埃及">埃及</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=摩洛哥">摩洛哥</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=南非">南非</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=马达加斯加">马达加斯加</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=法属留尼汪">法属留尼汪</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=突尼斯">突尼斯</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=肯尼亚">肯尼亚</a><span class="split"></span></span>
                                    </div>
                                </dd>
                            </dl>
                        </div>
                    </div>
                </div>
                <div class="category-panel hide" data-panel-target="热门海岛"
                     data-mes-g="0-1-6" data-mes-t="热门海岛">
                    <div class="bd bd-country clearfix">
                        <div class="col-left" data-mes-g="0-1-6-0" data-mes-t="左侧区域">
                            <dl class="dl-country" data-mes-g="0-1-6-0-0"
                                data-mes-t="当季热门">
                                <dt><a target="_blank" data-v="M11047'M10460'M15911'M11044'M14210'M10077'M10737'M19016'M10927'M10344P%E5%BD%93%E5%AD%A3%E7%83%AD%E9%97%A8"
                                       data-mes-g="0-1-6-0-0" data-mes-t="当季热门"
                                       rel="nofollow"
                                    >当季热门</a>
                                </dt>
                                <dd>
                                    <div class="place-nav" data-mes-g="0-1-6-0-0-0" data-mes-t="目的地">
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=普吉岛">普吉岛</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=巴厘岛">巴厘岛</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=苏梅岛">苏梅岛</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=帕劳">帕劳</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=塞班岛">塞班岛</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=长滩岛">长滩岛</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=斐济">斐济</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=关岛">关岛</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=夏威夷">夏威夷</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=斯里兰卡">斯里兰卡</a><span class="split"></span></span>
                                    </div>
                                </dd>
                            </dl>
                            <dl class="dl-country" data-mes-g="0-1-6-0-1"
                                data-mes-t="高端奢华">
                                <dt><a target="_blank" data-v="M10101'M11761'M10344'M16827P%E9%AB%98%E7%AB%AF%E5%A5%A2%E5%8D%8E"
                                       data-mes-g="0-1-6-0-1" data-mes-t="高端奢华"
                                       rel="nofollow">高端奢华</a>
                                </dt>
                                <dd>
                                    <div class="place-nav" data-mes-g="0-1-6-0-1-0" data-mes-t="目的地">
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=马尔代夫">马尔代夫</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=毛里求斯">毛里求斯</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=大溪地">大溪地</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=塞舌尔">塞舌尔</a><span class="split"></span></span>
                                    </div>
                                </dd>
                            </dl>
                            <dl class="dl-country" data-mes-g="0-1-6-0-2"
                                data-mes-t="马尔代夫">
                                <dt><a target="_blank" data-v="M10101P%E9%A9%AC%E5%B0%94%E4%BB%A3%E5%A4%AB"
                                       data-mes-g="0-1-6-0-2" data-mes-t="马尔代夫"
                                       rel="nofollow"
                                       href="${pageContext.request.contextPath}/search?indexsearch=shop&key=马尔代夫">马尔代夫</a>
                                </dt>
                                <dd>
                                    <div class="place-nav" data-mes-g="0-1-6-0-2-0" data-mes-t="目的地">
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=阿玛瑞岛">阿玛瑞岛</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=库拉玛提岛">库拉玛提岛</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=中央格兰德">中央格兰德</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=双鱼岛">双鱼岛</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=蕉叶岛">蕉叶岛</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=薇拉瓦鲁岛">薇拉瓦鲁岛</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=泰姬珊瑚岛">泰姬珊瑚岛</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=康杜玛岛">康杜玛岛</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=波杜希蒂岛">波杜希蒂岛</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=鲁滨逊岛">鲁滨逊岛</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=蜜月岛">蜜月岛</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=奥露岛">奥露岛</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=萨芙莉岛">萨芙莉岛</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=罗马庄园岛">罗马庄园岛</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=瑞提拉岛">瑞提拉岛</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=美露丽芙岛">美露丽芙岛</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=吉哈德岛">吉哈德岛</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=神仙珊瑚岛">神仙珊瑚岛</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=都喜天阙">都喜天阙</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=AKV安娜塔拉吉哈瓦岛">AKV安娜塔拉吉哈瓦岛</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=奥特瑞格科诺塔">奥特瑞格科诺塔</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=第六感拉姆岛">第六感拉姆岛</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=四季库达呼拉岛">四季库达呼拉岛</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=阿雅达岛">阿雅达岛</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=卓美亚维塔维丽岛">卓美亚维塔维丽岛</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=柏悦哈达哈">柏悦哈达哈</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=奥臻岛">奥臻岛</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=瑞喜敦岛">瑞喜敦岛</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=莉莉岛">莉莉岛</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=港丽岛">港丽岛</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=玛娜法鲁岛">玛娜法鲁岛</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=香格里拉岛">香格里拉岛</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=博瑞哈达哈岛">博瑞哈达哈岛</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=尼亚玛岛">尼亚玛岛</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=宁静岛">宁静岛</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=四季兰达吉拉瓦鲁岛">四季兰达吉拉瓦鲁岛</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=白马庄园">白马庄园</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=卓美亚德瓦纳芙希岛">卓美亚德瓦纳芙希岛</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=芙花芬岛">芙花芬岛</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=维拉私人岛">维拉私人岛</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=蓝色美人蕉">蓝色美人蕉</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=艾布度岛">艾布度岛</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=安嘎嘎岛">安嘎嘎岛</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=白金岛">白金岛</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=卡尼岛">卡尼岛</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=班度士岛">班度士岛</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=天堂岛">天堂岛</a><span class="split"></span></span>
                                        <span class="p-item"><a target="_blank" href="${pageContext.request.contextPath}/search?indexsearch=shop&key=库达富士岛">库达富士岛</a><span class="split"></span></span>
                                    </div>
                                </dd>
                            </dl>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%--轮播图--%>
        <div class="sales-focus">
            <div class="sales-slide" data-mes-g="0-2" data-mes-t="轮播图区域" data-slide="1">
                <ul class="slide-img" style="width:3650px;" data-mes-g="0-2-0" data-mes-t="轮播图">
                    <%
                        List<OrdersBean> ordersBeans = (List)request.getAttribute("shopshow");
                        for(int i=0;i<ordersBeans.size();i++){
                    %>
                    <li>
                        <a href="${pageContext.request.contextPath}/shop?id=<%=ordersBeans.get(i).getId()%>" target="_blank">
                            <img src="<%=ordersBeans.get(i).getImage()%>" height="405" width="730">
                        </a>
                    </li>
                    <%}%>
                </ul>
                <ul class="slide-nav">
                    <% for(int i=0;i<ordersBeans.size();i++){%>
                    <li class="on"> <%=ordersBeans.get(i).getTitle()%></li>
                    <%}%>
                </ul>
                <span class="slide-btn btn-left" data-btn-prev="1" data-mes-g="0-2-2" data-mes-t="控制左"><i></i></span>
                <span class="slide-btn btn-right" data-btn-next="1" data-mes-g="0-2-3" data-mes-t="控制右"><i></i></span>
            </div>
            <div class="safeguard">
                <ul class="clearfix">
                    <li>
                        <i class="icon1"></i>
                        <strong>透明低价</strong>
                        <div>超值低价、每日更新</div>
                    </li>
                    <li>
                        <i class="icon2"></i>
                        <strong>海量路线</strong>
                        <div>全球线路、自由选择</div>
                    </li>
                    <li>
                        <i class="icon3"></i>
                        <strong>客服保障</strong>
                        <div>专业客服、实时在线</div>
                    </l i>
                </ul>
            </div>
        </div>
        <div class="bg"></div>
    </div>
    <div data-mes-g="1" data-mes-t="BJ" id="layout_area">
        <%
            List<PromoReturnBean> list = (List) request.getAttribute("promo");
            for(int i=0;i<list.size();i++){
        %>
            <div class="mod-promo">
                <div class="mod-hd">
                    <a>
                        <h2 ><%=list.get(i).getTitle1()%></h2>
                    </a>
                    <h2><span><%=list.get(i).getTitle2()%></span></h2>
                </div>
                <div class="mod-bd" data-mes-g="1-1" data-mes-t="产品区">
                    <ul class="sales-cards clearfix" data-change-step="not-set" id="Js_hotSalesImg">
                        <%
                            List<OrdersBean> listorder = list.get(i).getOrders();
                            for(int j=0;j<listorder.size();j++){
                        %>
                        <li class="item" data-change="list">
                            <a href="${pageContext.request.contextPath}/shop?id=<%=listorder.get(j).getId()%>" target="_blank"
                               data-mes-g="1-1-0" data-mes-t="位置0"
                               data-mes-salesid="2032398">
                                <div class="image">
                                    <img src="<%=listorder.get(j).getImage()%>" height="134" width="238">
                                </div>
                                <div class="caption">
                                    <h3 title="<%=listorder.get(j).getTitle()%>"><%=listorder.get(j).getTitle()%></h3>
                                    <span class="price"><b>￥<%=listorder.get(j).getPrice()%></b>起</span>
                                </div>
                            </a>
                        </li>
                        <%}%>
                    </ul>
                </div>
            </div>
        <%
            }
            %>
    </div>
</div>
<script type="text/javascript">
    $(function () {
        var $body = $('body');

        var salesIndex = {
            init: function () {
                this.lunBoTu();
                this.search();
                this.tabChange();
            },
            // 轮播图
            lunBoTu: function () {
                var panelSwitchTimeout = 0, panelSwitchDelay = 100, panelHideDelay = 250, panelHideTimeout = 0;
                $("[data-panel=1]").on("mouseenter", function () {
                    window.clearTimeout(panelSwitchTimeout);
                });

                $("[data-type=left-nav]").on("mouseenter", function () {

                    var nav = $(this), navTarget = nav.data("navTarget"), panel = $('[data-panel="1"]');
                    window.clearTimeout(panelSwitchTimeout);
                    panelSwitchTimeout = window.setTimeout(function () {
                        nav.addClass('hover').siblings("[data-type=left-nav]").removeClass("hover");
                        panel.show().find('[data-panel-target]').hide().end()
                            .find('[data-panel-target="' + navTarget + '"]').show();
                    }, panelSwitchDelay);
                });

                $("[data-entire-nav]").hover(function () {
                    window.clearTimeout(panelHideTimeout);
                }, function () {
                    window.clearTimeout(panelSwitchTimeout);
                    panelHideTimeout = window.setTimeout(function () {
                        $("[data-type=left-nav]").removeClass("hover");
                        $("[data-panel=1]").hide();
                    }, panelHideDelay);

                });
                $('[data-slide=1]').mfwSlide({
                    'width': 730,
                    'height': 405,
                    'speed': 500,  //滚动速度
                    'item': '.slide-img>li',
                    'thumb_box': '.slide-nav',  //缩略图，没有请置空
                    'thumb_item': 'li', //缩略图单个元素
                    'prev_btn': '[data-btn-prev]',   //前一张，没有请置空
                    'next_btn': '[data-btn-next]',   //下一张，没有请置空
                    'thumb_focus_class': 'on',  // 当前正在显示的幻灯对应的缩略图的class
                    'auto_play': true,  // 自动播放
                    'interval': 5,  // 幻灯切换时间间隔
                    'btn_auto_hide': true,  // 自动隐藏上一张，下一张按钮
                    'contain': true, //thumb_box是否是$('#slide_box')的子元素,除特殊情况应该为true
                    'always_play': true // 点击后依旧可以播放
                });

            }
        };
        salesIndex.init();

    });
</script><link href="${pageContext.request.contextPath}/css/index_4.css" rel="stylesheet" type="text/css"/>
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

<link href="${pageContext.request.contextPath}/css/sales/sales1.css" rel="stylesheet" type="text/css"/>
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
