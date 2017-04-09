<%@ page import="java.util.List" %>
<%@ page import="com.fk.bean.UsertravelBean" %>
<%@ page import="com.fk.bean.AuditBean" %>
<%@ page import="com.fk.bean.TravelBean" %><%--
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
    <title>个人中心</title>
    <link href="${pageContext.request.contextPath}/css/my/i.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/css/my/index.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/css/my/index1.css" rel="stylesheet" type="text/css"/>
    <script language="javascript" src="${pageContext.request.contextPath}/js/my/my_1.js" type="text/javascript"></script>
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
                <li class="head-nav-place" id="head_4"><a href="${pageContext.request.contextPath}/my" title="个人中心">个人中心</a>
                </li>

            </ul>
            <div id="pagelet-block-abb1ca45f330cf8a24ad20466d690c67" class="pagelet-block">
                <div class="login-out">
                    <% String login = (String) request.getAttribute("login");
                        if (login == null || "".equals(login) || !"yes".equals(login)) { %>
                    <a id="_j_showlogin" title="登录" href="${pageContext.request.contextPath}/login"
                       rel="nofollow">登录</a>
                    <span class="split">|</span>
                    <a href="${pageContext.request.contextPath}/register" title="注册帐号"
                       rel="nofollow">注册</a>
                    <span class="split">|</span>
                    <a href="${pageContext.request.contextPath}/forget" title="找回密码"
                       rel="nofollow">找回密码</a>
                    <%} else {%>
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

<div class="main">

    <div class="center clearfix">
        <div class="side_bar flt1">
            <style>
                .MProfile pre {
                    white-space: pre-wrap;
                    word-wrap: break-word;
                }
            </style>

            <div class="MAvatar">
                <div class="MAvaImg">
                    <img src="${pageContext.request.contextPath}/images/test/pp120.gif" height="120" width="120"
                         alt="${user.username}"><a class="MAvaUp"><i class="Mphoto"></i></a></i>
                </div>
                <div class="MAvaName">${user.username}
                </div>

                <div class="MAvaInfo clearfix MAvaMyInfo">
                    <span class="MAvaLevel flt1">等级：<a title="Lv.1" target="_blank">Lv.1</a></span>
                </div>

                <div class="MAvaMore clearfix">
                    <div class="MAvaNums">
                        <strong><a href="${pageContext.request.contextPath}/mylike" target="_blank">${count}</a></strong>
                        <p>喜欢</p>
                    </div>
                    <div class="MAvaNums">
                        <strong><a></a></strong>
                        <p>敬请关注</p>
                    </div>
                    <div class="MAvaNums last">
                        <strong><a></a></strong>
                        <p>敬请关注</p>
                    </div>
                </div>
            </div>


            <div class="MHonor">
                <div class="MHonTitle">攻略标签云</div>
                <div class="MHonDetail" id="_j_privicnt">
                    <div class="MHonList">
                        <ul class="clearfix" id="_j_privi_listcnt">
                            <li>
                                <a href="/user/lv.php" target="_blank"><i class="_j_priviitem i2"
                                                                          data-description="Lv1.特权：好友上限"></a></i>
                                <a href="/user/lv.php" target="_blank"><i class="_j_priviitem i1"
                                                                          data-description="Lv1.特权：攻略下载"></a></i>
                            </li>
                        </ul>
                    </div>
                    <span class="MHonDescription" id="_j_privi_tip" style="display: none;"></span>
                    <div class="MHonBtn"><span class="MPrev2 _j_prev"></span><span class="MNext2 _j_next"></span></div>
                </div>
            </div>
            <div class="MHonor">
                <div class="MHonTitle">商城标签云</div>
                <div class="MHonDetail">
                    <div class="MHonList">
                        <ul class="clearfix">
                            <li>
                                <a href="/user/lv.php" target="_blank"><i class="_j_priviitem i2"
                                                                          data-description="Lv1.特权：好友上限"></a></i>
                                <a href="/user/lv.php" target="_blank"><i class="_j_priviitem i1"
                                                                          data-description="Lv1.特权：攻略下载"></a></i>
                            </li>
                        </ul>
                    </div>
                    <span class="MHonDescription" style="display: none;"></span>
                    <div class="MHonBtn"><span class="MPrev2 _j_prev"></span><span class="MNext2 _j_next"></span></div>
                </div>
            </div>

        </div>
        <div class="content flt2">
            <div class="common_block main_links">
                <ul class="clearfix">
                    <li><a href="${pageContext.request.contextPath}/addarticle" target="_blank"><i class="write_note"></i><span>写游记</span></a>
                    </li>
                    <li><a href="${pageContext.request.contextPath}/mywhere" target="_blank"><i class="add_footprint"></i><span>历史足迹</span></a></li>
                    <li><a href="${pageContext.request.contextPath}/mylike" target="_blank"><i class="ask_expert"></i><span>我感兴趣</span></a></li>
                    <li class="last"><a <%--href="${pageContext.request.contextPath}/myfriend"--%> target="_blank"><i
                            class="invite_friends"></i><span><%--发布结伴--%>敬请期待</span></a></li>
                </ul>
                <div class="open_corner">
                    <a role="button" id="_j_profile_setting"><span><i></i></span></a>
                </div>
            </div>
            <style>
                .attention ._j_followed {
                    display: none
                }

                ._j_focused ._j_followed {
                    display: inline-block
                }

                ._j_focused ._j_follow {
                    display: none
                }
            </style>
            <div class="common_block personal_info" id="_j_taskwrap">
                <div class="personal_tips">
                    <p><strong>${user.username}</strong>，这里是你的向往的地方！</p>
                    <p>是记录你的旅行记忆，结交各路豪杰的地盘儿。现在开启您的旅程！</p>
                </div>
            </div>
            <div class="common_block my_notes">
                <%
                    String status = (String) request.getAttribute("status");
                    if(status.equals("0")){
                %>
                <div class="notes_dcon">
                </div>
                <%}%>
                <div class="common_block my_notes">
                    <div class="notes_list">
                <ul>
                    <li>
                        <dl>
                            <%
                                List<TravelBean> travel = (List)request.getAttribute("travel");
                                for(int i=0;i<travel.size();i++){
                            %>
                            <dd>
                                <div class="note_title clearfix">
                                    <div class="MDing">
                                        <span id="topvote6847007"><%=travel.get(i).getCount()%></span><a href="${pageContext.request.contextPath}/count?id=<%=travel.get(i).getId()%>" title="顶一下">顶</a>
                                    </div>
                                    <div class="note_info">
                                        <h3 >
                                            <a href="${pageContext.request.contextPath}/article?id=<%=travel.get(i).getId()%>" target="_blank" title="个人游记">个人游记</a></h3>
                                        <div class="note_more">
                                            <span class="MInfoNum"><i class="MIcoView"></i><em><%=travel.get(i).getLookcount()%></em></span>
                                            <span class="MInfoNum"><i class="MIcoStar"></i><em><%=travel.get(i).getCount()%></em></span>
                                            <span class="time"><%=travel.get(i).getTime()%></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="note_word">
                                    <%=travel.get(i).getSummary()%>
                                </div>
                            </dd>
                            <%}%>
                        </dl>
                    </li>
                </ul>
                    </div>
                <div class="more_notes">
                    <a href="${pageContext.request.contextPath}/alluserart">共<strong>${count}</strong>篇通过审核</a>
                </div>
            </div>
            </div>


            <%--<div class="common_block my_notes">--%>
                <%--<div class="common_title clearfix">--%>
                    <%--<h2>我的回答</h2>--%>
                <%--</div>--%>
                <%--<div class="notes_default ask_default">--%>
                    <%--<i class="ico_notes"></i>--%>
                    <%--<div class="notes_default_detail">--%>
                        <%--<p>蚂蜂窝问答是一个所有人帮所有人的平台，<br>用你的旅行经验，去帮助其他蜂蜂。</p>--%>
                    <%--</div>--%>
                <%--</div>--%>
            <%--</div>--%>


        </div>
    </div>
</div>

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
