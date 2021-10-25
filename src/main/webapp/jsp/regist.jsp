<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/bootstrap/css/common.css" rel="stylesheet">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
<script type="text/javascript">
    $(function () {
        //光标离开文本框后自动验证用户名是否可用于注册


        /*没输入内容时进行提示*/
        // $("#username").blur(function () {
        //     var $userName = $('#username').val();
        //     if ("" == $userName) {
        //         $('#tips').html('请输入账号').css('color', 'red');
        //     }
        // })
        //光标离开文本框后自动验证密码是否符合要求
        $("#password").blur(function () {
            var $userPassword = $('#password').val();
            if ("" == $userPassword) {
                $('#tips1').html('请输入密码').css('color', 'red');
            }
            <%-- else {--%>
            <%--    $.ajax({--%>
            <%--        URL: '${pageContext.request.contextPath}/manage/checkpassword',--%>
            <%--        data: JSON.stringify({'password': $userPassword}),--%>
            <%--        method: 'post',--%>
            <%--        dataType: 'json',--%>
            <%--        success: function (data) {--%>
            <%--            if (data == 'true') {--%>
            <%--                $("#tips1").text('该密码强度不够，请使用数字与字母混合形式').css('color', 'red');--%>
            <%--            }--%>
            <%--        }--%>
            <%--    })--%>
            <%--}--%>
        })
        $("#passwordagain").blur(function () {
            var $userPasswordagain = $('#passwordagain').val();
            if ("" == $userPasswordagain) {
                $('#tips2').html('请再次输入密码').css('color', 'red');
            }
        })

        //单击文本框后取消提示
        $('#username').click(function () {
            $('#tips').text("");
            $('#tips1').text("");
            $('#tips2').text("");
            $('#tips3').text("");
        })
        $('#password').click(function () {
            $('#tips1').text("");
            $('#tips2').text("");
            <%--$userName = $('#username').val();--%>
            <%--$.ajax({--%>
            <%--    url: '${pageContext.request.contextPath}/manage/tryregist.action',--%>
            <%--    data: {'username': $userName},--%>
            <%--    method: 'post',--%>
            <%--    dataType: "text",--%>
            <%--    success: function (data) {--%>
            <%--        if (data == "false") {--%>
            <%--            $("#tips").html('该账号已被注册').css('color', 'red');--%>
            <%--        }--%>
            <%--        else if (data == "true") {--%>
            <%--            $("#tips").html('该账号可使用').css('color', 'green');--%>
            <%--        }--%>
            <%--        else if (data == "again") {--%>
            <%--            $("#tips").html('不知道你输入了啥').css('color', 'red');--%>
            <%--        }--%>
            <%--    }--%>
            <%--})--%>
        })
        $('#passwordagain').click(function () {
            $('#tips2').text("");
        })

        //点击注册按钮候进行验证可否注册
        $('#btn').click(function () {
            $('#tips').text("");
            $('#tips1').text("");
            $('#tips2').text("");
            $('#tips3').text("");
            //首先验证输入的信息是否完整
            $userName = $('#username').val();
            $userPassword = $('#password').val();
            $userPasswordagain = $('#passwordagain').val();
            $verifyCode = $('#verifycode').val();
            if ("" == $userName || "" == $userPassword || "" == $userPasswordagain) {
                $('#tips3').html('请输入信息进行注册！').css('color', 'red');
            }
            if ("" == $verifyCode) {
                $('#tips3').html('请输入验证码！').css('color', 'red');
            } else {
                $.ajax({
                    url: "${pageContext.request.contextPath}/manage/doregist.action",
                    data: {
                        'username': $userName,
                        'password': $userPassword,
                        'passwordagain': $userPasswordagain,
                        'verifycode': $verifyCode
                    },
                    type: 'post',
                    dataType: 'json',
                    success: function (data) {
                        if (data == '1') {
                            //注册成功，跳转
                            location.href = '${pageContext.request.contextPath}/manage/registsuccess.action'
                        } else if (data == '-100') {
                            $('#tips3').html('验证码错误').css('color', 'red');
                        } else if (data == '-1') {
                            //注册失败，提示用户重新注册
                            $('#tips').html('该账号已被注册').css('color', 'red');
                            $('#tips1').html('密码至少八位(可使用_-.@!?)').css('color', 'red');
                        } else if (data == '-2') {
                            //注册失败，提示用户重新注册
                            $('#tips').html('该账号已被注册').css('color', 'red');
                            $('#tips1').html('密码至少八位(可使用_-.@!?)').css('color', 'red');
                        } else if (data == '-3') {
                            //注册失败，提示用户重新注册
                            $('#tips').html('该账号已被注册').css('color', 'red');
                            $('#tips2').html('您前后两次输入的密码不相同，请确认').css('color', 'red');
                        } else if (data == '-4') {
                            //注册失败，提示用户重新注册
                            $('#tips1').html('密码至少八位(可使用_-.@!?)').css('color', 'red');
                        } else if (data == '-5') {
                            //注册失败，提示用户重新注册
                            $('#tips').html('该账号已被注册').css('color', 'red');
                        } else if (data == '-6') {
                            //注册失败，提示用户重新注册
                            $('#tips1').html('密码至少八位(可使用_-.@!?)').css('color', 'red');
                        } else if (data == '-7') {
                            //注册失败，提示用户重新注册
                            $('#tips2').html('您前后两次输入的密码不相同，请确认').css('color', 'red');
                        } else if (data == '-8') {
                            //注册失败，提示用户重新注册
                            $('#tips2').html('请再次输入密码进行确认').css('color', 'red');
                        } else if (data == '-40') {
                            //注册失败，提示用户重新注册
                            $('#tips').html('账号至少四位(不含汉字,可使用_-.@!?)').css('color', 'red');
                        } else if (data == '-41') {
                            //注册失败，提示用户重新注册
                            $('#tips').html('账号至少四位(不含汉字,可使用_-.@!?)').css('color', 'red');
                            $('#tips1').html('密码至少八位(可使用_-.@!?)').css('color', 'red');
                        }
                    }
                })
            }
        })
    })
</script>
<br><br><br><br><br><br>
<title>注册页面</title>
<div class="container">
    <div class="row">

        <div class="col-md-4"></div>
        <div class="col-md-3 ">

            <form action="${pageContext.request.contextPath}/manage/doregist.action" method="post">
                <h3 class="form-signin-heading">账号注册</h3>
                <div id="goback"><h5 class="text-muted">已有账号？ <a
                        href="${pageContext.request.contextPath}/manage/loginview.action">登录</a>
                </h5></div>
                <br>
                <label for="username" class="sr-only">创建账号</label>
                <input type="text" name="username" id="username" class="form-control" placeholder="账号至少四位(建议邮箱或手机号码)"
                       required
                       autofocus/>
                <span id="tips" style="color: red"></span><br>
                <label for="password" class="sr-only">设置密码</label>
                <input type="password" name="password" id="password" class="form-control" placeholder="输入八位密码(须包含字母和数字)"
                       required/>
                <span id="tips1" style="color: red">${tips1}</span><br>
                <label for="password" class="sr-only">确认密码</label>
                <input type="password" name="passwordagain" id="passwordagain" class="form-control"
                       placeholder="请再次输入密码" required/>
                <span id="tips2" style="color: red">${tips2}</span><br>

                <%--图片的地址就是获取图片的方法的地址--%>
                <input type="text" id="verifycode" name="verifycode" placeholder="请输入验证码"
                       maxlength="4" class="inp-fon" class="col-md-1"/>
                &nbsp;&nbsp;
                <a id="changeVerifImageRegister" onclick="changeImage();">
                    <img src="${pageContext.request.contextPath }/verify/getverifycode.action"
                         style="text-shadow:olive;text-align:center;height: 35px;" id="verifyCodeImage">
                </a><br>
                <span id="tips3">${tips3}</span><br>
                <button class="btn btn-lg btn-primary btn-block" id="btn" type="button">注册</button>
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