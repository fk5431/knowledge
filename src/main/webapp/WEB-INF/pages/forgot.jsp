<%--
  Created by IntelliJ IDEA.
  User: fengkai
  Date: 13/02/17
  Time: 14:24
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
            <h1>输入要找回的邮箱地址：</h1>

            <form action="/sendmail" method="post">

                <div class="field-wrap">
                    <label>
                        Email Address<span class="req">*</span>
                    </label>
                    <input type="email"required autocomplete="off" name="email"/>
                </div>
                <button type="submit" class="button button-block" onclick="validateCode()"/>Get</button>
            </form>

        </div><!--signup -->
    </div><!-- tab-content -->

</div> <!-- /form -->
<script src='${pageContext.request.contextPath}/js/jquery_2.1.3.js'></script>
<script src="${pageContext.request.contextPath}/js/index.js"></script>
</body>
</html>
