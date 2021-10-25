<%@include file="header.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>资源上传</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
</head>
<body>

<script type="text/javascript">
    function check() {
        //判断有无选择上传的文件
        file = $("#file").val();
        if (file.length == 0 || file == "") {
            alert("请选择要上传的文件");
            return false;
        }
        //判断有无选择文件类型
        if ($('input:radio:checked').val() == null) {
            alert("请选择上传文件的类型")
            return false;
        }
        //判断有无选择分组
        selectedTN = $('#select option:selected').val();
        nullselected = "";
        if (selectedTN == nullselected) {
            alert("请选择文件上传的分组")
            return false;
        }
        return true;
    }
</script>
<br><br>
<form class="col-md-offset-5 col-md-3" class="form-horizontal"
      role="form" action="${pageContext.request.contextPath}/manage/doupload.action" method="post"
      enctype="multipart/form-data" onsubmit="return check()">

    <!--选择上传到哪个分组-->
    <%--    <label for="select">选择上传分组</label>--%>
    <select class="form-control" id="select" name="typename">
        <option value="" selected>请选择文件上传分组</option>
        <option value="国风">国风</option>
        <option value="虚拟">虚拟</option>
        <option value="风景">风景</option>
        <option value="壁纸">壁纸</option>
        <option value="日常">日常</option>
    </select><br>

    <input id="file" type="file" name="uploadfile" multiple><br>

    <input name="mediatitle" id="mediatitle" class="text form-control" maxlength="16"
           placeholder="给资源取个名字吧ヾ(๑╹◡╹)ﾉ"><br>

    <!--这里textarea的闭标签如果换行的话好像会导致文本域里面出现几个空格，使placeholder一开始展示不出来-->
    <%--        <label for="txt">备注</label>--%>
    <textarea class="form-control" rows="1" style="resize: none" maxlength="16"
              id="txt" name="description" placeholder="备注信息最多16个汉字"></textarea><br>


    <input type="radio" name="optionsRadios" id="optionsRadios1" value="P">图片
    &nbsp;&nbsp;&nbsp;
    <input type="radio" name="optionsRadios" id="optionsRadios2" value="V">视频
    <br><br>

    <input type="submit" value="确认上传" class="btn btn-default btn-info">
    <div id="tips" style="color: lightseagreen"><b>${tips}</b></div>

</form>
</body>
</html>
<script type="text/javascript">

    //用户选择上传照片时不必设置封面图，上传视频时可选择封面图
    $(function () {
        // $('#optionsRadios2').change(function (){
        //     document.getElementById("addvideoimage").style.display="";
        // })
        // $('#optionsRadios1').change(function (){
        //     document.getElementById("addvideoimage").style.display="none";
        // })

        //取消提示
        $('#select').click(function () {
            $('#tips').text("");
        })
    })
</script>
<%@include file="footer.jsp" %>