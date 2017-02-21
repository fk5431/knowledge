<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html >
<head>
  <meta charset="UTF-8">
  <title>我的知识库</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/normalize.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>

<body>
  <div class="form">

      <ul class="tab-group">
        <li class="tab active" id="title_signup"><a href="#signup">注册</a></li>
        <li class="tab" id="title_login"><a href="#login">登录</a></li>
      </ul>

      <div class="tab-content">
        <div id="signup">
          <h1>Sign Up</h1>

          <form action="${pageContext.request.contextPath}/regis" method="post">

          <div class="top-row">
            <div class="field-wrap">
              <label>
                First Name<span class="req">*</span>
              </label>
              <input type="text" required autocomplete="off" name="firstname"/>
            </div>

            <div class="field-wrap">
              <label>
                Last Name<span class="req">*</span>
              </label>
              <input type="text"required autocomplete="off" name="lastname"/>
            </div>
          </div>

          <div class="field-wrap">
            <label>
              Email Address<span class="req">*</span>
            </label>
            <input type="email"required autocomplete="off" name="email"/>
          </div>

          <div class="field-wrap">
            <label>
              Set A Password<span class="req">*</span>
            </label>
            <input type="password"required autocomplete="off" name="password"/>
          </div>

          <input type="submit" class="button button-block"/>Started</button>

          </form>

        </div>

        <div id="login">
          <h1>Welcome My KnowLedge!</h1>

          <form action="${pageContext.request.contextPath}/login" method="post">

            <div class="field-wrap">
            <label>
              Email Address<span class="req">*</span>
            </label>
            <input type="email" required autocomplete="off" name="email"/>
          </div>

          <div class="field-wrap">
            <label>
              Password<span class="req">*</span>
            </label>
            <input type="password" required autocomplete="off" name="password"/>
          </div>
          <p class="forgot"><a href="${pageContext.request.contextPath}/forgot">Forgot Password?</a></p>

          <button class="button button-block"/>LogIn</button>

          </form>

        </div>

      </div><!-- tab-content -->

</div> <!-- /form -->
  <script src="${pageContext.request.contextPath}/js/jquery_2.1.3.js"></script>
  <script src="${pageContext.request.contextPath}/js/index.js"></script>
  <script>
      var state = ${login};
      if(state == 1){
          document.getElementById('title_signup').className = 'tab';
          document.getElementById('title_login').className = 'tab active';
          $("#login").show();
          $("#signup").hide();
      }
  </script>
</body>
</html>
