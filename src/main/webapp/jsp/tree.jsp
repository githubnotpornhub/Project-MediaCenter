<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--左侧列表-->
<div class="row">
    <div class="col-md-2">
        <div class="list-group sidebar">
            <a href="${pageContext.request.contextPath}/manage/mediamanage.action" class="list-group-item <#if url=='mediaManage'> active </#if>">资源管理 </a>
            <a href="${pageContext.request.contextPath}/manage/typemanage.action" class="list-group-item <#if url=='typeManage'> active </#if>">分类管理 </a>
            <a  class="list-group-item <#if url=='userManage'> active </#if>" id="usermanage">用户管理 </a>
            <a href="${pageContext.request.contextPath}/manage/logout.action" class="btn btn-danger col-md-12"><span class="glyphicon glyphicon-off"></span>退出登录 </a>
            <c:if test="${USER_SESSION.username!=null}">
                <div class="userinfo">当前登录用户:${USER_SESSION.username}</div>
            </c:if>
        </div>
    </div>
</div>

<script type="text/javascript">
    //判断是否给予当前登陆的用户最高等级的管理权限
    $(function () {
        userName = "${USER_SESSION.username}";
        admin0 = "admin";

        $('#usermanage').click(function () {
            //如果是管理员登录则开放管理权限
            if (userName == admin0) {
                location.href = "${pageContext.request.contextPath}/manage/usermanage.action";
            }
            //用户登录提示没有管理权限
            else {
                alert("抱歉,您目前的权限不足");
            }
        })
    })
</script>