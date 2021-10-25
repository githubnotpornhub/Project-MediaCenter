<%@include  file="../header.jsp"%>
<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="container-fluid">
  <div class="row">
   <div class="col-md-2">
		<%@include  file="../tree.jsp"%>
   </div>
   <div class="col-md-10">

      <h2>用户管理 <a href="#" class="btn btn-primary btn-sm" role="button">新增用户</a></h2>
      <div class="table-responsive">
        <table class="table table-striped table-sm">
          <thead>
            <tr>
              <th>权限等级</th>
                <th>用户</th>
                <th>密码</th>
                <th>备注</th>
			  <th>操作</th>
            </tr>
          </thead>
          <tbody>
          <c:forEach items="${list}" var="l">
            <tr>
                <td>${l.level}</td>
              <td>${l.username}</td>
              <td>${l.password}</td>
              <td>${l.information}</td>
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
</div>

 <%@include  file="../footer.jsp"%>