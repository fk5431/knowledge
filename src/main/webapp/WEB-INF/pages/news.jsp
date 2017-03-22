<%@ page import="java.util.List" %>
<%@ page import="com.fk.bean.NewsBean" %><%--
  Created by IntelliJ IDEA.
  User: fengkai
  Date: 22/03/17
  Time: 13:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<head>
    <title>资讯  ——  ${newsBean.title}</title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="//ms0.meituan.net/mywww/common.69f27356.css"/>
    <link rel="stylesheet" href="//ms0.meituan.net/mywww/news-detail.babc5c81.css"/>
</head>
<body>
<div class="header">
    <div class="header-inner">
        <a href="${pageContext.request.contextPath}" class="logo" data-act="icon-click"></a>

        <div class="nav">
            <ul class="navbar">
                <li><a href="${pageContext.request.contextPath}" id="index_1" class="active">首页</a></li>
                <li><a href="${pageContext.request.contextPath}/movies" id="index_2">演出</a></li>
                <li><a href="#" id="index_3">榜单</a></li>
                <li><a href="${pageContext.request.contextPath}/hot" id="index_4">热点</a></li>
            </ul>
        </div>

        <div class="user-info">
            <div class="user-avatar J-login">
                <img src="${pageContext.request.contextPath}/image/7dd82a16316ab32c8359debdb04396ef2897.png">
                <span class="caret"></span>
                <ul class="user-menu">
                    <%
                        String login = (String) request.getAttribute("login");
                        if (login == null || "".equals(login) || !"yes".equals(login)) {
                    %>
                    <li><a href="${pageContext.request.contextPath}/log">登录</a></li>
                    <%} else {%>
                    <li><a href="${pageContext.request.contextPath}/info">个人信息</a></li>
                    <%}%>
                </ul>
            </div>
        </div>

        <form action="#" target="_blank" class="search-form" data-actform="search-click">
            <input name="kw" class="search" maxlength="32" placeholder="找影人、演出" autocomplete="off" type="search">
            <input class="submit" value="" type="submit">
        </form>
    </div>
</div>
<div class="header-placeholder"></div>

<div class="container" id="app" class="page-news/detail">
    <div class="news-page">

        <div class="news-main">

            <div class="news-title">
                <h1>${newsBean.title}</h1>
                <div class="news-subtitle">
                    福州文娱演出票务网&nbsp;&nbsp;
                    ${newsBean.time}&nbsp;&nbsp;
                    <span class="news-icon-views"></span>
                    ${newsBean.count}
                </div>
            </div>
            <div class="news-content">
                ${newsBean.content}
            </div>

          <%--  <div class="news-action" data-val="{ newsid: 19594 }">
      <span class="news-action-block like-news" data-act="like-news"
            data-val="{ liked: true }">
        <span class="like-icon"></span>&nbsp;&nbsp;
        <span class="like-news-count" data-count="3">
          3
        </span>
      </span>
            </div>--%>

            <div class="module">
                <div class="mod-title">
                    <h3>最新评论</h3>
                </div>
                <div class="mod-content">
                    <dl class="comments-list">
                        <dd class="comment-item">
                            <div class="comment-avatar">
                                <img src="http://p1.meituan.net/50.50/movie/58d3cb55f20171b337d1da4b33d2e2531171.png"
                                     alt=""
                                     style="background-image: url(https://img.meituan.net/avatar/ce56ae3907491f990075f07d9b6b941f143404.jpg@50w_50h_1e_1c)"/>
                                <div class="level level-v3"></div>
                            </div>
                            <div class="comment-main">
                                <div class="comment-info">
                                    <div class="comment-nickname">
                                        来也匆匆去也匆匆
                                    </div>
                                    <div class="comment-time">
                                        17分钟前&nbsp;天津
                                    </div>
                                </div>
                                <div class="comment-content">
                                    那是三小姐希望能来
                                </div>
                            </div>
                        </dd>
                        <dd class="comment-item">
                            <div class="comment-avatar">
                                <img src="http://p1.meituan.net/50.50/movie/58d3cb55f20171b337d1da4b33d2e2531171.png"
                                     alt=""
                                     style="background-image: url(https://img.meituan.net/avatar/c51918ff779456fa442aae83df25ea66131893.jpg@50w_50h_1e_1c)"/>
                                <div class="level level-v4"></div>
                            </div>
                            <div class="comment-main">
                                <div class="comment-info">
                                    <div class="comment-nickname">
                                        唯爱影
                                    </div>
                                    <div class="comment-time">
                                        52分钟前&nbsp;黄山
                                    </div>
                                </div>
                                <div class="comment-content">
                                    大表哥不管怎样都是帅的
                                </div>
                            </div>
                        </dd>
                        <dd class="comment-item">
                            <div class="comment-avatar">
                                <img src="http://p1.meituan.net/50.50/movie/58d3cb55f20171b337d1da4b33d2e2531171.png"
                                     alt=""
                                     style="background-image: url(https://img.meituan.net/avatar/d0b86da1775c183bc93979e41afa9092145721.jpg@50w_50h_1e_1c)"/>
                                <div class="level level-v4"></div>
                            </div>
                            <div class="comment-main">
                                <div class="comment-info">
                                    <div class="comment-nickname">
                                        绍晓南
                                    </div>
                                    <div class="comment-time">
                                        1小时前&nbsp;合肥
                                    </div>
                                </div>
                                <div class="comment-content">
                                    二小姐能回归就更好了，🌺🌺
                                </div>
                            </div>
                        </dd>
                    </dl>

                </div>
            </div>
        </div>
    </div>
</div>
<div class="footer" style="visibility: visible;">
    <p>
        ©2017
        福州文娱演出票务网 ${pageContext.request.contextPath}
        <a href="*"
           target="_top">*ICP证******号</a>
        <a href="#" target="_top">*ICP备********号</a>
        京公网安备 11010502030881号
        <a href="#" target="_top">网络文化经营许可证</a>
        <a href="#" target="_top">电子公告服务规则</a>
    </p>
    <p>北京猫眼文化传媒有限公司</p>
</div>
<script>
    var state = ${index};
    if (state == 0) {
        document.getElementById('index_1').className = '';
        document.getElementById('index_2').className = '';
        document.getElementById('index_3').className = '';
        document.getElementById('index_4').className = '';
    }
    if (state == 1) {
        document.getElementById('index_1').className = 'active';
        document.getElementById('index_2').className = '';
        document.getElementById('index_3').className = '';
        document.getElementById('index_4').className = '';
    }
    if (state == 2) {
        document.getElementById('index_1').className = '';
        document.getElementById('index_2').className = 'active';
        document.getElementById('index_3').className = '';
        document.getElementById('index_4').className = '';
    }
    if (state == 3) {
        document.getElementById('index_1').className = '';
        document.getElementById('index_2').className = '';
        document.getElementById('index_3').className = 'active';
        document.getElementById('index_4').className = '';
    }
    if (state == 4) {
        document.getElementById('index_1').className = '';
        document.getElementById('index_2').className = '';
        document.getElementById('index_3').className = '';
        document.getElementById('index_4').className = 'active';
    }
</script>
</body>
</html>

