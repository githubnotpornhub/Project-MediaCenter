<%@include  file="header.jsp"%>
<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="container">
<div class="row">
<c:forEach items="${list}" var="l">
  <div class="grid-item">
    <div class="thumbnail">
      <img src="${pageContext.request.contextPath}${l.typeimage}" alt="缩略图" class="img-thumbnail">
      <div class="caption">
<%--        <H4>${l.typeid}</H4>--%>
        <h3>${l.typename}</h3>
        <p>${l.description}</p>
        <p><a href="${pageContext.request.contextPath}/manage/group${l.typeid}list.action"
              class="btn btn-primary" role="button">更多内容 &gt;&gt;</a> </p>
      </div>
    </div>
  </div>
</c:forEach>
</div>
</div>
<style>
  .grid-item {
    float: left;
  }
  .grid-item img {
    width: 350px;
    height: 230px;

  }
  .grid-item div{
    margin: 10px 10px;
  }
</style>
 <%@include  file="footer.jsp"%>