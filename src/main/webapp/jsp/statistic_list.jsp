<%@include  file="header.jsp"%>
<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="container">
<div class="row">
  <div class="col-sm-6 col-md-12">
<table class="table table-hover">
  <caption><h3>按分类统计图片及视频数量</h3></caption>
  <thead>
    <tr>
      <th>分类名称</th>
      <th>图片数</th>
      <th>视频数</th>
    </tr>
  </thead>
  <tbody>
    <c:forEach items="${list}" var="l">
    <tr>
      <td>${l.typename}</td>
      <td>${l.pnum}</td>
      <td>${l.vnum}</td>
    </tr>
  </c:forEach>

  </tbody>
</table>
  </div>   
</div>
</div>
 <%@include  file="footer.jsp"%>