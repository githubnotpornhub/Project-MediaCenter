<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="../header.jsp" %>
<%@ page language="java" contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8" %>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>

<div class="container-fluid">
    <div class="row">
        <div class="col-md-2">
            <%@include file="../tree.jsp" %>
        </div>
        <div class="col-md-10">
            <h2>
                资源管理 <a href="${pageContext.request.contextPath }/manage/upload.action"
                        id="upload" class="btn btn-primary btn-sm" role="button">上传新资源</a>
            </h2>

            <div class="table-responsive">
                <table class="table table-striped table-sm">
                    <thead>
                    <tr>
                        <th>
                            <select name="Mediatype" style="width: 60px;text-align: center" id="selectedtype">
                                <option value="All" ${all}>全部</option>
                                <option value="P" ${photo}>图片</option>
                                <option value="V" ${video}>视频</option>
                            </select>
                        </th>
                        <th>资源预览</th>
                        <th>标题</th>
                        <th>描述</th>
                        <th>分类</th>
                        <th>上传时间</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:if test="${empty pageInfo}">
                        <c:set var="list" scope="page" value="${pageInfo.list}"/>
                    </c:if>
                    <c:if test="${not empty pageInfo}">
                        <c:set var="list" scope="page" value="${list}"/>
                    </c:if>
                    <c:forEach items="${pageInfo.list}" var="l">
                        <tr class="data">
                            <td>
                                <c:if test="${l.mediatype=='P'}">图片</c:if>
                                <c:if test="${l.mediatype=='V'}">视频</c:if>
                            </td>
                            <td>
                                <c:if test="${l.mediatype=='P'}">
                                    <img src="${pageContext.request.contextPath }${l.mediaurl}"
                                         class="img-rounded" width="100px">
                                </c:if>
                                <c:if test="${l.mediatype=='V'}">
                                    <video controls width="100px">
                                        <source
                                                src="${pageContext.request.contextPath }${l.mediaurl}"
                                                type='video/mp4; codecs="avc1.4D401E, mp4a.40.2"'>
                                    </video>
                                </c:if>
                            </td>
                            <td class="mediatitle">${l.mediatitle}</td>
                            <td>${l.description}</td>
                            <td>${l.typename}</td>
                            <td><fmt:formatDate value="${l.uploaddate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>

                            <td><button class="edit" type="button">修改</button>
                                <button class="delete" type="button">删除</button>
                                <button class="download" type="button">下载</button>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>

                <hr style="color: aqua">
                <p>当前页${pageInfo.pageNum}&nbsp;/&nbsp;共${pageInfo.pages}页&nbsp;&nbsp;&nbsp;&nbsp;
                    共有资源${pageInfo.total}个</p>
                <a href="${pageContext.request.contextPath}/manage/${Mediatype}.action?pageNum=${pageInfo.firstPage}">首页</a>&nbsp;&nbsp;
                <a href="${pageContext.request.contextPath}/manage/${Mediatype}.action?pageNum=${pageInfo.prePage}">上一页</a>&nbsp;&nbsp;
                <a href="${pageContext.request.contextPath}/manage/${Mediatype}.action?pageNum=${pageInfo.nextPage}">下一页</a>&nbsp;&nbsp;
                <a href="${pageContext.request.contextPath}/manage/${Mediatype}.action?pageNum=${pageInfo.lastPage}">尾页</a>&nbsp;&nbsp;
                跳转到&nbsp;<input type="text" id="tz" style="width: 30px">&nbsp;页<br><br>

            </div>
        </div>

        <script type="text/javascript">
            $(function () {

                //根据下拉列表选择的资源类型展示对应资源
                $('#selectedtype').change(function () {
                    $type = $('#selectedtype').val();
                    if ($type != null) {
                        $.ajax({
                            url: "${pageContext.request.contextPath}/manage/selecttype.action",
                            type: 'post',
                            dataType: 'text',
                            data: {'Mediatype': $type},
                            success: function (data) {
                                if (data == "All") {
                                    location.href = "${pageContext.request.contextPath}/manage/mediamanage.action"
                                }
                                if (data == "P") {
                                    location.href = "${pageContext.request.contextPath}/manage/photomanage.action"
                                }
                                if (data == "V") {
                                    location.href = "${pageContext.request.contextPath}/manage/videomanage.action"
                                }
                            }
                        })
                    }
                })


                //删除资源
                $(".delete").click(function () {
                    console.log($(this))
                    $mediatitle = $(this).parent('td').siblings('.mediatitle').val();
                    item=webdriver.find()
                    console.log($(this),"test")
                    console.log( $(this).parent('td'))
                    console.log( $(this).parent('td').siblings('.mediatitle'))
                    console.log( $(this).parent('td').siblings('.mediatitle')[0])
                    $.ajax({
                        URL: "${pageContext.request.contextPath}/manage/delete.action",
                        type: 'post',
                        dataType: 'text',
                        data: {'mediatitle': $mediatitle},
                        success: function (data) {
                            if (data == 'success') {
                                window.location.reload();//自动刷新
                            } else (data == 'failed')
                            {
                                alert("文件" + $mediatitle + "删除失败，请重试");
                            }
                        }
                    })
                })
            })
        </script>
<%@include file="../footer.jsp" %>