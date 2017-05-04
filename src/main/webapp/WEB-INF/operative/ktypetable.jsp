<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: fengkai
  Date: 25/04/17
  Time: 15:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>分类管理</title>

    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="${pageContext.request.contextPath}/css/operative/font-awesome.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/operative/custom.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/operative/dataTables.bootstrap.min.css" rel="stylesheet">
</head>

<body class="nav-md">
<div class="container body">
    <div class="main_container">
        <jsp:include page="head.jsp"></jsp:include>

        <!-- page content -->
        <div class="right_col" role="main">
            <div class="">
                <div class="page-title">
                    <div class="title_left">
                        <h3>分类管理</h3>
                    </div>

                    <div class="title_right">
                        <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                            <div class="input-group">
                                <input type="text" class="form-control" placeholder="Search for...">
                                <span class="input-group-btn">
                      <button class="btn btn-default" type="button">Go!</button>
                    </span>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="clearfix"></div>

                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="x_panel">
                            <div class="x_title">
                                <h2>分类管理
                                    <small>ktype</small>
                                </h2>
                                <ul class="nav navbar-right panel_toolbox">
                                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                    </li>
                                    <li><a class="close-link"><i class="fa fa-close"></i></a>
                                    </li>
                                </ul>
                                <div class="clearfix"></div>
                            </div>
                            <div class="x_content">
                                <p class="text-muted font-13 m-b-30">
                                </p>
                                <table id="datatable" class="table table-striped table-bordered">
                                    <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>分类名称</th>
                                        <th>新分类名称</th>
                                        <th>图片链接</th>
                                        <th>新图片链接</th>
                                        <th>文件数</th>
                                        <th>修改</th>
                                        <th>删除</th>
                                    </tr>
                                    </thead>

                                    <tbody>
                                    <c:forEach var="k" items="${ktype}">
                                        <form action="${pageContext.request.contextPath}/updatektype" method="post"
                                              enctype="multipart/form-data" id="user${k.ktypeid}">
                                            <tr>
                                                <td>${k.ktypeid}</td>
                                                <td>${k.ktype}</td>
                                                <td><input type="text" name="name">
                                                    <input type="text" name="id" hidden value="${k.ktypeid}"/></td>
                                                <td><img src="${k.ktypeurl}" style="height: 100px; width: 100px;"></td>
                                                <td><input type="file" name="image"></td>
                                                <td>${k.count}</td>
                                                <td>
                                                    <a onclick="document.getElementById('user${k.ktypeid}').submit();return false">修改</a>
                                                </td>
                                                <td>
                                                    <a href="${pageContext.request.contextPath}/delktype?id=${k.ktypeid}">删除</a>
                                                </td>
                                            </tr>
                                        </form>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <!-- /page content -->

        <!-- footer content -->
        <footer>
            <div class="pull-right">
                冯凯
            </div>
            <div class="clearfix"></div>
        </footer>
        <!-- /footer content -->
    </div>
</div>

<!-- jQuery -->
<script src="${pageContext.request.contextPath}/js/operative/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="${pageContext.request.contextPath}/js/operative/bootstrap.min.js"></script>


<!-- Switchery -->
<script src="${pageContext.request.contextPath}/js/operative/switchery.min.js"></script>

<script src="${pageContext.request.contextPath}/js/operative/custom.min.js"></script>

</body>
</html>