<%--
  Created by IntelliJ IDEA.
  User: fengkai
  Date: 13/02/17
  Time: 13:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<script>
    var errorcode = ${errorcode};
    if (errorcode == 1){
        alert("该邮箱已被注册，请您直接登录！");
        window.history.back(-1);
    }
</script>
</body>
</html>
