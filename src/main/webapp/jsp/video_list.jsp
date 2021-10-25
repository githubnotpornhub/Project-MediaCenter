<%@include file="header.jsp" %>
<%@ page language="java" contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8" %>
<div class="container">
    <div class="row">
        <script src="https://cdn.jsdelivr.net/npm/jquery/dist/jquery.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/font-awesome/css/font-awesome.min.css"/>
        <script src="https://cdn.jsdelivr.net/gh/stevenjoezhang/live2d-widget/autoload.js"></script>
        <c:forEach items="${vlist}" var="v">
            <div class="col-sm-6 col-md-4">
                <div class="thumbnail">
                    <video controls height="100%" width="98%">
                        <source src="${pageContext.request.contextPath}${v.mediaurl}"
                                type='video/mp4; codecs="avc1.4D401E, mp4a.40.2"'>
                    </video>
                    <div class="caption">
                        <h4>${v.mediatitle}</h4>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

<center>
    <hr style="color: aqua">
    <p>当前页${pageInfo.pageNum}&nbsp;/&nbsp;共${pageInfo.pages}页&nbsp;&nbsp;&nbsp;&nbsp;
        共有资源${pageInfo.total}个</p>
    <a href="${pageContext.request.contextPath}/videolist.action?pageNum=${pageInfo.firstPage}">首页</a>&nbsp;&nbsp;
    <a href="${pageContext.request.contextPath}/videolist.action?pageNum=${pageInfo.prePage}">上一页</a>&nbsp;&nbsp;
    <a href="${pageContext.request.contextPath}/videolist.action?pageNum=${pageInfo.nextPage}">下一页</a>&nbsp;&nbsp;
    <a href="${pageContext.request.contextPath}/videolist.action?pageNum=${pageInfo.lastPage}">尾页</a>&nbsp;&nbsp;
    跳转到&nbsp;<input type="text" id="tz" style="width: 30px">&nbsp;页<br><br>
</center>

<%@include file="footer.jsp" %>