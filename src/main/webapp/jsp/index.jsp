<%@ include file="header.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://cdn.jsdelivr.net/npm/jquery/dist/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/font-awesome/css/font-awesome.min.css"/>
<script src="https://cdn.jsdelivr.net/gh/stevenjoezhang/live2d-widget/autoload.js"></script>

<div class="container">
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">
                <span class="glyphicon glyphicon-camera"></span>最新图片
            </h3>
        </div>
        <div class="panel-body">
            <div class="row">
                <c:forEach items="${plist}" var="pl">
                    <div  class="grid-item">
                        <a href="${pageContext.request.contextPath}/photoview.action?mediaid=${pl.mediaid}&medianum=${fn:length(plist)}">
                            <div class="thumbnail">
                                <img src="${pageContext.request.contextPath}${pl.mediaurl}" alt="缩略图" class="img-thumbnail">
                                <p class="caption">
                                    <h4>${pl.mediatitle}</h4>
                                    <p>${pl.description}</p>
                                    <p><fmt:formatDate value="${pl.uploaddate}" pattern="yyyy-MM-dd HH:mm:ss"/> </p>
                                </div>

                        </a>
                    </div>
                </c:forEach>
                <div class="pull-right">
                    <a href="${pageContext.request.contextPath}/photolist.action" class="btn btn-primary" role="button">更多图片&gt;&gt;</a>
                    &nbsp;&nbsp;
                </div>
            </div>
        </div>
    </div>
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">
                <span class="glyphicon glyphicon-film"></span>最新视频
            </h3>
        </div>
        <div class="panel-body">
            <div class="row">
                <c:forEach items="${vlist}" var="v">
                    <div class="col-sm-6 col-md-4">
                        <div class="thumbnail">
                            <video controls height="100%" width="98%">
                                <source src="${pageContext.request.contextPath}${v.mediaurl}" type='video/mp4;codecs="avc1.4D401E,mp4a.40.2"'>
                            </video>
                            <div class="caption">
                                <h4>${v.mediatitle}</h4>
                            </div>
                        </div>
                    </div>
                </c:forEach>
                <div class="pull-right">
                    <a href="${pageContext.request.contextPath}/videolist.action" class="btn btn-primary" role="button">更多视频 &gt;&gt;</a>
                    &nbsp;&nbsp;
                </div>
            </div>
        </div>
    </div>
</div>
<style>
    .grid-item {
        float: left;
    }
    .grid-item img {
        width: 259px;
        height: 166px;
    }
    .grid-item div{
        margin: 10px 7px;
    }

</style>
<%@include file="footer.jsp"%>