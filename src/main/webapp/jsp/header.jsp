<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!--trimDirectiveWhitespaces作用:使JSP输出html时去除多余的空行-->
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>在线相册</title>
    <!--强制让文档与设备的宽度保持1:1-->
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    <!--引入BootStrap-->
    <link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/bootstrap/css/common.css" rel="stylesheet">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
    <%--    <link rel="shortcut icon" href="/public/images/favicon.ico?x88036" type="image/x-icon" />--%>
    <link href="${pageContext.request.contextPath}/favicon.ico" rel="shortcut icon">
</head>
<body>
<header>
    <!--bootstrap里的样式-->
    <nav class="navbar navbar-inverse navbar-fixed-top">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
                        aria-expanded="false" aria-controls="navbar">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="${pageContext.request.contextPath}/index.action">我的秘密小站</a>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
                <ul class="nav navbar-nav">
                    <li><a href="${pageContext.request.contextPath}/index.action">首页&nbsp;&nbsp;<span
                            class="glyphicon glyphicon-home"></span></a></li>
                    <li><a href="${pageContext.request.contextPath}/photolist.action">图片&nbsp;&nbsp;<span
                            class="glyphicon glyphicon-picture"></span></a></li>
                    <li><a href="${pageContext.request.contextPath}/videolist.action">视频&nbsp;&nbsp;<span
                            class="glyphicon glyphicon-facetime-video"></span> </a></li>
                    <li><a href="${pageContext.request.contextPath}/typelist.action">分类&nbsp;&nbsp;<span
                            class="	glyphicon glyphicon-list"></span> </a></li>
                    <li><a href="${pageContext.request.contextPath}/statistic.action">统计&nbsp;&nbsp;<span
                            class="glyphicon glyphicon-list-alt"></span> </a></li>
                </ul>
                <form class="navbar-form navbar-right" action="${pageContext.request.contextPath}/search.action"
                      onsubmit="return check()">
                    <div class="form-group">
                        <input type="text" id="search" name="searchkey" placeholder="请输入关键字" class="form-control">
                    </div>
                    <button type="submit" id="btn" class="btn btn-success">搜索</button>
                    <a class="btn btn-primary" role="button" id="manage">管理</a>
                    <a href="${pageContext.request.contextPath}/manage/logout.action" class="btn btn-danger"
                       role="button">退出</a>
                    <c:if test="${USER_SESSION.username!=null}">
                        <span class="userinfo" style="color: white">当前用户:</span>
                        <span class="userinfo" style="color: white" id="username"
                              name="username">${USER_SESSION.username}</span>
                    </c:if>
                </form>
            </div>
        </div>
    </nav>
    <script type="text/javascript">
        //判断是否允许给予当前登陆的用户管理权限
        $(function () {
            userName = "${USER_SESSION.username}";
            admin0 = "admin";
            admin1 = "user";

            $('#manage').click(function () {
                //如果是管理员登录则开放管理权限
                if (userName == admin0 || userName == admin1) {
                    location.href = "${pageContext.request.contextPath}/manage/mediamanage.action";
                }
                //用户登录提示没有管理权限
                else {
                    alert("管理员暂未向您开放该权限");
                }
            })
        })

        //判断用户点击搜索按钮时是否有输入信息
        function check() {
            searchkey = $('#search').val();
            if (searchkey == "") {
                alert("请输入查询关键字");
                return false;
            }
        }
    </script>
</header>
<br><br><br>
