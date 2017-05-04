<%--
  Created by IntelliJ IDEA.
  User: fengkai
  Date: 27/04/17
  Time: 10:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>
    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="${pageContext.request.contextPath}/css/operative/font-awesome.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/operative/custom.min.css" rel="stylesheet">
</head>
<body class="login">
<div>

    <div class="login_wrapper">
        <div class="animate form login_form">
            <section class="login_content">
                <form action="${pageContext.request.contextPath}/operativelogin" id="myform" method="post">
                    <h1>knowledge base</h1>
                    <h1>back-stage management</h1>
                    <div>
                        <input type="text" class="form-control" placeholder="Username" required="" name="name"/>
                    </div>
                    <div>
                        <input type="password" class="form-control" placeholder="Password" required="" name="pwd"/>
                    </div>
                    <script>
                        function submit() {
                            document.getElementById("myform").submit();
                        }
                    </script>
                    <div>
                        <a class="btn btn-default submit" href="javascript:submit()">登录</a>
                    </div>

                    <div class="clearfix"></div>

                    <div class="separator">
                        <p class="change_link">没有帐号?
                            <a class="to_register"> 联系超级管理员 </a>
                        </p>

                        <div class="clearfix"></div>
                        <br/>

                        <div>
                            <h1><i class="fa fa-paw"></i> knowledge base</h1>
                            <p>©2017 knowledege base fengkai</p>
                        </div>
                    </div>
                </form>
            </section>
        </div>
    </div>
</div>
</body>
</html>
