<%--
  Created by IntelliJ IDEA.
  User: fengkai
  Date: 13/02/17
  Time: 16:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html >
<head>
    <meta charset="UTF-8">
    <title>Sign-Up/Login Form</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/normalize.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>

<body>
<div class="form" style="max-width:800px;">

    <ul class="tab-group" class="margin:0;">
        <li class="tab active"><a href="#signup" style="width:100%;">找回密码</a></li>
    </ul>

    <div class="tab-content">
        <div id="signup">
            <h1>您的密码以成功重置，请您登录您的邮箱${email}查看</h1>
        </div><!--signup -->
    </div><!-- tab-content -->

</div> <!-- /form -->
<script src='${pageContext.request.contextPath}/js/jquery_2.1.3.js'></script>
<script src="${pageContext.request.contextPath}/js/index.js"></script>
<script>
        $("#signup").show();
</script>
</body>
</html>
