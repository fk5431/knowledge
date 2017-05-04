<%--
  Created by IntelliJ IDEA.
  User: fengkai
  Date: 03/05/17
  Time: 09:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="nav-bar">
    <div class="wrap-nav zerogrid">
        <div class="row">
            <div class="col-1-3">
                <div class="wrap-col">
                    <div class="logo">
                        <a href="main.jsp"><img src="${pageContext.request.contextPath}/images/logo.png"/></a>
                    </div>
                </div>
            </div>
            <div class="col-2-3">
                <div class="wrap-col f-right">
                    <div id="menu" style="margin-left:2px;margin-top:1px;">
                        <nav>
                            <ul>
                                <!-- 导航栏名称改-->
                                <li class="active"><a href="${pageContext.request.contextPath}">首页</a></li>
                                <li><a href="${pageContext.request.contextPath}/resource">资源中心</a></li>
                                <li><a href="center">个人中心</a></li>
                                <li><a href="index.jsp"><img src="${pageContext.request.contextPath}/images/default.jpg"
                                                             style="width:35px;margin-top:2px;" title="注销"></a></li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>