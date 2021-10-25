<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/bootstrap/css/common.css" rel="stylesheet">

<!--提示用户注册成功的页面(设置为若干秒后将自动跳转返回到登录页面,用户也可手动点击链接马上跳转)-->
<script type="text/javascript">
    function delayURL(url) {
        var delay = document.getElementById("time").innerHTML;
        if (delay > 0) {
            delay--;
            document.getElementById("time").innerHTML = delay;
        } else {
            window.top.location.href = url;
        }
        setTimeout("delayURL('" + url + "')", 1000);
    }
</script>

<div class="text-muted text-center ">
    <h4>
<span>恭喜您注册成功</span>
    <span id="time" style="color: red">3</span>秒后将跳转至登录页面。如果未跳转,请点击下面链接<a href="${pageContext.request.contextPath }/manage/loginview.action">返回登录页面</a></h4>
</div>
<script type="text/javascript">
    delayURL("${pageContext.request.contextPath }/manage/loginview.action");
</script></a>

<%@include file="footer.jsp" %>