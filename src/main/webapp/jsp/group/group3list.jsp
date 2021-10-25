<%@include file="../header.jsp" %>
<%@ page contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<div class="container">
    <div class="row">

        <c:forEach items="${plist}" var="pl">
            <div class="grid-item">

                <a href="${pageContext.request.contextPath}/photoview.action?mediaid=${pl.mediaid}">
                    <div class="thumbnail">
                        <img src="${pageContext.request.contextPath}${pl.mediaurl}" alt="缩略图" class="img-thumbnail">
                        <div class="caption">
                            <h3>${pl.mediatitle}</h3>
                        </div>

                    </div>
                </a>
            </div>
        </c:forEach>
    </div>
</div>
<center>
    <hr style="color: aqua">
    <p>当前页${pageInfo.pageNum}&nbsp;/&nbsp;共${pageInfo.pages}页&nbsp;&nbsp;&nbsp;&nbsp;
        共有资源${pageInfo.total}个</p>
    <a href="${pageContext.request.contextPath}/manage/group3list.action?pageNum=${pageInfo.firstPage}">首页</a>&nbsp;&nbsp;
    <a href="${pageContext.request.contextPath}/manage/group3list.action?pageNum=${pageInfo.prePage}">上一页</a>&nbsp;&nbsp;
    <a href="${pageContext.request.contextPath}/manage/group3list.action?pageNum=${pageInfo.nextPage}">下一页</a>&nbsp;&nbsp;
    <a href="${pageContext.request.contextPath}/manage/group3list.action?pageNum=${pageInfo.lastPage}">尾页</a>&nbsp;&nbsp;
    跳转到&nbsp;<input type="text" id="tz" style="width: 30px">&nbsp;页<br><br>
</center>
<script src="https://cdn.jsdelivr.net/npm/jquery/dist/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/font-awesome/css/font-awesome.min.css"/>
<script src="https://cdn.jsdelivr.net/gh/stevenjoezhang/live2d-widget/autoload.js"></script>

<style>
    .grid-item {
        float: left;
    }
    .grid-item img {
        width: 270px;
        height: 180px;
    }
    .grid-item div{
        margin: 5px 3px;
    }
</style>
<%@include file="../footer.jsp" %>