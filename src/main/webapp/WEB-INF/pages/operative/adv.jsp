<%@ page import="java.util.List" %>
<%@ page import="com.fk.bean.NewsBean" %><%--
  Created by IntelliJ IDEA.
  User: fengkai
  Date: 23/03/17
  Time: 13:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>后台管理中心</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/ocss/pintuer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/ocss/admin.css">
    <script src="${pageContext.request.contextPath}/ojs/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/ojs/pintuer.js"></script>
</head>
<body style="background-color:#f2f9fd;">
<div class="header bg-main">
    <div class="logo margin-big-left fadein-top">
        <h1> 后台管理中心</h1>
    </div>
    <div class="head-l"><a class="button button-little bg-green" href="${pageContext.request.contextPath}"
                           target="_blank"><span class="icon-home"></span> 前台首页</a> &nbsp;&nbsp;<a
            class="button button-little bg-red" href="${pageContext.request.contextPath}/operative/login"><span
            class="icon-power-off"></span> 退出登录</a></div>
</div>
<div class="leftnav">
    <div class="leftnav-title"><strong><span class="icon-list"></span>菜单列表</strong></div>
    <h2><span class="icon-user"></span>基本修改</h2>
    <ul style="display:block">
        <li><a href="${pageContext.request.contextPath}/operative/user"><span class="icon-caret-right"></span>网站用户</a></li>
        <li><a href="${pageContext.request.contextPath}/operative/pass"><span class="icon-caret-right"></span>演员管理</a>
        </li>
        <li><a href="${pageContext.request.contextPath}/operative/page"><span class="icon-caret-right"></span>资讯添加</a>
        </li>
        <li><a href="${pageContext.request.contextPath}/operative/adv"><span class="icon-caret-right"></span>首页轮播</a>
        </li>
        <li><a href="${pageContext.request.contextPath}/operative/book"><span class="icon-caret-right"></span>演出添加</a>
        </li>
        <li><a href="${pageContext.request.contextPath}/operative/column"><span class="icon-caret-right"></span>演出管理</a>
        </li>
    </ul>
    <h2><span class="icon-pencil-square-o"></span>高级修改</h2>
    <ul>
        <li><a href="${pageContext.request.contextPath}/operative/per"><span class="icon-caret-right"></span>演员添加</a>
        </li>
        <li><a href="${pageContext.request.contextPath}/operative/type"><span class="icon-caret-right"></span>分类管理</a>
        </li>
        <li><a href="${pageContext.request.contextPath}/operative/site"><span class="icon-caret-right"></span>影院管理</a>
        </li>
        <li><a href="${pageContext.request.contextPath}/operative/addsite"><span
                class="icon-caret-right"></span>影院添加</a></li>
        <li><a href="${pageContext.request.contextPath}/operative/buy"><span class="icon-caret-right"></span>订单管理</a>
        </li>
    </ul>
</div>
<script type="text/javascript">
    $(function () {
        $(".leftnav h2").click(function () {
            $(this).next().slideToggle(200);
            $(this).toggleClass("on");
        })
        $(".leftnav ul li a").click(function () {
            $("#a_leader_txt").text($(this).text());
            $(".leftnav ul li a").removeClass("on");
            $(this).addClass("on");
        })
    });
</script>
<ul class="bread">
    <li><a class="icon-home"> 首页</a></li>
</ul>
<div class="admin">
    <div class="panel admin-panel">
        <div class="panel-head"><strong class="icon-reorder"> 内容列表</strong></div>

        <table class="table table-hover text-center">
            <tr>
                <th width="10%">ID</th>
                <th width="20%">图片</th>
                <th width="15%">名称</th>
                <th width="20%">时间</th>
                <th width="10%">访问量</th>
                <th width="15%">操作</th>
            </tr>
            <%
                List<NewsBean> list = (List) request.getAttribute("indexshow");
                for (int i = 0; i < list.size(); i++) {
            %>
            <tr>
                <td><%=list.get(i).getId()%>
                </td>
                <td><img src="<%=list.get(i).getImage()%>" width="120" height="50"/></td>
                <td><%=list.get(i).getTitle()%>
                </td>
                <td><%=list.get(i).getTime()%>
                </td>
                <td><%=list.get(i).getCount()%>
                </td>
                <td>
                    <div class="button-group">
                        <a class="button border-red"
                           href="${pageContext.request.contextPath}/operative/delnew?id=<%=list.get(i).getId()%>"><span
                                class="icon-trash-o"></span> 删除</a>
                    </div>
                </td>
            </tr>
            <%}%>

        </table>
    </div>

    <div class="panel admin-panel margin-top" id="add">
        <div class="panel-head"><strong><span class="icon-pencil-square-o"></span> 查看</strong></div>
        <div class="body-content">
            <table class="table table-hover text-center">
                <tr>
                    <th width="10%">ID</th>
                    <th width="20%">图片</th>
                    <th width="15%">名称</th>
                    <th width="20%">时间</th>
                    <th width="10%">访问量</th>
                    <th width="15%">删除/添加到轮播图</th>
                </tr>
                <%
                    List<NewsBean> news = (List) request.getAttribute("news");
                    for (int i = 0; i < news.size(); i++) {
                %>
                <tr>
                    <td><%=news.get(i).getId()%>
                    </td>
                    <td><img src="<%=news.get(i).getImage()%>" width="120" height="50"/></td>
                    <td><%=news.get(i).getTitle()%>
                    </td>
                    <td><%=news.get(i).getTime()%>
                    </td>
                    <td><%=news.get(i).getCount()%>
                    </td>
                    <td>
                        <div class="button-group">
                            <a class="button border-main"
                               href="${pageContext.request.contextPath}/operative/delnews?id=<%=news.get(i).getId()%>"><span
                                    class="icon-edit"></span> 删除</a>
                            <a class="button border-red"
                               href="${pageContext.request.contextPath}/operative/addnews?id=<%=news.get(i).getId()%>"><span
                                    class="icon-trash-o"></span> 添加</a>
                        </div>
                    </td>
                </tr>
                <%}%>
                <tr>
                    <td colspan="8">
                        <div class="pagelist">
                            <%
                                Integer pageAll = (Integer) request.getAttribute("page");
                                Integer pageNow = (Integer) request.getAttribute("pageNow");

                                for (int i = 1; i <= pageAll.intValue(); i++) {
                                    if (i == pageNow.intValue()) {
                            %>
                            <span class="current"><%=i%></span>
                            <%} else {%>
                            <a href="${pageContext.request.contextPath}/operative/adv?page=<%=i%>"><%=i%>
                            </a>
                            <%
                                    }
                                }
                            %>
                            <a href="${pageContext.request.contextPath}/operative/adv?page=${pageNow+1}">下一页</a>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</div>

</body>
</html>