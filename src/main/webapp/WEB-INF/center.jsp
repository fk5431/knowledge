<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: fengkai
  Date: 15/02/17
  Time: 10:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>个人信息</title>
    <link media="all" href="${pageContext.request.contextPath}/css/center/wordbox.css" type="text/css" rel="stylesheet">
    <link media="all" href="${pageContext.request.contextPath}/css/center/index.css" type="text/css" rel="stylesheet">
    <link media="all" href="${pageContext.request.contextPath}/css/center/info.css" type="text/css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/index_style.css">
</head>
<body>
<style>
    header {
        height: 100px;
    }
</style>
<div class="wrap-body">
    <header>
    <jsp:include page="head.jsp"></jsp:include>
    </header>
</div>

<div id="root">
    <div data-reactroot=""><!-- react-empty: 2 -->
        <div class="LoadingBar"></div><!-- react-empty: 4 -->
        <div>
            <div class="Sticky--holder" style="position: relative; top: 0px; right: 0px; bottom: 0px; left: 0px; display: block; float: none; margin: 0px; height: 53px;"></div>
        </div><!-- react-empty: 38 -->
        <main role="main" class="App-main">
            <div><!-- react-empty: 41 -->
                <div><!-- react-empty: 43 -->
                    <div id="ProfileHeader" class="ProfileHeader">
                        <div class="Card">
                            <div class="ProfileHeader-userCover">
                                <div class="UserCover UserCover--colorBlock"></div>
                            </div>
                            <div class="ProfileHeader-wrapper">
                                <div class="ProfileHeader-main">
                                    <div class="UserAvatar ProfileHeader-avatar" style="top: -57px;">
                                        <img class="Avatar Avatar--large UserAvatar-inner" src="${pageContext.request.contextPath}/images/my.jpg" style="width: 160px; height: 160px;"></div>
                                    <div class="ProfileHeader-content">
                                        <div class="ProfileHeader-contentHead">
                                            <h1 class="ProfileHeader-title">
                                                <span class="ProfileHeader-name">欢迎： ${user.uname}</span>
                                                <span class="RichText ProfileHeader-headline">注册邮箱：${user.uemail} </span>
                                            </h1>
                                        </div>
                                    </div>
                                    <div class="MemberButtonGroup ProfileButtonGroup ProfileHeader-buttons">
                                        <button class="Button FollowButton Button--primary Button--blue"type="button">
                                            <span> <a href="${pageContext.request.contextPath}/logout">退出</a></span>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="Profile-main">
                        <div class="Profile-mainColumn">
                            <div class="Card ProfileMain" id="ProfileMain">
                                <div class="ProfileMain-header">
                                    <ul role="tablist" class="Tabs ProfileMain-tabs">
                                        <li role="tab" class="Tabs-item Tabs-item--noMeta">
                                            <a class="Tabs-link is-active" href="${pageContext.request.contextPath}/center?type=1" id="act1">历史浏览
                                                <span class="Tabs-meta">${count1}</span>
                                            </a>
                                        </li>
                                        <li role="tab" class="Tabs-item Tabs-item--noMeta">
                                            <a class="Tabs-link" href="${pageContext.request.contextPath}/center?type=2" id="act2">我的上传
                                                <span class="Tabs-meta">${count2}</span>
                                            </a>
                                        </li>
                                        <li role="tab" class="Tabs-item Tabs-item--noMeta">
                                            <a class="Tabs-link" href="${pageContext.request.contextPath}/center?type=3" id="act3">常用文档
                                                <span class="Tabs-meta">${count3}</span>
                                            </a>
                                        </li>
                                        <li role="tab" class="Tabs-item Tabs-item--noMeta">
                                            <a class="Tabs-link" href="${pageContext.request.contextPath}/center?type=4"  id="act4">我的审核
                                                <span class="Tabs-meta"> ${count4}</span>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                                <div class="List" id="Profile-following">
                                    <div>
                                        <%--<%--%>
                                            <%--String type = (String)request.getAttribute("type");--%>
                                            <%--if("1".equals(type)){--%>
                                        <%--%>--%>
                                        <c:forEach var="f" items="${file}">
                                        <div class="List-item">
                                            <div class="ContentItem" >
                                                <div class="ContentItem-main">
                                                    <div class="ContentItem-image">
                                                        <span class="UserLink UserItem-avatar">
                                                            <div class="Popover">
                                                                <div id="Popover-15688-46640-toggle" class="UserLink-link">
                                                                    <a href="${pageContext.request.contextPath}/showfile?id=${f.fid}">
                                                                    </a>
                                                                </div>
                                                            </div>
                                                        </span>
                                                    </div>
                                                    <div class="ContentItem-head">
                                                        <h2 class="ContentItem-title">
                                                            <div class="UserItem-title">
                                                                <span class="UserLink UserItem-name">
                                                                    <div class="Popover">
                                                                        <div id="Popover-15691-69832-toggle" >
                                                                            <a class="UserLink-link" target="_top" href="${pageContext.request.contextPath}/showfile?id=${f.fid}">${f.title}</a>
                                                                        </div>
                                                                    </div>
                                                                </span>
                                                            </div>
                                                        </h2>
                                                        <div class="ContentItem-meta">
                                                            <div>
                                                                <div class="RichText">
                                                                    ${f.abstractS}
                                                                </div>
                                                                <div class="ContentItem-status">
                                                                    <span class="ContentItem-statusItem">标签 ${f.tags}</span>
                                                                    <span class="ContentItem-statusItem">上传者 ${f.uname}</span>
                                                                    <span class="ContentItem-statusItem">时间 ${f.uploadtime}</span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        </c:forEach>
                                        <style>
                                            .pagelist {padding:10px 0; text-align:center;}
                                            .pagelist span,.pagelist a{ border-radius:3px; border:1px solid #dfdfdf;display:inline-block; padding:5px 12px;}
                                            .pagelist a{ margin:0 3px;}
                                            .pagelist span.current{ background:#09F; color:#FFF; border-color:#09F; margin:0 2px;}
                                            .pagelist a:hover{background:#09F; color:#FFF; border-color:#09F; }
                                            .pagelist label{ padding-left:15px; color:#999;}
                                            .pagelist label b{color:red; font-weight:normal; margin:0 3px;}

                                        </style>
                                        <div class="pagelist">
                                            <%
                                                Integer pageAll = (Integer)request.getAttribute("page");
                                                Integer pageNow = (Integer)request.getAttribute("pageNow");

                                                for(int i=1;i<= pageAll.intValue();i++){
                                                    if(i == pageNow.intValue()){
                                            %>
                                            <span class="current"><%=i%></span>
                                            <%}else{%>
                                            <a href="${pageContext.request.contextPath}/info?page=<%=i%>&type=${type}"><%=i%></a>
                                            <%}}%>
                                            <a href="${pageContext.request.contextPath}/info?page=${pageNow+1}&type=${type}">下一页</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="Profile-sideColumn" data-za-module="RightSideBar">
                            <div class="Card">
                                <div class="Card-header Profile-sideColumnTitle">
                                    <div class="Card-headerText">云</div>
                                </div>
                                <div class="Profile-sideColumnItems">
                                    <div id="box-fixedWidth2" class="wordbox"></div>

                                    <script type="text/javascript" src="${pageContext.request.contextPath}/js/login/jquery-1.9.0.min.js"></script>
                                    <script type="text/javascript" src="${pageContext.request.contextPath}/js/center/wordbox.js"></script>
                                    <script type="text/javascript">
                                        $(function() {
                                            var titles = [${sb1}];
                                            var ids = [${sb2}];
                                            var words = [];
                                            for(var i = 0; i < titles.length; i++) {
                                                words[i] = {
                                                    'title' : titles[i],
                                                    'url' : '${pageContext.request.contextPath}/search?id='+ids[i]
                                                }
                                            }
                                            var colors1 = ['#F46779', '#045DA4'];
                                            var colors2 = ['#D59A3E', '#C58B59'];
                                            var colors3 = ['#49B4E0', '#FCBDA2', '#EBADBD', '#D5C2AF', '#C0BDE5', '#CBCC7F', '#FFDA7F', '#8dd0c3', '#bbbfc6', '#a4d9ef', '#bbdb98'];
                                            // responsive
                                            // 响应式wordbox需要有外层嵌套div
                                            $('#box-fixedWidth2').wordbox({
                                                isLead: true,
                                                words: words,
                                                colors: colors3,
                                                borderWidth: 2,
                                                isFixedWidth: true,
                                                width: 280,
                                                height: 300
                                            });
                                            // 鼠标浮动加下划线
                                            $('.box a').hover(function(event) {
                                                $(this).css({'text-decoration': 'underline'});
                                                event.stopPropagation();
                                            }, function(event) {
                                                $(this).css({'text-decoration': 'none'});
                                                event.stopPropagation();
                                            });
                                            // 鼠标浮动字体变大
                                            var fontSize = $('#box-responsive').css('font-size');
                                            $('#box-fixedWidth1 .box a').hover(function(event) {
                                                $(this).css({'font-size': '1.4em'});
                                                event.stopPropagation();
                                            }, function(event) {
                                                $(this).css({'font-size': fontSize});
                                                event.stopPropagation();
                                            });
                                        });
                                    </script>
                                </div>
                            </div><!-- react-empty: 300 -->
                        </div>
                    </div>
                </div>
            </div>
        </main><!-- react-empty: 324 --><!-- react-empty: 325 --><!-- react-empty: 326 -->
    </div>
</div>
<script>
    var type = ${type};
    if (type == '1') {
        document.getElementById('act1').className = 'Tabs-link is-active';
        document.getElementById('act2').className = 'Tabs-link';
        document.getElementById('act3').className = 'Tabs-link';
        document.getElementById('act4').className = 'Tabs-link';
    }
    if (type == '2') {
        document.getElementById('act1').className = 'Tabs-link';
        document.getElementById('act2').className = 'Tabs-link is-active';
        document.getElementById('act3').className = 'Tabs-link';
        document.getElementById('act4').className = 'Tabs-link';
    }
    if (type == '3') {
        document.getElementById('act1').className = 'Tabs-link';
        document.getElementById('act2').className = 'Tabs-link';
        document.getElementById('act3').className = 'Tabs-link is-active';
        document.getElementById('act4').className = 'Tabs-link';
    }
    if (type == '4') {
        document.getElementById('act1').className = 'Tabs-link';
        document.getElementById('act2').className = 'Tabs-link';
        document.getElementById('act3').className = 'Tabs-link';
        document.getElementById('act4').className = 'Tabs-link is-active';
    }
</script>

</body>
</html>