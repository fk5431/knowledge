<%--
  Created by IntelliJ IDEA.
  User: fengkai
  Date: 02/05/17
  Time: 17:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/resource/index1.css"/>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/resource/index.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/resource/page.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/login/jquery-1.9.0.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/resource/standard.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/index_style.css">
</head>

<body>
<header>
    <jsp:include page="head.jsp"></jsp:include>
    <div class="row-wrapper">
        <div id="KB_header" class="wuid WTCjTYJa WTCjTYJa_0_search">
            <h1>资源中心 resource center</h1>
        </div>
        <div id="KB_searchbar"
             class="wuid 9CCHnuD6 9CCHnuD6_0_search searchForm">
            <form class="selected" method="get"
                  action="${pageContext.request.contextPath}/searchAll">
                <table class="searchWidget" border="0" cellpadding="0"
                       cellspacing="0">
                    <tbody>
                    <tr>
                        <td>
                            <div id="KB_pleaselogin">
                                <span style="font-family: 楷体;">搜索关键字</span> <br/>
                                search with keyword
                            </div>
                            <div class="searchFormContent" style="display: table;">
                                <div class="KB_searchInput_row"
                                     style="display: table-row;">
                                    <div style="display: table-cell; vertical-align: top;">
                                        <div class="KB_searchInput_wrapper">
                                            <input autocomplete="off" name="searchAll" value=""
                                                   class="searchInput" placeholder="请输入查询内容" type="text"/>
                                            <span style="display: none;" class="clearsearch"></span>
                                        </div>
                                    </div>
                                    <div style="display: table-cell;" class="searchButton">
                                        <input value="Search" type="submit"/>
                                    </div>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <script>
                        $(document).ready(function () {
                            $(".advancedSearchLink").click(function () {
                                $(".advanceSearch").slideToggle("slow");
                            });
                        });
                    </script>
                    <tr>
                        <td>
                            <div id="KB_toolbox">
                                <div class="advancedsearch">
                                    <div style="margin-top:8px;"><a class="advancedSearchLink">高级搜索 </a></div>
                                </div>
                            </div>
                        </td>
                    </tr>

                    </tbody>
                </table>
            </form>

        </div>

    </div>
    <%--<div>--%>


    <%-- ===============--%>
</header>
<div class="advanceSearch" style="display: none; background-color: rgb(239, 239, 239);">
    <div id="container">
        <div id="searchformwrap">
            <div id="searchformbox">
                <div id="searchformtabsbox">
                    <ul id="searchformtabs" aria-label="Search forms" role="navigation"
                        style="width: 100%;">
                        <li>
                            <h1 class="link">
                                <a id="quickSearchTab" href="#" class="tablink here"
                                   title="Quick Search  (currently selected form)">高级搜索</a>
                            </h1>
                        </li>
                    </ul>
                </div>
                <script type="text/javascript">
                    function sy() {
                        var curWwwPath = window.document.location.href;
                        var pathName = window.document.location.pathname;
                        var pos = curWwwPath.indexOf(pathName);
                        var localhostPaht = curWwwPath.substring(0, pos);
                        var projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);

                        return (localhostPaht + projectName) + "/advancedsearch";
                    }
                </script>
                <script type="text/javascript">
                    function save() {
                        document.quicksearch.action = "http://localhost:8080/knowledge/advancedsearch_save";
                        document.quicksearch.submit();
                    }
                </script>
                <div id="searchcontents" class="shadowbox" role="search" aria-label="Quick Search">
                    <div>
                        <form method="POST" name="quicksearch" action="${pageContext.request.contextPath}/groupSearch" id="searchform" target="_top">
                            <div id="searchcomponentfullwrap" class="searchcomponentfullwrap"
                                 style="padding-bottom: 0px;">
                                <div id="searchfields">
                                    <h2 class="searchcomponentlabel">SEARCH FOR</h2>
                                    <div class="searchforline">
                                        <label class="hidden" >Search 1</label>
                                        <span style="position: relative; display: inline;" class="twitter-typeahead">
                                             <input style="position: absolute; border-color: transparent; box-shadow: none; background: rgb(255, 255, 255) none repeat scroll 0% 0%;"
                                                    class="tt-hint" autocomplete="off" spellcheck="off" disabled=""
                                                    type="text">
                                             <input dir="auto"
                                                    style="position: relative; vertical-align: top; background-color: transparent;"
                                                    spellcheck="false" autocomplete="off" name="searchWords"
                                                    id="srchWrd1" title="Search Text Box 1" class="searchword tt-query"
                                                    value="" type="text">
                                             <span style="position: absolute; left: -9999px; visibility: hidden; white-space: nowrap; font-family: MS Shell Dlg \32 ; font-size: 13.3333px; font-style: normal; font-variant: normal; font-weight: 400; word-spacing: 0px; letter-spacing: 0px; text-indent: 0px; text-rendering: optimizelegibility; text-transform: none;"></span>
                                             <span style="position: absolute; left: 1px; z-index: 999; display: none;"
                                                   class="tt-dropdown-menu"></span>
                                         </span>
                                        <span>in</span>
                                        <label class="hidden" for="sect1">Search Within 1</label>
                                        <select size="1" name="sections" id="sect1" title="Search Within Dropdown 1"
                                                class="section">
                                            <option value="title">标题</option>
                                            <%--<option value="user">上传者</option>--%>
                                            <option value="tags">标签</option>
                                            <option value="abstractS">摘要</option>
                                            <option value="fname">文件名字</option>
                                            <option value="introduction">描述</option>
                                        </select>
                                        <a class="helpurl" title="Learn more about available search fields by database">
                                        </a>
                                    </div>

                                    <div class="searchforconnector">
                                        <label class="hidden" for="cbnt1">Combine Terms 1</label> <select
                                            size="1" name="booleans" id="cbnt1"
                                            title="boolean operator for combining textbox 1 and textbox 2"
                                            class="boolean">
                                        <option value="AND">AND</option>
                                        <%--<option value="OR">OR</option>--%>
                                        <option value="NOT">NOT</option>
                                    </select>
                                    </div>
                                    <div class="searchforline">
                                        <label class="hidden" for="srchWrd2">Search 2</label>
                                        <span style="position: relative; display: inline;" class="twitter-typeahead">
                                             <input style="position: absolute; border-color: transparent; box-shadow: none; background: rgb(255, 255, 255) none repeat scroll 0% 0%;"
                                                    class="tt-hint" autocomplete="off" spellcheck="off" disabled=""
                                                    type="text">
                                             <input dir="auto"
                                                    style="position: relative; vertical-align: top; background-color: transparent;"
                                                    spellcheck="false" autocomplete="off" name="searchWords"
                                                    id="srchWrd2" title="Search Text Box 2" class="searchword tt-query"
                                                    value="" type="text">
                                             <span style="position: absolute; left: -9999px; visibility: hidden; white-space: nowrap; font-family: MS Shell Dlg \32 ; font-size: 13.3333px; font-style: normal; font-variant: normal; font-weight: 400; word-spacing: 0px; letter-spacing: 0px; text-indent: 0px; text-rendering: optimizelegibility; text-transform: none;"></span>
                                             <span style="position: absolute; left: 1px; z-index: 999; display: none;"
                                                   class="tt-dropdown-menu"></span>
                                         </span>
                                        <span>in</span>
                                        <label class="hidden" for="sect2">Search Within 2</label>
                                        <select size="1" name="sections" id="sect2" title="Search Within Dropdown 2"
                                                class="section">
                                            <option value="title">标题</option>
                                            <%--<option value="user">上传者</option>--%>
                                            <option value="tags">标签</option>
                                            <option value="abstractS">摘要</option>
                                            <option value="fname">文件名字</option>
                                            <option value="introduction">描述</option>
                                        </select>
                                    </div>

                                    <div class="searchforconnector">
                                        <label class="hidden" for="cbnt2">Combine Terms 2</label>
                                        <select size="1" name="booleans" id="cbnt2"
                                                title="boolean operator for combining textbox 2 and textbox 3"
                                                class="boolean">
                                            <option value="AND">AND</option>
                                            <%--<option value="OR">OR</option>--%>
                                            <option value="NOT">NOT</option>
                                        </select>
                                    </div>
                                    <div class="searchforline">
                                        <label class="hidden" for="srchWrd3">Search 3</label>
                                        <span style="position: relative; display: inline;" class="twitter-typeahead">
                                             <input style="position: absolute; border-color: transparent; box-shadow: none; background: rgb(255, 255, 255) none repeat scroll 0% 0%;"
                                                    class="tt-hint" autocomplete="off" spellcheck="off" disabled=""
                                                    type="text">
                                             <input dir="auto"
                                                    style="position: relative; vertical-align: top; background-color: transparent;"
                                                    spellcheck="false" autocomplete="off" name="searchWords"
                                                    id="srchWrd3" title="Search Text Box 3" class="searchword tt-query"
                                                    value="" type="text">
                                             <span style="position: absolute; left: -9999px; visibility: hidden; white-space: nowrap; font-family: MS Shell Dlg \32 ; font-size: 13.3333px; font-style: normal; font-variant: normal; font-weight: 400; word-spacing: 0px; letter-spacing: 0px; text-indent: 0px; text-rendering: optimizelegibility; text-transform: none;"></span>
                                             <span style="position: absolute; left: 1px; z-index: 999; display: none;"
                                                   class="tt-dropdown-menu"></span>
                                         </span>
                                        <span> in </span>
                                        <label class="hidden" for="sect3">Search Within 3</label>
                                        <select size="1" name="sections" id="sect3" title="Search Within Dropdown 3"
                                                class="section">
                                            <option value="title">标题</option>
                                            <%--<option value="user">上传者</option>--%>
                                            <option value="tags">标签</option>
                                            <option value="abstractS">摘要</option>
                                            <option value="fname">文件名字</option>
                                            <option value="introduction">描述</option>
                                        </select>
                                    </div>

                                </div>

                                <div id="addsearcherror" class="searchforline"
                                     style="display: none; padding-left: 400px;">
                                    <img src="1x1_transparent.png" class="sprite sprite-warning_red"
                                         alt="Error message">
                                    <b> 最多可以筛选10个条件</b>
                                </div>

                                <ul id="search_toolbar" class="horizlist">

                                    <li id="resetsearch_tool" class="text" style="display: none;">
                                        <input type="hidden">
                                        <input class="formreset" value="重置" title="Reset search" type="reset">
                                    </li>
                                    <li id="addsearchfield_tool" class="text">
                                         <span id="addsearchllinkgray" title="Add search field" class="greytext"
                                               style="display: none;">
                                             <img src="${pageContext.request.contextPath}/images/1x1_transparent.png"
                                                  class="addsearchimg sprite sprite-addsearchfield" alt="">
                                             增加条件
                                         </span>
                                        <a id="addsearchllink" href="#" title="Add search field">
                                            <img src="${pageContext.request.contextPath}/images/1x1_transparent.png"
                                                 class="addsearchimg sprite sprite-addsearchfield" alt="">
                                            增加条件
                                        </a>
                                    </li>
                                    <li id="submitsearch_tool" class="last">
                                        <input disabled="disabled" value="搜索" title="搜索" class="button searchbtn"
                                               type="submit">
                                    </li>
                                </ul>

                                <div class="clear"></div>


                            </div>

                            <div id="advancedOptions">
                                <h2 class="advancedOptionslabel">
                                     <span id="advancedOptionstoggle">高级条件&nbsp;
                                         <a class="historyplus" id="advancedOptionstoggleAnchor" href="#"
                                            title="Show adavanced options">
                                             <img src="${pageContext.request.contextPath}/images/1x1_transparent.png"
                                                  class="sprite sprite-login_expand" alt="">
                                         </a>
                                     </span>
                                </h2>
                                <div id="advancedOptionshidden" style="float: none; clear: both; display: none;">
                                    <div class="searchcomponentseparator" style="padding: 0px;">
                                        <hr>
                                    </div>
                                    <div class="clear"></div>

                                    <div class="searchcomponentshortwrap">
                                        <div id="limittowrap" style="width: 380px; float: left;">
                                            <div class="searchcomponentlabel">
                                                <h2 class="searchcomponentlabel">时间</h2>
                                                <div style="margin-top:26px;"><h2 class="searchcomponentlabel">类型</h2>
                                                </div>
                                            </div>
                                            <div class="searchlimitbybox">
                                                <fieldset>
                                                    <ul>
                                                        <li>
                                                            <label class="hidden" for="yearrangechx">Limit To Year
                                                                Range</label>
                                                            <input checked="checked" id="yearrangechx" value="yearrange"
                                                                   type="radio">
                                                            <label class="hidden" for="startyrrange">Start Year</label>
                                                            <select name="startYear" style="width: 5em;" id=""
                                                                    title="Choose a date range">
                                                                <option value="1969">1969</option>
                                                                <option value="1970">1970</option>
                                                                <option value="1971">1971</option>
                                                                <option value="1972">1972</option>
                                                                <option value="1973">1973</option>
                                                                <option value="1974">1974</option>
                                                                <option value="1975">1975</option>
                                                                <option value="1976">1976</option>
                                                                <option value="1977">1977</option>
                                                                <option value="1978">1978</option>
                                                                <option value="1979">1979</option>
                                                                <option value="1980">1980</option>
                                                                <option value="1981">1981</option>
                                                                <option value="1982">1982</option>
                                                                <option value="1983">1983</option>
                                                                <option value="1984">1984</option>
                                                                <option value="1985">1985</option>
                                                                <option value="1986">1986</option>
                                                                <option value="1987">1987</option>
                                                                <option value="1988">1988</option>
                                                                <option value="1989">1989</option>
                                                                <option value="1990">1990</option>
                                                                <option value="1991">1991</option>
                                                                <option value="1992">1992</option>
                                                                <option value="1993">1993</option>
                                                                <option value="1994">1994</option>
                                                                <option value="1995">1995</option>
                                                                <option value="1996">1996</option>
                                                                <option value="1997">1997</option>
                                                                <option value="1998">1998</option>
                                                                <option value="1999">1999</option>
                                                                <option value="2000">2000</option>
                                                                <option value="2001">2001</option>
                                                                <option value="2002">2002</option>
                                                                <option value="2003">2003</option>
                                                                <option value="2004">2004</option>
                                                                <option value="2005">2005</option>
                                                                <option value="2006">2006</option>
                                                                <option value="2007">2007</option>
                                                                <option value="2008">2008</option>
                                                                <option value="2009">2009</option>
                                                                <option value="2010">2010</option>
                                                                <option value="2011">2011</option>
                                                                <option value="2012">2012</option>
                                                                <option value="2013">2013</option>
                                                                <option value="2014">2014</option>
                                                                <option value="2015">2015</option>
                                                                <option value="2016">2016</option>
                                                            </select>

                                                            <div class="searchcomponentlabel"
                                                                 style="float: none; margin: 0px 15px; display: inline;">
                                                                TO
                                                            </div>
                                                            <label class="hidden" for="endyearrange">End
                                                                Year
                                                            </label>
                                                            <select name="endYear" style="width: 5em;" id="endyearrange"
                                                                    title="Choose a date range">
                                                                <option value="1969">1969</option>
                                                                <option value="1970">1970</option>
                                                                <option value="1971">1971</option>
                                                                <option value="1972">1972</option>
                                                                <option value="1973">1973</option>
                                                                <option value="1974">1974</option>
                                                                <option value="1975">1975</option>
                                                                <option value="1976">1976</option>
                                                                <option value="1977">1977</option>
                                                                <option value="1978">1978</option>
                                                                <option value="1979">1979</option>
                                                                <option value="1980">1980</option>
                                                                <option value="1981">1981</option>
                                                                <option value="1982">1982</option>
                                                                <option value="1983">1983</option>
                                                                <option value="1984">1984</option>
                                                                <option value="1985">1985</option>
                                                                <option value="1986">1986</option>
                                                                <option value="1987">1987</option>
                                                                <option value="1988">1988</option>
                                                                <option value="1989">1989</option>
                                                                <option value="1990">1990</option>
                                                                <option value="1991">1991</option>
                                                                <option value="1992">1992</option>
                                                                <option value="1993">1993</option>
                                                                <option value="1994">1994</option>
                                                                <option value="1995">1995</option>
                                                                <option value="1996">1996</option>
                                                                <option value="1997">1997</option>
                                                                <option value="1998">1998</option>
                                                                <option value="1999">1999</option>
                                                                <option value="2000">2000</option>
                                                                <option value="2001">2001</option>
                                                                <option value="2002">2002</option>
                                                                <option value="2003">2003</option>
                                                                <option value="2004">2004</option>
                                                                <option value="2005">2005</option>
                                                                <option value="2006">2006</option>
                                                                <option value="2007">2007</option>
                                                                <option value="2008">2008</option>
                                                                <option value="2009">2009</option>
                                                                <option value="2010">2010</option>
                                                                <option value="2011">2011</option>
                                                                <option value="2012">2012</option>
                                                                <option value="2013">2013</option>
                                                                <option value="2014">2014</option>
                                                                <option value="2015">2015</option>
                                                                <option value="2016" selected="selected">2016
                                                                </option>
                                                            </select>
                                                            <input type="hidden">
                                                        </li>
                                                    </ul>
                                                </fieldset>
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                <select name="ftype" style="width: 5em;" id="startyrrange"
                                                        title="Choose a date range">
                                                    <option value="-1">全部</option>
                                                    <option value="0">文档</option>
                                                    <option value="1">图片</option>
                                                    <option value="2">音乐</option>
                                                    <option value="3">视频</option>
                                                    <option value="4">压缩包</option>
                                                    <option value="5">其他</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="clear"></div>

                                    </div>

                                    <div id="buttonsbottom" class="searchcomponentshortwrap"
                                         style="position: relative; margin-top: -30px; float: none; z-index: 1;">
                                        <div style="float: right; margin-bottom: 7px;">
                                            <input disabled="disabled" class="button searchbtn" value="保存并搜索"
                                                   title="Submit Search" type="button" onclick="save()">&nbsp;
                                            <input disabled="disabled" class="button searchbtn" value="搜索"
                                                   title="Submit Search" type="submit">&nbsp;
                                            <input class="formreset" value="重置" title="Reset search" type="reset">&nbsp;
                                            <div class="clear"></div>
                                        </div>
                                        <div class="clear"></div>
                                    </div>
                                </div>
                            </div>
                            <div style="display: none;">
                                <input type="hidden">
                                <input type="hidden">
                            </div>
                        </form>
                    </div>
                    <!-- END searchform -->
                </div>
                <!-- END searchcontents -->
                <br class="clear">
            </div>
            <!-- END searchformbox -->
        </div>
        <!-- end searchformwrap -->

    </div>
    <!-- END container -->
    <div class="clear"></div>
    <input id="modalReleaseVersion" value="04212016" type="hidden">
    <script src="${pageContext.request.contextPath}/js/resource/SearchForm.js"></script>
    <div class="addsearchfieldcopy" style="display: none;">
        <div class="searchforconnector" id="addsearchforconnector">
            <select size="1" name="booleans" id="connector" class="boolean">
                <option value="AND">AND</option>
                <%--<option value="OR">OR</option>--%>
                <option value="NOT">NOT</option>
            </select>
        </div>
        <div class="searchforline" id="addsearchforline">
            <input name="searchWords" value="" class="searchwordcopy" type="text">
            <span>in</span>
            <select size="1" name="sections" class="section">
                [
                <option value="title">标题</option>
                ,
                <%--<option value="user">上传者</option>--%>
                <%--,--%>
                <option value="tags">标签</option>
                ,
                <option value="abstractS">摘要</option>
                ,
                <option value="fname">文件名字</option>
                ,
                <option value="introduction">描述</option>
                ]
            </select>
            <a class="removesearchlink" title="Remove this search field.">
                <img src="${pageContext.request.contextPath}/images/1x1_transparent.png" alt=""
                     class="sprite sprite-Delete">
            </a>
        </div>
    </div>
    <script type="text/javascript">
        $(document)
            .ready(
                function () {
                    var expand_adv_options = false;
                    SEARCHFORM.init({
                        "expandAdvOptions": expand_adv_options
                    });
                    var autosuggest_session = true;
                    AUTOSUGGEST
                        .init({
                            "enabled": autosuggest_session,
                            "helpurl": "http://help.engineeringvillage.com/Engineering_Village_Help_CSH.htm#autocomplete_ei.htm"
                        });

                    // Add extra search fields if present on request

                });
    </script>
</div>
<div style="margin:0 auto;">
    <div id="mainWrapper" style="width: 100%;">
        <div class="table-layout-wrapper pageLayout">
            <table class="table-layout" style="width: 100%;">
                <tbody>
                <tr id="KB_search_wrapper" class="row">
                    <td id="KB_search_left" colspan="1" rowspan="1" class="cell"
                        align="left" valign="top">
                        <div class="row-wrapper">
                            <div id="KB_refinesum"
                                 class="wuid ORaw9pWO ORaw9pWO_0_search searchWidget">
                                <h2 class="widgetHeader">
                                    Filter by
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
                                                        title="${f.title }">${f.title }</span>
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
									<a href="${pageContext.request.contextPath }/resource?page=1" data-page="1"
                                       class="btn btn-xs btn-default">首页</a>
                                        <a href="${pageContext.request.contextPath }/resource?page=<c:choose><c:when test="${pageNow == 1}">1</c:when><c:otherwise>${pageNow-1}</c:otherwise></c:choose>"
                                           data-page="1" class="btn btn-xs btn-default">&lt;</a>
								<c:forEach var="t" begin="1" end="${page }">
                                    <c:if test="${page <= 5 }">
                                        <c:if test="${t == pageNow }">
                                            <a href="${pageContext.request.contextPath }/resource?page=${t}"
                                               data-page="1" class="btn btn-xs btn-default active cblue">${t }</a>
                                        </c:if>
                                        <c:if test="${t != pageNow }">
                                            <a href="${pageContext.request.contextPath }/resource?page=${t}"
                                               data-page="1" class="btn btn-xs btn-default cblue">${t }</a>
                                        </c:if>
                                    </c:if>
                                    <c:if test="${page > 5 }">
                                        <c:if test="${pageNow>3}">
                                            <a class="btn btn-xs btn-default active cblue">...</a>
                                        </c:if>
                                        <c:if test="${t >= pageNow - 2}">
                                            <a href="${pageContext.request.contextPath }/resource?page=${t}"
                                               data-page="1" class="btn btn-xs btn-default active cblue">${t }</a>
                                        </c:if>
                                        <c:if test="${t = pageNow + 2}">
                                            <a href="${pageContext.request.contextPath }/resource?page=${t}"
                                               data-page="1" class="btn btn-xs btn-default active cblue">${t }</a>
                                        </c:if>
                                        <c:if test="${pageNow< page - 2}">
                                            <a class="btn btn-xs btn-default active cblue">...</a>
                                        </c:if>
                                    </c:if>
                                </c:forEach>

									<a href="${pageContext.request.contextPath }/resource?page=${pageNow+1 }"
                                       data-page="907" class="btn btn-xs btn-default">&gt;</a>
									<a href="${pageContext.request.contextPath }/resource?page=${page }" data-page="907"
                                       class="btn btn-xs btn-default">末页</a>
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
