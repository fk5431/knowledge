<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="col-md-3 left_col">
    <div class="left_col scroll-view">
        <div class="navbar nav_title" style="border: 0;">
            <a href="${pageContext.request.contextPath}/operative" class="site_title"><i class="fa fa-paw"></i>
                <span>管理员</span></a>
        </div>
        <div class="clearfix"></div>
        <!-- menu profile quick info -->
        <div class="profile clearfix">
            <div class="profile_pic">
                <img src="${pageContext.request.contextPath}/images/author.jpg" alt=".  .."
                     class="img-circle profile_img">
            </div>
            <div class="profile_info">
                <span>欢迎,</span>
                <h2>管理员</h2>
            </div>
        </div>
        <!-- /menu profile quick info -->
        <br/>
        <!-- sidebar menu -->
        <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
            <div class="menu_section">
                <h3>General</h3>
                <ul class="nav side-menu">
                    <li><a> 开始 <span class="fa fa-chevron-down"></span></a>
                        <ul class="nav child_menu">
                            <li><a href="${pageContext.request.contextPath}//operative/index">首页</a></li>
                            <li><a href="${pageContext.request.contextPath}/operativelogout">退出</a></li>
                            <li><a href="${pageContext.request.contextPath}">前台</a></li>
                        </ul>
                    </li>
                    <li><a> 添加内容 <span class="fa fa-chevron-down"></span></a>
                        <ul class="nav child_menu">
                            <li><a href="${pageContext.request.contextPath}/fileform">文件添加</a></li>
                            <li><a href="${pageContext.request.contextPath}/ktypeform">分类添加</a></li>
                            <li><a href="${pageContext.request.contextPath}/ftypeform">类型添加</a></li>
                            <li><a href="${pageContext.request.contextPath}/userform">用户添加</a></li>
                        </ul>
                    </li>

                    <li>
                        <a> 管理 <span class="fa fa-chevron-down"></span></a>
                        <ul class="nav child_menu">
                            <li><a href="${pageContext.request.contextPath}/usertable">用户管理</a></li>
                            <li><a href="${pageContext.request.contextPath}/filetable">文件管理</a></li>
                            <li><a href="${pageContext.request.contextPath}/ktypetable">分类管理</a></li>
                            <li><a href="${pageContext.request.contextPath}/ftypetable">类型管理</a></li>
                            <li><a href="${pageContext.request.contextPath}/tagstable">用户标签管理</a></li>
                            <li><a href="${pageContext.request.contextPath}/cdirectory">文档管理</a></li>
                            <li><a href="${pageContext.request.contextPath}/review">用户资源审核</a></li>
                        </ul>
                    </li>

                    <li><a> 高级 <span class="fa fa-chevron-down"></span></a>
                        <ul class="nav child_menu">
                            <li><a href="${pageContext.request.contextPath}/spuerusertable">超级管理员管理管理员</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
        <!-- /sidebar menu -->
    </div>
</div>
<!-- top navigation -->
<div class="top_nav">
    <div class="nav_menu">
        <nav>
            <div class="nav toggle">
                <a id="menu_toggle"><i class="fa fa-bars"></i></a>
            </div>
            <ul class="nav navbar-nav navbar-right">
                <li class="">
                    <a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown"
                       aria-expanded="false">
                        <img src="${pageContext.request.contextPath}/images/author.jpg" alt="">管理员
                        <span class=" fa fa-angle-down"></span>
                    </a>
                    <ul class="dropdown-menu dropdown-usermenu pull-right">
                        <li><a href="${pageContext.request.contextPath}/operativelogout"><i
                                class="fa fa-sign-out pull-right"></i> 退出</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
    </div>
</div>
<!-- /top navigation -->