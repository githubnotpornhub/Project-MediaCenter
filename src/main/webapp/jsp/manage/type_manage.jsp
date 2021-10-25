<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include  file="../header.jsp"%>
<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="container-fluid">
  <div class="row">
   <div class="col-md-2">
		<%@include  file="../tree.jsp"%>
   </div>
   <div class="col-md-10">

      <h2>分类管理 <a href="#" class="btn btn-primary btn-sm" role="button">新建分类</a></h2>
      <div class="table-responsive">
        <table class="table table-striped table-sm">
          <thead>
            <tr>
              <th>封皮</th>
              <th>分类名称</th>
              <th>分类描述</th>
              <th>创建时间</th>
              <th>操作</th>
            </tr>
          </thead>
          <tbody>
          
          <c:forEach items="${list}" var="l"> 
            <tr>
              <td><img src="${pageContext.request.contextPath}${l.typeimage}" class="img-rounded" width="120px"></td>            
              <td>${l.typename}</td>
              <td>${l.description}</td>
              <td><fmt:formatDate value="${l.builddate}" pattern="yyyy-MM-dd HH:mm:ss"/>   </td>
              <td>        
              <a href="#" class="btn btn-primary btn-xs" role="button">修改</a>
              <a href="#" class="btn btn-primary btn-xs" role="button">删除</a>
              </td>
            </tr>
            </c:forEach>
          </tbody>
        </table>

      </div>
  </div>
</div>

 <%@include  file="../footer.jsp"%>
