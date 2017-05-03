<%--
  Created by IntelliJ IDEA.
  User: fengkai
  Date: 02/05/17
  Time: 17:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>资源中心</title>
    <script type="text/javascript"
            src="${pageContext.request.contextPath }/js/resource/jquery-1.7.2.min.js"
            charset="utf-8"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath }/js/resource/buildUrl.js"
            charset="utf-8"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath }/js/resource/oop.js"
            charset="utf-8"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath }/js/resource/KB_overlay.js"
            charset="utf-8"></script>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath }/css/resource/index.css"
          media="all" />
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath }/css/resource/page.css"
          media="all" />

</head>

<body id="body" class="mashup mashup-style web modern gecko firefox theme_enterprise">
<header>
    <jsp:include page="head.jsp"></jsp:include>
</header>
<div  style="width: 1340px;margin:0 auto;">
    <div id="mainWrapper" style="width: 100%;">
        <div class="table-layout-wrapper pageLayout">
            <table class="table-layout" style="width: 100%;">
                <colgroup>
                    <col width="100%" />
                </colgroup>
                <tbody>
                <tr id="row_0" class="row">
                    <td id="KB_search_top" colspan="1" rowspan="1" class="cell"
                        align="center" valign="top">
                        <div class="row-wrapper">
                            <div id="KB_header" class="wuid WTCjTYJa WTCjTYJa_0_search">
                                <h1>资源中心 resource center</h1>
                            </div>
                            <div id="KB_searchbar"
                                 class="wuid 9CCHnuD6 9CCHnuD6_0_search searchForm">
                                <form class="selected" method="get"
                                      action="search_text">
                                    <table class="searchWidget" border="0" cellpadding="0"
                                           cellspacing="0">
                                        <tbody>
                                        <tr>
                                            <td>
                                                <div id="KB_pleaselogin">
                                                    <span style="font-family: 楷体;">搜索关键字</span> <br />
                                                    search with keyword
                                                </div>
                                                <div class="searchFormContent" style="display: table;">
                                                    <div class="KB_searchInput_row"
                                                         style="display: table-row;">
                                                        <div style="display: table-cell; vertical-align: top;">
                                                            <div class="KB_searchInput_wrapper">
                                                                <input autocomplete="off" name="searchText" value=""
                                                                       class="searchInput" placeholder="请输入查询内容" type="text" />
                                                                <span style="display: none;" class="clearsearch"></span>
                                                            </div>
                                                        </div>
                                                        <div style="display: table-cell;" class="searchButton">
                                                            <input value="Search" type="submit" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div id="KB_toolbox">
                                                    <div class="advancedsearch">
                                                        <div  style="margin-top:8px;"><a class="advancedSearchLink">高级搜索 </a></div>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </form>
                                <div class="advancedSearchFormContent" style=" overflow-y:scroll;">
                                    <div style="margin-left:180px;">
                                        <iframe src="${pageContext.request.contextPath }/resource/index.jsp" width="797" height="500"
                                                frameborder="0" scrolling="no"> </iframe>
                                    </div>
                                    <div>
                                        <table>
                                            <c:forEach items="${sql }" var="s" >
                                                <tr>
                                                    <td> <a href="${pageContext.request.contextPath }/search_save?search=${s.id}">${s.sql }</a></td>
                                                </tr>
                                            </c:forEach>
                                        </table>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </td>
                </tr>
                </tbody>
            </table>
            <table class="table-layout" style="width: 100%;">

                <tbody>
                <tr id="KB_search_wrapper" class="row">
                    <td id="KB_search_left" colspan="1" rowspan="1" class="cell"
                        align="left" valign="top">
                        <div class="row-wrapper">
                            <div id="KB_refinesum"
                                 class="wuid ORaw9pWO ORaw9pWO_0_search searchWidget">
                                <h2 class="widgetHeader">
                                    Filter by <span id="KB_refinesum_tooltip"
                                                    title="Sub-filters may not represent the whole set of parent filter">?</span>
                                </h2>
                                <div id="KB_refinesum_list"></div>
                            </div>

                            <div id="w1airkp8ab"
                                 class="wuid zUVShK89 zUVShK89_0_search KB_facetlist_wrapper">
                                <div class="KB_facetlist">
                                    <h3 class="popping2">
                                        <span class="icon"></span> 分类 <span class="infos"></span>
                                    </h3>
                                    <div class="KB_facetlist_content">
                                        <ul style="right: -17px;" tabindex="0" class="nano-content">
                                            <c:forEach var="t" items="${type}">
                                                <li class="category">
                                                    <span class="count">${t.count}</span>
                                                    <a title="${t.ktype}" href="#">${t.ktype}</a>
                                                </li>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </td>
                    <td id="KB_search_right" colspan="1" rowspan="1" class="cell"
                        align="left" valign="top">
                        <div class="row-wrapper">

                            <div id="KB_displayHits"
                                 class="wuid J5jOfsgj J5jOfsgj_0_search searchWidget displayHits">
                                <ul class="hits">
                                    <c:forEach var="f" items="${file}">
                                        <li class="KB_hit dsnews">
                                            <h3 class="KB_hit_title">
                                                <a href="showfile?id=${f.fid}" target="_blank"> <span
                                                        title="${f.title }" >${f.title }</span>
                                                </a>
                                            </h3>
                                            <p class="KB_question">
                                                <span class="KB_label">摘要: </span> ${f.abstractS}
                                            </p>
                                            <p class="KB_hitinfo">
                                                <span class="KB_articleid">上传者：</span>
                                                <span class="KB_updatedate">${f.uname} </span>
                                                <span class="KB_ratingbox" style="float:right;">${f.uploadtime}</span>
                                                <span class="KB_articleid" style="float:right;">时间：</span>
                                                <span class="KB_updatedate" style="float:right;">${f.ftypename }&nbsp&nbsp&nbsp	</span>
                                                <span class="KB_articleid" style="float:right;">类型：</span>
                                            </p>
                                            <p class="KB_hitinfo">标签：${f.tags};</p>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </div>
                            <div class="csdn-pagination hide-set page1">
									<span class="page-nav"> <b>共<i>${count }条第${pageNow}页</i></b>
									<a href="${pageContext.request.contextPath }/resource?page=1" data-page="1" class="btn btn-xs btn-default">首页</a>
                                        <a href="${pageContext.request.contextPath }/resource?page=<c:choose><c:when test="${pageNow == 1}">1</c:when><c:otherwise>${pageNow-1}</c:otherwise></c:choose>" data-page="1" class="btn btn-xs btn-default">&lt;</a>
								<c:forEach var="t" begin="1" end="${page }">
                                    <c:if test="${page <= 5 }">
                                        <c:if test="${t == pageNow }">
                                            <a href="${pageContext.request.contextPath }/resource?page=${t}" data-page="1" class="btn btn-xs btn-default active cblue">${t }</a>
                                        </c:if>
                                        <c:if test="${t != pageNow }">
                                            <a href="${pageContext.request.contextPath }/resource?page=${t}" data-page="1" class="btn btn-xs btn-default cblue">${t }</a>
                                        </c:if>
                                    </c:if>
                                    <c:if test="${page > 5 }">
                                        <c:if test="${pageNow>3}">
                                            <a class="btn btn-xs btn-default active cblue">...</a>
                                        </c:if>
                                        <c:if test="${t >= pageNow - 2}">
                                            <a href="${pageContext.request.contextPath }/resource?page=${t}" data-page="1" class="btn btn-xs btn-default active cblue">${t }</a>
                                        </c:if>
                                        <c:if test="${t = pageNow + 2}">
                                            <a href="${pageContext.request.contextPath }/resource?page=${t}" data-page="1" class="btn btn-xs btn-default active cblue">${t }</a>
                                        </c:if>
                                        <c:if test="${pageNow< page - 2}">
                                            <a class="btn btn-xs btn-default active cblue">...</a>
                                        </c:if>
                                    </c:if>
                                </c:forEach>


									<a href="${pageContext.request.contextPath }/resource?page=${pageNow+1 }" data-page="907" class="btn btn-xs btn-default">&gt;</a>
									<a href="${pageContext.request.contextPath }/resource?page=${page }" data-page="907" class="btn btn-xs btn-default">末页</a>
									</span>
                            </div>
                        </div>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>

    </div>

</div>
</body>
</html>
