<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>文件信息</title>
    <%--<link rel="stylesheet" href="http://fonts.useso.com/css?family=Open+Sans:300,400">--%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/resource/magnific-popup.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/resource/templatemo-style.css">
    <link href="${pageContext.request.contextPath}/css/style3.css" rel="stylesheet" type="text/css" media="all" />
    <style type="text/css">
        .contact a:hover{color:blue;}
        .contact a:link {color:#000;}
    </style>
</head>
<body>
<div class="container">
    <div class="tm-sidebar">
        <img src="img/menu-top.jpg" alt="Menu top image" class="img-fluid tm-sidebar-image">
        <nav class="tm-main-nav">
            <ul>
                <li class="tm-nav-item"><a href="#home" class="tm-nav-item-link">标题</a></li>
                <li class="tm-nav-item"><a href="#summary" class="tm-nav-item-link">摘要</a></li>
                <li class="tm-nav-item"><a href="#ideas" class="tm-nav-item-link">描述</a></li>
                <li class="tm-nav-item"><a href="#about" class="tm-nav-item-link">文件操作</a></li>
                <%--<li class="tm-nav-item"><a href="#contact" class="tm-nav-item-link">关联文档</a></li>--%>
            </ul>
        </nav>
    </div>

    <div class="tm-main-content">

        <section id="home" class="tm-content-box tm-banner margin-b-10">
            <div class="tm-banner-inner">
                <h1 class="tm-banner-title">标题：${file.title }</h1>
                <p class="tm-banner-text">上传者：${name }<br/>上传时间：${file.uploadtime }<br/>标签：${file.tags }</p>
            </div>
        </section>


        <!-- slider -->
        <section id="summary">
            <div class="tm-content-box flex-2-col">

                <div class="pad flex-item tm-team-description-container">
                    <h2 class="tm-section-title">摘要</h2>
                    <p class="tm-section-description">${file.abstractS }</p>
                </div>
                <div class="flex-item">
                    <img src="${file.urlImage }" style="width:200px;" alt="${file.title }">
                </div>

            </div>
        </section>
        <section id="ideas">
            <div id="tmCarousel" class="carousel slide tm-content-box" data-ride="carousel">

                <ol class="carousel-indicators">
                    <li data-target="#tmCarousel" data-slide-to="0" class="active"></li>

                </ol>

                <div class="carousel-inner" role="listbox">

                    <div class="carousel-item active">
                        <div class="carousel-content">
                            <div class="flex-item">
                                <h2 class="tm-section-title">描述</h2>
                                <p class="tm-section-description carousel-description">${file.introduction }</p>
                            </div>
                        </div>
                    </div>



                </div>

            </div>
        </section>

        <section>
            <div id="about" class="tm-content-box">
                <div  class="grid_bottom">

                    <ul>
                        <li><a href="sendcdirectory?id=${file.fid}&fname=${file.title}">发送至常用目录</a></li>
                        <li><a href="senddocument?id=${file.fid}"><span >发送至常用文档</span></a></li>
                        <li><a href="preview?url_transforms=${file.urlTransforms }&typeid=${file.ftypeid}"><span>预览文件</span></a></li>
                        <li><a href="${pageContext.request.contextPath}/download?id=${file.fid}"><span >下载文件</span></a></li>
                    </ul>
                </div>

            </div>

        </section>

        <%--<section class="tm-content-box">--%>

            <%--<div id="contact" class="pad">--%>
                <%--<h2 class="tm-section-title">关联文档</h2>--%>
                <%--<c:forEach var="file" items="${showfile}">--%>
                    <%--<div> <a href="search_ktypeid?ktypeid=${file.ktypeid }">[${file.ktypeid }]</a> <a href="showfile?id=${file.fid }" style="text-decoration:none;">${file.title } &nbsp;&nbsp;&nbsp;&nbsp;--%>
                        <%--<p style="color:#888; font-size:10px; white-space: nowrap;text-overflow:ellipsis;overflow:hidden;">　${file.abstracString }</p>--%>
                    <%--</a>--%>
                    <%--</div>--%>
                <%--</c:forEach>--%>
            <%--</div>--%>

        <%--</section>--%>


    </div>

</div>

<!-- load JS files -->

<script src="${pageContext.request.contextPath}/js/operative/jquery.min.js"></script>             <!-- jQuery (https://jquery.com/download/) -->
<script src="${pageContext.request.contextPath}/js/operative/bootstrap.min.js"></script>                 <!-- Bootstrap (http://v4-alpha.getbootstrap.com/getting-started/download/) -->
<script src="${pageContext.request.contextPath}/js/resource/jquery.magnific-popup.min.js"></script>     <!-- Magnific pop-up (http://dimsemenov.com/plugins/magnific-popup/) -->
<script src="${pageContext.request.contextPath}/js/resource/jquery.singlePageNav.min.js"></script>      <!-- Single Page Nav (https://github.com/ChrisWojcik/single-page-nav) -->
<script src="${pageContext.request.contextPath}/js/resource/jquery.touchSwipe.min.js"></script>         <!-- https://github.com/mattbryson/TouchSwipe-Jquery-Plugin -->

<!-- Templatemo scripts -->
<script>

    $(document).ready(function(){

        // Single page nav
        if($(window).width() <= 1139) {
            $('.tm-main-nav').singlePageNav({
                'currentClass' : "active",
                offset : 100
            });
        } else {
            $('.tm-main-nav').singlePageNav({
                'currentClass' : "active",
                offset : 80
            });
        }

        // Handle nav offset upon window resize
        $(window).resize(function(){
            if($(window).width() <= 1139) {
                $('.tm-main-nav').singlePageNav({
                    'currentClass' : "active",
                    offset : 100
                });
            } else {
                $('.tm-main-nav').singlePageNav({
                    'currentClass' : "active",
                    offset : 80
                });
            }
        });

        // Magnific pop up
        $('.gallery-container').magnificPopup({
            delegate: 'a', // child items selector, by clicking on it popup will open
            type: 'image',
            gallery: {enabled:true}
            // other options
        });

        $('.carousel').carousel({
            interval: 3000
        })

        // Enable carousel swiping (http://lazcreative.com/blog/adding-swipe-support-to-bootstrap-carousel-3-0/)
        $(".carousel-inner").swipe( {
            //Generic swipe handler for all directions
            swipeLeft:function(event, direction, distance, duration, fingerCount) {
                $(this).parent().carousel('next');
            },
            swipeRight: function() {
                $(this).parent().carousel('prev');
            }
        });

    });

</script>
</body>
</html>
