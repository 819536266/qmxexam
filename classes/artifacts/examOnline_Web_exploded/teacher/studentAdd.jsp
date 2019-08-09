<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="/struts-tags" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

    <title>企明星考核系统</title>
    <link href="<%=path %>/admin/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <!-- orris -->
    <link href="<%=path %>/admin/css/animate.css" rel="stylesheet">
    <link href="<%=path %>/admin/css/font-awesome.css" rel="stylesheet">
    <link href="<%=path %>/admin/css/plugins/morris/morris-0.4.3.min.css" rel="stylesheet">
    <link href="<%=path %>/admin/css/bootstrap-table.min.css" rel="stylesheet">
    <link href="<%=path %>/admin/css/animate.css" rel="stylesheet">
    <link href="<%=path %>/admin/css/style.css?v=4.1.0" rel="stylesheet">
    <link href="<%=path %>/admin/css/plugins/datapicker/datepicker3.css" rel="stylesheet">

    <link rel="stylesheet" href="<%=path %>/css/BeatPicker.min.css"/>

    <style type="text/css">
        select {
            padding: 5px;
            border-radius: 5px;
            outline: none;
        }
    </style>

    <script type="text/javascript">
        //ajax
        function showStatus(str) {
            //如果form表单中的字符串为空的话，就把显示的返回值清空，并且返回函数，不再往下执行
            if (str.length == 0) {
                document.getElementById("txt").innerHTML = "";
                return;
            }
            if (window.XMLHttpRequest) {
                //chrome Firefox opera Safari……
                var xmlhttp = new XMLHttpRequest();
            } else {
                //兼容老版本
                var xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
            }
            xmlhttp.onreadystatechange = function () {
                //如果可以连接的通
                if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                    // 并且返回值是HTTP200
                    document.getElementById("txt").innerHTML = xmlhttp.responseText;
                    // 获取ajax 从后台回传的数据
                }
            }
            //打开ajax
            xmlhttp.open("GET", "checkPassword.action?password=" + str, true);
            //发送请求
            xmlhttp.send();
        }


    </script>
    <title>企明星考核系统</title>
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="ibox float-e-margins">
        <div class="ibox-title">
            <h5>添加员工</h5>
        </div>
        <div class="ibox-content " >
            <div class="row">
            <form class="form-horizontal col-xs-offset-1 col-md-offset-4"  action="studentAdd.action" method="post" id="login">
                <div class="form-group form-inline" >
                    <label for="span" class="col-sm-2 control-label">选择部门:</label>
                    <span  id="span" class="col-sm-10">
                                <select class="form-control" id="selectone" onchange="fun1()"
                                        style="width:110px;height: 35px"></select>
                                <select class="form-control" name="sclass" id="selecttwo" onchange="fun2()"
                                        style="width:110px;height: 35px">
                            </select>
                        </span>
                </div>
                <input type="hidden" name="sclassone" id="sclassone">
                <div class="form-group" >
                    <label class="col-sm-2 control-label">员工姓名：</label>
                    <input type="text" name="studentName" style="width:215px"
                           class="col-sm-10 form-control" placeholder="请输入..."
                           required="required" onkeyup="showStatus(this.value)"/><span
                        id="txt"></span>
                </div>
                <div class="form-group" >
                    <label for="password" class="col-sm-2 control-label">密码：</label>
                    <input type="text" name="password"  id="password"class="col-sm-10 form-control" style="width:215px"
                           placeholder="请输入..." required="required"/>
                </div>
                    <div class="form-group" id="data_1">
                        <label class="col-sm-2 control-label">入职时间：</label>
                        <div class="input-group date col-sm-10">
                            <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                            <input type="text" id="date1" readonly="readonly" name="dateTerm" class="form-control" style="width:175px">
                        </div>
                    </div>
                <div class="form-group" >
                    <label class="col-sm-2 control-label">实习工资：</label>
                    <input type="number"name="internshipsalary" style="width:215px"
                           class="col-sm-10 form-control" placeholder="请输入..."
                           required="required"  />
                </div>
                    <div class="form-group" id="data_2">
                        <label class="col-sm-2 control-label">转正时间：</label>
                        <div class="input-group date col-sm-10 ">
                            <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                            <input type="text" id="date2" name="correctiontime" readonly="readonly" class="form-control"style="width:175px">
                        </div>
                    </div>
                <div class="form-group" >
                    <label class="col-sm-2 control-label">转正工资：</label>
                    <input type="number" style="width:215px"
                           class="col-sm-10 form-control" name="salary" placeholder="请输入..."
                           required="required" />
                </div>


                <div class="form-group " >
                    <input class="btn btn-primary  col-sm-offset-2" type="submit" value="录入" style="width:100px">
                    <a href="<%=path %>/teacher/studentExcel.jsp">
                        <button type="button" class="btn btn-primary">Excel录入</button>
                    </a>
                </div>


            </form>
            </div>
        </div>
        <div class="ibox-footer" style="position: fixed;bottom:0px;">
            <div class="footer-left">
                <span>&copy; 2019. 企明星考核系统.</span>
            </div>
        </div><!--maincontentinner-->
    </div><!--maincontent-->
</div>
</body>
<script src="<%=path %>/admin/js/jquery.min.js"></script>
<script src="<%=path %>/js/bootstrap.min.js"></script>
<!-- 自定义js -->
<script src="<%=path %>/admin/js/content.js"></script>
<script src="<%=path %>/js/select.js"></script>
<!-- Data picker -->
<script src="<%=path %>/admin/js/plugins/datapicker/bootstrap-datepicker.js"></script>
<!-- Image cropper -->
<script src="<%=path %>/admin/js/plugins/cropper/cropper.min.js"></script>
<script type="text/javascript">

    $(function () {
        $.ajax({
            type: "post",
            url: "<%=path %>/bigtype_queryall.action",
            success: function (data) {
                $("#selectone").empty();
                data = JSON.parse(data);
                $(data).each(function (i, n) {
                    $("#selectone").append("<option na='" + n.bigNano + "' url='" + n.bigId + "'  value='" + n.bigName + "'>" + n.bigName + "</option>");

                });
                fun1(data[0].bigId);
            }
        })

    })

    function fun1(bid) {
        id = $("#selectone").find("option:selected").attr("url");
        if (id == null || id == "") {
            id = bid;
        }
        $.ajax({
            type: "post",
            url: "${pageContext.request.contextPath}/centre_queryByPid.action",
            data: {'centrePid.bigId': id},
            success: function (data) {
                $("#selecttwo").empty();
                $(JSON.parse(data)).each(function (i, n) {
                    $("#selecttwo").append("<option na='" + n.centreNano + "' url='" + n.centreId + "'  value='" + n.centreName + "'>" + n.centreName + "</option>");

                });
                fun2(data[0].centreId);
            }
        })

    }

    function fun2(centreId) {

        id = $("#selecttwo").find("option:selected").attr("url");
        if (id == null || id == "") {
            id = centreId;
        }
        $.ajax({
            type: "post",
            url: "${pageContext.request.contextPath}/small_queryByPid.action",
            data: {'smallPid.centreId': id},
            success: function (data) {
                data = JSON.parse(data);
                if (data.length > 0) {
                    $("#span #selectthree").remove();
                    $("#selecttwo").attr("name", "");
                    selectthree = $("<select class='form-control' name='sclass' id='selectthree' style='width:110px'></select>");
                    $("#span").append(selectthree);
                    $(data).each(function (i, n) {
                        $(selectthree).append("<option na='" + n.smallNano + "' url='" + n.smallId + "'  value='" + n.smallName + "'>" + n.smallName + "</option>");
                    });

                } else {
                    $("#selecttwo").attr("name", "sclass");
                    $("#span #selectthree").remove();

                }
            }
        })
    }
</script>
<script type="text/javascript">

    //提交之前
    jQuery('#login').submit(function () {
        var year = $("#year option:selected").html();
        var month = $("#month option:selected").html();
        year = year.substring(2, 4);
        month = month.substring(0, 2);
        term = year + month;
        if (term == "年份") {
            term = "";
        }
        if (term == "选择") {
            term = "";
        }
        if (term == "年份选择") {
            term = "";
        }
        $("#semester").val(term);
        id = $("#selecttwo").find("option:selected").attr("na");
        $("#sclassone").val(id);
        $("#kind").val(selecttwo);
        if ($("#txt").html() == "员工编号已存在!请重新输入!" || $("#txt").html() == "用户名已存在!请重新输入!") {
            return false;
        }
    });


    jQuery(document).ready(function () {
        /*加载时间选择器*/
        $('#data_1 .input-group.date').datepicker({
            minViewMode: 0,
            keyboardNavigation: false,
            forceParse: false,
            autoclose: true,
            todayHighlight: true
        });
        $('#data_2 .input-group.date').datepicker({
            minViewMode: 0,
            keyboardNavigation: false,
            forceParse: false,
            autoclose: true,
            todayHighlight: true
        });
        /*设置时间选择器中时间为当前月份*/
        let date= new Date()
        let date1=date.Format("yyyy-MM-dd");
        $("#date1").val(date1);
        date.setDate(date.getDate()+30);
        let date2=date.Format("yyyy-MM-dd");
        $("#date2").val(date2);
    });

    Date.prototype.Format = function (fmt) {
        var o = {
            "M+": this.getMonth() + 1, //月份
            "d+": this.getDate(), //日
            "H+": this.getHours(), //小时
            "m+": this.getMinutes(), //分
            "s+": this.getSeconds(), //秒
            "q+": Math.floor((this.getMonth() + 3) / 3), //季度
            "S": this.getMilliseconds() //毫秒
        };
        if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
        for (var k in o)
            if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
        return fmt;
    }
</script>

</html>