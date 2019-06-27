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


    <link rel="stylesheet" href="<%=path %>/css/style.default.css" type="text/css"/>
    <link rel="stylesheet" href="<%=path %>/css/responsive-tables.css">
    <link rel="stylesheet" href="<%=path %>/css/bootstrap-fileupload.min.css" type="text/css"/>
    <link rel="stylesheet" href="<%=path %>/css/bootstrap-timepicker.min.css" type="text/css"/>
    <link rel="shortcut icon" href="<%=path %>/images/favicon.ico"/>

    <%-- <script type="text/javascript" src="<%=path %>/jquery/jquery-1.4.2.js"></script> --%>
    <%-- 	<link rel="stylesheet" href="<%=path %>/jquery/jquery.datepick.css" type="text/css">
        <script type="text/javascript" src="<%=path %>/jquery/jquery.datepick.js"></script>
        <script type="text/javascript" src="<%=path %>/jquery/jquery.datepick-zh-CN.js"></script> --%>

    <link rel="stylesheet" href="<%=path %>/css/BeatPicker.min.css"/>
    <script src="<%=path %>/js/jquery-2.1.4.min.js"></script>
    <script src="<%=path %>/js/BeatPicker.min.js"></script>
    <script src="<%=path %>/js/select.js"></script>

    <style type="text/css">
        select {
            padding: 5px;
            border-radius: 5px;
            outline: none;
        }
    </style>


    <title>企明星考核系统</title>
</head>
<body>



        <div class="maincontent" style="">
            <div class="maincontentinner">

                <div class="widget">
                    <h4 class="widgettitle">添加</h4>
                    <div class="widgetcontent">

                        <form class="stdform" action="<%=path %>/centre_add.action" method="post" id="login">
                            <label>选择父分类：</label>
                            <span class="field">
                                <select class="form-control" name="centrePid.bigId" id="selectone" style="width:110px">

                                </select>
                            <script type="text/javascript">
                                $(function () {
                                    $.ajax({
                                        type:"post",
                                        url:"<%=path %>/bigtype_queryall.action",
                                        success: function (data) {
                                            $("#selectone").empty();
                                            $(JSON.parse(data)).each(function(i,n){
                                                $("#selectone").append("<option value='"+n.bigId+"'>"+n.bigName+"</option>");
                                               /* $("#s1 option[value={linkman.costomer.id==null?0:linkman.costomer.id}]").prop("selected","selected");*/
                                            });

                                        }
                                    })

                                })
                            </script>
                            </span>

                            <label>二级分类名称：</label>
                            <span class="field">
                      			<input type="text" id="centreName" name="centreName" class="input-xlarge" style="width:215px"
                                       placeholder="请输入..." required="required" />
                            	<span id="txt"></span><!-- 验证 -->
                            </span>

                            <label>二级分类简写：</label>
                            <span class="field"><input type="text" id="centreNano"  name="centreNano" style="width:215px"
                                                       class="input-xlarge" placeholder="请输入..."
                                                       required="required"/></span>


                            <p class="stdformbutton">
                                <input class="btn btn-primary" type="submit" value="添加" style="width:100px">
                            </p>


                        </form>

                    </div><!--widgetcontent-->
                </div><!--widget-->

                <br/><br/>

                <div class="footer" style="position: fixed;bottom:0px;">
                    <div class="footer-left">
                        <span>&copy; 2019. 企明星考核系统.</span>
                    </div>

                </div><!--footer-->

            </div><!--maincontentinner-->
        </div><!--maincontent-->

<script type="text/javascript">

    //提交之前
    jQuery('#login').submit(function () {
        if($("#centreNano").val()==null||$("#centreNano").val()==''||$("#centreName").val()==''||$("#centreName").val()==null){
            return false;
        }else{
            return true;
        }
    });


</script>
</body>
</html>