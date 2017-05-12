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
    <title>错误</title>
</head>
<body>
<script>
    var errorcode = ${errorcode};
    if (errorcode == 1){
        alert("该邮箱已被注册，请您直接登录！");
        window.history.back(-1);
    }else if (errorcode == 2) {
        alert("该用户不存在,请您重新登录！");
        window.history.back(-1);
    }else if (errorcode == 3){
        alert("密码错误，请您重新登录！");
        window.history.back(-1);
    }else if (errorcode == 4){
        alert("邮件发送失败，请您刷新重新尝试！");
        window.history.back(-1);
    }else if (errorcode == 5){
        alert("邮件链接失效，请您重新找回！");
        this.window.opener = null;
        window.history.back();
    }else if (errorcode == 8){
        alert("数据不合法，请您重新尝试！");
        window.history.back(-1);
    }else if (errorcode == 7){
        alert("请登录您的邮箱完成密码找回！");
        this.window.opener = null;
        window.location.href = "https://www.baidu.com/s?ie=utf-8&f=8&rsv_bp=1&tn=baidu&wd=%E9%82%AE%E7%AE%B1&oq=js%2520%25E5%2585%25B3%25E9%2597%25AD%25E5%25BD%2593%25E5%2589%258D%25E9%25A1%25B5%25E9%259D%25A2&rsv_pq=fdbb7dee0006f039&rsv_t=7c13OZ8WwKax%2FiR9dJGKJxrmx%2FXQa7bnQF4Ut4Pz018OZ1uZ1kXcDFn26Lc&rqlang=cn&rsv_enter=1&inputT=2622&rsv_sug3=17&rsv_sug1=17&rsv_sug7=100&rsv_sug2=0&rsv_sug4=3596";
    }else if (errorcode == 9){
        alert("请输入整数！");
        window.history.back(-1);
    }else if (errorcode == 10){
        alert("没有搜索结果，请重试！");
        window.history.back(-1);
    }else if (errorcode == 11){
        alert("支付成功！");
        this.window.opener = null;
        window.location.href = "http://localhost:8080/movie/info";
    }

</script>
</body>
</html>
