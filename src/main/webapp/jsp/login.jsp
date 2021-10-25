<%--<%@include file="header.jsp"%>--%>
<%@ page language="java" contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8" %>
<link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/bootstrap/css/common.css" rel="stylesheet">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
<script type="text/javascript">
    $(function () {

        //判断文本框有无空白
        $("#password").blur(function () {
            var $userPassword = $('#password').val();
            if ("" == $userPassword) {
                $('#msg').html('请输入密码').css('color', 'red');
            }
        })

        //光标进入输入框后取消警告
        $('#username').mouseenter(function () {
            $('#message').text("");
            $('#msg').text("");
            $('#tips').text("");
        })
        $('#password').mouseenter(function () {
            $('#msg').text("");
        })
        $('#tips').mouseenter(function () {
            $('#tips').text("");
        })

        //点击按钮后开始验证信息
        $('#btn').click(function () {
            $userName = $('#username').val();
            $userPassword = $('#password').val();
            $verifyCode = $('#verifycode').val();

            $('#tips').text("");
            if ("" == $userName && "" == $userPassword && "" == $verifyCode) {
                $('#tips').text("请输入信息进行登录").css('color', 'red');
            } else if ("" == $userName && "" == $userPassword) {
                $('#message').text("");
                $('#msg').text("");
                $('#msg').html('请输入账号和密码进行登录').css('color', 'red');
            } else if ("" == $userName) {
                $('#message').text("");
                $('#msg').text("");
                $('#message').html('请输入账号进行登录').css('color', 'red');
            } else if ("" == $userPassword) {
                $('#message').text("");
                $('#msg').text("");
                $('#msg').html('请输入密码进行登录').css('color', 'red');
            } else {//内容填写完整，开始验证登录
                $.ajax({
                        url: "${pageContext.request.contextPath}/manage/login.action",
                        data: {'username': $userName, 'password': $userPassword, 'verifycode': $verifyCode},
                        type: 'post',
                        dataType: 'text',
                        success: function (data) {
                            if (data == 'true') {
                                $('#tips').text("");
                                //验证成功，进入用户主页面
                               window.location.href = '${pageContext.request.contextPath}/index.action'
                            }
                            if (data == 'admin') {
                                //验证成功，进入管理员页面
                                window.location.href = '${pageContext.request.contextPath}/index.action'
                            }
                            if (data == 'false') {
                                //验证失败，给出提示信息
                                $('#msg').html('用户名或密码错误').css('color', 'red');
                            }
                            if (data == 'wrong') {
                                $('#tips').html('验证码输入错误').css('color', 'red');
                            }
                            if (data == 'noverify') {
                                $('#tips').html('请填写验证码').css('color', 'red');
                            }
                        }
                    }
                )
            }
        })
    })
</script>

<title>登录页面</title>
<br><br><br><br><br><br>
<div class="container">
    <div class="row">

        <div class="col-md-4"></div>
        <div class="col-md-3 col-md-offset-5">

            <form class="form-signin"
                  action="${pageContext.request.contextPath}/manage/login.action"
                  method="post">
                <h3 class="form-signin-heading">请输入账户信息</h3>
                <label for="username" class="sr-only">用户名</label>
                <input type="text" name="username" id="username" class="form-control" placeholder="用户名" required
                       autofocus>
                <span id="message"></span><br>
                <label for="password" class="sr-only">密码</label>
                <input type="password" name="password" id="password" class="form-control" placeholder="密码" required>
                <span id="msg"></span><br>
                <!--自动登录及记住密码选项-->
                <%--                <div class="custom-control custom-checkbox " style="float: right;">--%>
                <%--                    <input type="checkbox" class="custom-control-input" name="autologin" value="on" id="check2" >--%>
                <%--                    <label class="custom-control-label" for="check2">自动登录</label>--%>
                <%--                </div>--%>
                <%--                <div class="custom-control custom-checkbox " style="float: right;">--%>
                <%--                    <input type="checkbox" class="custom-control-input" id="check1" >--%>
                <%--                    <label class="custom-control-label" for="check1">记住密码&nbsp;&nbsp;</label>--%>
                <%--                </div>--%>

                <%--图片的地址就是获取图片的方法的地址--%>
                <input type="text" id="verifycode" name="verifycode" placeholder="请输入验证码"
                       maxlength="4" class="inp-fon" class="col-md-1" class="input-group-lg"/>
                &nbsp;&nbsp;
                <a id="changeVerifImageRegister" onclick="changeImage();">
                    <img src="${pageContext.request.contextPath }/verify/getverifycode.action"
                         style="text-shadow:olive;text-align:center;height: 35px;" id="verifyCodeImage">
                </a><br>
                <span id="tips">${tips}</span><br>

                <button class="btn btn-lg btn-primary btn-block" id="btn" type="button">登录</button>
                <a href="${pageContext.request.contextPath}/manage/regist.action">没有账号?注册免费使用</a>
            </form>
        </div>
        <div class="col-md-4"></div>
    </div>
</div>
<script type="text/javascript">
    // 点击事件是为了每次点击图片验证码，验证码都会变化
    function genTimestamp() {
        var time = new Date();
        return time.getTime();
    }

    function changeImage() {
        $('#verifyCodeImage').attr('src',
            '${pageContext.request.contextPath }/verify/getverifycode.action?timestamp=' + genTimestamp());
    }
</script>
<!-- /container -->
<%@include file="footer.jsp" %>
