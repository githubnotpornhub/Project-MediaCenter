<%@include file="header.jsp" %>
<%@ page contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8" %>

<div class="container">
    <div id="myCarousel" class="carousel slide">
        <!-- 轮播（Carousel）指标 -->
<%--        <ol class="carousel-indicators">--%>

<%--            <c:forEach items="${plist}" var="p">--%>
<%--                <li data-target="#myCarousel" data-slide-to="${p_index}">--%>
<%--                        <c:if test="${p_index==0}">--%>
<%--                            class="active"--%>
<%--                        </c:if>>--%>
<%--                </li>--%>
<%--            </c:forEach>--%>
<%--        </ol>--%>
        <!-- 轮播（Carousel）项目 -->
        <div class="carousel-inner">

            <c:forEach items="${plist}" var="p">
                <div class="item <c:if test="${p.mediaid==mediaid}" >active</c:if>">
                    <img src="${pageContext.request.contextPath}${p.mediaurl}" alt="${p.mediatitle}">
                    <div class="carousel-caption">${p.mediatitle}</div><br>
<%--                    <div class="carousel-caption">${p.description}</div>--%>
                </div>
            </c:forEach>

        </div>
        <!-- 轮播（Carousel）导航 上一页下一页 -->
        <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
</div>
<%@include file="footer.jsp" %>