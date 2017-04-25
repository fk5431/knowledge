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

    <title>DataTables | Gentelella</title>

    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="${pageContext.request.contextPath}/css/operative/font-awesome.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/operative/custom.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/operative/dataTables.bootstrap.min.css" rel="stylesheet">
</head>

<body class="nav-md">
<div class="container body">
    <div class="main_container">
        <div class="col-md-3 left_col">
            <div class="left_col scroll-view">
                <div class="navbar nav_title" style="border: 0;">
                    <a href="../../cttp_1_gentelella/production/index.html" class="site_title"><i class="fa fa-paw"></i> <span>Gentelella Alela!</span></a>
                </div>

                <div class="clearfix"></div>

                <!-- menu profile quick info -->
                <div class="profile clearfix">
                    <div class="profile_pic">
                        <img src="../../cttp_1_gentelella/production/images/img.jpg" alt="..." class="img-circle profile_img">
                    </div>
                    <div class="profile_info">
                        <span>Welcome,</span>
                        <h2>John Doe</h2>
                    </div>
                </div>
                <!-- /menu profile quick info -->

                <br />

                <!-- sidebar menu -->
                <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
                    <div class="menu_section">
                        <h3>General</h3>
                        <ul class="nav side-menu">
                            <li><a><i class="fa fa-home"></i> Home <span class="fa fa-chevron-down"></span></a>
                                <ul class="nav child_menu">
                                    <li><a href="../../cttp_1_gentelella/production/index.html">Dashboard</a></li>
                                    <li><a href="../../cttp_1_gentelella/production/index2.html">Dashboard2</a></li>
                                    <li><a href="../../cttp_1_gentelella/production/index3.html">Dashboard3</a></li>
                                </ul>
                            </li>
                            <li><a><i class="fa fa-edit"></i> Forms <span class="fa fa-chevron-down"></span></a>
                                <ul class="nav child_menu">
                                    <li><a href="../../WEB-INF/operative/form.html">General Form</a></li>
                                    <li><a href="../../cttp_1_gentelella/production/form_advanced.html">Advanced Components</a></li>
                                    <li><a href="../../cttp_1_gentelella/production/form_validation.html">Form Validation</a></li>
                                    <li><a href="../../cttp_1_gentelella/production/form_wizards.html">Form Wizard</a></li>
                                    <li><a href="../../cttp_1_gentelella/production/form_upload.html">Form Upload</a></li>
                                    <li><a href="../../cttp_1_gentelella/production/form_buttons.html">Form Buttons</a></li>
                                </ul>
                            </li>
                            <li><a><i class="fa fa-desktop"></i> UI Elements <span class="fa fa-chevron-down"></span></a>
                                <ul class="nav child_menu">
                                    <li><a href="../../cttp_1_gentelella/production/general_elements.html">General Elements</a></li>
                                    <li><a href="../../cttp_1_gentelella/production/media_gallery.html">Media Gallery</a></li>
                                    <li><a href="../../cttp_1_gentelella/production/typography.html">Typography</a></li>
                                    <li><a href="../../cttp_1_gentelella/production/icons.html">Icons</a></li>
                                    <li><a href="../../cttp_1_gentelella/production/glyphicons.html">Glyphicons</a></li>
                                    <li><a href="../../cttp_1_gentelella/production/widgets.html">Widgets</a></li>
                                    <li><a href="../../cttp_1_gentelella/production/invoice.html">Invoice</a></li>
                                    <li><a href="../../cttp_1_gentelella/production/inbox.html">Inbox</a></li>
                                    <li><a href="../../cttp_1_gentelella/production/calendar.html">Calendar</a></li>
                                </ul>
                            </li>
                            <li><a><i class="fa fa-table"></i> Tables <span class="fa fa-chevron-down"></span></a>
                                <ul class="nav child_menu">
                                    <li><a href="../../cttp_1_gentelella/production/tables.html">Tables</a></li>
                                    <li><a href="tables_dynamic.html">Table Dynamic</a></li>
                                </ul>
                            </li>
                            <li><a><i class="fa fa-bar-chart-o"></i> Data Presentation <span class="fa fa-chevron-down"></span></a>
                                <ul class="nav child_menu">
                                    <li><a href="../../cttp_1_gentelella/production/chartjs.html">Chart JS</a></li>
                                    <li><a href="../../cttp_1_gentelella/production/chartjs2.html">Chart JS2</a></li>
                                    <li><a href="../../cttp_1_gentelella/production/morisjs.html">Moris JS</a></li>
                                    <li><a href="../../cttp_1_gentelella/production/echarts.html">ECharts</a></li>
                                    <li><a href="../../cttp_1_gentelella/production/other_charts.html">Other Charts</a></li>
                                </ul>
                            </li>
                            <li><a><i class="fa fa-clone"></i>Layouts <span class="fa fa-chevron-down"></span></a>
                                <ul class="nav child_menu">
                                    <li><a href="../../cttp_1_gentelella/production/fixed_sidebar.html">Fixed Sidebar</a></li>
                                    <li><a href="../../cttp_1_gentelella/production/fixed_footer.html">Fixed Footer</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <div class="menu_section">
                        <h3>Live On</h3>
                        <ul class="nav side-menu">
                            <li><a><i class="fa fa-bug"></i> Additional Pages <span class="fa fa-chevron-down"></span></a>
                                <ul class="nav child_menu">
                                    <li><a href="../../cttp_1_gentelella/production/e_commerce.html">E-commerce</a></li>
                                    <li><a href="../../cttp_1_gentelella/production/projects.html">Projects</a></li>
                                    <li><a href="../../cttp_1_gentelella/production/project_detail.html">Project Detail</a></li>
                                    <li><a href="../../cttp_1_gentelella/production/contacts.html">Contacts</a></li>
                                    <li><a href="../../cttp_1_gentelella/production/profile.html">Profile</a></li>
                                </ul>
                            </li>
                            <li><a><i class="fa fa-windows"></i> Extras <span class="fa fa-chevron-down"></span></a>
                                <ul class="nav child_menu">
                                    <li><a href="../../cttp_1_gentelella/production/page_403.html">403 Error</a></li>
                                    <li><a href="../../cttp_1_gentelella/production/page_404.html">404 Error</a></li>
                                    <li><a href="../../cttp_1_gentelella/production/page_500.html">500 Error</a></li>
                                    <li><a href="../../cttp_1_gentelella/production/plain_page.html">Plain Page</a></li>
                                    <li><a href="../../cttp_1_gentelella/production/login.html">Login Page</a></li>
                                    <li><a href="../../cttp_1_gentelella/production/pricing_tables.html">Pricing Tables</a></li>
                                </ul>
                            </li>
                            <li><a><i class="fa fa-sitemap"></i> Multilevel Menu <span class="fa fa-chevron-down"></span></a>
                                <ul class="nav child_menu">
                                    <li><a href="#level1_1">Level One</a>
                                    <li><a>Level One<span class="fa fa-chevron-down"></span></a>
                                        <ul class="nav child_menu">
                                            <li class="sub_menu"><a href="../../cttp_1_gentelella/production/level2.html">Level Two</a>
                                            </li>
                                            <li><a href="#level2_1">Level Two</a>
                                            </li>
                                            <li><a href="#level2_2">Level Two</a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li><a href="#level1_2">Level One</a>
                                    </li>
                                </ul>
                            </li>
                            <li><a href="javascript:void(0)"><i class="fa fa-laptop"></i> Landing Page <span class="label label-success pull-right">Coming Soon</span></a></li>
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
                            <a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                                <img src="../../cttp_1_gentelella/production/images/img.jpg" alt="">John Doe
                                <span class=" fa fa-angle-down"></span>
                            </a>
                            <ul class="dropdown-menu dropdown-usermenu pull-right">
                                <li><a href="javascript:;"> Profile</a></li>
                                <li>
                                    <a href="javascript:;">
                                        <span class="badge bg-red pull-right">50%</span>
                                        <span>Settings</span>
                                    </a>
                                </li>
                                <li><a href="javascript:;">Help</a></li>
                                <li><a href="../../cttp_1_gentelella/production/login.html"><i class="fa fa-sign-out pull-right"></i> Log Out</a></li>
                            </ul>
                        </li>

                    </ul>
                </nav>
            </div>
        </div>
        <!-- /top navigation -->

        <!-- page content -->
        <div class="right_col" role="main">
            <div class="">
                <div class="page-title">
                    <div class="title_left">
                        <h3>Users <small>Some examples to get you started</small></h3>
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
                                <h2>Default Example <small>Users</small></h2>
                                <ul class="nav navbar-right panel_toolbox">
                                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                    </li>
                                    <li class="dropdown">
                                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                                        <ul class="dropdown-menu" role="menu">
                                            <li><a href="#">Settings 1</a>
                                            </li>
                                            <li><a href="#">Settings 2</a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li><a class="close-link"><i class="fa fa-close"></i></a>
                                    </li>
                                </ul>
                                <div class="clearfix"></div>
                            </div>
                            <div class="x_content">
                                <p class="text-muted font-13 m-b-30">
                                    DataTables has most features enabled by default, so all you need to do to use it with your own tables is to call the construction function: <code>$().DataTable();</code>
                                </p>
                                <table id="datatable" class="table table-striped table-bordered">
                                    <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>姓名</th>
                                        <th>新姓名</th>
                                        <th>邮箱</th>
                                        <th>新箱</th>
                                        <th>密码</th>
                                        <th>新密码</th>
                                        <th>修改</th>
                                        <th>删除</th>
                                    </tr>
                                    </thead>

                                    <tbody>
                                    <tr>
                                        <td>Tiger Nixon</td>
                                        <td>System Architect</td>
                                        <td>Edinburgh</td>
                                        <td>61</td>
                                        <td>2011/04/25</td>
                                        <td>$320,800</td>
                                    </tr>

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