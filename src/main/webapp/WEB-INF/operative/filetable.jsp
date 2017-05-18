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

    <title>文件管理</title>

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
                        <h3>文件管理</h3>
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
                                <h2>类型管理
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
                                        <th>标题</th>
                                        <th>上传用户ID</th>
                                        <th>标签</th>
                                        <th>简介</th>
                                        <th>是否有附件</th>
                                        <th>时间</th>
                                        <th>修改</th>
                                        <th>查看</th>
                                        <th>删除</th>
                                    </tr>
                                    </thead>

                                    <tbody>
                                    <c:forEach var="f" items="${file}">
                                        <form action="${pageContext.request.contextPath}/updateftype" method="post">
                                            <tr>
                                                <td>${f.fid}</td>
                                                <td>${f.title}</td>
                                                <td>
                                                    <c:if test="${f.uid == -1}">
                                                        管理员
                                                    </c:if>
                                                    <c:if test="${f.uid != -1}">
                                                        ${f.uid}
                                                    </c:if>
                                                </td>
                                                <td>${f.tags}</td>
                                                <td>${f.abstractS}</td>
                                                <td>
                                                    <c:if test="${f.url == ''}">
                                                        无
                                                    </c:if>
                                                    <c:if test="${f.url != ''}">
                                                        有
                                                    </c:if>
                                                </td>
                                                <td>${f.uploadtime}</td>
                                                <td><a href="">修改</a></td>
                                                <td><a href="">查看</a></td>
                                                <td><a href="">删除</a></td>
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
            <div>
                <div class="col-sm-7">
                    <div class="dataTables_paginate paging_simple_numbers" id="datatable-checkbox_paginate">
                        <ul class="pagination">

                            <li class="paginate_button previous <c:if test="${pageNow == 1}"> disabled</c:if>"
                                id="datatable-checkbox_previous"><a
                                    href="${pageContext.request.contextPath}/filetable
                                    ?page=${pageNow-1}"
                                    aria-controls="datatable-checkbox" data-dt-idx="0" tabindex="0">Previous</a>
                            </li>
                            <c:forEach var="i" begin="1" end="${page}">
                                <li class="paginate_button active"><a
                                        href="${pageContext.request.contextPath}/filetable?page=${i}"
                                        aria-controls="datatable-checkbox" data-dt-idx="1" tabindex="0">${i}</a></li>
                            </c:forEach>

                            <li class="paginate_button next <c:if test="${pageNow == page}"> disabled</c:if> "
                                id="datatable-checkbox_next">
                                <a href="${pageContext.request.contextPath}/filetable?page=${pageNow+1}"
                                   aria-controls="datatable-checkbox" data-dt-idx="7" tabindex="0">Next</a>
                            </li>
                        </ul>
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