<%@ page import="java.util.List" %>
<%@ page import="com.fk.bean.NewsBean" %>
<%@ page import="com.fk.bean.DiscussBean" %><%--
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
                <li><a href="${pageContext.request.contextPath}/top" id="index_3">榜单</a></li>
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
        <form action="${pageContext.request.contextPath}/search" target="_blank" class="search-form" data-actform="search-click">
            <input name="kw" class="search" maxlength="32" placeholder="找演出" autocomplete="off" type="search">
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
                        <%
                            List<DiscussBean> list = (List)request.getAttribute("discuss");
                            for(int i=0;i<list.size();i++){
                        %>
                        <dd class="comment-item">
                            <div class="comment-avatar">
                                <img src="${pageContext.request.contextPath}/image/ico.png"/>
                            </div>
                            <div class="comment-main">
                                <div class="comment-info">
                                    <div class="comment-nickname">
                                        <%=list.get(i).getUsername()%>
                                    </div>
                                    <div class="comment-time">
                                        <%=list.get(i).getTime()%>
                                    </div>
                                </div>
                                <div class="comment-content">
                                    <%=list.get(i).getContent()%>
                                </div>
                            </div>
                        </dd>
                        <%}%>
                    </dl>
                    <%
                        if(list.size() == 0){
                    %>
                    <div class="no-comments">
                        <div class="no-comments-img"></div>
                        <div class="no-comments-text">暂无评论</div>
                    </div>
                    <%}%>
                </div>
            </div>
            <div class="module">
                <div class="mod-title">
                    <h3>评论</h3>
                </div>
                <div class="mod-content">
                    <form action="${pageContext.request.contextPath}/addDiscuss">
                    <input name="key" type="text" id="key" value="评论字数不超过50" size="30"
                           onmouseover=this.focus();this.select();
                           onclick="if(value==defaultValue){value='';this.style.color='#000'}"
                           onBlur="if(!value){value=defaultValue;this.style.color='#999'}" style="color:#999;width: 400px;" />
                        <input name="id" value="${newsBean.id}" hidden>
                        <input type="submit" value="提交">
                    </form>
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

